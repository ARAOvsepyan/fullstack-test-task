module.exports = class ThesisDto{
	title;
	professorId;
	studentId;

	constructor(model) {
		this.title = model.title;
		this.professorId = model.professorId;
		this.studentId = model.studentId;
	}
};