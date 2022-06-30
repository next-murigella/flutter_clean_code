import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hsc/app/presentation/shared_ui/theme.dart';
import 'package:flutter_hsc/app/presentation/views/main_view/main_view.dart';
import 'package:flutter_hsc/core/dependency_injection/injector.dart'
    as dependency_injector;

void main() {
  dependency_injector.init();
  runApp(const OTHParking());
}

class OTHParking extends StatelessWidget {
  const OTHParking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CleanCode x MobX",
      themeMode: ThemeMode.system,
      darkTheme: createDarkModeTheme(),
      theme: createLightModeTheme(),
      onGenerateTitle: (context) {
        return AppLocalizations.of(context)!.app_title;
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MainView(),
    );
  }
}
