class AudioBookInfo {
  final String? id;
  final String image;
  final String duration;
  final String rating;
  final String title;
  final String text;
  final String audio;

  AudioBookInfo({
    this.id,
    required this.image,
    required this.duration,
    required this.rating,
    required this.title,
    required this.text,
    required this.audio,
  });
}
