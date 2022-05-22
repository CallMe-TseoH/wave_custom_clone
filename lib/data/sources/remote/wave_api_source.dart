import 'package:wave_custom_clone/data/models/responses/transaction_response.dart';

abstract class WaveApiSource{
  Future<List<TransactionResponse>> getTransactions();
}

