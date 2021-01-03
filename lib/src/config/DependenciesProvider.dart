import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:holy_quran/src/screens/Chapters/ChaptersRepo.dart';
import 'package:holy_quran/src/screens/Verses/VersesRepo.dart';


GetIt getIt = GetIt.instance;

class DependenciesProvider {
  DependenciesProvider._();

  static void build() {

    final Dio client = Dio();

    // final String _baseUrl = "https://admin.just-cost.com/api/";
    final String _baseUrl = "http://api.quran.com/api/v3/";
    client.options = BaseOptions(
      baseUrl: _baseUrl,
      responseType: ResponseType.json,
    );

    client.interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      requestHeader: true,
      error: true,
      requestBody: true,
      responseHeader: true,
    ));



    getIt.registerSingleton<Dio>(client);
    getIt.registerFactory<ChaptersRepo>(() => ChaptersRepo(client));
    getIt.registerFactory<VersesRepo>(() => VersesRepo(client));



  }

  static T provide<T>() {
    return getIt.get<T>();
  }
}
