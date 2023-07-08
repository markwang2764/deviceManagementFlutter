class ProcessJobTaskModel {
  int? code;
  ProcessJobTaskModelData? data;

  ProcessJobTaskModel({this.code, this.data});

  ProcessJobTaskModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null
        ? new ProcessJobTaskModelData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProcessJobTaskModelData {
  ProjectPhaseOrTask? projectPhaseOrTask;
  List<ProcessJobTask>? processJobTask;

  ProcessJobTaskModelData({this.projectPhaseOrTask, this.processJobTask});

  ProcessJobTaskModelData.fromJson(Map<String, dynamic> json) {
    if (json['processJobTask'] != null) {
      processJobTask = <ProcessJobTask>[];
      json['processJobTask'].forEach((v) {
        processJobTask!.add(new ProcessJobTask.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.processJobTask != null) {
      data['processJobTask'] =
          this.processJobTask!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectPhaseOrTask {
  List<dynamic>? projectPhaseTaskDtos;
  List<dynamic>? projectPhaseDtos;

  ProjectPhaseOrTask({this.projectPhaseTaskDtos, this.projectPhaseDtos});
}

class ProcessJobTask {
  String? uid;
  String? ctype;
  String? objectName;
  String? processJobName;
  String? processJobDesc;
  String? processJobTag;
  String? processJobStatus;
  String? currentProcessJobTaskTag;
  int? hours;
  String? endDate;
  String? processType;
  String? accepterUserNames;
  String? weightLevel;
  String? targetType;
  String? createAt;
  String? createUserAliasName;
  bool? readed;
  bool? processing;
  bool? delayed;
  bool? track;
  bool? processJobComplete;
  String? httpDesc;
  String? completeDate;
  List<dynamic>? accepterUserTags;

  ProcessJobTask(
      {this.uid,
      this.ctype,
      this.objectName,
      this.processJobName,
      this.processJobDesc,
      this.processJobTag,
      this.processJobStatus,
      this.currentProcessJobTaskTag,
      this.hours,
      this.endDate,
      this.processType,
      this.accepterUserNames,
      this.weightLevel,
      this.targetType,
      this.createAt,
      this.createUserAliasName,
      this.readed,
      this.processing,
      this.delayed,
      this.track,
      this.processJobComplete,
      this.httpDesc,
      this.completeDate,
      this.accepterUserTags});

  ProcessJobTask.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    ctype = json['ctype'];
    objectName = json['objectName'];
    processJobName = json['processJobName'];
    processJobDesc = json['processJobDesc'];
    processJobTag = json['processJobTag'];
    processJobStatus = json['processJobStatus'];
    currentProcessJobTaskTag = json['currentProcessJobTaskTag'];
    hours = json['hours'];
    endDate = json['endDate'];
    processType = json['processType'];
    accepterUserNames = json['accepterUserNames'];
    weightLevel = json['weightLevel'];
    targetType = json['targetType'];
    createAt = json['createAt'];
    createUserAliasName = json['createUserAliasName'];
    readed = json['readed'];
    processing = json['processing'];
    delayed = json['delayed'];
    track = json['track'];
    processJobComplete = json['processJobComplete'];
    httpDesc = json['httpDesc'];
    completeDate = json['completeDate'];
    accepterUserTags = json['accepterUserTags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['ctype'] = this.ctype;
    data['objectName'] = this.objectName;
    data['processJobName'] = this.processJobName;
    data['processJobDesc'] = this.processJobDesc;
    data['processJobTag'] = this.processJobTag;
    data['processJobStatus'] = this.processJobStatus;
    data['currentProcessJobTaskTag'] = this.currentProcessJobTaskTag;
    data['hours'] = this.hours;
    data['endDate'] = this.endDate;
    data['processType'] = this.processType;
    data['accepterUserNames'] = this.accepterUserNames;
    data['weightLevel'] = this.weightLevel;
    data['targetType'] = this.targetType;
    data['createAt'] = this.createAt;
    data['createUserAliasName'] = this.createUserAliasName;
    data['readed'] = this.readed;
    data['processing'] = this.processing;
    data['delayed'] = this.delayed;
    data['track'] = this.track;
    data['processJobComplete'] = this.processJobComplete;
    data['httpDesc'] = this.httpDesc;
    data['completeDate'] = this.completeDate;
    data['accepterUserTags'] = this.accepterUserTags;
    return data;
  }
}
