class LoginUserInfoModel {
  int? code;
  LoginUserInfoData? data;

  LoginUserInfoModel({this.code, this.data});

  LoginUserInfoModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null
        ? new LoginUserInfoData.fromJson(json['data'])
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

class LoginUserInfoData {
  String? loginName;
  String? userAliasName;
  String? objectId;
  String? email;
  bool? status;
  String? lastLoginTime;
  String? defaultGroupTag;
  String? defaultRoleTag;
  String? folderTag;
  List<UserSysOrganization>? userSysOrganization;
  String? loginGroupTag;
  String? loginRoleTag;
  String? enterpriseWeChatUserid;
  String? dingTalkUserid;
  bool? allowSpeciallyIpLogin;
  String? allowSpeciallyIps;
  int? allOnlineTime;
  String? createAt;
  String? updateAt;
  String? onlineRemoteAddr;
  int? onlineUserCount;
  String? tags;
  int? order;
  bool? workshop;
  String? uid;
  String? ctype;

  LoginUserInfoData(
      {this.loginName,
      this.userAliasName,
      this.objectId,
      this.email,
      this.status,
      this.lastLoginTime,
      this.defaultGroupTag,
      this.defaultRoleTag,
      this.folderTag,
      this.userSysOrganization,
      this.loginGroupTag,
      this.loginRoleTag,
      this.enterpriseWeChatUserid,
      this.dingTalkUserid,
      this.allowSpeciallyIpLogin,
      this.allowSpeciallyIps,
      this.allOnlineTime,
      this.createAt,
      this.updateAt,
      this.onlineRemoteAddr,
      this.onlineUserCount,
      this.tags,
      this.order,
      this.workshop,
      this.uid,
      this.ctype});

  LoginUserInfoData.fromJson(Map<String, dynamic> json) {
    loginName = json['loginName'];
    userAliasName = json['userAliasName'];
    objectId = json['objectId'];
    email = json['email'];
    status = json['status'];
    lastLoginTime = json['lastLoginTime'];
    defaultGroupTag = json['defaultGroupTag'];
    defaultRoleTag = json['defaultRoleTag'];
    folderTag = json['folderTag'];
    if (json['userSysOrganization'] != null) {
      userSysOrganization = <UserSysOrganization>[];
      json['userSysOrganization'].forEach((v) {
        userSysOrganization!.add(new UserSysOrganization.fromJson(v));
      });
    }
    loginGroupTag = json['loginGroupTag'];
    loginRoleTag = json['loginRoleTag'];
    enterpriseWeChatUserid = json['enterpriseWeChatUserid'];
    dingTalkUserid = json['dingTalkUserid'];
    allowSpeciallyIpLogin = json['allowSpeciallyIpLogin'];
    allowSpeciallyIps = json['allowSpeciallyIps'];
    allOnlineTime = json['allOnlineTime'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    onlineRemoteAddr = json['onlineRemoteAddr'];
    onlineUserCount = json['onlineUserCount'];
    tags = json['tags'];
    order = json['order'];
    workshop = json['workshop'];
    uid = json['uid'];
    ctype = json['ctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loginName'] = this.loginName;
    data['userAliasName'] = this.userAliasName;
    data['objectId'] = this.objectId;
    data['email'] = this.email;
    data['status'] = this.status;
    data['lastLoginTime'] = this.lastLoginTime;
    data['defaultGroupTag'] = this.defaultGroupTag;
    data['defaultRoleTag'] = this.defaultRoleTag;
    data['folderTag'] = this.folderTag;
    if (this.userSysOrganization != null) {
      data['userSysOrganization'] =
          this.userSysOrganization!.map((v) => v.toJson()).toList();
    }
    data['loginGroupTag'] = this.loginGroupTag;
    data['loginRoleTag'] = this.loginRoleTag;
    data['enterpriseWeChatUserid'] = this.enterpriseWeChatUserid;
    data['dingTalkUserid'] = this.dingTalkUserid;
    data['allowSpeciallyIpLogin'] = this.allowSpeciallyIpLogin;
    data['allowSpeciallyIps'] = this.allowSpeciallyIps;
    data['allOnlineTime'] = this.allOnlineTime;
    data['createAt'] = this.createAt;
    data['updateAt'] = this.updateAt;
    data['onlineRemoteAddr'] = this.onlineRemoteAddr;
    data['onlineUserCount'] = this.onlineUserCount;
    data['tags'] = this.tags;
    data['order'] = this.order;
    data['workshop'] = this.workshop;
    data['uid'] = this.uid;
    data['ctype'] = this.ctype;
    return data;
  }
}

class UserSysOrganization {
  String? uid;
  String? ctype;
  String? objectName;
  List<Children>? children;
  String? objectId;
  String? nameAlias;
  bool? allowSpeciallyIpLogin;
  int? userCount;

  UserSysOrganization(
      {this.uid,
      this.ctype,
      this.objectName,
      this.children,
      this.objectId,
      this.nameAlias,
      this.allowSpeciallyIpLogin,
      this.userCount});

  UserSysOrganization.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    ctype = json['ctype'];
    objectName = json['objectName'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
    objectId = json['objectId'];
    nameAlias = json['nameAlias'];
    allowSpeciallyIpLogin = json['allowSpeciallyIpLogin'];
    userCount = json['userCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['ctype'] = this.ctype;
    data['objectName'] = this.objectName;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    data['objectId'] = this.objectId;
    data['nameAlias'] = this.nameAlias;
    data['allowSpeciallyIpLogin'] = this.allowSpeciallyIpLogin;
    data['userCount'] = this.userCount;
    return data;
  }
}

class Children {
  String? uid;
  String? ctype;
  String? objectName;
  List<Children>? children;
  String? objectId;
  String? nameAlias;
  bool? allowSpeciallyIpLogin;
  int? userCount;

  Children(
      {this.uid,
      this.ctype,
      this.objectName,
      this.children,
      this.objectId,
      this.nameAlias,
      this.allowSpeciallyIpLogin,
      this.userCount});

  Children.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    ctype = json['ctype'];
    objectName = json['objectName'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
    objectId = json['objectId'];
    nameAlias = json['nameAlias'];
    allowSpeciallyIpLogin = json['allowSpeciallyIpLogin'];
    userCount = json['userCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['ctype'] = this.ctype;
    data['objectName'] = this.objectName;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    data['objectId'] = this.objectId;
    data['nameAlias'] = this.nameAlias;
    data['allowSpeciallyIpLogin'] = this.allowSpeciallyIpLogin;
    data['userCount'] = this.userCount;
    return data;
  }
}
