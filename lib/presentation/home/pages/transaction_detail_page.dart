import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wave_custom_clone/config/theme/theme.dart' show AppColors;
import 'package:wave_custom_clone/core/enums/enums.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/domain/entities/entities.dart';
import 'package:wave_custom_clone/l10n/l10n.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({super.key, required this.transaction});

  static const routeName = 'TransactionDetailPage';

  final TransactionEntity transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.dark),
      ),
      body: StretchingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: SizesHelper.width(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: SizesHelper.height(28),
                backgroundImage: AssetImage(_transactionIconPath),
              ),
              const Separator(value: 30),
              TextComponent(
                textKey: '$_getSign${transaction.amount}F',
                fontWeight: FontWeight.bold,
                fontSize: AppFontSizesHelper.xl,
              ),
              const Separator(value: 5),
              TextComponent(
                textKey: _getTransactionName(context),
                fontSize: AppFontSizesHelper.ml,
              ),
              _buildSeparator25,
              _DetailTile(
                title: _buildTransactionDetailAmountType(context),
                subtitle: '${transaction.amount}F',
              ),
              _buildSeparator25,
              _DetailTile(
                title: context.l10n.transactionDetailFee,
                subtitle: '${transaction.fee}F',
              ),
              _buildSeparator25,
              _DetailTile(
                title: context.l10n.transactionDetailStatus,
                subtitle: context.l10n.transactionDetailStatusPerform,
              ),
              _buildSeparator25,
              if (transaction.type == TransactionTypeEnum.withdrawn) ...[
                _DetailTile(
                  title: "Nom de l'agent",
                  subtitle: transaction.phoneNumber ?? '-',
                ),
                _buildSeparator25,
              ],
              _DetailTile(
                title: context.l10n.transactionDetailDateAndTime,
                subtitle: DateFormat
                    .yMMMEd()
                    .add_Hm()
                    .format(transaction.dateTime),
              ),
              _buildSeparator25,
              _DetailTile(
                title: context.l10n.transactionDetailNewBalance,
                subtitle: '${transaction.balance}F',
              ),
              _buildSeparator25,
              _DetailTile(
                title: context.l10n.transactionDetailTransactionID,
                subtitle: '${transaction.id}F',
              ),
              const Separator(value: 50),
              TextComponent(
                textKey: context.l10n.transactionDetailPartner,
                fontSize: AppFontSizesHelper.sm,
                color: AppColors.dark.withOpacity(.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _buildTransactionDetailAmountType(BuildContext context) {
    switch (transaction.type) {
      case TransactionTypeEnum.transfer:
        return context.l10n.transactionDetailAmountReceived;
      case TransactionTypeEnum.deposit:
        return context.l10n.transactionDetailAmountWithdrawn;
      case TransactionTypeEnum.withdrawn:
        return context.l10n.transactionDetailAmountReceived;
      case TransactionTypeEnum.all:
        return '-';
    }
  }

  String _getTransactionName(BuildContext context) {
    switch (transaction.type) {
      case TransactionTypeEnum.transfer:
        return '${transaction.contactName?.toUpperCase()}';
      case TransactionTypeEnum.deposit:
        return context.l10n.homeTransactionTypeDeposit;
      case TransactionTypeEnum.withdrawn:
        return 'Retrait';
      case TransactionTypeEnum.all:
        return '-';
    }
  }

  String get _transactionIconPath {
    switch (transaction.type) {
      case TransactionTypeEnum.transfer:
        return 'assets/icons/transfer_detail_icon.png';
      case TransactionTypeEnum.deposit:
        return 'assets/icons/deposit_icon.png';
      case TransactionTypeEnum.withdrawn:
        return 'assets/icons/withdrawil_icon.png';
      case TransactionTypeEnum.all:
        return 'assets/icons/transfer_detail_icon.png';
    }
  }

  Separator get _buildSeparator25 => const Separator(value: 25);

  String get _getSign {
    switch (transaction.type) {
      case TransactionTypeEnum.transfer:
        return '-';
      case TransactionTypeEnum.deposit:
        return '';
      case TransactionTypeEnum.withdrawn:
        return '-';
      case TransactionTypeEnum.all:
        return '';
    }
  }
}

class _DetailTile extends StatelessWidget {
  const _DetailTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextComponent(
          textKey: title,
          fontSize: AppFontSizesHelper.sm,
          color: AppColors.dark.withOpacity(.5),
        ),
        const Separator(value: 5),
        TextComponent(
          textKey: subtitle,
          fontSize: AppFontSizesHelper.sm,
        ),
      ],
    );
  }
}
