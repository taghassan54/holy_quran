import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:holy_quran/src/Models/ChaptersModel.dart';
import 'package:holy_quran/src/Models/VersesModel.dart';
import 'package:path_provider/path_provider.dart';

class VersesRepo{
  final Dio _dio;

  VersesRepo(this._dio);

  getVerses({Chapters chapters,int page,int recitation}) async{

    String fileName = "chapters${chapters.id}page$page.json";
    var cacheDir = await getTemporaryDirectory();

    if (await File(cacheDir.path + "/" + fileName).exists()) {
      print("Loading from cache");

      var jsonData = File(cacheDir.path + "/" + fileName).readAsStringSync();

      return VersesModel.fromJson(json.decode(jsonData));

    }else {
      print("Loading from API");
      var response = await _dio.get('chapters/${chapters.id}/verses?recitation=$recitation&language=en&limit=20&text_type=words&page=$page');
      var tempDir = await getTemporaryDirectory();
      File file = new File(tempDir.path + "/" + fileName);
      file.writeAsString(json.encode(response.data), flush: true, mode: FileMode.write);

      return VersesModel.fromJson(response.data);
    }
  }
}