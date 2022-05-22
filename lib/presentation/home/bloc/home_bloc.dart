import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wave_custom_clone/core/enums/enums.dart';
import 'package:wave_custom_clone/domain/entities/entities.dart';
import 'package:wave_custom_clone/domain/repositories/repositories.dart';
import 'package:wave_custom_clone/domain/usecases/usecases.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required TransactionRepository transactionRepository,
  })  : _transactionRepository = transactionRepository,
        super(const HomeState()) {
    on<HomeGetTransactionsList>(_onGetTransactionsList);
    on<HomeConfirmWithDrawlSheetShown>(_onShowConfirmWithDrawlSheet);
    on<HomeBalanceVisibilityToggled>(_onBalanceVisibilityToggled);
    on<HomeTransactionAppBarVisibilityToggled>(_onTransactionAppBarVisibilityToggled);
    on<HomeTransactionFilterChanged>(_onTransactionFilterChanged);
  }

  final TransactionRepository _transactionRepository;

  Future<void> _onGetTransactionsList(
    HomeGetTransactionsList event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: EventStatusEnum.loading));
    try {
      final _transactions = await GetTransactionUseCase(
        transactionRepository: _transactionRepository,
      ).execute();
      emit(
        state.copyWith(
          status: EventStatusEnum.success,
          transactions: _transactions,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: EventStatusEnum.failure));
    }
  }

  void _onShowConfirmWithDrawlSheet(
    HomeConfirmWithDrawlSheetShown event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(hasWithDrawlRequest: event.hasWithDrawlRequest));
  }
  void _onBalanceVisibilityToggled(
      HomeBalanceVisibilityToggled event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(balanceVisibility: event.balanceVisibility));
  }

  void _onTransactionAppBarVisibilityToggled(
      HomeTransactionAppBarVisibilityToggled event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(showTransactionAppBar: event.showTransactionAppBar));
    if(!event.showTransactionAppBar){
      emit(state.copyWith(transactionFilter: TransactionTypeEnum.all));
    }
  }

  void _onTransactionFilterChanged(
      HomeTransactionFilterChanged event,
    Emitter<HomeState> emit,
  ) {
      emit(state.copyWith(transactionFilter: event.filter));
  }
}
