// import 'package:flutter/material.dart';
// import 'package:nirdesa/app/data/services.dart';
// import 'package:nirdesa/object_class.dart';
// import 'package:nirdesa/services.dart';
// import 'package:nirdesa/suratpage.dart';
// import 'package:search_page/search_page.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String? keren;
//   Future<ListQuran>? listQuran;
//   Languages? selectedMenu;

//   @override
//   void initState() {
//     listQuran = API().listQuran();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'NIRDESA',
//           style: Font.arabicHome(),
//         ),
//         backgroundColor: Colors.green[900],
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search_rounded),
//             onPressed: () async {
//               ListQuran listQuran = await API().listQuran();
//               List<DataQuran> dataQuran = listQuran.data!;
//               // ignore: use_build_context_synchronously
//               showSearch(
//                 context: context,
//                 delegate: SearchPage<DataQuran>(
//                   showItemsOnEmpty: true,
//                   items: dataQuran,
//                   searchLabel: 'Search people',
//                   suggestion: const Center(
//                     child: Text('Filter people by name, surname or age'),
//                   ),
//                   failure: const Center(
//                     child: Text('No dataQuran found :('),
//                   ),
//                   filter: (dataQuran) => [
//                     dataQuran.number.toString(),
//                     dataQuran.asma!.id!.long,
//                     dataQuran.asma!.id!.short,
//                     dataQuran.asma!.en!.long,
//                     dataQuran.asma!.en!.short,
//                   ],
//                   builder: (dataQuran) => TextButton(
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => SuratPage(
//                             dataQuran.number!,
//                             suratEn: dataQuran.asma!.en!.short!,
//                             suratId: dataQuran.asma!.id!.short!,
//                           ),
//                         ),
//                       );
//                     },
//                     child: ListTile(
//                       title: Text(dataQuran.asma!.id!.short!),
//                       subtitle: Text(dataQuran.asma!.ar!.long!),
//                       trailing: Text(dataQuran.number.toString()),
//                     ),
//                   ),
//                 ),
//               );
//             },
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
//               await Storages().setKodeBahasa(item.name);
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
//       body: FutureBuilder(
//         future: listQuran,
//         builder: (context, snapshot) {
//           if (snapshot.hasData && snapshot.data != null) {
//             if (snapshot.data!.data != null) {
//               ListQuran listQuran = snapshot.data!;
//               return ListView(
//                 physics: const BouncingScrollPhysics(),
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.symmetric(
//                       horizontal: 5,
//                       vertical: 3,
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: const [
//                         BoxShadow(
//                           blurRadius: 7,
//                           offset: Offset(2, 4),
//                           color: Color.fromARGB(255, 177, 177, 177),
//                         ),
//                       ],
//                     ),
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 15, vertical: 5),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.green,
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Storages.getkodeBahasa() == 'id' ||
//                                   Storages.getkodeBahasa() == 'su' ||
//                                   Storages.getkodeBahasa() == 'jw' ||
//                                   Storages.getkodeBahasa() == 'ms'
//                               ? Text(
//                                   'Assalamualaikum',
//                                   style: Font.arabicHome(
//                                     color: Colors.white,
//                                   ),
//                                 )
//                               : translateTeks(
//                                   "السلام عليكم",
//                                   textStyle: Font.arabicPage(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                           Storages.getNama().isEmpty
//                               ? teksLanguage(
//                                   langEn: "No Name",
//                                   style: Font.arabicHome(
//                                     fontSize: 30,
//                                     color: Colors.white,
//                                   ),
//                                 )
//                               : Text(
//                                   Storages.getNama(),
//                                   style: Font.arabicHome(
//                                     fontSize: 30,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: listQuran.data!.length,
//                     itemBuilder: (context, index) {
//                       DataQuran dataQuran = snapshot.data!.data![index];
//                       return TextButton(
//                         onPressed: () {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => SuratPage(
//                                 dataQuran.number!,
//                                 suratEn: dataQuran.asma!.en!.short!,
//                                 suratId: dataQuran.asma!.id!.short!,
//                               ),
//                             ),
//                           );
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               CircleAvatar(
//                                 backgroundColor: Colors.green,
//                                 child: Text(
//                                   dataQuran.number!.toString(),
//                                   style: Font.number(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Storages.getkodeBahasa() == 'id' ||
//                                             Storages.getkodeBahasa() == 'jw' ||
//                                             Storages.getkodeBahasa() == 'ms' ||
//                                             Storages.getkodeBahasa() == 'su'
//                                         ? Text(
//                                             dataQuran.asma!.id!.short!,
//                                             style: Font.arabicHome(
//                                               color: Colors.black,
//                                             ),
//                                           )
//                                         : Text(
//                                             dataQuran.asma!.en!.short!,
//                                             style: Font.arabicHome(
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                     teksLanguage(
//                                       langEn: dataQuran.asma!.translation!.en!,
//                                       langId: dataQuran.asma!.translation!.id!,
//                                       style:
//                                           Font.arabicHome(color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Text(
//                                 dataQuran.asma!.ar!.short!,
//                                 style: Font.arabicHome(
//                                     fontSize: 30, color: Colors.black),
//                                 textAlign: TextAlign.right,
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               );
//             } else {
//               return const Center(
//                 child: Text('waiting'),
//               );
//             }
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
