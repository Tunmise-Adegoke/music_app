import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/api/api_interceptor.dart';

class MusicCubit extends Cubit {
  final _musicService = MusicServices();
  MusicCubit() :super([]);

  void get message async => emit(await _musicService.fetchProducts());
}
