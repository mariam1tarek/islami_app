import 'package:flutter/material.dart';
import 'package:islami_app/common/app_colors.dart';
import 'package:islami_app/gen/assets.gen.dart';
import 'package:islami_app/models/sura_model.dart';



class MostRecentlyView extends StatefulWidget {
  const MostRecentlyView({super.key});

  @override
  State<MostRecentlyView> createState() => _MostRecentlyViewState();
}

class _MostRecentlyViewState extends State<MostRecentlyView> {
  final List<SuraModel> recentSuras = [
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

  void addRecentlyOpenedSura(SuraModel sura) {
    setState(() {
      recentSuras.removeWhere((item) => item.englishName == sura.englishName);
      recentSuras.insert(0, sura);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Most Recently",
          style: TextStyle(
            color: AppColors.wihteColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recentSuras.length,
            itemBuilder: (context, index) {
              final sura = recentSuras[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                color: AppColors.goldColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            sura.englishName,
                            style: const TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            sura.arabicName,
                            style: const TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            sura.versesCount,
                            style: const TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        Assets.images.suraImg.path,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
