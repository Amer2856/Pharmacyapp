class User {
  String username, _password, auth;
  String? firstname, lastname;
  String? email, phone;
  User(this.username, this._password, this.auth) {
    firstname = username.split(' ')[0];
    lastname = username.split(' ')[1];
  }
  String get GetPass {
    return this._password;
  }

  String get GetName {
    return this.username;
  }
}

List<User> users = [
  User("Amer Helal", "12345678", "amerhelal523@gmail.com"),
  User("Sakher Hatoum", "11223344", "0937416195")
];
