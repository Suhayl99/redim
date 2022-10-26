class UserModel {
  bool? status;
  Data? data;

  UserModel({this.status, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  List<User>? user;
  double? portfolioValue;

  Data({this.user, this.portfolioValue});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user?.add(User.fromJson(v));
      });
    }
    portfolioValue = json['portfolio_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user?.map((v) => v.toJson()).toList();
    }
    data['portfolio_value'] = portfolioValue;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? phone;
  String? email;
  int? phoneConfirmed;
  int? isActive;
  String? gender;
  String? accessToken;
  String? referredByCode;
  String? referralCode;
  String? cashoutMethod;
  String? cashoutValue;

  User(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.phoneConfirmed,
      this.isActive,
      this.gender,
      this.accessToken,
      this.referredByCode,
      this.referralCode,
      this.cashoutMethod,
      this.cashoutValue});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    phoneConfirmed = json['phone_confirmed'];
    isActive = json['is_active'];
    gender = json['gender'];
    accessToken = json['access_token'];
    referredByCode = json['referred_by_code'];
    referralCode = json['referral_code'];
    cashoutMethod = json['cashout_method'];
    cashoutValue = json['cashout_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['phone_confirmed'] = phoneConfirmed;
    data['is_active'] = isActive;
    data['gender'] = gender;
    data['access_token'] = accessToken;
    data['referred_by_code'] = referredByCode;
    data['referral_code'] = referralCode;
    data['cashout_method'] = cashoutMethod;
    data['cashout_value'] = cashoutValue;
    return data;
  }
}
