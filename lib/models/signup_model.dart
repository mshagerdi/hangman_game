class SignupBody {
  String name;
  String username;
  String email;
  String password;

  SignupBody({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = name;
    data['username'] = username;
    data['email_id'] = email;
    data['phone_number'] = '0000';
    data['password'] = password;
    // data['created_at'] = DateTime.now().toString();
    return data;
  }
}
