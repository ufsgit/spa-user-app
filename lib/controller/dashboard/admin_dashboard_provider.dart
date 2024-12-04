
import 'package:flutter/material.dart';
import 'package:spa_app_user/http/http_requests.dart';
import 'package:spa_app_user/http/http_urls.dart';
import 'package:spa_app_user/model/dash_board_model.dart';

class DashboardProvider extends ChangeNotifier {
  bool _isUserDropdownOpen = false;
  bool _isStaffDropdownOpen = false;

  bool get isUserDropdownOpen => _isUserDropdownOpen;
  bool get isStaffDropdownOpen => _isStaffDropdownOpen;

  String _selectedPayment = 'Card';
  String? _selectedUser;
  String _selectedTimeFrame = 'Monthly';
  int _totalWalkins = 0;
  String _totalEarnings = '';

  String get selectedTimeFrame => _selectedTimeFrame;

  // Getter for selected user
  String? get selectedUser => _selectedUser;
  String get selectedPayment => _selectedPayment;

  int get totalWalkins => _totalWalkins;
  String get totalEarnings => _totalEarnings;
  List<Datum> _dashBoardData = [];
  List<Datum> _allCustomersList = [];

  List<Datum>? get dashBoardData => _dashBoardData;
  List<Datum>? get allCustomersList => _allCustomersList;
  List<Map<String, dynamic>> _paymentModes = [];
  List<Map<String, dynamic>> _packages = [];
  List<Map<String, dynamic>> _users = [];

  // Getters
  List<Map<String, dynamic>> get paymentModes => _paymentModes;
  List<Map<String, dynamic>> get packages => _packages;
  List<Map<String, dynamic>> get users => _users;

  // Flag to track if items have been fetched
  bool _isItemsFetched = false;
  bool get isItemsFetched => _isItemsFetched;

  // Store previously selected values
  String? selectedPaymentId;
  String? selectedStartDate;
  String? selectedEndDate;

  void toggleUserDropdown() {
    _isUserDropdownOpen = !_isUserDropdownOpen;
    _isStaffDropdownOpen = false;
    notifyListeners();
  }

  void updateSelectedTimeFrame(String timeFrame) {
    _selectedTimeFrame = timeFrame;
    notifyListeners();
  }

  void updateSelectedUser(String? userId) {
    _selectedUser = userId;
    notifyListeners(); // Notify listeners so UI can update
  }

  void toggleStaffDropdown() {
    _isStaffDropdownOpen = !_isStaffDropdownOpen;
    _isUserDropdownOpen = false;
    notifyListeners();
  }

  void closeAllDropdowns() {
    _isUserDropdownOpen = false;
    _isStaffDropdownOpen = false;
    notifyListeners();
  }

  // Update the selected payment type and notify listeners
  void updatePayment(String paymentType, String paymentModeId) {
    _selectedPayment = paymentType;
    selectedPaymentId = paymentModeId; // Store the selected payment mode ID
    notifyListeners();
  }

  Future<void> fetchDashBoardDetails({
    required String startDate,
    required String endDate,
    required String paymentModeId,
    required String toUserId,
  }) async {
    notifyListeners();

    try {
      final response = await HttpRequest.httpGetRequest(
        endPoint:
            '${HttpUrls.dashBoardDetails}?startDate=$startDate&endDate=$endDate&paymentModeId=$paymentModeId&toUserId=$toUserId',
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data != null && data is Map<String, dynamic>) {
          // Extract the 'data' list from the response
          var listData = data['data'];

          if (listData != null && listData is List) {
            _dashBoardData = listData
                .map((item) => item != null ? Datum.fromJson(item) : null)
                .whereType<Datum>()
                .toList();

            _totalEarnings = data['totalPackageAmount'] ?? '0.00';
            _totalWalkins = data['totalLeads'] ?? 0;

            print('Total Package Amount: $_totalEarnings');
            print('Total Leads: $_totalWalkins');

            notifyListeners();
          } else {
            throw Exception('Failed to load lead details: Invalid data format');
          }
        } else {
          throw Exception(
              'Failed to load lead details: Invalid data structure');
        }
      } else {
        throw Exception('Failed to load lead details: ${response.statusCode}');
      }
    } catch (error) {
      print('Exception occurred: $error');
      // Optionally handle error here, e.g., show a message to the user
    }

    notifyListeners();
  }

  Future<void> fetchAllItems() async {
    try {
      final response =
          await HttpRequest.httpGetRequest(endPoint: '${HttpUrls.getAllItems}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = response.data;

        if (responseBody['success'] == true && responseBody['data'] is List) {
          final List<dynamic> dataList = responseBody['data'];

          print("Received dataList: $dataList");

          if (dataList.length >= 3) {
            if (dataList[0] is List) {
              _paymentModes = List<Map<String, dynamic>>.from(dataList[0]);
            } else {
              throw Exception('Payment Modes data is not in List format');
            }

            if (dataList[1] is List) {
              _users = List<Map<String, dynamic>>.from(dataList[1]);
            } else {
              throw Exception('Users data is not in List format');
            }

            if (dataList[2] is List) {
              _packages = List<Map<String, dynamic>>.from(dataList[2]);
            } else {
              throw Exception('Packages data is not in List format');
            }

            // Set the first payment method as selected
            if (_paymentModes.isNotEmpty) {
              final firstPaymentMode = _paymentModes[0];
              _selectedPayment = firstPaymentMode['Payment_Mode_Name'];
              selectedPaymentId =
                  firstPaymentMode['Payment_Mode_Id'].toString();
            }

            // Set the first user as selected if there are users
            if (_users.isNotEmpty) {
              _selectedUser = _users[0]['User_Details_Id'].toString();
            }

            _isItemsFetched = true;
            notifyListeners();
          } else {
            throw Exception('Insufficient data in response');
          }
        } else {
          _isItemsFetched = false;
          throw Exception('Invalid response format');
        }
      } else {
        _isItemsFetched = false;
        throw Exception(
            'Failed to load items. Status code: ${response.statusCode}');
      }
    } catch (error) {
      _isItemsFetched = false;
      print('Exception occurred while fetching items: $error');
      notifyListeners();
    }
  }
}
