import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:holy_quran/src/Models/ChaptersModel.dart';
import 'package:holy_quran/src/Models/VersesModel.dart';
import 'package:holy_quran/src/screens/Verses/VersesRepo.dart';

part 'verses_event.dart';
part 'verses_state.dart';

class VersesBloc extends Bloc<VersesEvent, VersesState> {
 final VersesRepo _versesRepo;
  VersesBloc(this._versesRepo) : super(VersesInitial());

  @override
  Stream<VersesState> mapEventToState(
    VersesEvent event,
  ) async* {
    if(event is LoadVerses){
      try{

        var response = await _versesRepo.getVerses(page: event.page,chapters: event.chapters,recitation:event.recitation);
        yield(VersesLoadedSuccessfully(response));
      } on DioError catch (e) {
        yield LoadError();
      }
    }
  }
}
