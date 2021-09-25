import 'package:code_test_datacom_albums/domain/entities/app_error.dart';
import 'package:code_test_datacom_albums/presentation/widget/custom_view.dart';
import 'package:flutter/material.dart';

class AppErrorScreen extends StatelessWidget {
  final AppErrorType errorType;
  final Function() onPressed;

  const AppErrorScreen(
      {Key? key, required this.errorType, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomView(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: Center(
          child: Column(
        children: [
          Text(errorType == AppErrorType.api ? "api error" : "network_error"),
          ElevatedButton(onPressed: onPressed, child: const Text("try again")),
        ],
      )),
    );
  }
}
