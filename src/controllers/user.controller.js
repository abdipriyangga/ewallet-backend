const userModel = require('../models/auth.model');
const { response: formResponse } = require('../helpers/formResponse');
const { APP_URL, APP_UPLOAD_ROUTE } = process.env;
const { Op } = require('sequelize');
const bcrypt = require('bcrypt');

exports.detailUser = async (req, res) => {
  const { id } = req.authUser;
  const user = await userModel.findByPk(id);
  if (
    user.images !== null &&
    !user.images.startsWith('http')
  ) {
    user.images = `${APP_URL}${user.images}`;
  }
  return formResponse(res, 200, 'Detail User: ', user);
};

exports.updateUser = async (req, res) => {
  const { id } = req.authUser;
  const user = await userModel.findByPk(id);
  if (user === null) {
    return formResponse(res, 404, 'User profile not found!');
  } else {
    if (req.file) {
      req.body.images = req.file ? `${APP_UPLOAD_ROUTE}/${req.file.filename}` : null;
      user.set(req.body);
      await user.save();
      if (user.images !== null && !user.images.startsWith('http')) {
        user.images = `${APP_URL}${user.images}`;
      }
      return formResponse(res, 200, 'upload successfully!', user);
    } else {
      user.set(req.body);
      await user.save();
      if (user.images !== null && !user.images.startsWith('http')) {
        user.images = `${APP_URL}${user.images}`;
      }
      return formResponse(res, 200, 'upload successfully!', user);
    }
  }
};

exports.deleteUserProfile = async (req, res) => {
  const { id } = req.params;
  const user = await userModel.findByPk(id);
  if (user === null) {
    return formResponse(res, 404, 'User profile not found!');
  } else {
    await user.destroy();
    return formResponse(res, 200, 'Delete user successfully! ', user);
  }
};

exports.changePassword = async (req, res) => {
  const user = await userModel.findByPk(req.authUser.id);
  const checkOldPassword = await userModel.findAll({
    where: {
      password: {
        [Op.substring]: req.body.old_password
      },
      id: {
        [Op.substring]: req.authUser.id
      }
    }
  });
  const check = await userModel.findOne({
    where: { email: user.email }
  });
  console.log(user.email);
  const results = check;
  const compare = await bcrypt.compare(req.body.old_password, results.password);
  if (user) {
    if (checkOldPassword) {
      if (compare) {
        try {
          req.body.password = await bcrypt.hash(req.body.password, await bcrypt.genSalt());
          user.set(req.body);
          await user.save();
          return formResponse(res, 200, 'Change Password Success!', user);
        } catch (err) {
          return formResponse(res, 400, 'Change Password Failed!', err);
        }
      } else {
        return formResponse(res, 400, 'Password doesnt match!');
      }
    } else {
      return formResponse(res, 400, 'Password doesnt match!');
    }
  } else {
    return formResponse(res, 404, 'User not Found!');
  }
};