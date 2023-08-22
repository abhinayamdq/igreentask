import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../Apputility.dart';
import '../pojo/TaskList.dart';
import '../pojo/json.dart';
import 'Api_Url.dart';
import 'http_service.dart';

class ApiConnect extends GetConnect {
  HttpService httpService = HttpService();

  @override
  onInit() async {

    super.onInit();
  }

  Future<LoginResponse> loginConnect(Map<String, dynamic> payload) async {
    await httpService.init();
    var response = await httpService.request(
        url: ApiUrl.login, method: Method.POST, params: payload);
    if (response is dio.Response) {
      if (response.data == null) {
        throw Exception(AppUtility.connectivityMessage);
      }
      return LoginResponse.fromJson(response.data);
    }
    return LoginResponse();
  }
  Future<TaskListResponse> taskListConnect() async {
    await httpService.init();
    var response = await httpService.request(
        url: ApiUrl.getTask, method: Method.GET);
    if (response is dio.Response) {
      if (response.data == null) {
        throw Exception(AppUtility.connectivityMessage);
      }
      return TaskListResponse.fromJson(response.data);
    }
    return TaskListResponse();
  }

}
