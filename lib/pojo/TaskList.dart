class TaskListResponse {
  String? message;
  bool? error;
  List<Data>? data;

  TaskListResponse({this.message, this.error, this.data});

  TaskListResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? taskId;
  String? taskName;
  String? taskType;
  String? taskCode;
  String? department;
  String? members;
  String? startdate;
  String? enddate;
  String? expectedCompletionDate;
  String? descriptions;

  Data(
      {this.taskId,
        this.taskName,
        this.taskType,
        this.taskCode,
        this.department,
        this.members,
        this.startdate,
        this.enddate,
        this.expectedCompletionDate,
        this.descriptions});

  Data.fromJson(Map<String, dynamic> json) {
    taskId = json['taskId'];
    taskName = json['taskName'];
    taskType = json['taskType'];
    taskCode = json['taskCode'];
    department = json['department'];
    members = json['Members'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    expectedCompletionDate = json['expected_completion_date'];
    descriptions = json['descriptions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskId'] = this.taskId;
    data['taskName'] = this.taskName;
    data['taskType'] = this.taskType;
    data['taskCode'] = this.taskCode;
    data['department'] = this.department;
    data['Members'] = this.members;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    data['expected_completion_date'] = this.expectedCompletionDate;
    data['descriptions'] = this.descriptions;
    return data;
  }
}