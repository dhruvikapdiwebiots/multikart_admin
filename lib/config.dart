export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:get_storage/get_storage.dart';

export '../../common/config.dart';
export '../../controllers/pages_controller/index.dart';
export '../pages/index.dart';
export '../extensions/text_style_extensions.dart';
export '../controllers/common_controllers/app_controller.dart';
export '../common/theme/app_theme.dart';
export '../common/theme/app_css.dart';
export '../extensions/spacing.dart';
export '../extensions/widget_extension.dart';
export '../widgets/common_button.dart';
export '../widgets/common_text_box.dart';
export '../../controllers/index.dart';

export '../../../../routes/index.dart';
export '../responsive.dart';
import 'config.dart';

var appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());