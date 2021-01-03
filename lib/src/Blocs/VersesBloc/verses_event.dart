part of 'verses_bloc.dart';

abstract class VersesEvent extends Equatable {
  const VersesEvent();
}
class LoadVerses extends VersesEvent{
 final int page;
  final int recitation;
  final Chapters chapters;
  LoadVerses({this.page,this.recitation,this.chapters});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
