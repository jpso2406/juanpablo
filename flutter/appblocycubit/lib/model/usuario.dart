
class Usuario {
  final int? id;
  final String? nombre;
  final String? email;
  final String? telefono;
  final String? nombreUsuario;
  final String? fotoPerfil; 

  const Usuario({
    this.email,
    this.telefono,
    this.nombreUsuario,
    this.fotoPerfil,
    this.id,
    this.nombre, 
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'] ?? 'No ID',
      nombre: json['firstName'] + json['lastName'] ?? 'No Nombre',
      email: json['email'] ?? 'No Email',
      telefono: json['phone'] ?? 'No Telefono',
      nombreUsuario: json['username'] ?? 'No Nombre Usuario',
      fotoPerfil: json['image'] ?? 'No Foto Perfil',
    );
  }

  List<Object?> get props => [id, nombre, email, telefono, nombreUsuario, fotoPerfil];
}