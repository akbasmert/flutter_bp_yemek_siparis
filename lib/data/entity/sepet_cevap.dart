import 'package:flutter_bp_yemek_siparis/data/entity/sepet_yemekler.dart';

class SepetCevap{
  List<SepetYemekler> sepetYemekler;
  int succes;

  SepetCevap({required this.sepetYemekler,required this.succes});

factory SepetCevap.fromJson(Map<String,dynamic>json){
  var jsonArray = json["sepet_yemekler"] as List;
  var sepetYemekler = jsonArray.map((jsonArrayNesnesi) => SepetYemekler.fromJson(jsonArrayNesnesi)).toList();

  return SepetCevap(
      sepetYemekler: sepetYemekler,
      succes: json["success"] as int
  );
}
}