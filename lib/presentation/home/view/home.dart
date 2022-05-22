import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_custom_clone/data/repositories/repositories.dart';
import 'package:wave_custom_clone/domain/repositories/repositories.dart';
import 'package:wave_custom_clone/presentation/home/bloc/home_bloc.dart';
import 'package:wave_custom_clone/presentation/home/view/home_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => TransactionRepositoryImpl(),
      child: BlocProvider(
        create: (context) => HomeBloc(
          transactionRepository: RepositoryProvider.of<TransactionRepositoryImpl>(context),
        )..add(const HomeGetTransactionsList()),
        child: const HomeView(),
      ),
    );
  }
}
