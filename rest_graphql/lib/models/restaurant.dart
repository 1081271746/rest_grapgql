class Restaurant {
  final int id;
  final String name;
  final String email;

  Restaurant({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}