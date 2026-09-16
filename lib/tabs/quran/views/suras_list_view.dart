import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/common/app_colors.dart';
import 'package:islami_app/gen/assets.gen.dart';
import 'package:islami_app/models/sura_data.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:islami_app/tabs/quran/views/sura_details_view.dart';

class SurasListView extends StatelessWidget {
  final Function(SuraModel) onSuraSelected;

  SurasListView({super.key, required this.onSuraSelected});

  final List<SuraModel> suras = SuraData.getAllSuras();

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
            return InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SuraDetailsView(sura: sura),
                  ),
                );
                onSuraSelected(sura);
              },
              child: ListTile(
                minVerticalPadding: 0,
                contentPadding: const EdgeInsets.all(0),
                leading: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: SvgPicture.asset(
                        Assets.images.suraStarSvg,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      sura.index.toString(),
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