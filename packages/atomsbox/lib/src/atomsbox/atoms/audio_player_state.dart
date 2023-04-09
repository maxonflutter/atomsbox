enum AudioPlayerState {
  /// The audio player is stopped.
  stopped,

  /// The audio player is playing.
  playing,

  /// The audio player is paused.
  paused,

  /// The audio player is loading.
  loading,

  /// The audio player is buffering.
  buffering,

  /// The audio player is completed.
  completed,

  /// The audio player is error.
  error,
}
