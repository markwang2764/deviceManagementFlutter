class LoginUserRoleModel {
  int? code;
  List<LoginUserRoleData>? data;

  LoginUserRoleModel({this.code, this.data});

  LoginUserRoleModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <LoginUserRoleData>[];
      json['data'].forEach((v) {
        data!.add(new LoginUserRoleData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LoginUserRoleData {
  String? uid;
  String? ctype;
  String? roleName;
  String? roleNameAlias;
  String? roleDesc;
  String? createAt;
  String? groupTag;
  int? order;
  int? organizationOrder;
  String? companyTag;

  LoginUserRoleData(
      {this.uid,
      this.ctype,
      this.roleName,
      this.roleNameAlias,
      this.roleDesc,
      this.createAt,
      this.groupTag,
      this.order,
      this.organizationOrder,
      this.companyTag});

  LoginUserRoleData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    ctype = json['ctype'];
    roleName = json['roleName'];
    roleNameAlias = json['roleNameAlias'];
    roleDesc = json['roleDesc'];
    createAt = json['createAt'];
    groupTag = json['groupTag'];
    order = json['order'];
    organizationOrder = json['organizationOrder'];
    companyTag = json['companyTag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['ctype'] = this.ctype;
    data['roleName'] = this.roleName;
    data['roleNameAlias'] = this.roleNameAlias;
    data['roleDesc'] = this.roleDesc;
    data['createAt'] = this.createAt;
    data['groupTag'] = this.groupTag;
    data['order'] = this.order;
    data['organizationOrder'] = this.organizationOrder;
    data['companyTag'] = this.companyTag;
    return data;
  }
}
