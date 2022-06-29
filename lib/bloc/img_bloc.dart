// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_photogallery/services/img_repository.dart';

import '../models/img.dart';
import 'img_events.dart';
import 'img_states.dart';

class ImgBloc extends Bloc<ImgEvents, ImgStates> {
  final ImgRepository imgRepository;
  ImgBloc({required this.imgRepository}) : super(ImgEmptyState()) {
    on<ImgLoadEvent>(
      (event, emit) async {
        emit(ImgLoadingState());
        try {
          final List<Img> loadImgList = await imgRepository.getAllImg();
        } catch (_) {
          emit(ImgErrorState());
        }
      }
    );
    on<ImgClearEvent>(
      (event, emit) async {
        emit(ImgEmptyState());
      }
    );
  }
  
}
