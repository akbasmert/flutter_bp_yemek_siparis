import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bp_yemek_siparis/data/entity/sepet_yemekler.dart';
import 'package:flutter_bp_yemek_siparis/ui/cubit/yemek_sepet_cubit.dart';

class YemekSepet extends StatefulWidget {

  @override
  State<YemekSepet> createState() => _YemekSepet();
}

class _YemekSepet extends State<YemekSepet> {


  @override
  void initState() {
    super.initState();
    context.read<YemekSepetCubit>().sepetiYukle("merttt");
  }
  @override
  Widget build(BuildContext context) {
    List yemekAdListe = [];
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Sepetiniz",style: TextStyle(fontSize: 32),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<YemekSepetCubit,List<SepetYemekler>>(
        builder: (context,yemeklerListesi){
          if(yemeklerListesi.isNotEmpty){
            return ListView.builder(
                itemCount: yemeklerListesi.length,
                itemBuilder: (context,indeks){
                  var yemek = yemeklerListesi[indeks];
                  int yemekSiparisAdet = int.parse(yemek.yemek_siparis_adet);

                  yemekAdListe.add(yemek.yemek_adi);

               // int.parse(yemek.yemek_siparis_adet);

                  if(yemek.kullanici_adi == "merttt"){

                      return GestureDetector(
                        onTap: (){

                        },
                        child: Card(
                          color: Colors.black,
                          child: Row(

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Container(
                                  width: width*0.2,
                                  child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(8.0),
                                child: Container(
                                    width: width*0.35,
                                    child: Text("${yemek.yemek_adi}",style: TextStyle(color: Colors.white,fontSize: 22),),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(

                                    child: Text("${yemek.yemek_fiyat}₺",style: TextStyle(color: Colors.white,fontSize: 22),)),
                              ),
                              Padding(padding: EdgeInsets.all(8.0),
                                child: Text("${yemek.yemek_siparis_adet}adet",style: TextStyle(color: Colors.white,fontSize: 22),),
                              ),

                              Spacer(),

                              Container(
                                width: width*0.05,
                                child: IconButton(onPressed: (){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("${yemek.yemek_adi} silinsin mi?"),
                                      action: SnackBarAction(
                                        label: "Evet",
                                        onPressed: (){
                                          setState(() {
                                            context.read<YemekSepetCubit>().sil(int.parse(yemek.sepet_yemek_id), "merttt");

                                          });
                                        },
                                      ),
                                    ),
                                  );
                                }, icon: const Icon(Icons.delete_outline,color: Colors.white,)),
                              ),
                              SizedBox(width: 15,)
                            ],
                          ),
                        ),
                      );

                  } else{
                    return const Center();
                  }

                }
            );
          }
          else{
            return const Center();
          }
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Sipariş verildi.",style: TextStyle(color: Colors.white),),

              ),
          );
        },
        label: const Text('Sipariş ver',style: TextStyle(fontSize: 22,color: Colors.white),),
        //icon: const Icon(Icons.thumb_up),
        backgroundColor: Colors.black,
      ),
    );
  }
}
