class RecitationsModel {
  List<Recitations> recitations;

  RecitationsModel({this.recitations});

  RecitationsModel.fromJson(Map<String, dynamic> json) {
    if (json['recitations'] != null) {
      recitations = new List<Recitations>();
      json['recitations'].forEach((v) {
        recitations.add(new Recitations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recitations != null) {
      data['recitations'] = this.recitations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recitations {
  int id;
  String style;
  String reciterNameEng;
  String reciterNameTranslated;

  Recitations(
      {this.id, this.style, this.reciterNameEng, this.reciterNameTranslated});

  Recitations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    style = json['style']??'';
    reciterNameEng = json['reciter_name_eng'];
    reciterNameTranslated = json['reciter_name_translated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['style'] = this.style??'';
    data['reciter_name_eng'] = this.reciterNameEng;
    data['reciter_name_translated'] = this.reciterNameTranslated;
    return data;
  }
}
