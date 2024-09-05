// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:check_network_connection/check_network_connection.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CheckNetworkConnection());
}

class CheckNetworkConnection extends StatelessWidget {
  const CheckNetworkConnection({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(360, 720),
      useInheritedMediaQuery: true,
      child: GetMaterialApp(
        title: 'Network Connection Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(title: 'Network Connection Demo'),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NetworkConnectionDialog networkConnectionDialog;
  @override
  void initState() {
    networkConnectionDialog = NetworkConnectionDialog(
        title: const Text('No Internet'),
        content: const Text("Check connection settings and try again."),
        btnCancel: const Text("RETRY"),
        btnSetting: const Text("GO SETTING"),
        titleStyle: TextStyle(fontSize: 20.sp),
        contentStyle: TextStyle(fontSize: 14.sp),
        boxDecorationBtnRetry: const BoxDecoration(color: Colors.red));

    networkConnectionDialog.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please enable/disable mobile data and wifi to see the change',
            ),
          ],
        ),
      ),
    );
  }
}
