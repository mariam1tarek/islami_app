import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/common/app_colors.dart';
import 'package:islami_app/gen/assets.gen.dart';
import 'package:islami_app/widgets/tab_bg_widget.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedTabIndex = 0;

  final List<Map<String, dynamic>> radioList = [
    {"name": "Radio Ibrahim Al-Akdar", "isPlaying": true},
    {"name": "Radio Al-Qaria Yassen", "isPlaying": false},
    {"name": "Radio Ahmed Al-trabulsi", "isPlaying": true},
    {"name": "Radio Addokali Mohammad Alalim", "isPlaying": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [

        TabBgWidget(imagePath: Assets.images.radioBg.path),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              Assets.images.header.image(height: 45),
              const SizedBox(height: 15),


              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFF141414).withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTabIndex = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedTabIndex == 0
                                ? AppColors.goldColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Radio",
                            style: TextStyle(
                              color: selectedTabIndex == 0
                                  ? Colors.black
                                  : AppColors.wihteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTabIndex = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedTabIndex == 1
                                ? AppColors.goldColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Reciters",
                            style: TextStyle(
                              color: selectedTabIndex == 1
                                  ? Colors.black
                                  : AppColors.wihteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: radioList.length,
                  itemBuilder: (context, index) {
                    final item = radioList[index];
                    bool isPlaying = item["isPlaying"];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppColors.goldColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: isPlaying
                                  ? Positioned.fill(
                                key: const ValueKey('wave'),
                                child: SvgPicture.asset(
                                  Assets.images.soundWave,
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withValues(alpha: 0.5),
                                    BlendMode.srcIn,
                                  ),
                                ),
                              )
                                  : Positioned(
                                key: const ValueKey('mosque'),
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Image.asset(
                                  Assets.images.mosque2.path,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  color: Colors.black.withOpacity(0.18),
                                  colorBlendMode: BlendMode.dstATop,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item["name"],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            radioList[index]["isPlaying"] =
                                            !isPlaying;
                                          });
                                        },
                                        child: Icon(
                                          isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          color: Colors.black,
                                          size: 34,
                                        ),
                                      ),
                                      const SizedBox(width: 30),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            radioList[index]["isPlaying"] =
                                            !isPlaying;
                                          });
                                        },
                                        child: Icon(
                                          isPlaying
                                              ? Icons.volume_up
                                              : Icons.volume_off,
                                          color: Colors.black,
                                          size: 28,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}