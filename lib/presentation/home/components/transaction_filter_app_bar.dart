import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_custom_clone/config/theme/app_colors.dart';
import 'package:wave_custom_clone/core/constant/shadow.dart';
import 'package:wave_custom_clone/core/enums/enums.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/l10n/l10n.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';
import 'package:wave_custom_clone/presentation/home/bloc/home_bloc.dart';

part '_transaction_filter_button.dart';
class TransactionFilterAppBar extends SliverPersistentHeaderDelegate{
  TransactionFilterAppBar({required this.maxHeight});

  final bool maxHeight;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
   context.read<HomeBloc>().add(HomeTransactionAppBarVisibilityToggled(showTransactionAppBar: overlapsContent));
    return !maxHeight? const Separator(value: 0): ExtendedContainer(
      color: AppColors.white,
      width: double.infinity,
      size: 80,
      boxShadow: [
        outerShadowSmall
      ],
      child: Row(children: [
        for(var i=0; i<TransactionTypeEnum.values.length; i++)
          if(i<TransactionTypeEnum.values.length-1)
        Expanded(
          child: _TransactionFilterButton(type: TransactionTypeEnum.values[i],),
        )
      ],),
    );
  }

  @override
  double get maxExtent => !maxHeight? 0 : 80;

  @override
  double get minExtent => !maxHeight? 0 : SizesHelper.height(70);

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate){
   return oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
  }

}

