part of 'transaction_filter_app_bar.dart';

class _TransactionFilterButton extends StatelessWidget {
  const _TransactionFilterButton

  ({
  super.key, required this.type,
  });

  final TransactionTypeEnum type;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.transactionFilter != current.transactionFilter,
      builder: (context, state) {
        return ExtendedContainer(
          color: type != state.transactionFilter? Colors.grey.shade200 : AppColors.purplishBlue.withOpacity(.5),
          useAnimated: true,
          animatedTimeInMilliseconds: 200,
          curve: Curves.slowMiddle,
          margin: EdgeInsets.symmetric(horizontal: SizesHelper.width(10)),
          borderRadius: BorderRadius.circular(SizesHelper.radius(20)),
          child: MaterialInkWell(
            onPressed: () {
              if(state.transactionFilter != type) {
                context.read<HomeBloc>().add(HomeTransactionFilterChanged(filter: type));
              }else{
                context.read<HomeBloc>().add(const HomeTransactionFilterChanged(filter: TransactionTypeEnum.all));
              }
            },
            radius: 18.5,
            splashColor: AppColors.purplishBlue,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _buildTransactionIcon,
                    color: AppColors.dark.withOpacity(.65),
                    size: AppFontSizesHelper.sm,
                  ),
                  const Separator(value: 5, onVertical: false,),
                  TextComponent(textKey: _getTransactionType(context),
                    fontSize: AppFontSizesHelper.sm,
                    color: AppColors.dark.withOpacity(.65),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String _getTransactionType(BuildContext context) {
    switch (type) {
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

  IconData get _buildTransactionIcon {
    switch (type) {
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