import 'package:get/get.dart';

class CountController extends GetxController {
  
  //state management = value management
  int count = 0;

  incrementCounter(){
    count++;
    update();
  }

}
