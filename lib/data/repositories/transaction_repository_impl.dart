import 'package:wave_custom_clone/data/sources/sources.dart';
import 'package:wave_custom_clone/domain/entities/transaction_entity.dart';
import 'package:wave_custom_clone/domain/repositories/repositories.dart' show TransactionRepository;

class TransactionRepositoryImpl extends TransactionRepository{
  final WaveApiSource _waveApiSource = WaveApiSourceImpl();

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    return Future.delayed(const Duration(seconds: 10), (){
      return _waveApiSource.getTransactions().then((value){
        return value.map((e) => e.toEntity()).toList();
      });
    });

  }

}