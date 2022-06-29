import 'package:flutter_photogallery/services/img_provider.dart';

import '../models/img.dart';

class ImgRepository {
  final ImgProvider _imgProvider = ImgProvider();
  Future<List<Img>> getAllImg() => _imgProvider.getImg();
}