const Router = require('express');
const professorRouter = require('./professorRouter');
const studenRoute = require('./studentRoute');
const thesisRouter = require('./thesisRouter');

const router = new Router();

router.use('/professors', professorRouter);
router.use('/students', studenRoute);
router.use('/thesis', thesisRouter);

module.exports = router;
