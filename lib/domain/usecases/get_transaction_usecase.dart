import 'package:wave_custom_clone/core/interfaces/interfaces.dart';
import 'package:wave_custom_clone/domain/entities/entities.dart' show TransactionEntity;
import 'package:wave_custom_clone/domain/repositories/repositories.dart';

class GetTransactionUseCase extends UseCasesInterface<List<TransactionEntity>, NoParams?>{
  factory GetTransactionUseCase({required TransactionRepository transactionRepository,}){
    _instance.transactionRepository= transactionRepository;
    return _instance;
  }
  GetTransactionUseCase._();

  static final _instance = GetTransactionUseCase._();
  //
  late TransactionRepository transactionRepository;


  @override
  Future<List<TransactionEntity>> execute({NoParams? params}) {
    return transactionRepository.getTransactions();
  }

}