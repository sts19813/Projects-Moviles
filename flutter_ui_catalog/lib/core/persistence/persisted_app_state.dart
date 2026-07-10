class PersistedAppState {
  const PersistedAppState({
    this.theme = 'system',
    this.useMaterial3 = true,
    this.density = 'comfortable',
    this.showCupertinoExamples = true,
    this.showCodeAutomatically = false,
    this.favoriteIds = const <String>[],
    this.searchHistory = const <String>[],
    this.recentComponentIds = const <String>[],
  });

  final String theme;
  final bool useMaterial3;
  final String density;
  final bool showCupertinoExamples;
  final bool showCodeAutomatically;
  final List<String> favoriteIds;
  final List<String> searchHistory;
  final List<String> recentComponentIds;
}
