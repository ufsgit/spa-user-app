import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spa_app_user/model/dash_board_model.dart';

class FilterProvider extends ChangeNotifier {
  // Date Filter Options
  final List<String> dateFilterOptions = ['Today', 'This Week', 'This Month'];
  String _selectedDateFilter = 'Today';

  // Date Controllers
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();

  // Service/Package Dropdown
  List<String> servicePackageList = ["Service 1", "Service 2", "Service 3"];
  String? _selectedServicePackage;
   List<DashBoardModel> _searchList = [];
  List<DashBoardModel> get searchList => _searchList;

  // Staff Dropdown
  List<String> staffList = ["Staff 1", "Staff 2", "Staff 3"];
  String? _selectedStaff;

  // Payment Type Dropdown
  List<String> paymentTypeList = ["Cash", "Card", "Online Transfer"];
  String? _selectedPaymentType;

  // Getters
  String get selectedDateFilter => _selectedDateFilter;
  String? get selectedServicePackage => _selectedServicePackage;
  String? get selectedStaff => _selectedStaff;
  String? get selectedPaymentType => _selectedPaymentType;

  // Set Date Filter
  void setDateFilter(String filter) {
    _selectedDateFilter = filter;
    _updateDateFields();
    notifyListeners();
  }

  // Private method to update date fields based on selected filter
  void _updateDateFields() {
    DateTime now = DateTime.now();

    switch (_selectedDateFilter) {
      case 'Today':
        fromDateController.text = DateFormat('dd/MM/yyyy').format(now);
        toDateController.text = DateFormat('dd/MM/yyyy').format(now);
        break;
      case 'This Week':
        DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
        fromDateController.text = DateFormat('dd/MM/yyyy').format(startOfWeek);
        toDateController.text = DateFormat('dd/MM/yyyy').format(endOfWeek);
        break;
      case 'This Month':
        DateTime startOfMonth = DateTime(now.year, now.month, 1);
        DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);
        fromDateController.text = DateFormat('dd/MM/yyyy').format(startOfMonth);
        toDateController.text = DateFormat('dd/MM/yyyy').format(endOfMonth);
        break;
    }
  }

  // Select Date Method
  Future<void> selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      if (isFromDate) {
        fromDateController.text = DateFormat('dd/MM/yyyy').format(picked);
      } else {
        toDateController.text = DateFormat('dd/MM/yyyy').format(picked);
      }
      notifyListeners();
    }
  }

  // Set Dropdown Values
  void setServicePackage(String? value) {
    _selectedServicePackage = value;
    notifyListeners();
  }

  void setStaff(String? value) {
    _selectedStaff = value;
    notifyListeners();
  }

  searchCustomers({required String query,required List<DashBoardModel> data}) {
    if(query.isNotEmpty){
      data.contains((e)e)
      return _searchList;
    }else{

   return data;
    }

  }
  void setPaymentType(String? value) {
    _selectedPaymentType = value;
    notifyListeners();
  }

  Map<String, String> activeFilters = {};

  void updateActiveFilters() {
    activeFilters.clear();

    if (selectedDateFilter.isNotEmpty) {
      activeFilters['Date'] = selectedDateFilter;
    }

    if (selectedStaff != null) {
      activeFilters['Staff'] = selectedStaff!;
    }

    if (selectedPaymentType != null) {
      activeFilters['Payment Type'] = selectedPaymentType!;
    }

    if (fromDateController.text.isNotEmpty &&
        toDateController.text.isNotEmpty) {
      activeFilters['Custom Date'] =
          '${fromDateController.text} - ${toDateController.text}';
    }

    notifyListeners();
  }

  // Reset Filters Method
  void resetFilters() {
    _selectedDateFilter = 'Today';
    fromDateController.clear();
    toDateController.clear();
    _selectedServicePackage = null;
    _selectedStaff = null;
    _selectedPaymentType = null;
    activeFilters.clear();
    _updateDateFields();
    notifyListeners();
  }

  // Apply Filters Method (you can customize this based on your requirements)
  void applyFilters() {
    // Implement your filter application logic here
    // This could involve calling an API, updating a list, etc.
    updateActiveFilters();
    print('Filters Applied:');
    print('Date Filter: $_selectedDateFilter');
    print('From Date: ${fromDateController.text}');
    print('To Date: ${toDateController.text}');
    print('Service/Package: $_selectedServicePackage');
    print('Staff: $_selectedStaff');
    print('Payment Type: $_selectedPaymentType');
  }

  // Initialize with default date
  FilterProvider() {
    _updateDateFields();
  }

  // Dispose controllers to prevent memory leaks
  @override
  void dispose() {
    fromDateController.dispose();
    toDateController.dispose();
    super.dispose();
  }
}
