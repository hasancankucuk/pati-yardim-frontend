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

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        surname = json['surname'],
        mail = json['mail'],
        phoneNumber = json['phoneNumber'],
        address = json['address'],
        password = json['password'],
        userType = json['userType'],
        isVisible = json['isVisible'];

  Map<String, dynamic> toJson() => {
        'id':id, 
        'name':name, 
        'surname':surname, 
        'mail':mail, 
        'phoneNumber':phoneNumber, 
        'address':address, 
        'password':password, 
        'userType':userType,
        'isVisible':isVisible,
      };
}