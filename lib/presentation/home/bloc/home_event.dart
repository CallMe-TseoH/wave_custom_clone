part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeGetTransactionsList extends HomeEvent {

  const HomeGetTransactionsList();

  @override
  List<Object> get props => [];
}

class HomeConfirmWithDrawlSheetShown extends HomeEvent {
  const HomeConfirmWithDrawlSheetShown({required this.hasWithDrawlRequest});

  final bool hasWithDrawlRequest;

  @override
  List<Object> get props => [hasWithDrawlRequest];
}

class HomeBalanceVisibilityToggled extends HomeEvent {
  const HomeBalanceVisibilityToggled({required this.balanceVisibility});

  final bool balanceVisibility;

  @override
  List<Object> get props => [balanceVisibility];
}

class HomeTransactionAppBarVisibilityToggled extends HomeEvent {
  const HomeTransactionAppBarVisibilityToggled({required this.showTransactionAppBar});

  final bool showTransactionAppBar;

  @override
  List<Object> get props => [showTransactionAppBar];
}

class HomeTransactionFilterChanged extends HomeEvent {
  const HomeTransactionFilterChanged({required this.filter});

  final TransactionTypeEnum filter;

  @override
  List<Object> get props => [filter];
}
