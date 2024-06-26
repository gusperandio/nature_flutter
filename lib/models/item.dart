import 'dart:convert';

class Item {
  final String title;
  final String description;
  final String? image;

  const Item({
    required this.title,
    required this.description,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'title': String title,
        'description': String description,
        'image': String image,
      } =>
        Item(
          title: title,
          description: description,
          image: image,
        ),
      _ => throw const FormatException('Failed to load item.'),
    };
  }
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          other.title == title &&
          other.description == description &&
          other.image == image;

  @override
  int get hashCode =>
      title.hashCode ^ description.hashCode ^ image.hashCode;
}
