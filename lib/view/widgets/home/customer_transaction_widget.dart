import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomerTransactionWidget extends StatelessWidget {
  final String date;
  final String time;
  final String customer;
  final String service;
  final String staffName;
  final String amount;

  const CustomerTransactionWidget({super.key, 
    required this.date,
    required this.customer,
    required this.service,
    required this.amount,
    required this.time,
    required this.staffName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.textWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.textGrey600.withOpacity(.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.textGrey600,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          date,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                        ),
                        const Text(
                          ' • ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      customer,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.access_time_rounded,
                  color: AppColors.textGrey600,
                  size: 18,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                ),
                const Spacer(),
                Text(
                  amount,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: AppColors.textGreen),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  service,
                  style: TextStyle(
                    color: AppColors.textBlack,
                    fontSize: 14.0,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.textGrey600.withOpacity(.1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.textGrey600.withOpacity(.3),
                            )),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          staffName,
                          style: TextStyle(
                            color: AppColors.textBlack,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
