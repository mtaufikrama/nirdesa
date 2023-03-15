import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nirdesa/app/data/object_class.dart';
import 'package:nirdesa/app/data/services.dart';

class ListAyat extends StatefulWidget {
  const ListAyat({super.key, required this.ayahs});
  final Ayahs ayahs;

  @override
  State<ListAyat> createState() => _ListAyatState();
}

class _ListAyatState extends State<ListAyat> {
  bool tafsir = false;
  AudioPlayer player = AudioPlayer();
  bool pause = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Ayahs ayahs = widget.ayahs;
    return GestureDetector(
      onTap: () {
        setState(() {
          tafsir = !tafsir;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.ayahs.number!.insurah!.toString(),
                  style: Font.number(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      loading = true;
                    });
                    try {
                      if (!pause) {
                        await player.play(
                          UrlSource(widget.ayahs.audio!.url!),
                          mode: PlayerMode.mediaPlayer,
                        );
                      } else {
                        await player.pause();
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      pause = !pause;
                      loading = false;
                    });
                  },
                  child: loading == true
                      ? const SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : pause == false
                          ? const Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.pause,
                              color: Colors.white,
                            ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  ayahs.text!.ar!,
                  style: Font.arabicPage(fontSize: 20),
                  textAlign: TextAlign.right,
                ),
                Text(
                  ayahs.text!.read!,
                  style: Font.arabicPage(),
                  textAlign: TextAlign.justify,
                ),
                teksLanguage(
                  langEn: ayahs.translation!.en!,
                  langId: ayahs.translation!.id!,
                  style: Font.arabicPage(),
                  textAlign: TextAlign.justify,
                ),
                AnimatedSizeAndFade(
                  sizeCurve: Curves.easeIn,
                  alignment: Alignment.topCenter,
                  child: tafsir == true
                      ? teksLanguage(
                          langEn: ayahs.tafsir!.en,
                          langId: ayahs.tafsir!.id,
                          style: Font.arabicPage(),
                          textAlign: TextAlign.justify,
                        )
                      : Container(),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
