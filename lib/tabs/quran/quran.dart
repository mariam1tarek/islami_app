import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/common/app_colors.dart';
import 'package:islami_app/gen/assets.gen.dart';
import 'package:islami_app/models/sura_data.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:islami_app/tabs/quran/views/most_recently_view.dart';
import 'package:islami_app/tabs/quran/views/suras_list_view.dart';
import 'package:islami_app/widgets/tab_bg_widget.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {

  final List<SuraModel> recentSuras = SuraData.getAllSuras().take(10).toList();

  void addRecentlyOpenedSura(SuraModel sura) {
    setState(() {
      recentSuras.removeWhere((item) => item.englishName == sura.englishName);
      recentSuras.insert(0, sura);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        TabBgWidget(imagePath: Assets.images.quranTab.path),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Assets.images.header.image(),
                  const SizedBox(height: 20),
                  TextField(
                    style: const TextStyle(color: AppColors.wihteColor),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.blackColor.withValues(alpha: 0.7),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          Assets.images.quran,
                          colorFilter: const ColorFilter.mode(
                            AppColors.goldColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.goldColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.goldColor,
                        ),
                      ),
                      hintText: "Sura name",
                      hintStyle: const TextStyle(
                        color: AppColors.wihteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.goldColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MostRecentlyView(recentSuras: recentSuras),
                  const SizedBox(height: 20),
                  SurasListView(onSuraSelected: addRecentlyOpenedSura),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}