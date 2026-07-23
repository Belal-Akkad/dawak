import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dawak',
    
   
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dawak'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Hello, Dawak!',
              style: context.cairo(
                size: 24,
                weight: AppTypography.medium,
                color: AppColors.danger100,
              ),
            ),


             Text(
              'Hello, Dawak!',
              style:TextStyle(fontSize: 24)
            ),
          ],
        ),
      ),
    );
  }
}