// To parse this JSON data, do
//
//     final homePageDropDownModel = homePageDropDownModelFromJson(jsonString);

import 'dart:convert';

HomePageDropDownModel homePageDropDownModelFromJson(String str) =>
    HomePageDropDownModel.fromJson(json.decode(str));

String homePageDropDownModelToJson(HomePageDropDownModel data) =>
    json.encode(data.toJson());

class HomePageDropDownModel {
  bool success;
  List<dynamic> data;

  HomePageDropDownModel({
    required this.success,
    required this.data,
  });

  factory HomePageDropDownModel.fromJson(Map<String, dynamic> json) =>
      HomePageDropDownModel(
        success: json["success"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}

class PurpleDatum {
  int? paymentModeId;
  String? paymentModeName;
  int deleteStatus;
  int? userDetailsId;
  String? userDetailsName;
  String? password;
  int? userTypeId;
  String? userTypeName;
  int? workingStatusId;
  String? workingStatusName;
  String? mobileNo;
  String? email;
  int? isApplogin;
  int? packageId;
  String? packageName;
  String? serviceAmount;

  PurpleDatum({
    this.paymentModeId,
    this.paymentModeName,
    required this.deleteStatus,
    this.userDetailsId,
    this.userDetailsName,
    this.password,
    this.userTypeId,
    this.userTypeName,
    this.workingStatusId,
    this.workingStatusName,
    this.mobileNo,
    this.email,
    this.isApplogin,
    this.packageId,
    this.packageName,
    this.serviceAmount,
  });

  factory PurpleDatum.fromJson(Map<String, dynamic> json) => PurpleDatum(
        paymentModeId: json["Payment_Mode_Id"],
        paymentModeName: json["Payment_Mode_Name"],
        deleteStatus: json["DeleteStatus"],
        userDetailsId: json["User_Details_Id"],
        userDetailsName: json["User_Details_Name"],
        password: json["Password"],
        userTypeId: json["User_Type_Id"],
        userTypeName: json["User_Type_Name"],
        workingStatusId: json["Working_Status_Id"],
        workingStatusName: json["Working_Status_Name"],
        mobileNo: json["Mobile_No"],
        email: json["Email"],
        isApplogin: json["Is_Applogin"],
        packageId: json["Package_Id"],
        packageName: json["Package_Name"],
        serviceAmount: json["Service_Amount"],
      );

  Map<String, dynamic> toJson() => {
        "Payment_Mode_Id": paymentModeId,
        "Payment_Mode_Name": paymentModeName,
        "DeleteStatus": deleteStatus,
        "User_Details_Id": userDetailsId,
        "User_Details_Name": userDetailsName,
        "Password": password,
        "User_Type_Id": userTypeId,
        "User_Type_Name": userTypeName,
        "Working_Status_Id": workingStatusId,
        "Working_Status_Name": workingStatusName,
        "Mobile_No": mobileNo,
        "Email": email,
        "Is_Applogin": isApplogin,
        "Package_Id": packageId,
        "Package_Name": packageName,
        "Service_Amount": serviceAmount,
      };
}

class FluffyDatum {
  int fieldCount;
  int affectedRows;
  int insertId;
  String info;
  int serverStatus;
  int warningStatus;
  int changedRows;

  FluffyDatum({
    required this.fieldCount,
    required this.affectedRows,
    required this.insertId,
    required this.info,
    required this.serverStatus,
    required this.warningStatus,
    required this.changedRows,
  });

  factory FluffyDatum.fromJson(Map<String, dynamic> json) => FluffyDatum(
        fieldCount: json["fieldCount"],
        affectedRows: json["affectedRows"],
        insertId: json["insertId"],
        info: json["info"],
        serverStatus: json["serverStatus"],
        warningStatus: json["warningStatus"],
        changedRows: json["changedRows"],
      );

  Map<String, dynamic> toJson() => {
        "fieldCount": fieldCount,
        "affectedRows": affectedRows,
        "insertId": insertId,
        "info": info,
        "serverStatus": serverStatus,
        "warningStatus": warningStatus,
        "changedRows": changedRows,
      };
}
