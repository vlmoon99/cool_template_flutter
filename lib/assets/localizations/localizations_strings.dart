class LocalizationsStrings {
  static final _Auth auth = _Auth();
  static final _Home home = _Home();
  static const localizationPath = './assets/translations';
}

class _Auth {
  final login = _Login();
  final forgotPassword = _ForgotPassword();
  final resetPassword = _ResetPassword();
  final register = _Register();
}

class _Home {
  final title = 'launch.title';
  final editAccount = _EditAccount();
  final changePassword = _ChangePassword();
  final entity = _Entity();
  final settings = _Settings();
}

class _Login {
  final title = 'login.title';
  final forgotPassword = 'login.forgotPassword';
  final registerNewAccount = 'login.registerNewAccount';
}

class _ForgotPassword {
  final title = 'forgotPassword.title';
  final sendResetPasswordKey = 'forgotPassword.sendResetPasswordKey';
}

class _ResetPassword {
  final title = 'resetPassword.title';
  final resetButton = 'resetPassword.resetButton';
}

class _Register {
  final title = 'register.title';
}

class _EditAccount {
  final title = 'editAccount.title';
  final sendButton = 'editAccount.sendButton';
}

class _ChangePassword {
  final title = 'changePassword.title';
  final changeButton = 'changePassword.changeButton';
}

class _Entity {
  final title = 'entity.title';
}

class _Settings {
  final title = 'settings.title';
  final accountListTitleText = 'settings.accountListTitleText';
  final passwordListTitleText = 'settings.passwordListTitleText';
  final singOutListTitleText = 'settings.singOutListTitleText';
}
