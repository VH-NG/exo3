class Breed {
  final String name;
  final String description;
  final String id;

  Breed({
    required this.name,
    required this.description,
    required this.id,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  @override
  int get hashCode {
    return id.hashCode;
  }

  @override
  bool operator ==(Object other) {
    return super == other;
  }

  toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}