class User {
  final int? id;
  final String? name;
  final String? email;

  const User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] ?? 0,
    name: json['name'] ?? 'No Name',
    email: json['email'] ?? 'No Email',
  );

  @override
  // ignore: override_on_non_overriding_member
  List<Object?> get props => [id, name, email];
}