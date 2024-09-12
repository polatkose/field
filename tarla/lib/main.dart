import 'package:flutter/material.dart';
import 'package:tarla/Borsa.dart';
import 'package:tarla/Ekle.dart';
import 'package:tarla/Fiyatlar.dart';
import 'package:tarla/Gubre.dart';
import 'package:tarla/HaberDetaySayfasi.dart';
import 'package:tarla/Haberler.dart';
import 'package:tarla/Ilac.dart';
import 'package:tarla/Mazot.dart';
import 'package:tarla/Duyurular.dart';
import 'package:tarla/Firsatlar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the respective pages based on the selected index
    if (_selectedIndex == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Firsatlar()));
    } else if (_selectedIndex == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: '')));
    } else if (_selectedIndex == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Duyurular()));
    }
  }

  Future<List<Fiyatlar>> FiyatListeGetir() async {
    var fiyatListesi = <Fiyatlar>[];
    var mazotFiyatlari = Fiyatlar(fiyatAdi: "MAZOT", fiyatResimAdi: "mazot.jpg");
    var gubreFiyatlari = Fiyatlar(fiyatAdi: "GÜBRE", fiyatResimAdi: "gubre.jpg");
    var ilacFiyatlari = Fiyatlar(fiyatAdi: "İLAÇ", fiyatResimAdi: "saglik.jpg");
    var halBorsaFiyatlari = Fiyatlar(fiyatAdi: "HAL/BORSA", fiyatResimAdi: "borsa.jpeg");

    fiyatListesi.add(mazotFiyatlari);
    fiyatListesi.add(gubreFiyatlari);
    fiyatListesi.add(ilacFiyatlari);
    fiyatListesi.add(halBorsaFiyatlari);

    return fiyatListesi;
  }

  Future<List<Ekle>> EkleGetir() async {
    var ekleListesi = <Ekle>[];
    var tarlaEkle = Ekle(ekleAdi: "TARLA EKLE", ekleResimAdi: "tarla.jpg");
    var depoEkle = Ekle(ekleAdi: "DEPO EKLE", ekleResimAdi: "depo.jpg");
    var ekipmanEkle = Ekle(ekleAdi: "EKİPMAN EKLE", ekleResimAdi: "ekipman.jpg");

    ekleListesi.add(tarlaEkle);
    ekleListesi.add(depoEkle);
    ekleListesi.add(ekipmanEkle);

    return ekleListesi;
  }

  Future<List<Haberler>> HaberGetir() async {
    var haberListesi = <Haberler>[];
    var haber1 = Haberler(haberAdi: "Buğdayı satan değil elinde tutan kazanacak! Hasattan sonra 3 ay içinde fiyatların 9-10 lira bandına çıkması bekleniyor!", haberResim: "bugday.jpg");
    var haber2= Haberler(haberAdi: "Buğdayı satan değil elinde tutan kazanacak! Hasattan sonra 3 ay içinde fiyatların 9-10 lira bandına çıkması bekleniyor!", haberResim: "bugday.jpg");
    var haber3 = Haberler(haberAdi: "Buğdayı satan değil elinde tutan kazanacak! Hasattan sonra 3 ay içinde fiyatların 9-10 lira bandına çıkması bekleniyor!", haberResim: "bugday.jpg");
    var haber4 = Haberler(haberAdi: "Buğdayı satan değil elinde tutan kazanacak! Hasattan sonra 3 ay içinde fiyatların 9-10 lira bandına çıkması bekleniyor!", haberResim: "bugday.jpg");

    haberListesi.add(haber1);
    haberListesi.add(haber2);
    haberListesi.add(haber3);
    haberListesi.add(haber4);

    return haberListesi;
  }

    @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.green),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      height: 300,
                      top: 200,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(25.0),
                            topRight: const Radius.circular(25.0),
                          ),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -55,
                              left: 50,
                              right: 50,
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.location_on),
                                        Text(
                                          "Yeryüzü",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 1,
                                      height: 100,
                                      decoration: BoxDecoration(color: Colors.black),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "28°",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          "Hafif Yağmurlu",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: FutureBuilder<List<Fiyatlar>>(
                      future: FiyatListeGetir(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var fiyatListesi = snapshot.data;
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: fiyatListesi?.length,
                            itemBuilder: (context, index) {
                              var fiyat = fiyatListesi?[index];
                              return SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                                height: 70,
                                child: GestureDetector(
                                  onTap: (){
                                    if(fiyat?.fiyatAdi == "MAZOT"){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Mazot()));
                                    }
                                    else if (fiyat?.fiyatAdi == "GÜBRE"){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Gubre()));

                                    }
                                    else if (fiyat?.fiyatAdi == "İLAÇ"){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Ilac()));

                                    }
                                    else if (fiyat?.fiyatAdi == "HAL/BORSA"){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Borsa()));
                                    }
                                  },
                                  child: Card(
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.white,border: Border.all(
                                        color: Colors.grey,
                                        width: 0.5,
                                      ),
                                        boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 1.0,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("resimler/${fiyat?.fiyatResimAdi}"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "${fiyat?.fiyatAdi}\n FİYATLARI",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Column(
                            children: [Text("veri yok")],
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: FutureBuilder<List<Ekle>>(
                      future: EkleGetir(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var ekleListesi = snapshot.data;
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: ekleListesi?.length,
                            itemBuilder: (context, index) {
                              var ekle = ekleListesi?[index];
                              return SizedBox(
                                width: MediaQuery.of(context).size.width/3,
                                height: 70,
                                child: Card(
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.white,border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey, // Gölge rengi
                                        blurRadius: 1.0,   // Gölge bulanıklığı
                                        offset: Offset(0, 2), // Gölge konumu (x, y)
                                      ),
                                    ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("resimler/${ekle?.ekleResimAdi}"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "${ekle?.ekleAdi}\n",
                                                style: TextStyle(fontSize: 12, color: Colors.black),
                                              ),
                                              TextSpan(
                                                text: "PREMİUM",
                                                style: TextStyle(fontSize: 12, color: Colors.red),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Column(
                            children: [Text("veri yok")],
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 680,
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(color: Colors.greenAccent, borderRadius: BorderRadius.circular(15)
                            ),
                          child: Center(child: Text("Haberler")
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 600,
                              child: FutureBuilder<List<Haberler>>(
                                future: HaberGetir(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    var haberListesi = snapshot.data;
                                    return ListView.builder(
                                      itemCount: haberListesi?.length,
                                      itemBuilder: (context, index) {
                                        var haber = haberListesi?[index];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => HaberDetaySayfasi(
                                                  haberResim: haber?.haberResim ?? "",
                                                ),
                                              ),
                                            );
                                          },
                                          child: SizedBox(
                                            width: 250,
                                            height: 250,
                                            child: Card(
                                              child: Container(
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.white,border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1.0,
                                                ),boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey, // Gölge rengi
                                                    blurRadius: 10.0,   // Gölge bulanıklığı
                                                    offset: Offset(0, 4), // Gölge konumu (x, y)
                                                  ),
                                                ],),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      width: double.infinity,
                                                      height: 150,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: AssetImage("resimler/${haber?.haberResim}"),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          borderRadius: BorderRadius.circular(10.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "${haber?.haberAdi}",
                                                        style: TextStyle(fontSize: 15),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return Column(
                                      children: [Text("veri yok")],
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar:ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          elevation: 8,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Fırsatlar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Anasayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.announcement),
              label: 'Duyurular',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      )
    );
  }
}
