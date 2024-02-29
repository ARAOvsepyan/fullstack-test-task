const { ProfessorModel, StudentModel } = require("../models/models");

const createSchema = {
	email: {
		normalizeEmail: true,
		custom: {
			options: async email => {
				const professor = await ProfessorModel.findAll({
					where: {email}
				});
				if (professor.length) {
					return Promise.reject("Пользователь с такой почтой уже существует");
				}
			}
		}
	},
	phone: {
		isMobilePhone: true,
		custom: {
			options: async phone => {
				const professor = await ProfessorModel.findAll({
					where: {phone}
				});
				if (professor.length) {
					return Promise.reject("Пользователь с таким номером телефона уже существует");
				}
			}
		}
	}
};
module.exports = createSchema;