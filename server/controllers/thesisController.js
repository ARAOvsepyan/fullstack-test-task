const { ThesisModel, ProfessorModel, StudentModel } = require('../models/models');
const { Op } = require('sequelize');

const ThesisDto = require('../dtos/ThesisDto');
const ProfessorDto = require('../dtos/professorDto');
const ApiError = require('../error/apiError');

class ThesisController {
  // async getAll(req, res, next) {
  // 	try {
  // 		const where = {};
  // 		const order = {};

  // 		const params = new ThesisDto(req.query);

  // 		const page = req.query.page ? parseInt(req.query.page) : 0;
  // 		const per_page = req.query.per_page ? parseInt(req.query.per_page) : 1000;

  // 		if (params.title) where.title = {[Op.iLike]: `${params.title}%`};

  // 		let thesis = {};

  // 		if (req.query.sort) {
  // 			order.sort = req.query.sort;
  // 			if (req.query.validate) {
  // 				order.validate = req.query.validate
  // 			};

  // 			thesis = await ThesisModel.findAndCountAll({
  // 				attributes: ["title"],
  // 				where,
  // 				offset: page,
  // 				limit: per_page - page,
  // 				order: [[order.sort, order.validate]],
  // 				include: [
  // 					{
  // 						model: StudentModel,
  // 						attributes: ["last_name", "first_name", "patronymic"],
  // 					},
  // 					{
  // 						model: ProfessorModel,
  // 						attributes: ["last_name", "first_name", "patronymic"],
  // 					},
  // 				],
  // 			});
  // 		} else {
  // 			thesis = await ThesisModel.findAndCountAll({
  // 				attributes: ["title"],
  // 				where,
  // 				offset: page,
  // 				limit: per_page - page,
  // 				include: [
  // 					{
  // 						model: StudentModel,
  // 						attributes: ["last_name", "first_name", "patronymic"],
  // 					},
  // 					{
  // 						model: ProfessorModel,
  // 						attributes: ["last_name", "first_name", "patronymic"],
  // 					},
  // 				],
  // 			});
  // 		}

  // 		if (thesis.count <= 0) {
  // 			return next(ApiError.NotFound("Дипломная работа не найдена"));
  // 		}

  // 		return res.json(thesis);
  // 	} catch (error) {
  // 		next(error);
  // 	}
  // }

  async getAll(req, res, next) {
    try {
      const order = {};
      const where = {};
      let professor = {};

      const params = new ProfessorDto(req.query);

      const page = req.query.page ? parseInt(req.query.page) : 0;
      const per_page = req.query.per_page ? parseInt(req.query.per_page) : 1000;

      if (params.email) where.email = { [Op.iLike]: `${params.email}%` };
      if (params.first_name) where.first_name = { [Op.iLike]: `${params.first_name}%` };
      if (params.last_name) where.last_name = { [Op.iLike]: `${params.last_name}%` };
      if (params.patronymic) where.patronymic = { [Op.iLike]: `${params.patronymic}%` };
      if (params.phone) where.phone = { [Op.iLike]: `${params.phone}%` };

      if (req.query.sort && req.query.validate) {
        order.sort = req.query.sort;
        order.validate = req.query.validate;

        professor = await ThesisModel.findAndCountAll({
          include: [
            {
              model: ProfessorModel,
              attributes: ['id', 'last_name', 'first_name', 'patronymic', 'email', 'phone'],
              order: [[order.sort, order.validate]],
              where,
            },
            {
              model: StudentModel,
              attributes: ['id', 'last_name', 'first_name', 'patronymic'],
            },
          ],
          offset: page,
          limit: per_page - page,
        });
      } else {
        professor = await ThesisModel.findAndCountAll({
          include: [
            {
              model: ProfessorModel,
              attributes: ['id', 'last_name', 'first_name', 'patronymic', 'email', 'phone'],
              order: [[order.sort, order.validate]],
              where,
            },
            {
              model: StudentModel,
              attributes: ['id', 'last_name', 'first_name', 'patronymic'],
            },
          ],
          offset: page,
          limit: per_page - page,
        });
      }

      if (professor.count <= 0) {
        return next(ApiError.NotFound('Преподователь не найден'));
      }

      const map = new Map(
        professor.rows.map(({ title, professorId, professor, student }) => [
          professorId,
          {
            id: professorId,
            full_name: [professor.last_name, professor.first_name, professor.patronymic].join(' '),
            callRecords: [],
          },
        ]),
      );
      for (let { professorId, student, title, id } of professor.rows) {
        let data = student.toJSON();
        data.title = title;
        map.get(professorId).callRecords.push(...[data].flat());
      }
      // return res.json({count: professor.count, rows: [...map.values()]})
      return res.json([...map.values()]);
    } catch (error) {
      next(error);
    }
  }

  async getById(req, res, next) {
    try {
      const { id } = req.params;
      const { person } = req.query;

      let thesisById = {};

      switch (person) {
        case 'student':
          thesisById = await ThesisModel.findAll({
            include: [
              {
                model: StudentModel,
                where: { id },
              },
            ],
          });
          break;
        case 'professor':
          thesisById = await ThesisModel.findAll({
            include: [
              {
                model: ProfessorModel,
                where: { id },
              },
            ],
          });
          break;
        case 'thesis':
          thesisById = await ThesisModel.findByPk(id);
          break;
        default:
          return next(ApiError.BadRequest('Не верный идентификатор'));
      }

      if (!thesisById) {
        return next(ApiError.NotFound('Дипломная работа не найдена'));
      }

      return res.json(thesisById);
    } catch (error) {
      next(error);
    }
  }

  async create(req, res, next) {
    try {
      const thesis_info = new ThesisDto(req.body);

      const canditate = await StudentModel.findOne({
        where: {
          [Op.and]: [
            {
              first_name: thesis_info.first_name,
            },
            {
              last_name: thesis_info.last_name,
            },
            {
              patronymic: thesis_info.patronymic,
            },
          ],
        },
      });

      const example_thesis = await ThesisModel.findOne({ where: { title: thesis_info.title } });

      if (example_thesis || canditate) {
        return next(
          ApiError.BadRequest(
            'Дипломная работа уже существует или у данного студента дипломная работа уже загружена',
          ),
        );
      }

      const student = await StudentModel.create({
        first_name: thesis_info.first_name,
        last_name: thesis_info.last_name,
        patronymic: thesis_info.patronymic,
      });

      const thesis = await ThesisModel.create({
        title: thesis_info.title,
        professorId: thesis_info.professorId,
        studentId: student.id,
      });

      await ProfessorModel.increment('num_of_thesis', { where: { id: thesis.professorId } });

      return res.json(thesis);
    } catch (error) {
      next(error);
    }
  }

  async update(req, res, next) {
    try {
      const { id } = req.params;

      const thesisById = await ThesisModel.findOne({
        where: { studentId: id },
      });

      if (!thesisById) {
        return next(ApiError.NotFound('Дипломная работа не найдена'));
      }

      const params = new ThesisDto(req.body);

      thesisById.title = params.title;

      const updatedInfo = await thesisById.save();

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

      const thesisById = await ThesisModel.findOne({
        where: { studentId: id },
      });

      if (!thesisById) {
        return next(ApiError.NotFound('Дипломная работа не найдена'));
      }

      const thesis = await thesisById.destroy();

      if (!thesis) {
        return next(ApiError.BadRequest('Не удалось удалить'));
      }

      return res.json(thesis);
    } catch (error) {
      next(error);
    }
  }
}

module.exports = new ThesisController();
