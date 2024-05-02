//region imports

import 'package:beauty_master/injection_container.dart';
import 'package:beauty_master/main.dart';
import 'package:beauty_master/utils/AppTheme.dart';
import 'package:beauty_master/utils/BMConstants.dart';
import 'package:beauty_master/view/blocs/products/products_bloc.dart';
import 'package:beauty_master/view/screens/BMSplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class BeautyCenterApp extends StatelessWidget {
  const BeautyCenterApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                getIt<ProductsBloc>()..add(GetAllProductsEvent()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '$appName${!isMobile ? ' ${platformName()}' : ''}',
        home: BMSplashScreen(),
        theme: !appStore.isDarkModeOn
            ? AppThemeData.lightTheme
            : AppThemeData.darkTheme,
        navigatorKey: navigatorKey,
        scrollBehavior: SBehavior(),
        supportedLocales: LanguageDataModel.languageLocales(),
        localeResolutionCallback: (locale, supportedLocales) => locale,
      ),
    );
  }
}
