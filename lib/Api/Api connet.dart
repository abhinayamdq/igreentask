import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:igreen_taskapprovel/pojo/Resources.dart';

import '../Apputility.dart';
import '../pojo/TaskCreate.dart';
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
    Future<TaskCreateResponse> TaskCreate(Map<String, dynamic> payload) async {
    await httpService.init();
    var response = await httpService.request(
        url: ApiUrl.createTask, method: Method.POST, params: payload);
    if (response is dio.Response) {
      if (response.data == null) {
        throw Exception(AppUtility.connectivityMessage);
      }
      return TaskCreateResponse.fromJson(response.data);
    }
    return TaskCreateResponse();
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

  Future<ResourcesResponse> resourcesConnect() async {
    await httpService.init();
    var response = await httpService.request(
        url: ApiUrl.resources, method: Method.GET);
    if (response is dio.Response) {
      if (response.data == null) {
        throw Exception(AppUtility.connectivityMessage);
      }
      return ResourcesResponse.fromJson(response.data);
    }
    return ResourcesResponse();
  }


}
