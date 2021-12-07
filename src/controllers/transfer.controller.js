const userModel = require('../models/auth.model');
const transactionModel = require('../models/transaction.model');
const TokenFCM = require('../models/tokenFCM.model');
const firebase = require('../helpers/firebase');
const { response: formResponse } = require('../helpers/formResponse');

exports.createTransfer = async (req, res) => {
  const user = await userModel.findByPk(req.authUser.id);
  const { phoneRecipient } = req.body;
  const desc = 'transfer balance';
  const topupBalance = 0;
  const phoneUser = await userModel.findOne({
    where: { phone_number: phoneRecipient }
  });
  if (!phoneUser) {
    return formResponse(res, 404, 'User not found!');
  }
  if (user.balance < req.body.balance) {
    return formResponse(res, 500, 'Sorry your money is not enough!');
  }
  const date = new Date();
  if (req.body.balance < 0) {
    return formResponse(res, 500, 'Sorry money cant be minus!');
  }
  const anotherUser = await userModel.findOne({
    where: { phone_number: phoneRecipient },
    include: TokenFCM
  });
  if (!anotherUser) {
    return formResponse(res, 404, 'User not found!');
  }
  const transfer = await transactionModel.create({
    userId: req.authUser.id,
    noRef: date.getTime(),
    phoneRecipient: req.body.phoneRecipient,
    deductedBalance: req.body.deductedBalance,
    topupBalance: topupBalance,
    transactionFee: req.body.transactionFee,
    description: desc,
  });
  user.decrement('balance', { by: req.body.deductedBalance });
  await user.save();
  anotherUser.increment('balance', { by: req.body.deductedBalance });
  await anotherUser.save();

  firebase.messaging().sendToDevice(anotherUser.token_fcm.token, {
    notification: {
      title: 'ODO',
      body: ` ${user.name} mengirimkan dana sebesar Rp ${Number(req.body.deductedBalance).toLocaleString('en')} melalui aplikasi ODO`
    }
  });
  return formResponse(res, 200, 'Transfer Successfully!', transfer);
};