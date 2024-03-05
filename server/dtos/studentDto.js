const PersonEntity = require('./personEntity');

module.exports = class StudentDto extends PersonEntity {
  constructor(model) {
    super({ ...model });
  }
};
