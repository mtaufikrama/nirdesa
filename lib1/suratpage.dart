// // ignore_for_file: must_be_immutable
// import 'package:flutter/material.dart';
// import 'package:nirdesa/app/data/object_class.dart';
// import 'package:nirdesa/app/data/services.dart';
// import 'package:nirdesa/app/modules/surah/views/listayat.dart';
// import 'package:scroll_to_index/scroll_to_index.dart';

// class SuratPage extends StatefulWidget {
//   SuratPage(
//     this.id, {
//     super.key,
//     required this.suratEn,
//     required this.suratId,
//   });
//   int id;
//   String suratEn;
//   String suratId;

//   @override
//   State<SuratPage> createState() => _SuratPageState();
// }

// enum Languages { id, en, su, jw, ms }

// class _SuratPageState extends State<SuratPage> {
//   Languages? selectedMenu;
//   QuranSurah? quranSurah;
//   static final AutoScrollController _autoScrollController =
//       AutoScrollController();

//   @override
//   void initState() {
//     API.quranBySurah(widget.id).then((value) async {
//       setState(() {
//         quranSurah = value;
//       });
//       await _autoScrollController.scrollToIndex(
//         widget.id,
//         preferPosition: AutoScrollPosition.begin,
//         duration: const Duration(seconds: 1),
//       );
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.green[900],
//         title: teksLanguage(
//           langEn: widget.suratEn,
//           langId: widget.suratId,
//           style: Font.arabicPage(),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () async {
//               await _autoScrollController.scrollToIndex(
//                 widget.id,
//                 preferPosition: AutoScrollPosition.middle,
//                 duration: const Duration(seconds: 1),
//               );
//             },
//             icon: const Icon(
//               Icons.add,
//               size: 24.0,
//             ),
//           ),
//           PopupMenuButton<Languages>(
//             initialValue: selectedMenu,
//             icon: const Tooltip(
//               message: 'Ubah Bahasa',
//               child: Icon(
//                 Icons.language_rounded,
//                 color: Colors.white,
//               ),
//             ),
//             onSelected: (Languages item) async {
//               await Storages.setKodeBahasa(item.name);
//               selectedMenu = item;
//               setState(() {});
//             },
//             itemBuilder: (BuildContext context) => <PopupMenuEntry<Languages>>[
//               PopupMenuItem<Languages>(
//                 value: Languages.id,
//                 child: Text(
//                   'Bahasa Indonesia',
//                   style: Font.arabicPage(),
//                 ),
//               ),
//               PopupMenuItem<Languages>(
//                 value: Languages.en,
//                 child: Text(
//                   'Bahasa Inggris',
//                   style: Font.arabicPage(),
//                 ),
//               ),
//               PopupMenuItem<Languages>(
//                 value: Languages.jw,
//                 child: Text(
//                   'Bahasa Jawa',
//                   style: Font.arabicPage(),
//                 ),
//               ),
//               PopupMenuItem<Languages>(
//                 value: Languages.su,
//                 child: Text(
//                   'Bahasa Sunda',
//                   style: Font.arabicPage(),
//                 ),
//               ),
//               PopupMenuItem<Languages>(
//                 value: Languages.ms,
//                 child: Text(
//                   'Bahasa Melayu',
//                   style: Font.arabicPage(),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: quranSurah != null
//           ? ListView.builder(
//               shrinkWrap: true,
//               physics: const BouncingScrollPhysics(),
//               controller: _autoScrollController,
//               itemCount: quranSurah!.data!.ayahs!.length,
//               itemBuilder: (context, index) {
//                 Ayahs ayahs = quranSurah!.data!.ayahs![index];
//                 return AutoScrollTag(
//                   key: ValueKey<int>(index),
//                   controller: _autoScrollController,
//                   index: index,
//                   child: ListAyat(ayahs: ayahs),
//                 );
//               },
//             )
//           : const Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }
// }
