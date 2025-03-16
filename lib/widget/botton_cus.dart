import 'package:flutter/material.dart';
import 'package:property_app/style/colors/app_colors.dart';
import 'package:property_app/view/property_home_screen.dart';

Widget bottonCustom(
    {double? height,
    double? width,
    Color? backgrouncolor,
    Color? textColor,
    String? title,
    void Function()? onTap,
    required BuildContext context}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height ?? 60,
      width: width ?? 180,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors().background),
        color: backgrouncolor ?? Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          title ?? 'text',
          style: TextStyle(color: textColor ?? Colors.black),
        ),
      ),
    ),
  );
}

Widget loginWithSocialBotton(
    {double? height,
    double? width,
    Color? backgrouncolor,
    Color? textColor,
    String? title,
    String? imageUrl,
    EdgeInsets? padding,
    required BuildContext context}) {
  return Padding(
    padding: padding ?? EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PropertyHomeScreen(),
            ));
      },
      child: Container(
        height: height ?? 60,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors().background),
          color: backgrouncolor ?? Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  height: (height ?? 60) - 10,
                  width: (height ?? 60) - 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(imageUrl ??
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png'))),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'Continue with ${title ?? 'text'}',
                style: TextStyle(
                    color: textColor ?? Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
