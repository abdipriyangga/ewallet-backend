const Sequelize = require('sequelize');
const sequelize = require('../config/sequelize');
const UserModel = require('./auth.model');

const Transaction = sequelize.define('transaction', {
  userId: Sequelize.INTEGER,
  noRef: Sequelize.STRING,
  deductedBalance: Sequelize.INTEGER,
  topupBalance: Sequelize.INTEGER,
  phoneRecipient: Sequelize.STRING,
  transactionFee: Sequelize.INTEGER,
  description: Sequelize.STRING,
});

Transaction.belongsTo(UserModel, { sourceKey: 'id' });
module.exports = Transaction;