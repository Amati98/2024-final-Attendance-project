import 'package:device_preview/device_preview.dart';
import 'package:final_year/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// void main() {
//   runApp(const Homepage());
// }
void main() {
  runApp(
    ProviderScope(
      child: DevicePreview(
        enabled: true,
        tools: const [
          ...DevicePreview.defaultTools,
        ],
        builder: (context) => const Homepage(),
      ),
    ),
  );
}

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    //  final responseProvider = ref.watch(  ApiService().loginProvider);
    
    // dont forget to write "GetMaterialApp" for the home screen to run
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: StaffLogin(),
      routes: getAppRoutes()
    );
  }
}
