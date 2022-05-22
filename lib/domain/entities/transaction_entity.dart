import 'package:equatable/equatable.dart';
import 'package:wave_custom_clone/core/enums/enums.dart' show TransactionTypeEnum;

class TransactionEntity extends Equatable {

  const TransactionEntity({
    required this.id,
    required this.amount,
    required this.fee,
    required this.balance,
    required this.dateTime,
    required this.type,
    this.phoneNumber,
    this.contactName,
  });
  final String id;
  final int amount;
  final int fee;
  final int balance;
  final DateTime dateTime;
  final TransactionTypeEnum type;
  final String? phoneNumber;
  final String? contactName;



  @override
  List<Object?> get props => [id, amount, fee, balance, dateTime, type, phoneNumber, contactName,];
}