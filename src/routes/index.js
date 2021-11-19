const express = require('express');
const auth = require('./auth');
const user = require('./user');
const mainRouter = express.Router();
const { APP_UPLOAD_ROUTE, APP_UPLOAD_PATH } = process.env;
const welcomeRouter = require('./welcome');
// endpoint handler
mainRouter.use(APP_UPLOAD_ROUTE, express.static(APP_UPLOAD_PATH));
mainRouter.use('/auth', auth);
mainRouter.use('/user', user);
mainRouter.use('/', welcomeRouter);


module.exports = mainRouter;