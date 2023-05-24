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
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MTAdminTheme.instance?.primary,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      (user.role == 'DEVELOPER') ? 'D' : 'A',
                      style: MTAdminTheme.instance?.appBarTitle,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    user.shortName,
                    style: MTAdminTheme.instance?.appBarSubTitle,
                  ),
                } else ...{
                  Row(
                    children: [
                      InkWell(
                        onTap: () => onAuthTap!(true),
                        child: Text(
                          S.current.login.toUpperCase(),
                          style: MTAdminTheme.instance?.appBarSubTitle,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        width: 2.0,
                        height: 24.0,
                        color: MTAdminTheme.instance?.onPrimay,
                      ),
                      InkWell(
                        onTap: () => onAuthTap!(false),
                        child: Text(
                          S.current.register.toUpperCase(),
                          style: MTAdminTheme.instance?.appBarSubTitle,
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
