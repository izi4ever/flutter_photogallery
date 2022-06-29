import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/img_list.dart';
import '../bloc/img_bloc.dart';
import '../services/img_repository.dart';
import '../widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final imgRepository = ImgRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImgBloc(imgRepository: imgRepository),
      child: Scaffold(
        appBar: AppBarWidget(),
        body: ImgList(),
      ),
    );
  }
}