import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nirdesa/app/data/object_class.dart';
import 'package:nirdesa/app/data/services.dart';
import 'package:nirdesa/app/modules/surah/views/listayat.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../controllers/surah_controller.dart';

class SurahView extends GetView<SurahController> {
  const SurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green[900],
          title: teksLanguage(
            langEn: Get.arguments['suratEn'],
            langId: Get.arguments['suratId'],
            style: Font.arabicPage(),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await controller.autoScrollController.scrollToIndex(
                  int.parse(Get.parameters['id']!),
                  preferPosition: AutoScrollPosition.middle,
                  duration: const Duration(seconds: 1),
                );
              },
              icon: const Icon(
                Icons.add,
                size: 24.0,
              ),
            ),
            PopupMenuButton<Languages>(
              initialValue: controller.selectedMenu.value,
              icon: const Tooltip(
                message: 'Ubah Bahasa',
                child: Icon(
                  Icons.language_rounded,
                  color: Colors.white,
                ),
              ),
              onSelected: (Languages item) async {
                await Storages.setKodeBahasa(item.name);
                controller.selectedMenu.value = item;
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<Languages>>[
                PopupMenuItem<Languages>(
                  value: Languages.id,
                  child: Text(
                    'Bahasa Indonesia',
                    style: Font.arabicPage(),
                  ),
                ),
                PopupMenuItem<Languages>(
                  value: Languages.en,
                  child: Text(
                    'Bahasa Inggris',
                    style: Font.arabicPage(),
                  ),
                ),
                PopupMenuItem<Languages>(
                  value: Languages.jw,
                  child: Text(
                    'Bahasa Jawa',
                    style: Font.arabicPage(),
                  ),
                ),
                PopupMenuItem<Languages>(
                  value: Languages.su,
                  child: Text(
                    'Bahasa Sunda',
                    style: Font.arabicPage(),
                  ),
                ),
                PopupMenuItem<Languages>(
                  value: Languages.ms,
                  child: Text(
                    'Bahasa Melayu',
                    style: Font.arabicPage(),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: FutureBuilder<QuranSurah>(
          future: API.quranBySurah(int.parse(Get.parameters['id']!)),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState != ConnectionState.waiting &&
                snapshot.data != null) {
              QuranSurah quranSurah = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                controller: controller.autoScrollController,
                itemCount: quranSurah.data!.ayahs!.length,
                itemBuilder: (context, index) {
                  Ayahs ayahs = quranSurah.data!.ayahs![index];
                  return AutoScrollTag(
                    key: ValueKey<int>(index),
                    controller: controller.autoScrollController,
                    index: index,
                    child: ListAyat(ayahs: ayahs),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
