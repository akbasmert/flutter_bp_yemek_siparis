
/*
BlocBuilder<YemekSepetCubit,List<SepetYemekler>>(
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
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: width*0.2,
                                  child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(8.0),
                                child: Container(
                                    width: width*0.2,
                                    child: Column(
                                      children: [
                                        Text("${yemek.yemek_adi}"),
                                        Text("${yemek.yemek_fiyat}"),
                                      ],
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                    width: width*0.05,
                                    child: Text("${yemek.yemek_fiyat}")),
                              ),
                              Padding(padding: EdgeInsets.all(8.0),
                                child: Text("${yemek.yemek_siparis_adet}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: width*0.1,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {


                                          });

                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text("+",style: TextStyle( fontSize: 20),),
                                        ),
                                      ),

                                      Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text("$yemekSiparisAdet")
                                        //Text(yemek.yemek_siparis_adet),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            ;
                                          });

                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text("-",style: TextStyle( fontSize: 20),),
                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              ),

                              Container(
                                width: width*0.05,
                                child: IconButton(onPressed: (){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("${yemek.yemek_adi} silinsin mi?"),
                                      action: SnackBarAction(
                                        label: "Evet",
                                        onPressed: (){
                                          context.read<YemekSepetCubit>().sil(int.parse(yemek.sepet_yemek_id), "merttt");
                                        },
                                      ),
                                    ),
                                  );
                                }, icon: const Icon(Icons.delete_outline,color: Colors.black54,)),
                              ),
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
 */

/*
Center(
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
                }, child: const Text("-")),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              context.read<YemekDetayCubit>().sepeteEkle(widget.yemek.yemek_adi, widget.yemek.yemek_resim_adi, widget.yemek.yemek_fiyat, siparisAdeet.toString(),
              "merttt");
            }, child: const Text("Sepete Ekle")),
          ),
        ],
        ),
      ),
 */

/*
Card(
                      color: Colors.black,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                                child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Row(
                            children: [
                              Padding(padding: EdgeInsets.all(8.0),
                                child: Text("${yemek.yemek_adi}",style: TextStyle(color: Colors.white),),
                              ),
                              Padding(padding: EdgeInsets.all(8.0),
                                child: Text("${yemek.yemek_fiyat}",style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),)

                        ],
                      ),
                    ),
 */
