module.exports = class PersonEntity {
  last_name;
  first_name;
  patronymic;

  constructor(model) {
    this.last_name = model.last_name;
    this.first_name = model.first_name;
    this.patronymic = model.patronymic;
  }
};
