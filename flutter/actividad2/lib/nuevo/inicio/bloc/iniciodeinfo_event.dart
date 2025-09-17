part of 'iniciodeinfo_bloc.dart';

sealed class HomeInfoEvent extends Equatable {
  const HomeInfoEvent();

  List<Object> get props => [];
}

class Equatable {
  const Equatable();
}


class CargarHomeInfo extends HomeInfoEvent {}

class RetryHomeInfo extends HomeInfoEvent {}