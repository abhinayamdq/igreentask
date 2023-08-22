import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Binding/HomePageBinding.dart';
import '../Binding/TaskAssignedBinding.dart';
import '../Binding/TaskProjectListBinding.dart';
import '../Controller/HomePageController.dart';
import '../UI/HomeScreen.dart';
import '../UI/TaskAssigned.dart';
import '../UI/TaskProjectList.dart';
import 'App roots.dart';

class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.Home.toName,
        page: () => HomeScreen(),
        binding: HomePageBinding()),
    GetPage(
        name: AppRoutes.TaskProjectList.toName,
        page: () => TaskProjectList(),
        binding: TaskProjectListBinding()),
    GetPage(
        name: AppRoutes.TaskAssigned.toName,
        page: () => TaskAssigned(),
        binding: TaskAssignedBinding()),

  ];
}
