import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bp_yemek_siparis/data/repo/yemeklerdao_repository.dart';

class YemekDetayCubit extends Cubit<void>{
  YemekDetayCubit():super(0);

  var krepo = YemeklerdaoRepository();

Future<void> sepeteEkle(String yemek_adi,
    String yemek_resim_adi,
    String yemek_fiyat,
    String yemek_siparis_adet,
    String kullanici_adi ) async {
  await krepo.sepeteEkle(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);
}
}