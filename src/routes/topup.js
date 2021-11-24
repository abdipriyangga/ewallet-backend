const topup = require('express').Router();
const topupController = require('../controllers/topup.controller');
const auth = require('../middleware/checkToken');

topup.post('/', auth, topupController.createTopUp);

module.exports = topup;