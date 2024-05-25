
class User {
  final int id;
  final String fname;
  final String sname;
  final String oname;
  final String email;
  final String phone;
  final String gender;
  final String address;
  final String username;
  final String password;

  User({
    required this.id,
    required this.fname,
    required this.sname,
    required this.oname,
    required this.email,
    required this.phone,
    required this.gender,
    required this.address,
    required this.username,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fname: json['fname'],
      sname: json['sname'],
      oname: json['oname'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      address: json['address'],
      username: json['username'],
      password: json['password'],
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fname': fname,
      'sname': sname,
      'oname': oname,
      'email': email,
      'phone': phone,
      'gender': gender,
      'address': address,
      'username': username,
      'password': password,
    };
  }
}

// class User {
//   String username;
//   String password;
//   User({required this.username, required this.password});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(username: json['username'], password: json['password']);
//   }
// }
