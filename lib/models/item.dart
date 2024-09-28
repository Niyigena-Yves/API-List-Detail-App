class Item {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  final String description;

  Item({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
    required this.description,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
      description: json['description'] ?? 'No description available',
    );
  }
}