part of 'transactions_list_view.dart';

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({super.key, required this.transaction});

  final TransactionEntity transaction;

  @override
  Widget build(BuildContext context) {
    return ExtendedContainer(
      // height: SizesHelper.height(80),
      width: double.infinity,
      child: MaterialInkWell(
        onPressed: () {
          Navigator.of(context).pushNamed(
            TransactionDetailPage.routeName,
            arguments: transaction,
          );
        },
        splashColor: AppColors.purplishBlue.withOpacity(.35),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: SizesHelper.width(18),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextComponent(
                    textKey: _transactionTitle(context),
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSizesHelper.sm - 1.5,
                    color: AppColors.purplishBlue,
                  ),
                  TextComponent(
                    textKey: '${transaction.amount}F',
                    fontWeight: FontWeight.w600,
                    fontSize: AppFontSizesHelper.sm - 2,
                    color: AppColors.purplishBlue,
                  ),
                ],
              ),
              const Separator(value: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (transaction.phoneNumber != null) ...[
                    TextComponent(
                      textKey: transaction.phoneNumber ?? '-',
                      fontSize: AppFontSizesHelper.s - 1,
                      color: AppColors.purplishBlue.withOpacity(.5),
                    ),
                  ] else ...[
                    const Separator(
                      onVertical: false,
                      value: 10,
                    ),
                  ],
                  TextComponent(
                    textKey: _buildTransactionTypeTitle(context),
                    fontSize: AppFontSizesHelper.s - 2.5,
                    color: _buildTransactionIconColor.withOpacity(.45),
                  ),
                ],
              ),
              const Separator(value: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextComponent(
                    textKey: _getTransactionTime,
                    fontSize: AppFontSizesHelper.s - 1.5,
                    color: Colors.grey.shade400,
                  ),
                  Icon(
                    _buildTransactionIcon,
                    color: _buildTransactionIconColor.withOpacity(.5),
                    size: AppFontSizesHelper.s,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _transactionTitle(BuildContext context) {
    switch (transaction.type) {
      case TransactionTypeEnum.transfer:
        return transaction.contactName ?? '-';
      case TransactionTypeEnum.deposit:
        return context.l10n.homeTransactionTypeDeposit;
      case TransactionTypeEnum.withdrawn:
        return 'Retrait';
      case TransactionTypeEnum.all:
        return '-';
    }
  }

  String get _getTransactionTime => '${DateFormat.MMMd().format(transaction.dateTime)}, ${DateFormat.Hm().format(transaction.dateTime)}';

  String _buildTransactionTypeTitle(BuildContext context) {
    switch (transaction.type) {
      case TransactionTypeEnum.transfer:
        return context.l10n.homeTransactionTypeTransfer;
      case TransactionTypeEnum.deposit:
        return context.l10n.homeTransactionTypeDeposit;
      case TransactionTypeEnum.withdrawn:
        return 'Retrait';
      case TransactionTypeEnum.all:
        return '-';
    }
  }

  Color get _buildTransactionIconColor {
    switch (transaction.type) {
      case TransactionTypeEnum.transfer:
        return AppColors.blue;
      case TransactionTypeEnum.deposit:
        return Colors.green;
      case TransactionTypeEnum.withdrawn:
        return AppColors.orange;
      case TransactionTypeEnum.all:
        return AppColors.purplishBlue;
    }
  }

  IconData get _buildTransactionIcon {
    switch (transaction.type) {
      case TransactionTypeEnum.transfer:
        return Icons.compare_arrows;
      case TransactionTypeEnum.deposit:
        return Icons.arrow_drop_up;
      case TransactionTypeEnum.withdrawn:
        return Icons.arrow_drop_down;
      case TransactionTypeEnum.all:
        return Icons.compare_arrows;
    }
  }
}
