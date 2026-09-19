import 'package:flutter/material.dart';
import 'package:islami_app/common/app_colors.dart';
import 'package:islami_app/gen/assets.gen.dart';
import 'package:islami_app/widgets/tab_bg_widget.dart';

class Sabha extends StatefulWidget {
  const Sabha({super.key});

  @override
  State<Sabha> createState() => _SabhaState();
}

class _SabhaState extends State<Sabha> {
  final List<String> tasabeeh = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر",
    "استغفر الله"
  ];

  int currentIndex = 0;
  int counter = 0;
  double turns = 0.0;

  void onSabhaTapped() {
    setState(() {
      counter++;
      turns += 1.0 / 33.0;

      if (counter >= 33) {
        counter = 0;
        currentIndex = (currentIndex + 1) % tasabeeh.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        TabBgWidget(imagePath: Assets.images.sabhaBg.path),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              Assets.images.header.image(),
              const SizedBox(height: 20),


              SizedBox(
                width: 316,
                height: 60,
                child: Center(
                  child: Text(
                    "سَبِّحِ اسْمَ رَبِّكَ الأَعْلَى",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.wihteColor,
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),

              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: onSabhaTapped,
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          AnimatedRotation(
                            turns: turns,
                            duration: const Duration(milliseconds: 250),
                            child: Image.asset(
                              Assets.images.sabhaBody.path,
                              width: 330,
                              height: 330,
                              fit: BoxFit.contain,
                            ),
                          ),

                          Positioned(
                            top: -65,
                            child: Image.asset(
                              Assets.images.headSabha.path,
                              width: 70,
                              height: 75,
                              fit: BoxFit.contain,
                            ),
                          ),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 156,
                                height: 75,
                                child: Center(
                                  child: Text(
                                    tasabeeh[currentIndex],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: AppColors.wihteColor,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 156,
                                height: 75,
                                child: Center(
                                  child: Text(
                                    counter.toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: AppColors.wihteColor,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}