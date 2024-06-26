class ConnectivityState{
  const ConnectivityState({
    required this.isOffline,
    required this.isYetToSync,
    required this.isOfflineAvailable,
  });
  final bool isOffline;
  final bool isYetToSync;
  final bool isOfflineAvailable;

  ConnectivityState copyWith({
    bool? isOffline,
    bool? isYetToSync,
    bool? isOfflineAvailable,
  }) {
    return ConnectivityState(
      isOffline: isOffline ?? this.isOffline,
      isYetToSync: isYetToSync ?? this.isYetToSync,
      isOfflineAvailable: isOfflineAvailable ?? this.isOfflineAvailable,
    );
  }
}
