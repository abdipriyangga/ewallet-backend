const transactionModel = require('../models/transaction.model');
const { response: formResponse } = require('../helpers/formResponse');
const userModel = require('../models/auth.model');
const { Op } = require('sequelize');
const { APP_URL } = process.env;
exports.createTransaction = async (req, res) => {
  const { id } = req.authUser;
  const user = await userModel.findByPk(id);
  const date = new Date();

  if (user.balance < req.body.deductedBalance) {
    return formResponse(res, 400, 'Sorry your money is not enough!');
  }
  else if (req.body.deductedBalance < 0) {
    return formResponse(res, 400, 'Sorry money cant be minus!');
  }
  const trx = await transactionModel.create({
    userId: id,
    noRef: date.getTime(),
    deductedBalance: req.body.deductedBalance,
    transactionFee: req.body.transactionFee,
    description: req.body.description,
  });
  user.decrement('balance', { by: req.body.deductedBalance });
  await user.save();
  if (trx) {
    return formResponse(res, 200, 'Transaction Successfully!', trx);
  }
};

exports.detailTransaction = async (req, res) => {
  let { search = '', sort, limit = 6, page = 1 } = req.query;
  const order = [];
  const pageInfo = {};
  if (typeof sort === 'object') {
    const key = Object.keys(sort)[0];
    let value = sort[key];
    if (value === '1') {
      value = 'DESC';
    } else {
      value = 'ASC';
    }
    order.push([key, value]);
  }
  if (typeof limit === 'string') {
    limit = parseInt(limit);
  }
  if (typeof page === 'string') {
    page = parseInt(page);
  }
  const count = await transactionModel.count({
    where: {
      userId: {
        [Op.substring]: req.authUser.id
      }
    }
  });
  const nextPage = page < Math.ceil(count / limit) ? `${APP_URL}/transaction?page=${page + 1}` : null;
  const prevPage = page > 1 ? `${APP_URL}/transaction?page=${page - 1}` : null;
  const trx = await transactionModel.findAll({
    where: {
      description: {
        [Op.substring]: search
      },
      userId: {
        [Op.substring]: req.authUser.id
      }
    },
    order,
    limit,
    offset: (page - 1) * limit
  });
  pageInfo.totalData = count;
  pageInfo.totalPage = Math.ceil(count / limit);
  pageInfo.currentPage = page;
  pageInfo.nextPage = nextPage;
  pageInfo.prevPage = prevPage;
  if (trx) {
    return formResponse(res, 200, 'Detail Transaction', trx, pageInfo);
  } else {
    return formResponse(res, 404, 'Sorry Id not found!');
  }

};

exports.deleteTransaction = async (req, res) => {
  const { id } = req.params;
  const trx = await transactionModel.findByPk(id);
  await trx.destroy();
  return formResponse(res, 200, 'Deleted Successfully!', trx);
};