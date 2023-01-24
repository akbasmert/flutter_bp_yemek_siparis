import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bp_yemek_siparis/data/entity/sepet_yemekler.dart';

import '../../data/repo/yemeklerdao_repository.dart';

class YemekSepetCubit extends Cubit<List<SepetYemekler>> {
  YemekSepetCubit() :super(<SepetYemekler>[]);
  var krepo = YemeklerdaoRepository();

  Future<void> sepetiYukle(String aramaKelimesi) async {
    var liste = await krepo.sepetiGetir(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int sepet_yemek_id, String kullanici_adi) async {
    await krepo.sil(sepet_yemek_id, kullanici_adi);
    await sepetiYukle("merttt");
  }
}