import 'dart:developer';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multikart_admin/config.dart';
import 'dart:io' as io;

class OnboardController extends GetxController {
  dynamic usageCtrl;
  bool isLoading = false;
  bool isAlert = false;
  String id = "", languageVal = "en";
  int selectIndex = 0;
  List languages = [];
  List<Widget> controllers = [];
  TextEditingController txtEngTitle = TextEditingController();
  TextEditingController txtEngDesc = TextEditingController();
  TextEditingController txtHiTitle = TextEditingController();
  TextEditingController txtHiDesc = TextEditingController();
  TextEditingController txtFrTitle = TextEditingController();
  TextEditingController txtFrDesc = TextEditingController();
  TextEditingController txtITTitle = TextEditingController();
  TextEditingController txtITDesc = TextEditingController();
  TextEditingController txtGrTitle = TextEditingController();
  TextEditingController txtGrDesc = TextEditingController();
  TextEditingController txtJpTitle = TextEditingController();
  TextEditingController txtJpDesc = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  XFile? onboard1File, onboard2File, onboard3File;
  bool isUploadSize = false,
      isOnboardUploadFile2 = false,
      isOnboardUploadFile3 = false;
  late DropzoneViewController? controller1, controller2, controller3;

  Uint8List onboardWebImage1 = Uint8List(8);
  Uint8List onboardUploadWebImage2 = Uint8List(8);
  Uint8List onboard3UploadWebImage3 = Uint8List(8);
  io.File? pickImage, onboardPickImage2, onboardPickImage3;
  var random = math.Random();

  String imageName = "",
      imageUrl = "",
      imageUrl2 = "",
      imageUrl3 = "",
      onboardImageUrl2 = "",
      onboardImageUrl3 = "",
      onboardImageName2 = "",
      onboardImageName3 = "";
  Uint8List webImage = Uint8List(8);
  Uint8List onboardWebImage2 = Uint8List(8);
  Uint8List onboardWebImage3 = Uint8List(8);

  //get data from firebase
  getData() async {
    // selectLanguageLists = appArray.languagesList
    //     .map((e) => SelectLanguageModel.fromJson(e))
    //     .toList();
    update();
  }

  //on click Image
  onImagePickUp(setState, context, title) {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest);
    log("imageUrl : $isLoginTest");
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      if (kIsWeb) {
        getImage(source: ImageSource.gallery, context: context, title: title);
      } else {
        imagePickerOption(
            setState: setState,
            cameraTap: () {
              getImage(
                  source: ImageSource.camera,
                  setState: setState,
                  context: context,
                  title: title);
              Get.back();
            },
            galleryTap: () {
              getImage(
                  source: ImageSource.gallery,
                  setState: setState,
                  context: context,
                  title: title);
              Get.back();
            });
      }
    }
  }

