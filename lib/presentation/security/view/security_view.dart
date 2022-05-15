import 'package:flutter/material.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';
import 'package:wave_custom_clone/presentation/security/components/components.dart';

class SecurityView extends StatelessWidget {

  const SecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Separator(value: 30),
            SecurityPinField(),
            SecurityNumericPad()
          ],
        ),
      ),
    );
  }
}
