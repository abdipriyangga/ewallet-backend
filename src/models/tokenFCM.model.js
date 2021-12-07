const Sequelize = require('sequelize');
const sequelize = require('../config/sequelize');
const authModel = require('./auth.model');

const TokenFCM = sequelize.define('token_fcm', {
  token: Sequelize.STRING,
  userId: Sequelize.INTEGER
});

TokenFCM.belongsTo(authModel, { foreignKey: 'userId', sourceKey: 'id' });
authModel.hasOne(TokenFCM);

module.exports = TokenFCM;