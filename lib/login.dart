import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // logo
              Icon(
                Icons.apple_outlined,
                size: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
