import 'package:flutter/material.dart';

class CustomView extends StatelessWidget {
  final AppBar? appBar;
  final Widget body;

  const CustomView({Key? key, this.appBar, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: body,
      ),
    );
  }
}
