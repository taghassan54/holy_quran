part of 'chapters_bloc.dart';

abstract class ChaptersState extends Equatable {
  const ChaptersState();
}

class ChaptersInitial extends ChaptersState {
  @override
  List<Object> get props => [];
}

class ChaptersLoadedSuccessfully extends ChaptersState{
  final ChaptersModel chaptersModel;

  ChaptersLoadedSuccessfully(this.chaptersModel);

  @override
  // TODO: implement props
  List<Object> get props => [chaptersModel];
}

class LoadError extends ChaptersState{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class LoadingState extends ChaptersState{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}