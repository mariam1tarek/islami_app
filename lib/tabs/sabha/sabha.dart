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
  // قائمة الـ 5 تسبيحات المطلوبة
  final List<String> tasabeeh = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر",
    "استغفر الله"
  ];

  int currentIndex = 0; // مؤشر التسبيحة الحالية
  int counter = 0;      // عدد التسبيحات الحالي
  double turns = 0.0;   // زاوية دوران صورة السبحة

  void onSabhaTapped() {
    setState(() {
      counter++;
      // تدوير السبحة بمقدار دورة صغيرة (تزيد مع كل ضغطة)
      turns += 0.05;

      // لو العدد وصل 33، انفل للـ تسبيحة اللي بعدها ورجع العداد لـ 0
      if (counter > 33) {
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
        // الخلفية الخاصة بـ السبحة
        TabBgWidget(imagePath: Assets.images.sabhaBg.path),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // الهيدر أو الشعار إن وجد، أو مسافة تناسب التصميم
                  Assets.images.header.image(),
                  const SizedBox(height: 10),

                  // النص العلوي: (سَبِّحِ اسْمَ رَبِّكَ الأعلى)
                  SizedBox(
                    width: 316,
                    height: 67,
                    child: Center(
                      child: Text(
                        "سَبِّحِ اسْمَ رَبِّكَ الأَعْلَى",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.wihteColor,
                          fontSize: 36,
                          fontWeight: FontWeight.w700, // ويث 700 و بولد
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // صورة السبحة مع زر الاستجابة عند الضغط عليها
                  GestureDetector(
                    onTap: onSabhaTapped,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedRotation(
                          turns: turns,
                          duration: const Duration(milliseconds: 300),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                Assets.images.sabhaImg.path,
                                width: 350,
                                height: 350,
                                fit: BoxFit.contain,
                              ),
                              // النص بيتحرك مع الصورة (نفس نسبة اللفة)
                              // وبعدين بيترجع يقف مستقيم بعكس زاوية اللفة
                              AnimatedRotation(
                                turns: -turns,
                                duration: const Duration(milliseconds: 300),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 60),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // نص التسبيحة (مثل: سبحان الله)
                                      SizedBox(
                                        width: 156,
                                        height: 75,
                                        child: Center(
                                          child: Text(
                                            tasabeeh[currentIndex],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: AppColors.wihteColor,
                                              fontSize: 36,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // عدد التسبيح (مثل: 30)
                                      SizedBox(
                                        width: 156,
                                        height: 75,
                                        child: Center(
                                          child: Text(
                                            counter.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: AppColors.wihteColor,
                                              fontSize: 36,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}