const Router = require('express');
const studentController = require('../controllers/studentContoller');

const router = new Router();

router.get('', studentController.getAll);
router.get('/:id', studentController.getById);
router.post('', studentController.create);
router.patch('/:id', studentController.update);
router.delete('/:id', studentController.delete);

module.exports = router;
