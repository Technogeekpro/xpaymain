class UserModel {
  String userId;
  String firstName;
  String lastName;
  String country;
  String emailAddress;
  String mobile;
  String password;
  String accountType;
  String? companyName;
  String? representativeFirstName;
  String? representativeLastName;
  Map<String, dynamic> walletBalances;
  String? profilePhoto;
  String? address;
  String? state;
  String? city;
  String? zipCode;

  UserModel(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.country,
      required this.emailAddress,
      required this.mobile,
      required this.password,
      required this.accountType,
      this.companyName,
      this.representativeFirstName,
      this.representativeLastName,
      required this.walletBalances,
      required this.address,
      required this.state,
      required this.city,
      required this.zipCode,
      required this.profilePhoto});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'first_name': firstName,
      'last_name': lastName,
      'country': country,
      'email_address': emailAddress,
      'mobile': mobile,
      'password': password,
      'account_type': accountType,
      'company_name': companyName,
      'representative_first_name': representativeFirstName,
      'representative_last_name': representativeLastName,
      'wallet_balances': walletBalances,
      'address': address,
      'state': state,
      'city': city,
      'zip_code': zipCode,
      'profile_photo': profilePhoto
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        userId: map['userId'],
        firstName: map['first_name'],
        lastName: map['last_name'],
        country: map['country'],
        emailAddress: map['email_address'],
        mobile: map['mobile'],
        password: map['password'],
        accountType: map['account_type'],
        companyName: map['company_name'],
        representativeFirstName: map['representative_first_name'],
        representativeLastName: map['representative_last_name'],
        walletBalances: Map<String, dynamic>.from(map['wallet_balances']),
        address: map['address'],
        state: map['state'],
        city: map['city'],
        zipCode: map['zip_code'],
        profilePhoto: map['profile_photo']);
  }
}
