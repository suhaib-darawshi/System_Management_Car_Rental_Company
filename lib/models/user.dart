class User {
  late int id;
  late String name;
  late String Email;
  late String password;
  late String role;
  User(
      {required this.id,
      required this.name,
      required this.Email,
      required this.password,
      required this.role});
  User.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['Username'];
    this.Email = map['Email'];
    this.password = map['Password'];
    this.role = map['UserRole'];
  }
  Map<String, dynamic> toMap() {
    return {
      'Username': this.name,
      'Email': this.Email,
      'Password': this.password,
      'UserRole': this.role
    };
  }
}
