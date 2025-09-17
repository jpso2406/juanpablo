part of 'iniciodeinfo_bloc.dart';

sealed class HomeInfoState extends Equatable {
  const HomeInfoState();
  
  List<Object> get props => [];
}

final class HomeInfoInitial extends HomeInfoState {}

final class HomeInfoLoading extends HomeInfoState {}

final class HomeInfoFailed extends HomeInfoState {}

final class HomeInfoSuccess extends HomeInfoState {
  final List<User> users;
  const HomeInfoSuccess(this.users);

  @override
  List<Object> get props => [users];
}