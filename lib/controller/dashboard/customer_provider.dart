import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/http/http_requests.dart';
import 'package:spa_app_user/http/http_urls.dart';
import 'package:spa_app_user/http/loader.dart';
import 'package:flutter/material.dart';

class CustomerProvider extends ChangeNotifier {
  TextEditingController serviceNoController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController tipAmountController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  // New properties
  String? selectedStaff;
  String? selectedService;
  String? selectedPaymentMethod;
  bool isTipEnabled = false;

  // Select Date
  Future<void> selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      dateController.text =
          "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
      notifyListeners();
    }
  }

  // Select Time
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      timeController.text = selectedTime.format(context);
      notifyListeners();
    }
  }

  // Set Tip Enabled
  void setTipEnabled(bool value) {
    isTipEnabled = value;
    notifyListeners();
  }

  // Set Staff, Service, Payment Method
  void setSelectedStaff(String? staff) {
    selectedStaff = staff;
    notifyListeners();
  }

  void setSelectedService(String? service) {
    selectedService = service;
    notifyListeners();
  }

  void setSelectedPaymentMethod(String? paymentMethod) {
    selectedPaymentMethod = paymentMethod;
    notifyListeners();
  }

  Future<void> addCustomer({
    required BuildContext context,
    required int leadsId,
    required String customerName,
    required String contactNo,
    required String email,
    required int serviceNo,
    required String date,
    required int toUserId,
    required String toUserName,
    required int packageId,
    required String packageName,
    required String packageAmount,
    required int paymentModeId,
    required String paymentModeName,
    String? tipAmount,
    int? tipPaymentModeId,
    String? tipPaymentModeName,
    String? descriptions,
    int deleteStatus = 0,
  }) async {
    Loader.showLoader(context);

    // Construct JSON data from passed parameters
    Map<String, dynamic> jsonData = {
      "Leads_Id": leadsId,
      "Customer_Name": customerName,
      "Contact_No": contactNo,
      "Email": email,
      "Service_No": serviceNo,
      "Date": date,
      "To_User_Id": toUserId,
      "To_User_Name": toUserName,
      "Package_Id": packageId,
      "Package_Name": packageName,
      "Package_Amount": packageAmount,
      "Payment_Mode_Id": paymentModeId,
      "Payment_Mode_Name": paymentModeName,
      "Tip_Amount": tipAmount ?? 0.0,
      "Tip_Payment_Mode_Id": tipPaymentModeId ?? 0,
      "Tip_Payment_Mode_Name": tipPaymentModeName ?? "",
      "Descriptions": descriptions ?? "",
      "DeleteStatus": deleteStatus,
    };

    print('Adding customer with data: $jsonData');

    try {
      var response = await HttpRequest.httpPostRequest(
        bodyData: jsonData,
        endPoint: HttpUrls.addCustomer,
      );

      Loader.stopLoader(context);

      if (response != null) {
        print("Customer added successfully");
        customerNameController.clear();
        serviceNoController.clear();
        customerNameController.clear();
        mobileNoController.clear();
        emailIdController.clear();
        dateController.clear();
        timeController.clear();
        descriptionController.clear();
        tipAmountController.clear();
        selectedPaymentMethod = null;
        selectedStaff = null;
        selectedService = null;
        amountController.clear();
      } else {
        print("Customer addition failed");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Invalid data'),
            backgroundColor: AppColors.textBlack,
          ),
        );
      }
    } catch (e) {
      Loader.stopLoader(context);
      print('Failed to add customer: $e');
    }
  }
}
