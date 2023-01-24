import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bp_yemek_siparis/ui/screen/yemek_detay.dart';
import 'package:flutter_bp_yemek_siparis/ui/screen/yemek_sepet.dart';

import '../../data/entity/yemekler.dart';
import '../cubit/anasayfa_cubit.dart';

class Anasayfa2 extends StatefulWidget {
  const Anasayfa2({Key? key}) : super(key: key);

  @override
  State<Anasayfa2> createState() => _Anasayfa2State();
}

class _Anasayfa2State extends State<Anasayfa2> {

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().yemekleriYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Yemekler",style: TextStyle(color: Colors.white,fontSize: 42),),
        backgroundColor: Colors.black,

        actions: [

          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  YemekSepet()));
          }, icon: const Icon(Icons.shopping_bag))
        ],

      ),
      body: BlocBuilder<AnasayfaCubit,List<Yemekler>>(
        builder: (context,yemeklerListesi){
          if(yemeklerListesi.isNotEmpty){
            return ListView.builder(
                itemCount: yemeklerListesi.length,
                itemBuilder: (context,indeks){
                  var yemek = yemeklerListesi[indeks];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => YemekDetay(yemek: yemek)))
                          .then((value) {    context.read<AnasayfaCubit>().yemekleriYukle();
                      });
                    },
                    child: Stack(
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.only(top: 30.0,left: 120),
                          child: Container(
                            width: 300,
                            height: 50,
                            color: Colors.black,
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 10,),
                                Text(yemek.yemek_adi,style: TextStyle(color: Colors.white,fontSize: 28 ),),
                                Spacer(),
                                Text("${yemek.yemek_fiyat}₺",style: TextStyle(color: Colors.white,fontSize: 28 ),),
                                SizedBox(width: 30,)


                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 120,
                          child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),

                        ),
                      ],
                    )
                  );
                }
            );
          }
          else{
            return const Center();
          }
        },
      ),
    );
  }


















}
