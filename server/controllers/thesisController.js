const {ThesisModel, ProfessorModel, StudentModel} = require("../models/models");
const {Op} = require("sequelize");

const ThesisDto = require("../dtos/ThesisDto");
const ApiError = require("../error/apiError");

class ThesisController {
	async getAll(req, res, next) {
		try {
			const where = {};

			const params = new ThesisDto(req.query);

			const page = req.query.page ? parseInt(req.query.page) : 1;
			const per_page = req.query.per_page ? parseInt(req.query.per_page) : 1;

			if (params.title) where.title = {[Op.iLike]: `${params.title}%`};

			const thesis = await ThesisModel.findAndCountAll({
				attributes: ["id", "title"],
				where,
				offset: (page - 1) * per_page,
				limit: per_page,
				include: [
					{
						model: StudentModel,
						attributes: ["last_name", "first_name", "patronymic"],
					},
					{
						model: ProfessorModel,
						attributes: ["last_name", "first_name", "patronymic"],
					},
				],
			});

			if (thesis.count <= 0) {
				return next(ApiError.NotFound("Дипломная работа не найдена"));
			}

			return res.json(thesis);
		} catch (error) {
			next(error);
		}
	}

	async getById(req, res, next) {
		try {
			const {id} = req.params;
			const {person} = req.query;

			console.log(person);

			let thesisById = {};

			switch ( person ) {
			case "student":
				thesisById = await ThesisModel.findAll({
					include: [{
						model: StudentModel,
						where: {id},
					}],
				});
				break;
			case "professor":
				thesisById = await ThesisModel.findAll({
					include: [{
						model: ProfessorModel,
						where: {id},
					}],
				});
				break;
			case "thesis":
				thesisById = await ThesisModel.findByPk(id);
				break;
			default:
				return next(ApiError.BadRequest("Не верный идентификатор"));
			}

			if (!thesisById) {
				return next(ApiError.NotFound("Дипломная работа не найдена"));
			}

			return res.json(thesisById);
		} catch (error) {
			next(error);
		}
	}

	async create(req, res, next) {
		try {
			const thesis_info = new ThesisDto(req.body);

			const example_thesis = await ThesisModel.findOne({where: {
				[Op.or]: [
					{
						title: thesis_info.title,
					},
					{
						studentId: thesis_info.studentId,
					},
				],
			}});

			if (example_thesis) {
				return next(ApiError.BadRequest("Дипломная работа уже существует или у данного студента дипломная работа уже загружена"));
			}

			const thesis = await ThesisModel.create(thesis_info);
			await ProfessorModel.increment("num_of_thesis", {where: {id: thesis.professorId}});

			return res.json(thesis);
		} catch (error) {
			next(error);
		}
	}

	async update(req, res, next) {
		try {
			const {id} = req.params;

			const thesisById = await ThesisModel.findByPk(id);

			if (!thesisById) {
				return next(ApiError.NotFound("Дипломная работа не найдена"));
			}

			const params = new ThesisDto(req.body);

			thesisById.title = params.title;

			const updatedInfo = await thesisById.save();

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

			const thesisById = await ThesisModel.findByPk(id);

			if (!thesisById) {
				return next(ApiError.NotFound("Дипломная работа не найдена"));
			}

			const thesis = await thesisById.destroy();

			if (!thesis) {
				return next(ApiError.BadRequest("Не удалось удалить"));
			}

			return res.json(thesis);
		} catch (error) {
			next(error);
		}
	}
}

module.exports = new ThesisController();
