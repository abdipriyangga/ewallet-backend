const transfer = require('express').Router();
const transferController = require('../controllers/transfer.controller');
const auth = require('../middleware/checkToken');

transfer.post('/', auth, transferController.createTransfer);

module.exports = transfer;