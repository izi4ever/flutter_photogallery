import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/img_bloc.dart';
import '../bloc/img_events.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImgBloc _imgBloc = BlocProvider.of<ImgBloc>(context);
    
    return AppBar(
          title: Text('Photogallery', style: GoogleFonts.courgette()),
          centerTitle: false,
          leading: const Icon(Icons.local_see),
          actions: [
            IconButton(
              onPressed: () {
                _imgBloc.add(ImgClearEvent());
              },
              icon: const Icon(Icons.cleaning_services_outlined),
            ),
            IconButton(
              onPressed: () {
                _imgBloc.add(ImgLoadEvent());
              },
              icon: const Icon(Icons.download_for_offline_sharp),
            ),
          ],
        );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}