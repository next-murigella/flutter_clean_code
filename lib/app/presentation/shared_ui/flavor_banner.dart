import 'package:flutter/material.dart';
import 'package:flutter_hsc/core/dependency_injection/injector.dart';
import 'package:flutter_hsc/flavor_config.dart';

// ignore: must_be_immutable
class FlavorBanner extends StatelessWidget {
  final Widget child;
  BannerConfig? bannerConfig;
  FlavorConfig? config = injector<FlavorConfig>();

  FlavorBanner({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (config!.isProduction()!) return child;
    bannerConfig ??= _getDefaultBanner();
    return Stack(
      children: <Widget>[child, _buildBanner(context)],
    );
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(bannerName: config!.name!, bannerColor: config!.color!);
  }

  Widget _buildBanner(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: BannerPainter(
            message: config!.name!,
            textDirection: Directionality.of(context),
            layoutDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            color: config!.color!),
      ),
    );
  }
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;
  BannerConfig({required this.bannerName, required this.bannerColor});
}
