import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/common/app_colors.dart';
import 'package:islami_app/gen/assets.gen.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:islami_app/widgets/tab_bg_widget.dart';

class SuraDetailsView extends StatefulWidget {
  final SuraModel sura;

  const SuraDetailsView({super.key, required this.sura});

  @override
  State<SuraDetailsView> createState() => _SuraDetailsViewState();
}

class _SuraDetailsViewState extends State<SuraDetailsView> {
  String suraContent = "";

  @override
  void initState() {
    super.initState();
    loadSuraFile();
  }

  Future<void> loadSuraFile() async {
    String filePath = "assets/suras/${widget.sura.index}.txt";
    String fileContent = await rootBundle.loadString(filePath);

    List<String> verses = fileContent.trim().split("\n");
    String formattedAyat = "";
    for (int i = 0; i < verses.length; i++) {
      if (verses[i].trim().isNotEmpty) {
        formattedAyat += "${verses[i].trim()} [${i + 1}] ";
      }
    }

    setState(() {
      suraContent = formattedAyat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. الصورة الخلفية تغطي الشاشة بالكامل بما فيها مكان الـ AppBar
          TabBgWidget(imagePath: Assets.images.ayaBg.path),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // 2. تصميم شريط العلوي (AppBar بديل) جوه الـ Stack عشان الصورة تحته
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: AppColors.goldColor),
                        onPressed: () => Navigator.pop(context, widget.sura),
                      ),
                      Text(
                        widget.sura.englishName,
                        style: const TextStyle(
                          color: AppColors.goldColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 48), // مساحة عشان الاسم يبقى في المنتصف مظبوط
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.sura.arabicName,
                    style: const TextStyle(
                      color: AppColors.goldColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 3. محتوى الآيات
                  Expanded(
                    child: suraContent.isEmpty
                        ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.goldColor,
                      ),
                    )
                        : SingleChildScrollView(
                      child: Text(
                        suraContent,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.goldColor,
                          fontSize: 22,
                          height: 2.0,
                          fontWeight: FontWeight.bold,
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
    );
  }
}