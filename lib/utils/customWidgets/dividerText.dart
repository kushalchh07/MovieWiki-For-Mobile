import 'package:flutter/material.dart';
import 'package:movie_wiki/constants/size/size.dart';

import '../../constants/colors/colors.dart';

dividerText({
  required dynamic context,
  required String dividerText,
  required String desc,
  // bool isHome = false,
  // bool isUpComing = false,
}) {
  AppSize size = AppSize(context: context);
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: ' $dividerText',
                  style: TextStyle(
                    color: primaryColor,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.w500,
                    fontSize: size.boldText(),
                  ),
                ),
              ],
            ),
          ),
        )

        // if (desc.isNotEmpty)
        //   Padding(
        //     padding: const EdgeInsets.only(top: 10),
        //     child: Text(
        //       desc,
        //       style: TextStyle(color: greyColor),
        //     ),
        //   ),
      ],
    ),
  );
}
