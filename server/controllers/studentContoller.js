const {StudentModel} = require("../models/models");
const {Op} = require("sequelize");
const {validationResult} = require("express-validator");

const StudentDto = require("../dtos/StudentDto");
const ApiError = require("../error/apiError");

class StudentController {
	async getAll(req, res, next) {
		try {
			const where = {};

			const params = new StudentDto(req.query);

			const page = req.query.page ? parseInt(req.query.page) : 1;
			const per_page = req.query.per_page ? parseInt(req.query.per_page) : 1;

			if (params.first_name) where.first_name = {[Op.iLike]: `${params.first_name}%`};
			if (params.last_name) where.last_name = {[Op.iLike]: `${params.last_name}%`};
			if (params.patronymic) where.patronymic = {[Op.iLike]: `${params.patronymic}%`};

			const student = await StudentModel.findAndCountAll({
				where,
				offset: (page - 1) * per_page,
				limit: per_page,
			});


			if (student.count <= 0) {
				return next(ApiError.NotFound("Студент не найден"));
			}

			return res.json(student);
		} catch (error) {
			next(error);
		}
	}

	async getById(req, res, next) {
		try {
			const {id} = req.params;

			const studentById = await StudentModel.findByPk(id);

			if (!studentById) {
				return next(ApiError.NotFound("Студент не найден"));
			}

			return res.json(studentById);
		} catch (error) {
			next(error);
		}
	}

	async create(req, res, next) {
		try {
			const user = new StudentDto(req.body);

			const error = validationResult(req).array();

			if (error.length) {
				return next(ApiError.BadRequest(error[0].msg, error));
			}

			const student = await StudentModel.create(user);

			return res.json(student);
		} catch (error) {
			next(error);
		}
	}

	async update(req, res, next) {
		try {
			const {id} = req.params;

			const StudentById = await StudentModel.findByPk(id);

			if (!StudentById) {
				return next(ApiError.NotFound("Студент не найден"));
			}

			const params = new StudentDto(req.body);

			if (params.first_name) StudentById.first_name = params.first_name;
			if (params.last_name) StudentById.last_name = params.last_name;
			if (params.patronymic) StudentById.patronymic = params.patronymic;

			const updatedInfo = await StudentById.save();

			if (!updatedInfo) {
				return next(ApiError.BadRequest("Не удалось обновить"));
			}

			return res.json(updatedInfo);
		} catch (error) {
			next(error);
		}
	}

	async delete(req, res, next) {
		try {
			const {id} = req.params;

			const StudentById = await StudentModel.findByPk(id);

			if (!StudentById) {
				return next(ApiError.NotFound("Студент не найден"));
			}

			const Student = await StudentById.destroy();

			if (!Student) {
				return next(ApiError.BadRequest("Не удалось удалить"));
			}

			return res.json(Student);
		} catch (error) {
			next(error);
		}
	}
}

module.exports = new StudentController();
