import 'package:flutter/material.dart';
import 'package:mefit/admin/export.dart';

class MTButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final bool isLoading;
  final Color? background;

  const MTButton({
    super.key,
    required this.title,
    this.onTap,
    this.background,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.0,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 52.0,
          decoration: BoxDecoration(
            color: background ?? MTAdminTheme.instance?.primary,
            borderRadius: BorderRadius.circular(4.0),
          ),
          alignment: Alignment.center,
          child: isLoading
              ? SizedBox(
                  width: 28.0,
                  height: 28.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    color: MTAdminTheme.instance?.onPrimay,
                  ),
                )
              : Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: MTAdminTheme.instance?.onPrimay,
                  ),
                ),
        ),
      ),
    );
  }
}
