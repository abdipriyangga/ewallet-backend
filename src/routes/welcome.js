const express = require('express');
const welcomeRouter = express.Router();

welcomeRouter.get('/', (req, res) => {
  res.send('Welcome to E-Wallet API');
});

module.exports = welcomeRouter;