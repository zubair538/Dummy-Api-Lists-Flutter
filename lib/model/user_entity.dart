import 'package:dummyapilist/generated/json/base/json_convert_content.dart';

class UserEntity with JsonConvert<UserEntity> {
  int id;
  String name;
  String username;
  String email;
  UserAddress address;
  String phone;
  String website;
  UserCompany company;
}

class UserAddress with JsonConvert<UserAddress> {
  String street;
  String suite;
  String city;
  String zipcode;
  UserAddressGeo geo;
}

class UserAddressGeo with JsonConvert<UserAddressGeo> {
  String lat;
  String lng;
}

class UserCompany with JsonConvert<UserCompany> {
  String name;
  String catchPhrase;
  String bs;
}
