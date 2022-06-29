import '../models/img.dart';

abstract class ImgStates {}

class ImgEmptyState extends ImgStates {}

class ImgLoadingState extends ImgStates {}

class ImgLoadedState extends ImgStates {
  List<Img> loadedImg;
  ImgLoadedState({
    required this.loadedImg,
  });
}

class ImgErrorState extends ImgStates {}