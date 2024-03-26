import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../const/app_fonts.dart';
import '../const/imdb_colors.dart';

class ImageTitleDisplay extends StatelessWidget {
  final double? percentage;
  final String imageLoction;
  final String title;
  final bool showAPlus;
  final double? width;
  final double? height;

  const ImageTitleDisplay(
      {super.key,
      required this.percentage,
      required this.imageLoction,
      required this.title,
      required this.showAPlus,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: width ?? 319.0,
              height: height ?? 172.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(22.0)),
                image: DecorationImage(
                  image: AssetImage(imageLoction),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            percentage != null
                ? Positioned(
                    bottom: 5,
                    left: 11,
                    child: Container(
                      width: 300.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(22.0)),
                        border: Border.all(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      child: LinearProgressIndicator(
                        value: percentage,
                        backgroundColor: Colors.grey,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                  )
                : Container(),
            showAPlus
                ? Positioned(
                    top: 4.0,
                    right: 8.0,
                    child: Container(
                      width: 50.0.w,
                      height: 15.0.h,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(ImdbStrings.aplus,
                            style: AppFonts.small(fontFamily: AppFonts.roboto)
                                .copyWith(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff00B2FF))),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            textAlign: TextAlign.start,
            maxLines: 2,
            style: AppFonts.small(fontFamily: AppFonts.roboto).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ],
    );
  }
}
