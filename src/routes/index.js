const express = require('express');
const auth = require('./auth');
const topup = require('./topup');
const transaction = require('./transaction');
const transfer = require('./transfer');
const user = require('./user');
const mainRouter = express.Router();
const { APP_UPLOAD_ROUTE, APP_UPLOAD_PATH } = process.env;
const welcomeRouter = require('./welcome');
// endpoint handler
mainRouter.use(APP_UPLOAD_ROUTE, express.static(APP_UPLOAD_PATH));
mainRouter.use('/topup', topup);
mainRouter.use('/transaction', transaction);
mainRouter.use('/auth', auth);
mainRouter.use('/user', user);
mainRouter.use('/transfer', transfer);
mainRouter.use('/', welcomeRouter);


module.exports = mainRouter;