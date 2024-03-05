const Router = require('express');
const thesisController = require('../controllers/thesisController');

const router = new Router();

router.get('', thesisController.getAll);
router.get('/:id', thesisController.getById);
router.post('', thesisController.create);
router.patch('/:id', thesisController.update);
router.delete('/:id', thesisController.delete);

module.exports = router;
