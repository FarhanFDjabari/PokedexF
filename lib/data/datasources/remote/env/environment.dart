enum EnvironmentMode {
  production,
  development,
}

class Environments {
  static const EnvironmentMode _currentEnvironments =
      EnvironmentMode.development;
  static const List<Map<String, dynamic>> _availableEnvironment = [
    {'env': EnvironmentMode.development, 'url': 'https://pokeapi.co/api/v2/'},
    {'env': EnvironmentMode.production, 'url': 'https://pokeapi.co/api/v2/'}
  ];

  static String getEnvironment() {
    return _availableEnvironment
        .firstWhere(
          (d) => d['env'] == _currentEnvironments,
        )
        .values
        .last
        .toString();
  }
}
