const PersonEntity = require('./personEntity');

module.exports = class ProfessorDto extends PersonEntity {
  email;
  phone;
  num_of_thesis;

  constructor(model) {
    super({ ...model });
    this.email = model.email;
    this.phone = model.phone;
    this.num_of_thesis = model.num_of_thesis;
  }
};
