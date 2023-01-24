

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bp_yemek_siparis/data/entity/yemekler.dart';
import 'package:flutter_bp_yemek_siparis/ui/cubit/yemek_detay_cubit.dart';
import 'package:flutter_bp_yemek_siparis/ui/screen/yemek_sepet.dart';

import '../../data/entity/sepet_yemekler.dart';
import '../cubit/yemek_sepet_cubit.dart';

class YemekDetay extends StatefulWidget {
 Yemekler yemek;

  YemekDetay({required this.yemek});

  @override
  State<YemekDetay> createState() => _YemekDetayState();
}

class _YemekDetayState extends State<YemekDetay> {
 int siparisAdeet = 1;
  @override
  void initState() {
    super.initState();
    var yemek = widget.yemek;

    // SEPETİ GÜNCELLEME İÇİN EKLENDİ.
    context.read<YemekSepetCubit>().sepetiYukle("merttt");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("${widget.yemek.yemek_adi}",style: TextStyle(fontSize: 40),),
        backgroundColor: Colors.black,
        actions: [

          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  YemekSepet()));
          }, icon: const Icon(Icons.shopping_bag))
        ],
      ),
      body: BlocBuilder<YemekSepetCubit,List<SepetYemekler>>(
        builder: (context,yemeklerListesi){
          if(yemeklerListesi.isNotEmpty){
            return ListView.builder(
                itemCount: yemeklerListesi.length - yemeklerListesi.length +1,
                itemBuilder: (context,indeks){
                  var yemek = yemeklerListesi[indeks];
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 100,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(

                              child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}"),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                            "${widget.yemek.yemek_fiyat} ₺",style: TextStyle(color: Colors.white,fontSize: 32),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Spacer(),
                                ElevatedButton(onPressed: (){
                                  setState(() {
                                    siparisAdeet+=1;
                                  });
                                }, child: const Text("+", style: TextStyle(fontSize: 48),),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text("  $siparisAdeet  ",style: TextStyle(color: Colors.white,fontSize: 28),),
                                ),
                                ElevatedButton(onPressed: (){
                                  setState(() {
                                    siparisAdeet-=1;
                                  });
                                }, child: const Text("-",style: TextStyle(fontSize: 54),),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(onPressed: (){
                         /*     if(int.parse(yemek.yemek_siparis_adet)  == 0){
                                context.read<YemekDetayCubit>().sepeteEkle(widget.yemek.yemek_adi, widget.yemek.yemek_resim_adi, widget.yemek.yemek_fiyat, siparisAdeet.toString(),
                                    "merttt");
                                print("sepette yemek yoktu ile eklendi");
                              }else{*/
                              setState(() {
                                int adet = 0;
                                adet = int.parse(yemek.yemek_siparis_adet);
                                print(adet);
                                int toplam = adet + siparisAdeet - 1;
                                context.read<YemekSepetCubit>().sil(int.parse(yemek.sepet_yemek_id), "merttt");
                                context.read<YemekDetayCubit>().sepeteEkle(widget.yemek.yemek_adi, widget.yemek.yemek_resim_adi, widget.yemek.yemek_fiyat, (toplam).toString(),
                                    "merttt");
                                print("sepette yemek vardı ile eklendi");
                                //  }
                                print("----------------------");
                                context.read<YemekSepetCubit>().sepetiYukle("merttt");
                              });

                            }, child: const Text("Sepete Ekle",style: TextStyle(fontSize: 28),),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black26,
                                  foregroundColor: Colors.white),),
                          ),
                        ],
                      ),
                    );


                }
            );
          }
          else{

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.yemek.yemek_adi),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.yemek.yemek_fiyat),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ElevatedButton(onPressed: (){
                          setState(() {
                            siparisAdeet+=1;
                          });
                        }, child: const Text("+"),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("$siparisAdeet"),
                        ),
                        ElevatedButton(onPressed: (){
                          setState(() {
                            siparisAdeet-=1;
                          });
                        }, child: const Text("-"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.yellow),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: (){
                      context.read<YemekDetayCubit>().sepeteEkle(widget.yemek.yemek_adi, widget.yemek.yemek_resim_adi, widget.yemek.yemek_fiyat, siparisAdeet.toString(),
                          "merttt");
                      print("yemekler listesi boştu eklendi");
                    }, child: const Text("Sepete Ekle"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.yellow),
                    ),

                  ),
                ],
              ),
            );

          }
        },
      ),
    );
  }
}
