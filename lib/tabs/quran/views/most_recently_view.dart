import 'package:flutter/material.dart';
import 'package:islami_app/common/app_colors.dart';
import 'package:islami_app/gen/assets.gen.dart';
import 'package:islami_app/models/sura_model.dart';

class MostRecentlyView extends StatelessWidget {
  final List<SuraModel> recentSuras;

  const MostRecentlyView({super.key, required this.recentSuras});

  @override
  Widget build(BuildContext context) {
    if (recentSuras.isEmpty) {
      return const SizedBox.shrink();
    }

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