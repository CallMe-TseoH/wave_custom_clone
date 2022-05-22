import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wave_custom_clone/config/theme/theme.dart' show AppColors;
import 'package:wave_custom_clone/core/enums/enums.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/domain/entities/entities.dart';
import 'package:wave_custom_clone/l10n/l10n.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';
import 'package:wave_custom_clone/presentation/home/bloc/home_bloc.dart';
import 'package:wave_custom_clone/presentation/home/pages/pages.dart';

part '_transaction_tile.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.status != current.status || previous.transactionFilter != current.transactionFilter,
      builder: (context, state) {
        return Column(children: [
          const Separator(value: 15),
          if (state.status == EventStatusEnum.loading) ...[
            const AppSpin(),
          ] else ...[
            if(state.transactionFilter==TransactionTypeEnum.all)...[
              for (int i = 0; i < state.transactions.length; i++)
                _TransactionTile(
                  transaction: state.transactions[i],
                ),
            ]else...[
              for (int i = 0; i < _getFliteredList(state).length; i++)
                _TransactionTile(
                  transaction: _getFliteredList(state)[i],
                ),
              if(_getFliteredList(state).length<8)...[
                const Separator(value: 80*8)
              ]
            ]

          ]
        ]);
      },
    );
  }

  List<TransactionEntity> _getFliteredList(HomeState state) => state.transactions.where((element) => element.type==state.transactionFilter).toList();
}
