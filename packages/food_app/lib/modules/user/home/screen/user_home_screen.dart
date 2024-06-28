import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('User Home Screen'),
      ),
    );
  }
}
