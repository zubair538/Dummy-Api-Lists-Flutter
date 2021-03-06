// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:dummyapilist/model/comment_entity.dart';
import 'package:dummyapilist/generated/json/comment_entity_helper.dart';
import 'package:dummyapilist/model/user_entity.dart';
import 'package:dummyapilist/generated/json/user_entity_helper.dart';
import 'package:dummyapilist/model/album_entity.dart';
import 'package:dummyapilist/generated/json/album_entity_helper.dart';
import 'package:dummyapilist/model/post_entity.dart';
import 'package:dummyapilist/generated/json/post_entity_helper.dart';

class JsonConvert<T> {
  T fromJson(Map<String, dynamic> json) {
    return _getFromJson<T>(runtimeType, this, json);
  }

  Map<String, dynamic> toJson() {
    return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
      case CommentEntity:
        return commentEntityFromJson(data as CommentEntity, json) as T;
      case UserEntity:
        return userEntityFromJson(data as UserEntity, json) as T;
      case UserAddress:
        return userAddressFromJson(data as UserAddress, json) as T;
      case UserAddressGeo:
        return userAddressGeoFromJson(data as UserAddressGeo, json) as T;
      case UserCompany:
        return userCompanyFromJson(data as UserCompany, json) as T;
      case AlbumEntity:
        return albumEntityFromJson(data as AlbumEntity, json) as T;
      case PostEntity:
        return postEntityFromJson(data as PostEntity, json) as T;
    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
    switch (type) {
      case CommentEntity:
        return commentEntityToJson(data as CommentEntity);
      case UserEntity:
        return userEntityToJson(data as UserEntity);
      case UserAddress:
        return userAddressToJson(data as UserAddress);
      case UserAddressGeo:
        return userAddressGeoToJson(data as UserAddressGeo);
      case UserCompany:
        return userCompanyToJson(data as UserCompany);
      case AlbumEntity:
        return albumEntityToJson(data as AlbumEntity);
      case PostEntity:
        return postEntityToJson(data as PostEntity);
    }
    return data as T;
  }

  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {
      case 'CommentEntity':
        return CommentEntity().fromJson(json);
      case 'UserEntity':
        return UserEntity().fromJson(json);
      case 'UserAddress':
        return UserAddress().fromJson(json);
      case 'UserAddressGeo':
        return UserAddressGeo().fromJson(json);
      case 'UserCompany':
        return UserCompany().fromJson(json);
      case 'AlbumEntity':
        return AlbumEntity().fromJson(json);
      case 'PostEntity':
        return PostEntity().fromJson(json);
    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {
      case 'CommentEntity':
        return List<CommentEntity>();
      case 'UserEntity':
        return List<UserEntity>();
      case 'UserAddress':
        return List<UserAddress>();
      case 'UserAddressGeo':
        return List<UserAddressGeo>();
      case 'UserCompany':
        return List<UserCompany>();
      case 'AlbumEntity':
        return List<AlbumEntity>();
      case 'PostEntity':
        return List<PostEntity>();
    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}
