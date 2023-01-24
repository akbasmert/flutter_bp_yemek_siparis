import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bp_yemek_siparis/data/entity/yemekler.dart';
import 'package:flutter_bp_yemek_siparis/data/repo/yemeklerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yemekler>> {
  AnasayfaCubit():super(<Yemekler>[]);
  var krepo = YemeklerdaoRepository();

  Future<void> yemekleriYukle() async {
    var liste = await krepo.yemekleriYukle();
    emit(liste);
  }









}