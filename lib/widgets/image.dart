import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mefit/r.dart' as R;

class MFDefaultImage extends StatelessWidget {
  final double? width;
  final double? height;

  const MFDefaultImage({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey,
      child: Image.asset(
        R.AssetImages.imgPlaceholder,
        width: width,
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
}

class MTImage extends StatelessWidget {
  final dynamic src;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final Color? backgroundColor;
  final bool noTransitions;

  const MTImage(
    this.src, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.backgroundColor,
    this.noTransitions = false,
  });

  @override
  Widget build(BuildContext context) {
    if (src == null) {
      return MFDefaultImage(width: width, height: height);
    }
    switch (src.runtimeType) {
      case String:
        var asset = src as String;
        if (asset.contains('http')) {
          return Container(
            color: backgroundColor ?? Colors.transparent,
            child: CachedNetworkImage(
              imageUrl: asset,
              width: width,
              height: height,
              fit: fit,
              fadeInDuration: noTransitions
                  ? Duration.zero
                  : const Duration(milliseconds: 500),
              errorWidget: (context, e, _) => MFDefaultImage(
                width: width,
                height: height,
              ),
              placeholder: noTransitions
                  ? null
                  : (context, _) => MFDefaultImage(
                        width: width,
                        height: height,
                      ),
            ),
          );
        } else if (asset.contains('assets')) {
          if (asset.contains('.svg')) {
            return SvgPicture.asset(
              asset,
              width: width,
              height: height,
              fit: fit ?? BoxFit.none,
            );
          }
          return Image.asset(
            asset,
            width: width,
            height: height,
            fit: fit ?? BoxFit.none,
            color: color,
          );
        }
        break;
      case IconData:
        var asset = src as IconData;
        var size = max(width ?? 0, height ?? 0);
        return Icon(
          asset,
          size: size == 0 ? null : size,
        );
      // case File:
      //   return Image.file(file);
      case Uint8List:
        var bytes = src as Uint8List;
        return Image.memory(bytes);
    }

    return MFDefaultImage(
      width: width,
      height: height,
    );
  }
}
