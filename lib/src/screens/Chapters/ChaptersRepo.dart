import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:holy_quran/src/Models/ChaptersModel.dart';
import 'package:path_provider/path_provider.dart';

class ChaptersRepo{
  final Dio _dio;

  ChaptersRepo(this._dio);

  getChapters() async{

    String fileName = "ChaptersDataCash.json";
    var cacheDir = await getTemporaryDirectory();
    if (await File(cacheDir.path + "/" + fileName).exists()) {
      print("Loading from cache");

      var jsonData = File(cacheDir.path + "/" + fileName).readAsStringSync();

      return ChaptersModel.fromJson(json.decode(jsonData));

    }else{

      print("Loading from API");
      var response =await _dio.get('/chapters?language=ar');

      var tempDir = await getTemporaryDirectory();
      File file = new File(tempDir.path + "/" + fileName);
      file.writeAsString(json.encode(response.data), flush: true, mode: FileMode.write);

      return ChaptersModel.fromJson(response.data);
    }


  }
}