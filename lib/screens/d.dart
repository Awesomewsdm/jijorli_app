// import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Remaining Time"),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: RemainingTimeWidget(),
//       ),
//     );
//   }
// }

// class RemainingTimeWidget extends StatelessWidget {
//   // Assuming there are 24 hours in a day
//   final int hoursInADay = 24;
//   final int currentAge = 30;
//   final int lifeExpectancy = 80;

//   const RemainingTimeWidget({super.key});

//   double calculatePercentageRemaining() {
//     int remainingHours =
//         _calculateRemainingDaysAndHours(currentAge, lifeExpectancy);
//     int totalHours = (lifeExpectancy * 365 * hoursInADay);

//     return (totalHours - remainingHours) / totalHours;
//   }

//   int _calculateRemainingDaysAndHours(int currentAge, int lifeExpectancy) {
//     int remainingYears = lifeExpectancy - currentAge;
//     int remainingDays = remainingYears * 365; // Assuming 365 days in a year
//     int remainingHours = remainingDays * hoursInADay;

//     return remainingHours;
//   }

//   @override
//   Widget build(BuildContext context) {
//     double percentageRemaining = calculatePercentageRemaining();

//     int remainingHours =
//         _calculateRemainingDaysAndHours(currentAge, lifeExpectancy);
//     int remainingDays = remainingHours ~/ 24;
//     int remainingHoursInDay = remainingHours % 24;

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         LinearProgressIndicator(
//           value: percentageRemaining,
//           backgroundColor: Colors.grey[300],
//           valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
//         ),
//         const SizedBox(height: 16),
//         Text(
//           "You have approximately $remaining Days days and $remainingHoursInDay hours left on this earth.",
//           style: const TextStyle(fontSize: 20),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }






