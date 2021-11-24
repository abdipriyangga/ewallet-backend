const transaction = require('express').Router();
const transactionController = require('../controllers/transaction.controller');
const auth = require('../middleware/checkToken');

transaction.delete('/:id', transactionController.deleteTransaction);
transaction.get('/', auth, transactionController.detailTransaction);
transaction.post('/', auth, transactionController.createTransaction);
module.exports = transaction;