const admin = require('firebase-admin');
const serviceAccount = require('../config/odo-wallet-firebase-adminsdk-elusq-8040be4bec.json');

const firebase = admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

module.exports = firebase;