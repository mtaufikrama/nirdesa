class ListQuran {
  int? status;
  String? message;
  List<DataQuran>? data;

  ListQuran({this.status, this.message, this.data});

  ListQuran.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataQuran>[];
      json['data'].forEach((v) {
        data!.add(DataQuran.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataQuran {
  int? number;
  int? ayahCount;
  int? sequence;
  Asma? asma;
  PreBismillah? preBismillah;
  Type? type;
  Tafsir? tafsir;
  Recitation? recitation;

  DataQuran(
      {this.number,
      this.ayahCount,
      this.sequence,
      this.asma,
      this.preBismillah,
      this.type,
      this.tafsir,
      this.recitation});

  DataQuran.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    ayahCount = json['ayahCount'];
    sequence = json['sequence'];
    asma = json['asma'] != null ? Asma.fromJson(json['asma']) : null;
    preBismillah = json['preBismillah'] != null
        ? PreBismillah.fromJson(json['preBismillah'])
        : null;
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    tafsir = json['tafsir'] != null ? Tafsir.fromJson(json['tafsir']) : null;
    recitation = json['recitation'] != null
        ? Recitation.fromJson(json['recitation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['ayahCount'] = ayahCount;
    data['sequence'] = sequence;
    if (asma != null) {
      data['asma'] = asma!.toJson();
    }
    if (preBismillah != null) {
      data['preBismillah'] = preBismillah!.toJson();
    }
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (tafsir != null) {
      data['tafsir'] = tafsir!.toJson();
    }
    if (recitation != null) {
      data['recitation'] = recitation!.toJson();
    }
    return data;
  }
}

class Asma {
  Ar? ar;
  Ar? en;
  Ar? id;
  Translation? translation;

  Asma({this.ar, this.en, this.id, this.translation});

  Asma.fromJson(Map<String, dynamic> json) {
    ar = json['ar'] != null ? Ar.fromJson(json['ar']) : null;
    en = json['en'] != null ? Ar.fromJson(json['en']) : null;
    id = json['id'] != null ? Ar.fromJson(json['id']) : null;
    translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ar != null) {
      data['ar'] = ar!.toJson();
    }
    if (en != null) {
      data['en'] = en!.toJson();
    }
    if (id != null) {
      data['id'] = id!.toJson();
    }
    if (translation != null) {
      data['translation'] = translation!.toJson();
    }
    return data;
  }
}

class Ar {
  String? short;
  String? long;

  Ar({this.short, this.long});

  Ar.fromJson(Map<String, dynamic> json) {
    short = json['short'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['short'] = short;
    data['long'] = long;
    return data;
  }
}

class Translation {
  String? en;
  String? id;

  Translation({this.en, this.id});

  Translation.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['id'] = id;
    return data;
  }
}

class PreBismillah {
  Teks? text;
  Translation? translation;

  PreBismillah({this.text, this.translation});

  PreBismillah.fromJson(Map<String, dynamic> json) {
    text = json['text'] != null ? Teks.fromJson(json['text']) : null;
    translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (text != null) {
      data['text'] = text!.toJson();
    }
    if (translation != null) {
      data['translation'] = translation!.toJson();
    }
    return data;
  }
}

class Teks {
  String? ar;
  String? read;

  Teks({this.ar, this.read});

  Teks.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    read = json['read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ar'] = ar;
    data['read'] = read;
    return data;
  }
}

class Type {
  String? ar;
  String? id;
  String? en;

  Type({this.ar, this.id, this.en});

  Type.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    id = json['id'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ar'] = ar;
    data['id'] = id;
    data['en'] = en;
    return data;
  }
}

class Tafsir {
  String? id;
  Null? en;

  Tafsir({this.id, this.en});

  Tafsir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['en'] = en;
    return data;
  }
}

class Recitation {
  String? full;

  Recitation({this.full});

  Recitation.fromJson(Map<String, dynamic> json) {
    full = json['full'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full'] = full;
    return data;
  }
}

class QuranSurah {
  int? status;
  String? message;
  Data? data;

  QuranSurah({this.status, this.message, this.data});

  QuranSurah.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? number;
  int? ayahCount;
  int? sequence;
  Asma? asma;
  PreBismillah? preBismillah;
  Type? type;
  Tafsir? tafsir;
  Recitation? recitation;
  List<Ayahs>? ayahs;

  Data(
      {this.number,
      this.ayahCount,
      this.sequence,
      this.asma,
      this.preBismillah,
      this.type,
      this.tafsir,
      this.recitation,
      this.ayahs});

  Data.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    ayahCount = json['ayahCount'];
    sequence = json['sequence'];
    asma = json['asma'] != null ? Asma.fromJson(json['asma']) : null;
    preBismillah = json['preBismillah'] != null
        ? PreBismillah.fromJson(json['preBismillah'])
        : null;
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    tafsir = json['tafsir'] != null ? Tafsir.fromJson(json['tafsir']) : null;
    recitation = json['recitation'] != null
        ? Recitation.fromJson(json['recitation'])
        : null;
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs!.add(Ayahs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['ayahCount'] = ayahCount;
    data['sequence'] = sequence;
    if (asma != null) {
      data['asma'] = asma!.toJson();
    }
    if (preBismillah != null) {
      data['preBismillah'] = preBismillah!.toJson();
    }
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (tafsir != null) {
      data['tafsir'] = tafsir!.toJson();
    }
    if (recitation != null) {
      data['recitation'] = recitation!.toJson();
    }
    if (ayahs != null) {
      data['ayahs'] = ayahs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ayahs {
  Number? number;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  Sajda? sajda;
  Teks? text;
  Translation? translation;
  Tafsir? tafsir;
  Audio? audio;

  Ayahs(
      {this.number,
      this.juz,
      this.manzil,
      this.page,
      this.ruku,
      this.hizbQuarter,
      this.sajda,
      this.text,
      this.translation,
      this.tafsir,
      this.audio});

  Ayahs.fromJson(Map<String, dynamic> json) {
    number = json['number'] != null ? Number.fromJson(json['number']) : null;
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'] != null ? Sajda.fromJson(json['sajda']) : null;
    text = json['text'] != null ? Teks.fromJson(json['text']) : null;
    translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    tafsir = json['tafsir'] != null ? Tafsir.fromJson(json['tafsir']) : null;
    audio = json['audio'] != null ? Audio.fromJson(json['audio']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (number != null) {
      data['number'] = number!.toJson();
    }
    data['juz'] = juz;
    data['manzil'] = manzil;
    data['page'] = page;
    data['ruku'] = ruku;
    data['hizbQuarter'] = hizbQuarter;
    if (sajda != null) {
      data['sajda'] = sajda!.toJson();
    }
    if (text != null) {
      data['text'] = text!.toJson();
    }
    if (translation != null) {
      data['translation'] = translation!.toJson();
    }
    if (tafsir != null) {
      data['tafsir'] = tafsir!.toJson();
    }
    if (audio != null) {
      data['audio'] = audio!.toJson();
    }
    return data;
  }
}

class Number {
  int? inquran;
  int? insurah;

  Number({this.inquran, this.insurah});

  Number.fromJson(Map<String, dynamic> json) {
    inquran = json['inquran'];
    insurah = json['insurah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['inquran'] = inquran;
    data['insurah'] = insurah;
    return data;
  }
}

class Sajda {
  bool? recommended;
  bool? obligatory;

  Sajda({this.recommended, this.obligatory});

  Sajda.fromJson(Map<String, dynamic> json) {
    recommended = json['recommended'];
    obligatory = json['obligatory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recommended'] = recommended;
    data['obligatory'] = obligatory;
    return data;
  }
}

class Audio {
  String? url;

  Audio({this.url});

  Audio.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}

class QuranAyat {
  int? status;
  String? message;
  DataAyat? data;

  QuranAyat({this.status, this.message, this.data});

  QuranAyat.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataAyat.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataAyat {
  Surah? surah;
  Ayah? ayah;

  DataAyat({this.surah, this.ayah});

  DataAyat.fromJson(Map<String, dynamic> json) {
    surah = json['surah'] != null ? Surah.fromJson(json['surah']) : null;
    ayah = json['ayah'] != null ? Ayah.fromJson(json['ayah']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (surah != null) {
      data['surah'] = surah!.toJson();
    }
    if (ayah != null) {
      data['ayah'] = ayah!.toJson();
    }
    return data;
  }
}

class Surah {
  Ar? ar;
  Ar? en;
  Ar? id;
  Translation? translation;

  Surah({this.ar, this.en, this.id, this.translation});

  Surah.fromJson(Map<String, dynamic> json) {
    ar = json['ar'] != null ? Ar.fromJson(json['ar']) : null;
    en = json['en'] != null ? Ar.fromJson(json['en']) : null;
    id = json['id'] != null ? Ar.fromJson(json['id']) : null;
    translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ar != null) {
      data['ar'] = ar!.toJson();
    }
    if (en != null) {
      data['en'] = en!.toJson();
    }
    if (id != null) {
      data['id'] = id!.toJson();
    }
    if (translation != null) {
      data['translation'] = translation!.toJson();
    }
    return data;
  }
}

class Ayah {
  Number? number;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  Sajda? sajda;
  Teks? text;
  Translation? translation;
  Tafsir? tafsir;
  Audio? audio;

  Ayah(
      {this.number,
      this.juz,
      this.manzil,
      this.page,
      this.ruku,
      this.hizbQuarter,
      this.sajda,
      this.text,
      this.translation,
      this.tafsir,
      this.audio});

  Ayah.fromJson(Map<String, dynamic> json) {
    number = json['number'] != null ? Number.fromJson(json['number']) : null;
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'] != null ? Sajda.fromJson(json['sajda']) : null;
    text = json['text'] != null ? Teks.fromJson(json['text']) : null;
    translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    tafsir = json['tafsir'] != null ? Tafsir.fromJson(json['tafsir']) : null;
    audio = json['audio'] != null ? Audio.fromJson(json['audio']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (number != null) {
      data['number'] = number!.toJson();
    }
    data['juz'] = juz;
    data['manzil'] = manzil;
    data['page'] = page;
    data['ruku'] = ruku;
    data['hizbQuarter'] = hizbQuarter;
    if (sajda != null) {
      data['sajda'] = sajda!.toJson();
    }
    if (text != null) {
      data['text'] = text!.toJson();
    }
    if (translation != null) {
      data['translation'] = translation!.toJson();
    }
    if (tafsir != null) {
      data['tafsir'] = tafsir!.toJson();
    }
    if (audio != null) {
      data['audio'] = audio!.toJson();
    }
    return data;
  }
}

class ListImam {
  int? status;
  String? message;
  List<DataImam>? data;

  ListImam({this.status, this.message, this.data});

  ListImam.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataImam>[];
      json['data'].forEach((v) {
        data!.add(DataImam.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataImam {
  int? id;
  String? name;

  DataImam({this.id, this.name});

  DataImam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Bible {
  String? reference;
  List<Verses>? verses;
  String? text;
  String? translationId;
  String? translationName;
  String? translationNote;

  Bible(
      {this.reference,
      this.verses,
      this.text,
      this.translationId,
      this.translationName,
      this.translationNote});

  Bible.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) {
        verses!.add(Verses.fromJson(v));
      });
    }
    text = json['text'];
    translationId = json['translation_id'];
    translationName = json['translation_name'];
    translationNote = json['translation_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reference'] = reference;
    if (verses != null) {
      data['verses'] = verses!.map((v) => v.toJson()).toList();
    }
    data['text'] = text;
    data['translation_id'] = translationId;
    data['translation_name'] = translationName;
    data['translation_note'] = translationNote;
    return data;
  }
}

class Verses {
  String? bookId;
  String? bookName;
  int? chapter;
  int? verse;
  String? text;

  Verses({this.bookId, this.bookName, this.chapter, this.verse, this.text});

  Verses.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    bookName = json['book_name'];
    chapter = json['chapter'];
    verse = json['verse'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['book_id'] = bookId;
    data['book_name'] = bookName;
    data['chapter'] = chapter;
    data['verse'] = verse;
    data['text'] = text;
    return data;
  }
}
