import 'package:flutter/material.dart';
import 'package:flutter_hsc/app/presentation/shared_ui/flavor_banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hsc/app/presentation/stores/main_view_store.dart';
import 'package:flutter_hsc/core/dependency_injection/injector.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: must_be_immutable
class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);
  final MainViewStore _mainViewStore = injector<MainViewStore>();
  double angle = 0;

  final _formKey = GlobalKey<FormState>();

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.app_title,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.right,
              ),
            ),
            body: Observer(builder: (_) {
              switch (_mainViewStore.mainViewState) {
                case MainViewState.startup:
                  _mainViewStore.fetchWeather(
                      "93049", Localizations.localeOf(context).languageCode);
                  return const Center(child: CircularProgressIndicator());
                case MainViewState.loaded:
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              _mainViewStore.weather?.name ?? "",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            Image.network(
                                'http://openweathermap.org/img/wn/${_mainViewStore.weather?.icon}@2x.png'),
                          ],
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextFormField(
                                decoration: new InputDecoration(
                                  alignLabelWithHint: true,
                                  border: OutlineInputBorder(),
                                  hintText:
                                      AppLocalizations.of(context)!.hint_text,
                                  labelText:
                                      AppLocalizations.of(context)!.hint_text,
                                ),
                                validator: (coordinate) {
                                  if (!isNumeric(coordinate)) {
                                    return AppLocalizations.of(context)!
                                        .form_validation_double;
                                  }
                                  return null;
                                },
                                onChanged: (newText) {
                                  _mainViewStore.postalCode = newText;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.temperature,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                _mainViewStore.weather?.weatherAttributes?.temp
                                        .toString() ??
                                    "",
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.main_weather,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                _mainViewStore.weather?.main.toString() ?? "",
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.humidity_weather,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                _mainViewStore
                                        .weather?.weatherAttributes?.humidity
                                        .toString() ??
                                    "",
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .wind_speed_weather,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                _mainViewStore
                                        .weather?.weatherAttributes?.wind?.speed
                                        .toString() ??
                                    "",
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      FloatingActionButton.extended(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _mainViewStore.fetchWeather(
                                  _mainViewStore.postalCode,
                                  Localizations.localeOf(context).languageCode);
                            }
                          },
                          label:
                              Text(AppLocalizations.of(context)!.btn_search)),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.all(30),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.something_wrong,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  child: Text(
                                    AppLocalizations.of(context)!.tell_me,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline),
                                  ),
                                  onTap: () =>
                                      launchUrlString('https://www.google.com'),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                default:
                  return const Center(child: CircularProgressIndicator());
              }
            })));
  }
}
