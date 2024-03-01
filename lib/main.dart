import 'package:device_preview/device_preview.dart';
import 'package:final_year/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// void main() {
//   runApp(const Homepage());
// }
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const Homepage(),
    ),
  );
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // dont forget to write "GetMaterialApp" for the home screen to run
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

// DevicePreview(
//       enabled: true,
//       tools: [
//         ...DevicePreview.defaultTools,
//         const CustomPlugin(),
//       ],
//       builder: (context) => const BasicApp(),
//     ),