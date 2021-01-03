part of 'verses_bloc.dart';

abstract class VersesState extends Equatable {
  const VersesState();
}

class VersesInitial extends VersesState {
  @override
  List<Object> get props => [];
}
class VersesLoadedSuccessfully extends VersesState{
  final VersesModel versesModel;

  VersesLoadedSuccessfully(this.versesModel);

  @override
  // TODO: implement props
  List<Object> get props => [versesModel];
}

class LoadError extends VersesState{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}