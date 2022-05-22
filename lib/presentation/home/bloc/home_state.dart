part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = EventStatusEnum.initial,
    this.transactions = const [],
    this.hasWithDrawlRequest = false,
    this.balanceVisibility = false,
    this.showTransactionAppBar = false,
    this.transactionFilter = TransactionTypeEnum.all,
  });

  final EventStatusEnum status;
  final List<TransactionEntity> transactions;
  final bool hasWithDrawlRequest;
  final bool balanceVisibility;
  final bool showTransactionAppBar;
  final TransactionTypeEnum transactionFilter;

  @override
  List<Object?> get props => [
        status,
        transactions,
        balanceVisibility,
        showTransactionAppBar,
        hasWithDrawlRequest,
        transactionFilter,
      ];

  HomeState copyWith({
    EventStatusEnum? status,
    List<TransactionEntity>? transactions,
    bool? hasWithDrawlRequest,
    bool? balanceVisibility,
    bool? showTransactionAppBar,
    TransactionTypeEnum? transactionFilter,
  }) {
    return HomeState(
      status: status ?? this.status,
      transactions: transactions ?? this.transactions,
      hasWithDrawlRequest: hasWithDrawlRequest ?? this.hasWithDrawlRequest,
      balanceVisibility: balanceVisibility ?? this.balanceVisibility,
      showTransactionAppBar: showTransactionAppBar ?? this.showTransactionAppBar,
      transactionFilter: transactionFilter ?? this.transactionFilter,
    );
  }

  @override
  String toString() {
    return 'HomeState{status: $status, transactions: ${transactions.length}, hasWithDrawlRequest: $hasWithDrawlRequest, balanceVisibility: $balanceVisibility, showTransactionAppBar: $showTransactionAppBar, transactionFilter: $transactionFilter}';
  }
}
