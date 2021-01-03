class VersesModel {
  List<Verses> verses;
  Meta meta;

  VersesModel({this.verses, this.meta});

  VersesModel.fromJson(Map<String, dynamic> json) {
    if (json['verses'] != null) {
      verses = new List<Verses>();
      json['verses'].forEach((v) { verses.add(new Verses.fromJson(v)); });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.verses != null) {
      data['verses'] = this.verses.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class Verses {
  int id;
  int verseNumber;
  int chapterId;
  String verseKey;
  String textMadani;
  String textIndopak;
  String textSimple;
  int juzNumber;
  int hizbNumber;
  int rubNumber;
  String sajdah;
  int sajdahNumber;
  int pageNumber;
  Audio audio;
  List<MediaContents> mediaContents;
  List<Words> words;

  Verses({this.id, this.verseNumber, this.chapterId, this.verseKey, this.textMadani, this.textIndopak, this.textSimple, this.juzNumber, this.hizbNumber, this.rubNumber, this.sajdah, this.sajdahNumber, this.pageNumber, this.audio, this.mediaContents, this.words});

  Verses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    verseNumber = json['verse_number']!=null?json['verse_number']:1;
    chapterId = json['chapter_id']!=null?json['chapter_id']:1;
    verseKey = json['verse_key']!=null?json['verse_key']:"";
    textMadani = json['text_madani']!=null?json['text_madani']:"";
    textIndopak = json['text_indopak']!=null?json['text_indopak']:"";
    textSimple = json['text_simple']!=null?json['text_simple']:"";
    juzNumber = json['juz_number']!=null?json['juz_number']:1;
    hizbNumber = json['hizb_number']!=null?json['hizb_number']:1;
    rubNumber = json['rub_number']!=null?json['rub_number']:1;
    sajdah = json['sajdah']!=null?json['sajdah']:'';
    sajdahNumber = json['sajdah_number']!=null?json['sajdah_number']:0;
    pageNumber = json['page_number']!=null?json['page_number']:1;
    audio = json['audio'] != null ? new Audio.fromJson(json['audio']) : null;
    if (json['media_contents'] != null) {
      mediaContents = new List<MediaContents>();
      json['media_contents'].forEach((v) { mediaContents.add(new MediaContents.fromJson(v)); });
    }
    if (json['words'] != null) {
      words = new List<Words>();
      json['words'].forEach((v) { words.add(new Words.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['verse_number'] = this.verseNumber;
    data['chapter_id'] = this.chapterId;
    data['verse_key'] = this.verseKey;
    data['text_madani'] = this.textMadani;
    data['text_indopak'] = this.textIndopak;
    data['text_simple'] = this.textSimple;
    data['juz_number'] = this.juzNumber;
    data['hizb_number'] = this.hizbNumber;
    data['rub_number'] = this.rubNumber;
    data['sajdah'] = this.sajdah;
    data['sajdah_number'] = this.sajdahNumber;
    data['page_number'] = this.pageNumber;
    if (this.audio != null) {
      data['audio'] = this.audio.toJson();
    }
    if (this.mediaContents != null) {
      data['media_contents'] = this.mediaContents.map((v) => v.toJson()).toList();
    }
    if (this.words != null) {
      data['words'] = this.words.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Audio {
  String url;
  int duration;
  List<String> segments;
  String format;

  Audio({this.url, this.duration, this.segments, this.format});

  Audio.fromJson(Map<String, dynamic> json) {
    url = json['url']!=null?json['url']:'';
    duration = json['duration']!=null?json['duration']:0;

    format = json['format']!=null?json['format']:'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['duration'] = this.duration;

    data['format'] = this.format;
    return data;
  }
}

class Segments {


  Segments();

Segments.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}

class MediaContents {
  String url;
  String embedText;
  String provider;
  String authorName;

  MediaContents({this.url, this.embedText, this.provider, this.authorName});

  MediaContents.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    embedText = json['embed_text'];
    provider = json['provider'];
    authorName = json['author_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['embed_text'] = this.embedText;
    data['provider'] = this.provider;
    data['author_name'] = this.authorName;
    return data;
  }
}

class Words {
  int id;
  int position;
  String textMadani;
  String textIndopak;
  String textSimple;
  String verseKey;
  String className;
  int lineNumber;
  int pageNumber;
  String code;
  String codeV3;
  String charType;
  Audio audio;
  Translation translation;
  Translation transliteration;

  Words({this.id, this.position, this.textMadani, this.textIndopak, this.textSimple, this.verseKey, this.className, this.lineNumber, this.pageNumber, this.code, this.codeV3, this.charType, this.audio, this.translation, this.transliteration});

  Words.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
    textMadani = json['text_madani'];
    textIndopak = json['text_indopak']!=null?json['text_indopak']:'';
    textSimple = json['text_simple'];
    verseKey = json['verse_key'];
    className = json['class_name'];
    lineNumber = json['line_number'];
    pageNumber = json['page_number'];
    code = json['code'];
    codeV3 = json['code_v3'];
    charType = json['char_type'];
    audio = json['audio'] != null ? new Audio.fromJson(json['audio']) : null;
    translation = json['translation'] != null ? new Translation.fromJson(json['translation']) : null;
    transliteration = json['transliteration'] != null ? new Translation.fromJson(json['transliteration']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['position'] = this.position;
    data['text_madani'] = this.textMadani;
    data['text_indopak'] = this.textIndopak;
    data['text_simple'] = this.textSimple;
    data['verse_key'] = this.verseKey;
    data['class_name'] = this.className;
    data['line_number'] = this.lineNumber;
    data['page_number'] = this.pageNumber;
    data['code'] = this.code;
    data['code_v3'] = this.codeV3;
    data['char_type'] = this.charType;
    if (this.audio != null) {
      data['audio'] = this.audio.toJson();
    }
    if (this.translation != null) {
      data['translation'] = this.translation.toJson();
    }
    if (this.transliteration != null) {
      data['transliteration'] = this.transliteration.toJson();
    }
    return data;
  }
}


class Translation {
  int id;
  String languageName;
  String text;
  String resourceName;
  int resourceId;

  Translation({this.id, this.languageName, this.text, this.resourceName, this.resourceId});

  Translation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    languageName = json['language_name'];
    text = json['text'];
    resourceName = json['resource_name']!=null?json['resource_name']:'';
    resourceId = json['resource_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['language_name'] = this.languageName;
    data['text'] = this.text;
    data['resource_name'] = this.resourceName;
    data['resource_id'] = this.resourceId;
    return data;
  }
}

class Meta {
  int currentPage;
  int nextPage;
  int prevPage;
  int totalPages;
  int totalCount;

  Meta({this.currentPage, this.nextPage, this.prevPage, this.totalPages, this.totalCount});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    nextPage = json['next_page']!=null?json['next_page']:1;
    prevPage = json['prev_page']!=null?json['prev_page']:0;
    totalPages = json['total_pages'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['next_page'] = this.nextPage;
    data['prev_page'] = this.prevPage;
    data['total_pages'] = this.totalPages;
    data['total_count'] = this.totalCount;
    return data;
  }
}

