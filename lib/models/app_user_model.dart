class AppUser {
  String userId;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String birthdate;

  AppUser({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.birthdate,
    // this.updated,
  });

  factory AppUser.fromJson(Map<String, dynamic> data) {
    if (data == null) return null;
    return AppUser(
      userId: data['id'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      email: data['email'],
      phoneNumber: data['mobile'],
      birthdate: data['birthdate'],
    );
  }

  toJson() {
    return {
      'userId': userId,
      'first_name': firstName,
      'last_name': lastName,
      'mobile': phoneNumber,
      'email': email,
      'birthdate': birthdate,
    };
  }
}
