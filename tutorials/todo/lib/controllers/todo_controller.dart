import 'package:get/get.dart';
import 'package:practicefirebase/controllers/auth_controller.dart';
import 'package:practicefirebase/database/database.dart';
import 'package:practicefirebase/models/todo.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>([]);
  List<TodoModel> get todos => todoList.value;

  @override
  void onInit() {
    super.onInit();
    String uid = Get.find<AuthController>().user!.uid;
    todoList
        .bindStream(Database().todoStream(uid)); //stream coming from firebase
  }

}
