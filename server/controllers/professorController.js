const { ProfessorModel, ThesisModel, StudentModel } = require('../models/models');
const { Op, QueryTypes } = require('sequelize');
const { validationResult } = require('express-validator');
const ProfessorDto = require('../dtos/professorDto');
const ApiError = require('../error/apiError');
const sequelize = require('../db');

class ProfessorController {
  async getAll(req, res, next) {
    try {
      const where = {};
      const order = {};

      const params = new ProfessorDto(req.query);

      const page = req.query.page ? parseInt(req.query.page) : 0;
      const per_page = req.query.per_page ? parseInt(req.query.per_page) : 500;

      if (params.email) where.email = { [Op.iLike]: `${params.email}%` };
      if (params.first_name) where.first_name = { [Op.iLike]: `${params.first_name}%` };
      if (params.last_name) where.last_name = { [Op.iLike]: `${params.last_name}%` };
      if (params.patronymic) where.patronymic = { [Op.iLike]: `${params.patronymic}%` };
      if (params.phone) where.phone = { [Op.iLike]: `${params.phone}%` };
      if (params.num_of_thesis) where.num_of_thesis = { [Op.eq]: params.num_of_thesis };

      let professor = {};

      if (req.query.sort) {
        order.sort = req.query.sort;
        if (req.query.validate) {
          order.validate = req.query.validate;
        }

        professor = await ProfessorModel.findAndCountAll({
          attributes: ['last_name', 'first_name', 'patronymic', 'email', 'phone', 'num_of_thesis'],
          where,
          offset: page,
          limit: per_page - page,
          order: [[order.sort, order.validate]],
        });
      } else {
        professor = await ProfessorModel.findAndCountAll({
          attributes: ['last_name', 'first_name', 'patronymic', 'email', 'phone', 'num_of_thesis'],
          where,
          offset: page,
          limit: per_page - page,
        });
      }

      if (professor.count <= 0) {
        return next(ApiError.NotFound('Преподователь не найден'));
      }

      return res.json(professor);
    } catch (error) {
      next(error);
    }
  }

  async getById(req, res, next) {
    try {
      const { id } = req.params;

      const professorById = await sequelize.query('SELECT * FROM "professors" WHERE id = ?', {
        replacements: [id],
        type: QueryTypes.SELECT,
      });

      if (!professorById) {
        return next(ApiError.NotFound('Преподователь не найден'));
      }

      return res.json(professorById);
    } catch (error) {
      next(error);
    }
  }

  async create(req, res, next) {
    try {
      const user = new ProfessorDto(req.body);

      const error = validationResult(req).array();

      if (error.length) {
        return next(ApiError.BadRequest(error[0].msg, error));
      }

      const professor = await ProfessorModel.create(user);

      return res.json(professor);
    } catch (error) {
      next(error);
    }
  }

  async update(req, res, next) {
    try {
      const { id } = req.params;

      const professorById = await ProfessorModel.findByPk(id);

      if (!professorById) {
        return next(ApiError.NotFound('Сотрудник не найден'));
      }

      const params = new ProfessorDto(req.body);

      if (params.email) professorById.email = params.email;
      if (params.first_name) professorById.first_name = params.first_name;
      if (params.last_name) professorById.last_name = params.last_name;
      if (params.patronymic) professorById.patronymic = params.patronymic;
      if (params.phone) professorById.phone = params.phone;

      const updatedInfo = await professorById.save();

      if (!updatedInfo) {
        return next(ApiError.BadRequest('Не удалось обновить'));
      }

      return res.json(updatedInfo);
    } catch (error) {
      next(error);
    }
  }

  async delete(req, res, next) {
    try {
      const { id } = req.params;

      const professorById = await ProfessorModel.findByPk(id);

      if (!professorById) {
        return next(ApiError.NotFound('Сотрудник не найден'));
      }

      const professor = await professorById.destroy();

      if (!professor) {
        return next(ApiError.BadRequest('Не удалось удалить'));
      }

      return res.json(professor);
    } catch (error) {
      next(error);
    }
  }
}

module.exports = new ProfessorController();
