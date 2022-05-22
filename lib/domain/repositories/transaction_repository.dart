import 'package:wave_custom_clone/domain/entities/transaction_entity.dart';

abstract class TransactionRepository{
  Future<List<TransactionEntity>> getTransactions();
}