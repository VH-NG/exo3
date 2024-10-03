class StatusErrorException implements Exception {
  final String message;

  StatusErrorException(this.message);
}
@override
String toString() {
  return 'StatusErrorException: $message';
}

class CatApi {
  static const String _baseUrl = 'https://api.thecatapi.com/v1';
  static const String _apiKey = 'live_OuHvDxavqFkLb68B2iVUFPtwqLQXwiktv50RKQ3KjkD2hXKNTg41EFK4JOIanZwr';

  static future<List<Breed>> getBreeds() async {
    try{
      final response = await http.get(
        Uri.parse('$_baseUrl/breeds'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'x-api-key': _apiKey,
        },
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> breedsJson = jsonDecode(response.body);
        return breedsJson.map((json) => Breed.fromJson(json)).toList();
      } else {
        throw StatusErrorException('Failed to load breeds');
      }
    }
  }
}
