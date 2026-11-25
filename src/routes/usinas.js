var express = require("express");
var router = express.Router();

var usinaController = require("../controllers/usinaController");

router.get("/:empresaId", function (req, res) {
  usinaController.buscarUsinasPorEmpresa(req, res);
});

// router.post("/cadastrar", function (req, res) {
//   aquarioController.cadastrar(req, res);
// })

module.exports = router;