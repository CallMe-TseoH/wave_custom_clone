import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_custom_clone/presentation/components/app_spin.dart';
import 'package:wave_custom_clone/presentation/home/home.dart';
import 'package:wave_custom_clone/presentation/security/cubit/security_cubit.dart';
import 'package:wave_custom_clone/presentation/security/view/security_view.dart';

class Security extends StatelessWidget {
  const Security

  ({super.key});

  static const routeName = '/Security';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SecurityCubit(),
      child: BlocListener<SecurityCubit, SecurityState>(
        listenWhen: (previous, current) => previous.pin != current.pin,
        listener: (context, state) async {
          if(state.pin.length>3){
            showDialog<void>(
              barrierDismissible: false,
              context: context, builder: (_){
              return const AppSpin();
            },).ignore();
            await Future.delayed(const Duration(seconds: 2), (){
              if(ModalRoute.of(context)?.isCurrent != true) Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(Home.routeName);
            });
          }
        },
        child: const SecurityView(),
      ),
    );
  }
}
