import 'package:airaystem/bindings/initialbinding.dart';
import 'package:airaystem/core/class/crud.dart';
import 'package:airaystem/view/screen/language.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:airaystem/core/localization/changelocal.dart';
import 'package:airaystem/core/localization/translation.dart';
import 'package:airaystem/core/services/services.dart';
import 'package:airaystem/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  Get.lazyPut(() => Crud());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      title: 'Air Sense',
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      home: Language(),

      getPages: routes,
    );
  }
}
