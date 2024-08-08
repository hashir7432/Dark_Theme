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
                Icons.local_grocery_store,
                size: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
