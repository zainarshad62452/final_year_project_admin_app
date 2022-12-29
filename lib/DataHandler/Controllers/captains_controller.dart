import 'package:buraq_admin/DataHandler/Models/CaptainModel.dart';
import 'package:buraq_admin/DataHandler/Services/driverServices.dart';
import 'package:get/get.dart';

final captainController = Get.find<AdminController>();

class AdminController extends GetxController {
  RxList<CaptainModel>? allCapatins = <CaptainModel>[].obs;
  @override
  void onReady() {
    initStream();
  }

  initStream() async {
    allCapatins!.bindStream(DriverData().streamAllCaptains()!);
  }
}
