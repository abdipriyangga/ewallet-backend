const transactionModel = require('../models/transaction.model');
const { response: formResponse } = require('../helpers/formResponse');
const userModel = require('../models/auth.model');
const firebase = require('../helpers/firebase');
const TokenFCM = require('../models/tokenFCM.model');
exports.createTopUp = async (req, res) => {
  const { id } = req.authUser;
  const date = new Date();
  const desc = 'Top Up Balance to Account';
  const deductedBalance = 0;
  try {
    if (req.body.topupBalance < 0) {
      return formResponse(res, 400, 'Sorry money cant be minus!');
    }
    else if (req.body.topupBalance < 10000) {
      return formResponse(res, 400, 'Sorry minimum topup must be 10000!');
    }
    const user = await userModel.findByPk(id, { include: TokenFCM });
    console.log(user);
    const topUp = await transactionModel.create({
      userId: id,
      noRef: date.getTime(),
      deductedBalance: deductedBalance,
      topupBalance: req.body.topupBalance,
      phoneRecipient: '',
      description: desc,
      trxFee: req.body.trxFee,
    });
    user.increment('balance', { by: req.body.topupBalance });
    await user.save();
    firebase.messaging().sendToDevice(user.token_fcm.token, {
      notification: {
        title: 'ODO',
        body: ` Topup dari bank sebesar Rp ${Number(req.body.topupBalance).toLocaleString('en')} telah berhasil melalui aplikasi ODO`
      }
    });
    return formResponse(res, 200, 'Top Up Successfully!', topUp);
  } catch (err) {
    return formResponse(res, 400, err);
  }
};