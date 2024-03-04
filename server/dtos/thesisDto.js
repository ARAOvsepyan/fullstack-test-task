const PersonEntity = require("./personEntity");

module.exports = class ThesisDto extends PersonEntity{
	title;
	professorId;

	constructor(model) {
		super({...model});
		this.title = model.title;
		this.professorId = model.professorId;
	}
};