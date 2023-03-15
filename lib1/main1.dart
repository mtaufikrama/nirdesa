// import 'package:flutter/material.dart';
// import 'package:nirdesa/homepage.dart';
// import 'package:nirdesa/services.dart';

// void main() async {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Nirdesa',
//       home: FutureBuilder<bool>(
//         future: Storages.storages.ready,
//         builder: (
//           BuildContext context,
//           AsyncSnapshot<bool> snapshotLocalStorage,
//         ) {
//           if (snapshotLocalStorage.data == true) {
//             return const HomePage();
//           } else {
//             return Container(
//               color: Colors.white,
//             );
//           }
//         },
//       ),
//     );
//   }
// }
