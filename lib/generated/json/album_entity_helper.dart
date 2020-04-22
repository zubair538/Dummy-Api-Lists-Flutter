import 'package:dummyapilist/model/album_entity.dart';

albumEntityFromJson(AlbumEntity data, Map<String, dynamic> json) {
  if (json['albumId'] != null) {
    data.albumId = json['albumId']?.toInt();
  }
  if (json['id'] != null) {
    data.id = json['id']?.toInt();
  }
  if (json['title'] != null) {
    data.title = json['title']?.toString();
  }
  if (json['url'] != null) {
    data.url = json['url']?.toString();
  }
  if (json['thumbnailUrl'] != null) {
    data.thumbnailUrl = json['thumbnailUrl']?.toString();
  }
  return data;
}

Map<String, dynamic> albumEntityToJson(AlbumEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['albumId'] = entity.albumId;
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['url'] = entity.url;
  data['thumbnailUrl'] = entity.thumbnailUrl;
  return data;
}
