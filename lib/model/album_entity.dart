import 'package:dummyapilist/generated/json/base/json_convert_content.dart';

class AlbumEntity with JsonConvert<AlbumEntity> {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
}
