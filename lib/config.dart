export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:get_storage/get_storage.dart';



export '../../common/config.dart';
export '../../controllers/pages_controller/index.dart';
export '../pages/index.dart';
export '../extensions/text_style_extensions.dart';
export '../controllers/common_controllers/app_controller.dart';
export '../common/theme/app_theme.dart';
import 'config.dart';

var appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());