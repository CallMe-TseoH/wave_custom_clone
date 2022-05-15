import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_custom_clone/presentation/security/cubit/security_cubit.dart';
import 'package:wave_custom_clone/presentation/security/view/security_view.dart';

class Security extends StatelessWidget {
  const Security({super.key});

  static const routeName = '/Security';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SecurityCubit(),
      child: const SecurityView(),
    );
  }
}
