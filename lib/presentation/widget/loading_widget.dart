import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  const LoadingWidget({Key? key, required this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const SpinKitDualRing(
        color: Colors.blueAccent,
      ),
    );
  }
}
