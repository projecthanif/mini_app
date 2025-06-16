class UserModel {
  const UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.birthDate,
    required this.phone,
  });

  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String birthDate;
  final String phone;

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      firstname: data['firstname'],
      lastname: data['lastname'],
      email: data['email'],
      birthDate: data['birthDate'],
      phone: data['phone'],
    );
  }
}
