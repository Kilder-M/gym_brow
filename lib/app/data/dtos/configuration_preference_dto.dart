class ConfigurationPreferenceDTO {
  int? themeMode;
  String? language;

  ConfigurationPreferenceDTO({this.language, this.themeMode});

  factory ConfigurationPreferenceDTO.fromMapLocalDataBase(
      Map<String, dynamic> json) {
    return ConfigurationPreferenceDTO(
        language: json['language'], themeMode: json['theme_mode']);
  }

  @override
  String toString() {
    return '$themeMode - $language';
  }
}

enum ThemeModeEnum {
  light(0),
  dark(1);

  final int value;

  const ThemeModeEnum(this.value);
}

enum LanguageEnum {
  english('en'),
  portugues('pt');

  const LanguageEnum(this.value);

  final String value;
}
