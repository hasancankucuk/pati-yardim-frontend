class User {
  final String id;
  final String name;
  final String surname;
  final String mail;
  final String phoneNumber;
  final String address;
  final String password;
  final String userType;
  final bool isVisible;

  User(this.name, this.mail, this.id, this.surname, this.phoneNumber, this.address, this.password, this.userType, this.isVisible);
}