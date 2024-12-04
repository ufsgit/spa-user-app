import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/controller/dashboard/customer_provider.dart';
import 'package:spa_app_user/view/widgets/home/custom_drop_down_widget.dart';
import 'package:spa_app_user/view/widgets/home/home_text_field_widget.dart';
import 'package:spa_app_user/view/widgets/login/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCustomerWidget extends StatelessWidget {
  const AddCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customerProvider = Provider.of<CustomerProvider>(context);
    List<String> staffList = ["Staff 1", "Staff 2", "Staff 3"];
    List<String> servicesList = ["Service 1", "Service 2", "Service 3"];
    List<String> paymentMethods = ["Credit Card", "Cash", "UPI"];
    void showAlertDialog(BuildContext context, String message) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Validation Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    void validateAndSubmit() {
      // Check required fields
      if (customerProvider.serviceNoController.text.isEmpty) {
        showAlertDialog(context, 'Service number is required');
        return;
      }
      if (customerProvider.customerNameController.text.isEmpty) {
        showAlertDialog(context, 'Customer name is required');
        return;
      }
      if (customerProvider.mobileNoController.text.isEmpty) {
        showAlertDialog(context, 'Mobile number is required');
        return;
      }
      if (customerProvider.emailIdController.text.isEmpty) {
        showAlertDialog(context, 'Email ID is required');
        return;
      }
      if (customerProvider.dateController.text.isEmpty) {
        showAlertDialog(context, 'Date is required');
        return;
      }

      if (customerProvider.selectedStaff == null) {
        showAlertDialog(context, 'Staff selection is required');
        return;
      }
      if (customerProvider.selectedService == null) {
        showAlertDialog(context, 'Service/Package selection is required');
        return;
      }
      if (customerProvider.amountController.text.isEmpty) {
        showAlertDialog(context, 'Amount is required');
        return;
      }
      if (customerProvider.selectedService == null) {
        showAlertDialog(context, 'Payment mode is required');
        return;
      }
      if (customerProvider.isTipEnabled) {
        if (customerProvider.tipAmountController.text.isEmpty) {
          showAlertDialog(context, 'Tip amount is required');
          return;
        }
        if (customerProvider.selectedPaymentMethod == null) {
          showAlertDialog(context, 'Tip payment method is required');
          return;
        }
      }

      customerProvider.addCustomer(
        descriptions: customerProvider.descriptionController.text,
        tipAmount: customerProvider.tipAmountController.text.isEmpty
            ? '0'
            : customerProvider.tipAmountController.text,
        context: context,
        leadsId: 0,
        customerName: customerProvider.customerNameController.text,
        contactNo: customerProvider.mobileNoController.text,
        email: customerProvider.emailIdController.text,
        serviceNo: int.tryParse(customerProvider.serviceNoController.text) ?? 0,
        date: customerProvider.dateController.text,
        toUserId: 1,
        toUserName: customerProvider.selectedStaff!,
        packageId: 1,
        packageName: customerProvider.selectedService!,
        packageAmount: customerProvider.amountController.text,
        paymentModeId: 1,
        paymentModeName: customerProvider.selectedService!,
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: AppColors.textWhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: AppColors.textGrey600,
                  ),
                  const Spacer(),
                  Text(
                    'Add new customer',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  const SizedBox()
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: HomeTextFieldWidget(
                      showBorder: true,
                      containerColor: AppColors.textWhite,
                      borderColor: AppColors.grey,
                      borderRadius: 8,
                      controller: customerProvider.serviceNoController,
                      hintText: 'Service number',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: HomeTextFieldWidget(
                      borderRadius: 8,
                      containerColor: AppColors.textWhite,
                      borderColor: AppColors.grey,
                      controller: customerProvider.customerNameController,
                      hintText: 'Customer name',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              HomeTextFieldWidget(
                borderRadius: 8,
                containerColor: AppColors.textWhite,
                borderColor: AppColors.grey,
                controller: customerProvider.mobileNoController,
                hintText: 'Mobile Number',
              ),
              const SizedBox(height: 16),
              HomeTextFieldWidget(
                borderRadius: 8,
                containerColor: AppColors.textWhite,
                borderColor: AppColors.grey,
                controller: customerProvider.emailIdController,
                hintText: 'Email ID',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: HomeTextFieldWidget(
                      onTap: () => customerProvider.selectDate(context),
                      readOnly: true,
                      suffixIcon: Icon(
                        Icons.calendar_month_outlined,
                        color: AppColors.textGrey600.withOpacity(.5),
                      ),
                      showBorder: true,
                      containerColor: AppColors.textWhite,
                      borderColor: AppColors.grey,
                      borderRadius: 8,
                      controller: customerProvider.dateController,
                      hintText: 'Date',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: HomeTextFieldWidget(
                      onTap: () => customerProvider.selectTime(context),
                      readOnly: true,
                      suffixIcon: Icon(
                        Icons.timer_sharp,
                        color: AppColors.textGrey600.withOpacity(.5),
                      ),
                      borderRadius: 8,
                      containerColor: AppColors.textWhite,
                      borderColor: AppColors.grey,
                      controller: customerProvider.timeController,
                      hintText: 'Time',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomDropdownWidget(
                hintText: "Staff",
                items: staffList,
                selectedItem: customerProvider.selectedStaff,
                onChanged: (value) {
                  customerProvider.setSelectedStaff(value);
                },
              ),
              const SizedBox(height: 16),
              CustomDropdownWidget(
                hintText: "Service/Package",
                items: servicesList,
                selectedItem: customerProvider.selectedService,
                onChanged: (value) {
                  customerProvider.setSelectedService(value);
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: HomeTextFieldWidget(
                      showBorder: true,
                      containerColor: AppColors.textWhite,
                      borderColor: AppColors.grey,
                      borderRadius: 8,
                      controller: customerProvider.amountController,
                      hintText: 'Amount',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomDropdownWidget(
                      hintText: "Payment mode",
                      items: servicesList,
                      selectedItem: customerProvider.selectedService,
                      onChanged: (value) {
                        customerProvider.setSelectedService(value);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              HomeTextFieldWidget(
                borderRadius: 8,
                maxLines: 4,
                containerColor: AppColors.textWhite,
                borderColor: AppColors.grey,
                controller: customerProvider.descriptionController,
                hintText: 'Description',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    "Is there a tip amount?",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                    ),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: .7,
                    child: Switch(
                      trackOutlineColor:
                          WidgetStatePropertyAll(AppColors.textWhite),
                      activeColor: AppColors.textWhite,
                      activeTrackColor: AppColors.appThemeOrange,
                      inactiveThumbColor: AppColors.textWhite,
                      inactiveTrackColor: AppColors.textGrey600.withOpacity(.5),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: customerProvider.isTipEnabled,
                      onChanged: (value) {
                        customerProvider.setTipEnabled(value);
                      },
                    ),
                  ),
                ],
              ),
              if (customerProvider.isTipEnabled) ...[
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: HomeTextFieldWidget(
                        showBorder: true,
                        containerColor: AppColors.textWhite,
                        borderColor: AppColors.grey,
                        borderRadius: 8,
                        controller: customerProvider.tipAmountController,
                        hintText: 'Tip Amount',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomDropdownWidget(
                        hintText: "Payment Method",
                        items: paymentMethods,
                        selectedItem: customerProvider.selectedPaymentMethod,
                        onChanged: (value) {
                          customerProvider.setSelectedPaymentMethod(value);
                        },
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 16),
              CustomButtonWidget(
                color: AppColors.appThemeOrange,
                width: MediaQuery.sizeOf(context).width,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textWhite,
                ),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                text: 'Add customer',
                onPressed: () {
                  validateAndSubmit();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
