import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        leading: Hero(
          tag: 'logo',
          child: Image.asset('assets/images/logo.png', width: 40),
        ),
      ),
      body: Center(child: Text('Home Screen')),
    );
  }
}
