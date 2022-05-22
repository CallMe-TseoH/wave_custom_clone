import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_custom_clone/config/theme/theme.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';
import 'package:wave_custom_clone/presentation/home/bloc/home_bloc.dart';
import 'package:wave_custom_clone/presentation/home/components/components.dart'
    show ConfirmWithDrawlButton, HomeActionsButtonList, NotificationsCarousel, TransactionFilterAppBar, TransactionListView, WaveCard, homeAppBar;
import 'package:wave_custom_clone/presentation/home/components/home_sliver_app_bar.dart';
import 'package:wave_custom_clone/presentation/home/pages/pages.dart' show ConfirmWithDrawlDialog;

class HomeView extends StatelessWidget {
  const HomeView

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.purplishBlue,
        systemNavigationBarColor: AppColors.white,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: StretchingOverscrollIndicator(
                      axisDirection: AxisDirection.down,
                      child: CustomScrollView(
                        slivers: [
                          SliverPersistentHeader(
                            delegate: HomeSliverAppBar(
                              title: '580.000',
                              backgroundColor: AppColors.purplishBlue,
                              maxHeight: SizesHelper.height(105),
                              minHeight: SizesHelper.height(80),
                            ),
                            pinned: true,
                          ),
                          SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                ExtendedContainer(
                                  height: SizesHelper.height(320),
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: ExtendedContainer(
                                          color: AppColors.purplishBlue,
                                        ),
                                      ),
                                      Positioned(
                                        top: SizesHelper.height(140),
                                        left: 0,
                                        right: 0,
                                        child: ExtendedContainer(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.circular(
                                            SizesHelper.radius(20),
                                          ),
                                          height: SizesHelper.height(200),
                                          width: double.infinity,
                                          child: const HomeActionsButtonList(),
                                        ),
                                      ),
                                      const WaveCard(),
                                    ],
                                  ),
                                ),
                                const NotificationsCarousel(),
                              ],
                            ),
                          ),
                          BlocBuilder<HomeBloc, HomeState>(
                            buildWhen: (previous, current) => previous.showTransactionAppBar != current.showTransactionAppBar,
                            builder: (context, state) {
                              return SliverPersistentHeader(pinned: true,
                                delegate: TransactionFilterAppBar(maxHeight: state.showTransactionAppBar),
                              );
                            },
                          ),
                          SliverList(
                              delegate: SliverChildListDelegate([
                                const TransactionListView(),
                              ])),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
