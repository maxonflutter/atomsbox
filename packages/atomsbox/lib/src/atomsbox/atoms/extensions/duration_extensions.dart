extension DurationExt on Duration {
  String formatDuration() {
    // ignore: unnecessary_null_comparison
    if (this == null) {
      return '--:--';
    } else {
      String minutes = inMinutes.toString().padLeft(2, '0');
      String seconds = inSeconds.remainder(60).toString().padLeft(2, '0');
      return '$minutes:$seconds';
    }
  }
}
