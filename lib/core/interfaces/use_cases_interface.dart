import 'package:equatable/equatable.dart';

abstract class UseCasesInterface<T, P> {
  Future<T> execute({P params});
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}