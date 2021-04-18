class AppStrings {
  static AppStrings _instance;
  static AppStrings get instance {
    _instance ??= AppStrings._init();

    return _instance;
  }

  AppStrings._init();

  static String get appBarTitle => 'Kİ';
  static String get welcome => 'Hoş geldiniz :)';
  static String get stateDefault => 'Bir şeyler yanlış gitti !';
}
