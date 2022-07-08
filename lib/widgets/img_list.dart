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
        return const Center(child: Text('No data loaded, press Load button'));
      }
      if (state is ImgLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ImgLoadedState) {
        return MasonryGridView.count(
          itemCount: state.loadedImg.length,
          crossAxisCount: 3, 
          padding: const EdgeInsets.all(3.0),
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: state.loadedImg[index].urlString,
              fit: BoxFit.cover,
              // Если ошибка, то плагин в дебаге бросает ошибку. Но в документации плагина написано, что это нормально:
              // https://github.com/Baseflow/flutter_cached_network_image#my-app-crashes-when-the-image-loading-failed-i-know-this-is-not-really-a-question
              errorWidget: (context, url, error) => Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.image_not_supported_outlined,
                  size: 30,
                  color: Colors.grey[400],
                ),
              ),

              placeholder: (context, url) => Container(
                padding: const EdgeInsets.symmetric(vertical: 37),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                ),
                child: const Center(child: CircularProgressIndicator()),
              ),
              
              

              imageBuilder: (context, imageProvider) => ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image(image: imageProvider),
              ),
            );
          }
        );

      }
      if (state is ImgErrorState) {
        return const Center(child: Text('Error data loading'));
      }
      return const SizedBox.shrink();
    });
  }
}
