/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/pic-01.png
  AssetGenImage get pic01 => const AssetGenImage('assets/png/pic-01.png');

  /// File path: assets/png/pic-02.png
  AssetGenImage get pic02 => const AssetGenImage('assets/png/pic-02.png');

  /// File path: assets/png/pic-03.png
  AssetGenImage get pic03 => const AssetGenImage('assets/png/pic-03.png');

  /// File path: assets/png/pic-04.png
  AssetGenImage get pic04 => const AssetGenImage('assets/png/pic-04.png');

  /// File path: assets/png/pic-05.png
  AssetGenImage get pic05 => const AssetGenImage('assets/png/pic-05.png');

  /// File path: assets/png/pic-1.png
  AssetGenImage get pic1 => const AssetGenImage('assets/png/pic-1.png');

  /// File path: assets/png/pic-2.png
  AssetGenImage get pic2 => const AssetGenImage('assets/png/pic-2.png');

  /// File path: assets/png/pic-3.png
  AssetGenImage get pic3 => const AssetGenImage('assets/png/pic-3.png');

  /// File path: assets/png/pic-4.png
  AssetGenImage get pic4 => const AssetGenImage('assets/png/pic-4.png');

  /// File path: assets/png/pic-5.png
  AssetGenImage get pic5 => const AssetGenImage('assets/png/pic-5.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [pic01, pic02, pic03, pic04, pic05, pic1, pic2, pic3, pic4, pic5];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/Icons.svg
  SvgGenImage get icons => const SvgGenImage('assets/svg/Icons.svg');

  /// List of all assets
  List<SvgGenImage> get values => [icons];
}

class Assets {
  Assets._();

  static const AssetGenImage logo = AssetGenImage('assets/logo.jpg');
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();

  /// List of all assets
  static List<AssetGenImage> get values => [logo];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
