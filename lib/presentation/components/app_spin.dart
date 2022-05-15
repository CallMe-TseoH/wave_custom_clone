import 'package:flutter/material.dart';

class AppSpin extends StatelessWidget {
  const AppSpin({
    super.key, this.color,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation(color??Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
