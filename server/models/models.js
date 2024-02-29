const {DataTypes} = require("sequelize");
const sequelize = require("../db");

const ProfessorModel = sequelize.define("professor", {
	id: {type: DataTypes.UUID, defaultValue: DataTypes.UUIDV4, primaryKey: true},
	last_name: {type: DataTypes.STRING(50), allowNull: false},
	first_name: {type: DataTypes.STRING(50), allowNull: false},
	patronymic: {type: DataTypes.STRING(50), allowNull: false},
	email: {type: DataTypes.STRING(50), allowNull: false, unique: true},
	phone: {type: DataTypes.STRING(50), allowNull: false, unique: true},
	num_of_thesis: {type: DataTypes.INTEGER, defaultValue: 0},
});

const StudentModel = sequelize.define("student", {
	id: {type: DataTypes.UUID, defaultValue: DataTypes.UUIDV4, primaryKey: true},
	last_name: {type: DataTypes.STRING(50), allowNull: false},
	first_name: {type: DataTypes.STRING(50), allowNull: false},
	patronymic: {type: DataTypes.STRING(50), allowNull: false},
});

const ThesisModel = sequelize.define("thesis", {
	id: {type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true},
	title: {type: DataTypes.STRING(50), allowNull: false},
});

ProfessorModel.hasMany(ThesisModel, {
	foreignKey: {
		type: DataTypes.UUID,
	},
	onDelete: "CASCADE",
});
ThesisModel.belongsTo(ProfessorModel);

StudentModel.hasOne(ThesisModel, {
	foreignKey: {
		type: DataTypes.UUID,
	},
	onDelete: "CASCADE",
});
ThesisModel.belongsTo(StudentModel);

module.exports = {ProfessorModel, StudentModel, ThesisModel};
