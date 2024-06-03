class Staff {
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
  final List<String> attendanceHistories;

  Staff({
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
    required this.attendanceHistories,
  });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
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
      attendanceHistories: List<String>.from(json['attendanceHistories']),
    );
  }
}
