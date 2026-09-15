import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/common/app_colors.dart';
import 'package:islami_app/gen/assets.gen.dart';
import 'package:islami_app/models/hadith_data.dart';
import 'package:islami_app/widgets/tab_bg_widget.dart';

class Hadith extends StatelessWidget {
  const Hadith({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Stack(
      children: [
        TabBgWidget(imagePath: Assets.images.hadithBg.path),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.images.header.path),
              const SizedBox(height: 10),

              Expanded(
                child: Center(
                  child: CarouselSlider.builder(
                    itemCount: allHadiths.length,
                    options: CarouselOptions(
                      height: mediaQuery.height * 0.68,
                      viewportFraction: 0.75,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                    ),
                    itemBuilder: (context, index, realIndex) {
                      final hadith = allHadiths[index];
                      return Card(
                        color: AppColors.goldColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // خلفية الكارد
                            Image.asset(
                              Assets.images.hadithItemBg.path,
                              fit: BoxFit.fill,
                            ),


                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                children: [
                                  Text(
                                    hadith.title,
                                    style: const TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 15),

                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Text(
                                        hadith.content,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}