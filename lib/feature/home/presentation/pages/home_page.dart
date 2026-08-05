import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
      backgroundColor: Colors.white,
      // drawer: Drawer(
      //   child: SafeArea(
      //     child: ListView(
      //       padding: EdgeInsets.zero,
      //       children: [
      //         ListTile(
      //           title: Text(
      //             'إعادة تعيين كلمة السر',
      //             style: context.cairo(size: 16),
      //           ),
      //           onTap: () {
      //             Navigator.of(context).pop();
      //             Navigator.of(context).pushNamed(
      //               AppRoutes.forgotPassword,
      //               arguments: true,
      //             );
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SafeArea(

        child: Center(
          child: Text(
            'Home',
            style: context.cairo(size: 22)
          ),
        ),
      ),
    );
  }
}