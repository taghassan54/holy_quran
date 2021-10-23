import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:holy_quran/src/Models/ChaptersModel.dart';
import 'package:holy_quran/src/screens/Chapters/ChaptersRepo.dart';

part 'chapters_event.dart';
part 'chapters_state.dart';

class ChaptersBloc extends Bloc<ChaptersEvent, ChaptersState> {
  final ChaptersRepo _chaptersRepo;

  ChaptersBloc(this._chaptersRepo) : super(ChaptersInitial());


  @override
  Stream<ChaptersState> mapEventToState(
    ChaptersEvent event,
  ) async* {
    if(event is LoadChapters){
      yield(LoadingState());
      try{

        var response = await _chaptersRepo.getChapters();
        yield(ChaptersLoadedSuccessfully(response));
      } on DioError catch (e) {
        print(e.message);
        yield LoadError();
      }
    }
  }
}
