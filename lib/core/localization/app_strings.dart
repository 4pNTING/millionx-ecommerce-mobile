enum AppLanguage { english, lao }

class AppStrings {
  const AppStrings({
    required this.loginTitle,
    required this.loginSubtitle,
    required this.identifier,
    required this.identifierRequired,
    required this.password,
    required this.passwordRequired,
    required this.signIn,
    required this.signingIn,
    required this.signOut,
    required this.welcome,
    required this.account,
    required this.restoreError,
    required this.retry,
    required this.homeNote,
  });

  final String loginTitle;
  final String loginSubtitle;
  final String identifier;
  final String identifierRequired;
  final String password;
  final String passwordRequired;
  final String signIn;
  final String signingIn;
  final String signOut;
  final String welcome;
  final String account;
  final String restoreError;
  final String retry;
  final String homeNote;

  static const english = AppStrings(
    loginTitle: 'Sign in to MillionX',
    loginSubtitle: 'Use your customer email or phone number',
    identifier: 'Email or phone',
    identifierRequired: 'Enter your email or phone number',
    password: 'Password',
    passwordRequired: 'Enter your password',
    signIn: 'Sign in',
    signingIn: 'Signing in...',
    signOut: 'Sign out',
    welcome: 'Welcome to MillionX',
    account: 'Customer account',
    restoreError: 'Could not restore your session. Check your connection.',
    retry: 'Retry',
    homeNote: 'Your account is ready. Shopping features will be added next.',
  );

  static const lao = AppStrings(
    loginTitle: 'ເຂົ້າສູ່ຮ້ານ MillionX',
    loginSubtitle: 'ໃຊ້ອີເມວ ຫຼື ເບີໂທຂອງລູກຄ້າ',
    identifier: 'ອີເມວ ຫຼື ເບີໂທ',
    identifierRequired: 'ກະລຸນາປ້ອນອີເມວ ຫຼື ເບີໂທ',
    password: 'ລະຫັດຜ່ານ',
    passwordRequired: 'ກະລຸນາປ້ອນລະຫັດຜ່ານ',
    signIn: 'ເຂົ້າສູ່ລະບົບ',
    signingIn: 'ກຳລັງເຂົ້າສູ່ລະບົບ...',
    signOut: 'ອອກຈາກລະບົບ',
    welcome: 'ຍິນດີຕ້ອນຮັບສູ່ MillionX',
    account: 'ບັນຊີລູກຄ້າ',
    restoreError: 'ກູ້ຄືນການເຂົ້າລະບົບບໍ່ໄດ້ ກະລຸນາກວດສອບເຄືອຂ່າຍ',
    retry: 'ລອງໃໝ່',
    homeNote: 'ບັນຊີຂອງທ່ານພ້ອມແລ້ວ ຟັງຊັນຊື້ສິນຄ້າຈະເພີ່ມຕໍ່ໄປ',
  );

  static AppStrings forLanguage(AppLanguage language) =>
      language == AppLanguage.lao ? lao : english;
}
