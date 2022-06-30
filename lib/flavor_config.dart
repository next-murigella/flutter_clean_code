// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum Flavor { DEV, MOCK, PRODUCTION }

class FlavorValues {
  FlavorValues({required this.weatherUrl});
  final String weatherUrl;
}

class FlavorConfig {
  Flavor? flavor;
  String? name;
  Color? color;
  FlavorValues? values;

  FlavorConfig();

  bool? isProduction() => flavor == Flavor.PRODUCTION;
  bool? isDevelopment() => flavor == Flavor.DEV;
  bool? isMock() => flavor == Flavor.MOCK;
}
