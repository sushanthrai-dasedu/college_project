
import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leave_tracker/ui/admin/auth/cubit/registration_cubit.dart';
import 'package:leave_tracker/ui/main/ui/pages/app_main.dart';
import 'package:leave_tracker/ui/theme/theme_const.dart';
import 'package:leave_tracker/utility/string_consts.dart';

import 'core/Router/navigator.dart';
import 'core/di/service_locator.dart';
import 'localization/language_data.dart';
import 'localization/locale_constant.dart';
import 'localization/localizations_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocator();
  runApp(const MyApp());
}

final botToastBuilder = BotToastInit();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Locale _locale = const Locale("en");

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => serviceLocator<RegistrationCubit>()
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) =>
            MaterialApp(
              title: StringConstants.appName,
              debugShowCheckedModeBanner: false,
              builder: (context, widget) {
                widget = botToastBuilder(context, widget);
                return widget;
              },
              navigatorObservers: [BotToastNavigatorObserver()],
              onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
              theme: ThemeConst.lightThemeData,
              home: const AppMain(),
              locale: _locale,
              supportedLocales: LanguageData.getSupportedLocale(),
              localizationsDelegates: const [
                AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale?.languageCode &&
                      supportedLocale.countryCode == locale?.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
            ),
      ),
    );
  }
}

