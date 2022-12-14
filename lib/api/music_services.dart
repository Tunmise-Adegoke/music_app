import 'dart:convert';


import 'package:music_app/api/api_constants.dart';
import 'package:music_app/model/model1.dart';
import 'package:http/http.dart' as http;

class MusicServices {
  List<TrackList> trackList = [];
  Future<List<TrackList>> fetchProducts() async {
    http.Response response = await http.get(Uri.parse(kUri1));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      trackList = [];
      trackList.addAll(Body.fromJson(json.decode(response.body)).trackList!);
    } else {
      throw Exception('Error Occured');
    }
    return trackList;
  } 
}
