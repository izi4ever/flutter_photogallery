import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../bloc/img_bloc.dart';
import '../bloc/img_states.dart';

class ImgList extends StatelessWidget {
  const ImgList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImgBloc, ImgStates>(builder: (context, state) {
      if (state is ImgEmptyState) {
        print(state);
        return Center(child: Text('No data loaded, press Load button'));
      }
      if (state is ImgLoadingState) {
        print(state);
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ImgLoadedState) {
        print(state);

        return MasonryGridView.count(
          itemCount: state.loadedImg.length,
          crossAxisCount: 3, 
          padding: const EdgeInsets.all(3.0),
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          itemBuilder: (context, index) {
            // return Container(
            //   height: 100,
            //   color: Colors.grey,
            // );
            return CachedNetworkImage(
              imageUrl: state.loadedImg[index].urlString,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Icon(
                Icons.image_not_supported_outlined,
                size: 30,
                color: Colors.grey[300],
              ),
              placeholder: (context, url) => CircularProgressIndicator(),

              // imageBuilder: (context, imageProvider) => Container(
              //     height: 100,
              //     width: 100,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(50)),
              //         image: DecorationImage(
              //             image: imageProvider,
              //             fit: BoxFit.cover,
              //         ),
              //     ),
              // ),

              // imageBuilder: (context, imageProvider) => ClipRRect(
              //   borderRadius: BorderRadius.circular(5),
              //   child: Image(image: imageProvider),
              // ),
            );
          }
        );


        // return GridView.builder(
        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 3,
        //     ),
        //     padding: const EdgeInsets.all(3.0),
        //     itemCount: state.loadedImg.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       return Card(
        //         child:
        //             Center(child: Text('${state.loadedImg[index].urlString}')),
        //         color: Colors.amber,
        //         elevation: 0,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(0),
        //         ),
        //       );
        //     });
      }
      if (state is ImgErrorState) {
        print(state);
        return Center(child: Text('Error data loading'));
      }
      return SizedBox.shrink();
    });
  }
}
