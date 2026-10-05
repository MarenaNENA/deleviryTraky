import 'package:delivery_traky/features/AppRoute.dart';
import 'package:flutter/material.dart';

class Spalishscreen extends StatefulWidget {
  const Spalishscreen({super.key});

  @override
  State<Spalishscreen> createState() => _SpalishscreenState();
}

class _SpalishscreenState extends State<Spalishscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushNamed(context, Approute.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset('assets/logo.png')));
  }
}
