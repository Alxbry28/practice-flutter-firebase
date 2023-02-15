import 'package:get/get.dart';
import 'package:practicefirebase/models/ValueModel.dart';

class ValueController extends GetxController {
  final valueModel = ValueModel().obs;

  void updateTheValues(String newValue1, String newValue2) {
    valueModel.update((model) {
      model?.value1 = newValue1;
      model?.value2 = newValue2;
    });
  }
}
