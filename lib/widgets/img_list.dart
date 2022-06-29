import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/img_bloc.dart';
import '../bloc/img_states.dart';

class ImgList extends StatelessWidget {
  const ImgList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImgBloc, ImgStates>(builder: (context, state) {
      if (state is ImgEmptyState) {
        return Center(child: Text('No data loaded, press Load button'));
      }
      if (state is ImgLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is ImgLoadedState) {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            padding: const EdgeInsets.all(3.0),
            itemCount: state.loadedImg.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Center(child: Text('${state.loadedImg[index]}')),
                color: Colors.amber,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              );
            });
      }
      if (state is ImgErrorState) {
        return Center(child: Text('Error data loading'));
      }
      return SizedBox.shrink();
    });
  }
}
