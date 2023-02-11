import 'package:flutter/material.dart';


import 'presentation/router/app_router.dart';
import 'services/services_locator.dart';

Future<void> main() async {
  // BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
  // BaseServiceCategoryRepository baseServiceCategoryRepository =
  //     ServiceCategoryRepository(baseRemoteDataSource);
  //
  // List<ServiceCategory> serviceCategory =
  //     await GetServiceCategoryUseCase(baseServiceCategoryRepository).execute();
  //
  // print(serviceCategory);
  ServicesLocator().init();

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

   @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
