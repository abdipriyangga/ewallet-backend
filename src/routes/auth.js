const auth = require('express').Router();
const authController = require('../controllers/auth.controller');
const checkToken = require('../middleware/checkToken');
auth.post('/register', authController.register);
auth.post('/login', authController.login);
auth.post('/registerToken', checkToken, authController.registerToken);
module.exports = auth;