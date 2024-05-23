import 'package:cookbook/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(String titleName) {
  return AppBar(
    centerTitle: true,
    title: Text(
      titleName,
      style: TextStyle(
        fontSize: 16.sp,
        color: AppColors.primaryText,
        fontWeight: FontWeight.normal,
      ),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.strawberryRed,
        height: 0.8,
      ),
    ),
  );
}

GestureDetector buildReusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset(
        iconName,
      ),
    ),
  );
}

Widget buildReuseableText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: Colors.grey.withOpacity(0.5),
    ),
  );
}

Widget buildTextField(
  String hintText,
  String textInputType,
  IconData iconName,
  void Function(String value)? fun,
) {
  return Container(
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(18.w),
      ),
      border: Border.all(
        color: AppColors.primaryFourElementText,
      ),
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          margin: EdgeInsets.only(left: 16.h),
          child: Icon(iconName)
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => fun!(value),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: AppColors.primaryFourElementText,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 14.sp,
            ),
            obscureText: textInputType == 'password' ? true : false,
          ),
        ),
      ],
    ),
  );
}

Widget buildLoginButton(
  String buttonName,
  String buttonType,
  void Function()? fun,
) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(top: buttonType == 'login' ? 60.h : 20.h),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonType == 'login' ? Colors.black : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: buttonType == 'login' ? Colors.transparent : Colors.black,
          ),
          borderRadius: BorderRadius.circular(16.w),
        ),
      ),
      onPressed: fun,
      child: Text(
        buttonName,
        style: TextStyle(
          color: buttonType == 'login' ? Colors.white : AppColors.primaryText,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}
