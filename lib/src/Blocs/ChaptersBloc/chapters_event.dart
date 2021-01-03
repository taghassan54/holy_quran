part of 'chapters_bloc.dart';

abstract class ChaptersEvent extends Equatable {
  const ChaptersEvent();
}

class LoadChapters extends ChaptersEvent{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
