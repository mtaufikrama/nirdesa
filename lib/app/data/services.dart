import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:nirdesa/app/data/object_class.dart';
import 'package:translator/translator.dart';

class Font {
  static TextStyle arabicHome(
          {double? fontSize, Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.reemKufi(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      );
  static TextStyle number(
          {double? fontSize, Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.blackOpsOne(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      );

  static TextStyle arabicPage(
          {double? fontSize, Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.scheherazadeNew(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      );
}

class API {
  static Future<ListQuran> listQuran({int? imamId}) async {
    final response = await http.get(Uri.parse(
        'https://quran-endpoint.vercel.app/quran?imamId=${(imamId ?? 1).toString()}'));
    return ListQuran.fromJson(jsonDecode(response.body));
  }

  static Future<QuranSurah> quranBySurah(int surah, {int? imamId}) async {
    final response = await http.get(Uri.parse(
        'https://quran-endpoint.vercel.app/quran/$surah?imamId=${(imamId ?? 1).toString()}'));
    return QuranSurah.fromJson(jsonDecode(response.body));
  }

  static Future<QuranAyat> quranByAyat(int surah, int ayat,
      {int? imamId}) async {
    final response = await http.get(Uri.parse(
        'https://quran-endpoint.vercel.app/quran/$surah/$ayat?imamId=${(imamId ?? 1).toString()}'));
    return QuranAyat.fromJson(jsonDecode(response.body));
  }

  static Future<ListImam> listImam() async {
    final response =
        await http.get(Uri.parse('https://quran-endpoint.vercel.app/imam'));
    return ListImam.fromJson(jsonDecode(response.body));
  }

  static Future<Bible> bible(String bookName, int chapter, int verse,
      {String? translation}) async {
    Uri urlBible = Uri.https(
      'bible-api.com',
      '$bookName $chapter:$verse',
      {
        'translation': translation ?? 'web',
      },
    );

    final response = await http.get(urlBible);
    return Bible.fromJson(jsonDecode(response.body));
  }
}

enum Languages { id, en, su, jw, ms }

class Storages {
  static final LocalStorage _storages = LocalStorage('Kitabku');

  static Future<void> setKodeBahasa(String kodeBahasa) async {
    await _storages.deleteItem('kodeBahasa');
    await _storages.setItem('kodeBahasa', kodeBahasa);
  }

  static Future<void> setNama(String nama) async {
    await _storages.deleteItem('nama');
    await _storages.setItem('nama', nama);
  }

  static String get getkodeBahasa => _storages.getItem('kodeBahasa') ?? 'id';
  static String get getNama => _storages.getItem('nama') ?? '';
}

Future<String> translates(String text, {String? to}) async {
  String translate;
  try {
    var translates = await GoogleTranslator()
        .translate(text, to: to ?? Storages.getkodeBahasa);
    translate = translates.text;
  } catch (e) {
    translate = text;
  }
  return translate;
}

Widget teksLanguage({
  String? langEn,
  String? langId,
  required TextStyle style,
  TextAlign? textAlign,
}) {
  String kodeBahasa = Storages.getkodeBahasa;
  return kodeBahasa == 'id' && langId != null
      ? Text(
          langId,
          style: style,
          textAlign: textAlign,
        )
      : kodeBahasa == 'en' && langEn != null
          ? Text(
              langEn,
              style: style,
              textAlign: textAlign,
            )
          : translateTeks(
              langId ?? langEn ?? "Terjadi Kesalahan",
              textStyle: style,
              textAlign: textAlign,
            );
}

FutureBuilder<String> translateTeks(
  String text, {
  required TextStyle textStyle,
  TextAlign? textAlign,
}) {
  return FutureBuilder<String>(
    future: translates(text),
    builder: (context, snapshot) {
      if (snapshot.hasData && snapshot.data != null) {
        return Text(
          snapshot.data!,
          style: textStyle,
          textAlign: textAlign,
        );
      } else {
        return Text(
          text,
          style: textStyle,
          textAlign: textAlign,
        );
      }
    },
  );
}