// GET IMAGE FROM GALLERY
  Future getImage(
      {source,
      StateSetter? setState,
      dropImage,
      context,
      uploadFile,
      title}) async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest);
    log("imageUrl : $isLoginTest");
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      if (title == "image1") {
        onboard1Upload(
            setState: setState,
            source: source,
            dropImage: dropImage,
            title: title,
            context: context,
            uploadFile: uploadFile);
      } else if (title == "image2") {
        onboard2Upload(
            setState: setState,
            source: source,
            dropImage: dropImage,
            title: title,
            context: context,
            uploadFile: uploadFile);
      } else {
        drawerLogoUpload(
            setState: setState,
            source: source,
            dropImage: dropImage,
            title: title,
            context: context,
            uploadFile: uploadFile);
      }
    }
  }

  onboard1Upload(
      {source,
      StateSetter? setState,
      dropImage,
      context,
      uploadFile,
      title}) async {
    log("message");

    if (dropImage != null) {
      if (imageName.contains("png") ||
          imageName.contains("jpg") ||
          imageName.contains("jpeg")) {
        var image = dropImage;
        onboardWebImage1 = image;
        log("onboardWebImage1 : $onboardWebImage1");
        Image image1 = Image.memory(onboardWebImage1);
        log("image1 : $image1");
        isUploadSize = true;
        webImage = onboardWebImage1;
        pickImage = io.File("a");

        isAlert = false;
        update();
      } else {
        isAlert = true;
        update();
        await Future.delayed(DurationClass.s2);
        isAlert = false;
        update();
      }
    } else {
      final ImagePicker picker = ImagePicker();
      onboard1File = (await picker.pickImage(source: ImageSource.gallery))!;
      log("onboard1File : $onboard1File");

      if (onboard1File!.name.contains("png") ||
          onboard1File!.name.contains("jpg") ||
          onboard1File!.name.contains("jpeg")) {
        var image = await onboard1File!.readAsBytes();
        onboardWebImage1 = image;

        Image image1 = Image.memory(onboardWebImage1);
        log("image1 : $image1");
        isUploadSize = true;
        webImage = onboardWebImage1;
        pickImage = io.File(onboard1File!.path);
        isAlert = false;
        update();
      } else {
        isAlert = true;
        update();
        await Future.delayed(DurationClass.s2);
        isAlert = false;
        update();
      }
    }
  }

  onboard2Upload(
      {source,
      StateSetter? setState,
      dropImage,
      context,
      uploadFile,
      title}) async {
    log("message ${source}");
    log("message ${dropImage}");

    if (dropImage != null) {
      if (onboardImageName2.contains("png") ||
          onboardImageName2.contains("jpg") ||
          onboardImageName2.contains("jpeg")) {
        var image = dropImage;
        onboardUploadWebImage2 = image;

        Image image1 = Image.memory(onboardUploadWebImage2);

        ImageInfo info = await getImageInfo(image1);

        onboardWebImage2 = onboardUploadWebImage2;
        onboardPickImage2 = io.File("a");
        isOnboardUploadFile2 = true;
        isAlert = false;
        update();
      } else {
        isAlert = true;
        update();
        await Future.delayed(DurationClass.s2);
        isAlert = false;
        update();
      }
    } else {
      final ImagePicker picker = ImagePicker();
      onboard2File = (await picker.pickImage(source: ImageSource.gallery))!;
      log("onboard1File : $onboard2File");

      if (onboard2File!.name.contains("png") ||
          onboard2File!.name.contains("jpg") ||
          onboard2File!.name.contains("jpeg")) {
        var image = await onboard2File!.readAsBytes();
        onboardUploadWebImage2 = image;

        Image image1 = Image.memory(onboardUploadWebImage2);
        log("image1 : $image1");
        ImageInfo info = await getImageInfo(image1);

        onboardWebImage2 = onboardUploadWebImage2;
        onboardPickImage2 = io.File(onboard2File!.path);
        isOnboardUploadFile2 = true;

        isAlert = false;
        update();
      } else {
        isAlert = true;
        update();
        await Future.delayed(DurationClass.s2);
        isAlert = false;
        update();
      }
    }
  }

  drawerLogoUpload(
      {source,
      StateSetter? setState,
      dropImage,
      context,
      uploadFile,
      title}) async {
    if (dropImage != null) {
      if (onboardImageName3.contains("png") ||
          onboardImageName3.contains("jpg") ||
          onboardImageName3.contains("jpeg")) {
        var image = dropImage;
        onboard3UploadWebImage3 = image;

        Image image1 = Image.memory(onboard3UploadWebImage3);

        onboardWebImage3 = onboard3UploadWebImage3;
        onboardPickImage3 = io.File("a");
        isOnboardUploadFile3 = true;

        isAlert = false;
        update();
      } else {
        isAlert = true;
        update();
        await Future.delayed(DurationClass.s2);
        isAlert = false;
        update();
      }
    } else {
      final ImagePicker picker = ImagePicker();
      onboard3File = (await picker.pickImage(source: ImageSource.gallery))!;
      log("onboard1File : $onboard3File");

      if (onboard3File!.name.contains("png") ||
          onboard3File!.name.contains("jpg") ||
          onboard3File!.name.contains("jpeg")) {
        var image = await onboard3File!.readAsBytes();
        onboard3UploadWebImage3 = image;

        Image image1 = Image.memory(onboard3UploadWebImage3);
        log("image1 : $image1");
        ImageInfo info = await getImageInfo(image1);

        onboardWebImage3 = onboard3UploadWebImage3;
        onboardPickImage3 = io.File(onboard3File!.path);
        isOnboardUploadFile3 = true;

        isAlert = false;
        update();
      } else {
        isAlert = true;
        update();
        await Future.delayed(DurationClass.s2);
        isAlert = false;
        update();
      }
    }
  }

  updateData() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest);
    log("imageUrl : $isLoginTest");
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      update();

      if (formKey.currentState!.validate()) {
        if (imageUrl.isNotEmpty && imageUrl2.isNotEmpty &&
            imageUrl3.isNotEmpty) {
          await FirebaseFirestore.instance
              .collection(collectionName.onBoardScreen)
              .doc(id)
              .update({
            "images": [imageUrl, imageUrl2, imageUrl3],
            "title": txtEngTitle.text,
            "description": txtEngDesc.text,
            "language": "en"
          }).then((value) {
            appCtrl.isAlert = false;
            isLoading = false;
            update();
          });
        } else {
          appCtrl.isAlert = true;
          update();
        }
      }
    }
  }

