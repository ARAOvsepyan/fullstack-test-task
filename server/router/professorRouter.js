const Router = require("express");
const professorController = require("../controllers/professorController");
const {checkSchema} = require("express-validator");
const createSchema = require("../middleware/createPersonMiddleware");

const router = new Router();

router.get("", professorController.getAll);
router.get("/:id", professorController.getById);
router.post("", checkSchema(createSchema), professorController.create);
router.patch("/:id", professorController.update);
router.delete("/:id", professorController.delete);

module.exports = router;
