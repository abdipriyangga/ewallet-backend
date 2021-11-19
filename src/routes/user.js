const user = require('express').Router();
const userController = require('../controllers/user.controller');
const auth = require('../middleware/checkToken');
const upload = require('../middleware/upload');

// ENDPOINT
user.get('/', auth, userController.detailUser);
user.patch('/', auth, upload, userController.updateUser);
user.patch('/editPassword', auth, userController.changePassword);
user.delete('/:id', userController.deleteUserProfile);

module.exports = user;