// UPLOAD SELECTED IMAGE TO FIREBASE
  Future uploadLogoFile() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest);
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
    isLoading = true;
    if (pickImage != null) {
      update();
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = FirebaseStorage.instance.ref().child(fileName);

      UploadTask? uploadTask;
      uploadTask = reference.putData(webImage);

      uploadTask.then((res) async {
        log("res : $res");
        res.ref.getDownloadURL().then((downloadUrl) async {
          imageUrl = downloadUrl;
          log("imageUrl : $imageUrl");
          update();
          await Future.delayed(DurationClass.s3);
        }, onError: (err) {
          update();
        });
      });
    }

    if (onboardPickImage2 != null) {
      update();
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = FirebaseStorage.instance.ref().child(fileName);

      UploadTask? uploadTask;
      uploadTask = reference.putData(onboardWebImage2);

      uploadTask.then((res) async {
        log("res : $res");
        res.ref.getDownloadURL().then((downloadUrl) async {
          imageUrl2 = downloadUrl;
          log("imageUrl2 : $imageUrl2");
          update();
          await Future.delayed(DurationClass.s3);
        }, onError: (err) {
          update();
        });
      });
    }

    if (onboardPickImage3 != null) {
      update();
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = FirebaseStorage.instance.ref().child(fileName);

      UploadTask? uploadTask;
      uploadTask = reference.putData(onboardWebImage3);

      uploadTask.then((res) async {
        log("res : $res");
        res.ref.getDownloadURL().then((downloadUrl) async {
          imageUrl3 = downloadUrl;
          log("imageUrl3 : $imageUrl3");
          update();
          addData();
          await Future.delayed(DurationClass.s3);
        }, onError: (err) {
          update();
        });
      });
    }}
  }

  addData() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest);
    log("imageUrl : $isLoginTest");
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      if (formKey.currentState!.validate()) {
        log("message ${imageUrl.isNotEmpty}");
        log("message ${imageUrl2.isNotEmpty}");
        log("message ${imageUrl3.isNotEmpty}");
        if (imageUrl.isNotEmpty && imageUrl2.isNotEmpty &&
            imageUrl3.isNotEmpty) {
          update();
          await FirebaseFirestore.instance
              .collection(collectionName.onBoardScreen)
              .add({
            "images": [imageUrl, imageUrl2, imageUrl3],
            "title": txtEngTitle.text,
            "description": txtEngDesc.text,
          }).then((value) {
            appCtrl.isAlert = false;
            isLoading = false;
            update();
          });
        } else {
          appCtrl.isAlert = true;
        }
      }
    }
  }

  @override
  void onReady() {
    getData();

    // TODO: implement onReady
    super.onReady();
  }
}
