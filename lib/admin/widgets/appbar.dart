import 'package:flutter/material.dart';
import 'package:mefit/admin/export.dart';
import 'package:mefit/extensions/extensions.dart';
import 'package:mefit/model/model.dart';
import 'package:mefit/widgets/widgets.dart';
import 'package:mefit/r.dart' as R;

class WebSliverAppBar extends SliverAppBar {
  WebSliverAppBar(
    BuildContext context, {
    Key? key,
    UserModel? user,
    Function(bool isLogin)? onAuthTap,
  }) : super(
          key: key,
          backgroundColor: MTAdminTheme.instance?.primary,
          toolbarHeight: 72.0,
          leading: Container(),
          pinned: true,
          title: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Row(
              children: [
                const MTImage(
                  R.AssetImages.logoHorWhite,
                  height: 32.0,
                  fit: BoxFit.contain,
                ),
                const Spacer(),
                if (user != null) ...{
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: MTImage(
                      user.avatar,
                      width: 32.0,
                      height: 32.0,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    user.shortName,
                    style: MTAdminTheme.instance?.subTitle,
                  ),
                } else ...{
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (onAuthTap != null) onAuthTap(true);
                        },
                        child: Text(
                          S.current.login.toUpperCase(),
                          style: MTAdminTheme.instance?.subTitle,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        width: 2.0,
                        height: 24.0,
                        color: MTAdminTheme.instance?.onPrimay,
                      ),
                      InkWell(
                        onTap: () {
                          if (onAuthTap != null) onAuthTap(false);
                        },
                        child: Text(
                          S.current.register.toUpperCase(),
                          style: MTAdminTheme.instance?.subTitle,
                        ),
                      ),
                    ],
                  ),
                },
              ],
            ),
          ),
        );
}
