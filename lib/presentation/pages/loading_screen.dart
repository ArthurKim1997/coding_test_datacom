import 'package:code_test_datacom_albums/presentation/blocs/loading/loading_cubit.dart';
import 'package:code_test_datacom_albums/presentation/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: LoadingWidget(
          size: 50,
        ),
      ),
    );
  }
}
