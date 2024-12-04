class DashBoardModel {
  bool success;
  List<Datum> data;
  String totalPackageAmount;
  int totalLeads;

  DashBoardModel({
    required this.success,
    required this.data,
    required this.totalPackageAmount,
    required this.totalLeads,
  });

  factory DashBoardModel.fromJson(Map<String, dynamic> json) => DashBoardModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalPackageAmount: json["totalPackageAmount"],
        totalLeads: json["totalLeads"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalPackageAmount": totalPackageAmount,
        "totalLeads": totalLeads,
      };
}

class Datum {
  int leadsId;
  String customerName;
  String contactNo;
  String email;
  int serviceNo;
  DateTime date;
  int toUserId;
  String toUserName;
  int packageId;
  String packageName;
  String packageAmount;
  int paymentModeId;
  String paymentModeName;
  String tipAmount;
  int tipPaymentModeId;
  String tipPaymentModeName;
  String descriptions;
  int deleteStatus;

  Datum({
    required this.leadsId,
    required this.customerName,
    required this.contactNo,
    required this.email,
    required this.serviceNo,
    required this.date,
    required this.toUserId,
    required this.toUserName,
    required this.packageId,
    required this.packageName,
    required this.packageAmount,
    required this.paymentModeId,
    required this.paymentModeName,
    required this.tipAmount,
    required this.tipPaymentModeId,
    required this.tipPaymentModeName,
    required this.descriptions,
    required this.deleteStatus,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        leadsId: json["Leads_Id"],
        customerName: json["Customer_Name"],
        contactNo: json["Contact_No"],
        email: json["Email"],
        serviceNo: json["Service_No"],
        date: DateTime.parse(json["Date"]),
        toUserId: json["To_User_Id"],
        toUserName: json["To_User_Name"],
        packageId: json["Package_Id"],
        packageName: json["Package_Name"],
        packageAmount: json["Package_Amount"],
        paymentModeId: json["Payment_Mode_Id"],
        paymentModeName: json["Payment_Mode_Name"],
        tipAmount: json["Tip_Amount"],
        tipPaymentModeId: json["Tip_Payment_Mode_Id"],
        tipPaymentModeName: json["Tip_Payment_Mode_Name"],
        descriptions: json["Descriptions"],
        deleteStatus: json["DeleteStatus"],
      );

  Map<String, dynamic> toJson() => {
        "Leads_Id": leadsId,
        "Customer_Name": customerName,
        "Contact_No": contactNo,
        "Email": email,
        "Service_No": serviceNo,
        "Date": date.toIso8601String(),
        "To_User_Id": toUserId,
        "To_User_Name": toUserName,
        "Package_Id": packageId,
        "Package_Name": packageName,
        "Package_Amount": packageAmount,
        "Payment_Mode_Id": paymentModeId,
        "Payment_Mode_Name": paymentModeName,
        "Tip_Amount": tipAmount,
        "Tip_Payment_Mode_Id": tipPaymentModeId,
        "Tip_Payment_Mode_Name": tipPaymentModeName,
        "Descriptions": descriptions,
        "DeleteStatus": deleteStatus,
      };
}
