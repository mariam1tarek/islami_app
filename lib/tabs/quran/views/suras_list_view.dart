import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/common/app_colors.dart';
import 'package:islami_app/gen/assets.gen.dart';
import 'package:islami_app/models/sura_model.dart';

class SurasListView extends StatelessWidget {
   SurasListView({super.key});

  final List<SuraModel> suras = [
    SuraModel(englishName: "Al-Fatiha", arabicName: "الفاتحة", versesCount: "7 Verses"),
    SuraModel(englishName: "Al-Baqarah", arabicName: "البقرة", versesCount: "286 Verses"),
    SuraModel(englishName: "Aal-E-Imran", arabicName: "آل عمران", versesCount: "200 Verses"),
    SuraModel(englishName: "An-Nisa", arabicName: "النساء", versesCount: "176 Verses"),
    SuraModel(englishName: "Al-Ma'idah", arabicName: "المائدة", versesCount: "120 Verses"),
    SuraModel(englishName: "Al-An'am", arabicName: "الأنعام", versesCount: "165 Verses"),
    SuraModel(englishName: "Al-A'raf", arabicName: "الأعراف", versesCount: "206 Verses"),
    SuraModel(englishName: "Al-Anfal", arabicName: "الأنفال", versesCount: "75 Verses"),
    SuraModel(englishName: "At-Tawbah", arabicName: "التوبة", versesCount: "129 Verses"),
    SuraModel(englishName: "Yunus", arabicName: "يونس", versesCount: "109 Verses"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Suras List",
          style: TextStyle(
            color: AppColors.wihteColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ListView.separated(
          itemCount: suras.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final sura = suras[index];
            return ListTile(
              minVerticalPadding: 0,
              contentPadding: const EdgeInsets.all(0),
              leading: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: SvgPicture.asset(
                      Assets.images.suraStarSvg,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    (index + 1).toString(),
                    style: const TextStyle(
                      color: AppColors.wihteColor,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              title: Text(
                sura.englishName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.wihteColor,
                ),
              ),
              subtitle: Text(
                sura.versesCount,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.wihteColor,
                ),
              ),
              trailing: Text(
                sura.arabicName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.wihteColor,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(
            color: AppColors.wihteColor,
            endIndent: 44,
            indent: 44,
          ),
        ),
      ],
    );
  }
}