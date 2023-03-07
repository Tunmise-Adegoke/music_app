import 'package:dio/dio.dart';
import 'package:music_app/api/api_endpoints.dart';

class ApiInterceptor {
  final Dio api = Dio();

  ApiInterceptor() {
    api.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) => RequestOptions(),
    onResponse: (e, handler) => ResponseInterceptorHandler(),
    onError: (e, handler) => ErrorInterceptorHandler(),
    ));
  }
}
  // List<TrackList> trackList = [];
  // Future<List<TrackList>> fetchProducts() async {
  //   http.Response response = await http.get(Uri.parse(kUri1));
  //   if (response.statusCode == 200) {
  //     var jsonString = response.body;
  //     trackList = [];
  //     trackList.addAll(Body.fromJson(json.decode(response.body)).trackList!);
  //   } else {
  //     throw Exception('Error Occured');
  //   }
  //   return trackList;
  // } 

