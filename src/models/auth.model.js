const Sequelize = require('sequelize');
const sequelize = require('../config/sequelize');

const Auth = sequelize.define('users', {
  name: {
    type: Sequelize.STRING,
    allowNull: false,
    validate: {
      notNull: {
        msg: 'Please enter your name!'
      }
    }
  },
  password: {
    type: Sequelize.STRING,
    allowNull: true,
    validate: {
      len: [5, 255]
    }
  },
  email: {
    type: Sequelize.STRING,
    validate: {
      isEmail: {
        msg: 'Please enter your valid email!'
      }
    }
  },
  phone_number: Sequelize.STRING,
  images: Sequelize.STRING,
  balance: Sequelize.INTEGER,
});

module.exports = Auth;