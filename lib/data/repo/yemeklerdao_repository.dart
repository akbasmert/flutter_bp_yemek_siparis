import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bp_yemek_siparis/data/entity/sepet_cevap.dart';
import 'package:flutter_bp_yemek_siparis/data/entity/sepet_yemekler.dart';
import 'package:flutter_bp_yemek_siparis/data/entity/yemekler_cevap.dart';

import '../entity/yemekler.dart';

class YemeklerdaoRepository {
  List<Yemekler> parseYemeklerCevap(String cevap) {
    return YemeklerCevap.fromJson(json.decode(cevap)).yemekler;
  }

  List<SepetYemekler> parseSepetCevap(String cevap) {
    return SepetCevap.fromJson(json.decode(cevap)).sepetYemekler;
  }

  Future<void> sepeteEkle(String yemek_adi,
      String yemek_resim_adi,
      String yemek_fiyat,
      String yemek_siparis_adet,
      String kullanici_adi) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";
    var veri = {"yemek_adi": yemek_adi, "yemek_resim_adi": yemek_resim_adi,
      "yemek_fiyat": yemek_fiyat, "yemek_siparis_adet":yemek_siparis_adet,
    "kullanici_adi":kullanici_adi};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    print("sepete eklendi: ${cevap.data.toString()}");
  }


  Future<List<Yemekler>> yemekleriYukle() async {
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var cevap = await Dio().get(url);
    return parseYemeklerCevap(cevap.data.toString());
  }

  Future<List<SepetYemekler>> sepetiGetir(String aramaKelimesi) async{
    var url = "http://kasimadalan.pe.hu/yemekler/tumSepettekiYemekleriGetir.php";
    var veri = {"kullanici_adi":aramaKelimesi};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    return parseSepetCevap(cevap.data.toString());
  }

Future<void> sil(int sepet_yemek_id, String kullanici_adi) async {

    var url = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";
    var veri = {"sepet_yemek_id":sepet_yemek_id,  "kullanici_adi":kullanici_adi};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    print("${sepet_yemek_id} yemek silindi: ${cevap.data.toString()}");
}
}