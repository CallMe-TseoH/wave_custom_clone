import 'package:uuid/uuid.dart';
import 'package:wave_custom_clone/data/models/responses/transaction_response.dart';
import 'package:wave_custom_clone/data/sources/remote/wave_api_source.dart';

class WaveApiSourceImpl extends WaveApiSource {
  @override
  Future<List<TransactionResponse>> getTransactions() async {
    return [
       TransactionResponse(
        id: const Uuid().v4().toUpperCase(),
        amount: 20000,
        fee: 200,
        balance: 580000,
        storedAt: '2022-05-21T21:49:58+0000',
        type: 0,
        contactName: 'Maman Moov',
        phoneNumber: '+225 07 499 623 00',
      ),
       TransactionResponse(
        id: const Uuid().v4().toUpperCase(),
        amount: 20000,
        fee: 0,
        balance: 580000,
        storedAt: '2022-04-21T10:49:58+0000',
        type: 1,
      ),
       TransactionResponse(
        id: const Uuid().v4().toUpperCase(),
        amount: 50000,
        fee: 0,
        balance: 580000,
        storedAt: '2022-05-10T10:49:58+0000',
        type: 2,
      ),
       TransactionResponse(
        id: const Uuid().v4().toUpperCase(),
        amount: 10000,
        fee: 100,
        balance: 580000,
        storedAt: '2022-05-04T12:49:58+0000',
        type: 0,
        contactName: 'Laetitia',
        phoneNumber: '+225 07 499 623 00',
      ),
       TransactionResponse(
        id: const Uuid().v4().toUpperCase(),
        amount: 10000,
        fee: 100,
        balance: 580000,
        storedAt: '2022-04-21T21:49:58+0000',
        type: 0,
        contactName: 'Maman Moov',
        phoneNumber: '+225 07 499 623 00',
      ),
       TransactionResponse(
        id: const Uuid().v4().toUpperCase(),
        amount: 5000,
        fee: 5,
        balance: 580000,
        storedAt: '2022-05-21T21:49:58+0000',
        type: 0,
        contactName: 'Maman Moov',
        phoneNumber: '+225 07 499 623 00',
      ),
       TransactionResponse(
        id: const Uuid().v4().toUpperCase(),
        amount: 18000,
        fee: 0,
        balance: 580000,
        storedAt: '2022-04-21T21:49:58+0000',
        type: 1
      ),
       TransactionResponse(
        id: const Uuid().v4().toUpperCase(),
        amount: 200000,
        fee: 0,
        balance: 580000,
        storedAt: '2022-03-21T21:49:58+0000',
        type: 2,
      ),
       TransactionResponse(
        id: const Uuid().v4().toUpperCase(),
        amount: 1000,
        fee: 0,
        balance: 580000,
        storedAt: '2022-03-21T21:49:58+0000',
        type: 2,
      ),
       TransactionResponse(
        id: const Uuid().v4().toUpperCase(),
        amount: 30000,
        fee: 300,
        balance: 580000,
        storedAt: '2022-02-11T16:49:58+0000',
        type: 0,
        contactName: 'Maman Moov',
        phoneNumber: '+225 07 499 623 00',
      ),
    ];
  }
}
