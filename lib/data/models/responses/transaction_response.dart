import 'package:equatable/equatable.dart';
import 'package:wave_custom_clone/core/enums/enums.dart';
import 'package:wave_custom_clone/domain/entities/transaction_entity.dart';

class TransactionResponse extends Equatable {
  const TransactionResponse({
    required this.id,
    required this.amount,
    required this.fee,
    required this.balance,
    required this.storedAt,
    required this.type,
    this.phoneNumber,
    this.contactName,
  });

  factory TransactionResponse.fromMap(Map<String, dynamic> map) {
    return TransactionResponse(
      id: map['id'] as String,
      amount: map['amount'] as int,
      fee: map['fee'] as int,
      balance: map['balance'] as int,
      storedAt: map['storedAt'] as String,
      type: map['type'] as int,
      phoneNumber: map['phoneNumber'] as String?,
      contactName: map['contactName'] as String?,
    );
  }

  final String id;
  final int amount;
  final int fee;
  final int balance;
  final String storedAt;
  final int type;
  final String? phoneNumber;
  final String? contactName;

  @override
  List<Object?> get props => [
        id,
        amount,
        fee,
        balance,
        storedAt,
        type,
        phoneNumber,
        contactName,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'fee': fee,
      'balance': balance,
      'storedAt': storedAt,
      'type': type,
      'phoneNumber': phoneNumber,
      'contactName': contactName,
    };
  }

  TransactionEntity toEntity() {
    return TransactionEntity(
      id: id,
      amount: amount,
      fee: fee,
      balance: balance,
      dateTime: DateTime.parse(storedAt),
      type: TransactionTypeEnum.values[type],
      contactName: contactName,
      phoneNumber: phoneNumber
    );
  }
}
