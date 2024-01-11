class Album {
  
  final int id;
  final String name;

  const Album({
    
    required this.id,
    required this.name,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        
        'id': int id,
        'name': String name,
      } =>
        Album(
          
          id: id,
          name: name,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
