import 'package:flutter/material.dart';
import 'package:tarla/Duyurular.dart';
import 'package:tarla/Firsatlar.dart';
import 'package:tarla/HalBorsaFiyatlari.dart';
import 'package:tarla/Sehirler.dart';
import 'package:tarla/Tarimdao.dart';
import 'package:tarla/main.dart';

class Borsa extends StatefulWidget {
  const Borsa({Key? key}) : super(key: key);

  @override
  State<Borsa> createState() => _BorsaState();
}

class _BorsaState extends State<Borsa> {
  int _selectedIndex = 0;
  String selectedCity = 'Ankara';
  List<Sehirler> sehirler = [];
  int selectedCityId = 0;

  @override
  void initState() {
    super.initState();
    fetchCities();
  }

  void fetchCities() async {
    var sehirlerListe = await sehirlerListesi();
    setState(() {
      sehirler = sehirlerListe;
    });
  }

  Future<List<Sehirler>> sehirlerListesi() async {
    var sehirlerListe = await Tarimdao().sehirlerList();
    return sehirlerListe;
  }

  Future<List<HalBorsaFiyatlari>> borsaListesi(int sehirId) async {
    var borsaListesi = await Tarimdao().borsaList(sehirId);
    return borsaListesi;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Firsatlar()));
    } else if (_selectedIndex == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: '')));
    } else if (_selectedIndex == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Duyurular()));
    }
  }

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(right: ekranYuksekligi/100),
            child: Text(
              "HAL/BORSA FİYATLARI",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              hint: Text("Şehir Seçiniz"),
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCity = newValue!;
                  selectedCityId = sehirler
                      .firstWhere((sehir) => sehir.Sehir_Adi == newValue)
                      .Sehir_ID;
                });
              },
              items: sehirler.map<DropdownMenuItem<String>>((Sehirler sehir) {
                return DropdownMenuItem<String>(
                  value: sehir.Sehir_Adi,
                  child: Text(sehir.Sehir_Adi),
                );
              }).toList(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("ÜRÜN"),
                    Text("FİYAT"),
                  ],
                ),
                Container(
                  width: ekranGenisligi/1,
                  height: ekranYuksekligi/1000,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<HalBorsaFiyatlari>>(
              future: borsaListesi(selectedCityId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Hata oluştu: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("Şehir seçiniz"));
                } else {
                  var borsaListesi = snapshot.data!;
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: borsaListesi.length,
                    itemBuilder: (context, index) {
                      var urun = borsaListesi[index];
                      return Container(
                        width: ekranGenisligi/1.2,
                        height: ekranYuksekligi/4.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: ekranGenisligi/4.5,
                                    height: ekranYuksekligi/6,
                                    child: Image.asset("resimler/${urun.Borsa_Resim}"),
                                  ),
                                  Text("${urun.Borsa_Adi}",style: TextStyle(fontSize: 15, color: Colors.grey),),
                                  Text("${urun.Borsa_Fiyat}₺", style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("${urun.Borsa_HalFiyat}₺", style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            Container(
                              width: ekranGenisligi/1,
                              height: ekranYuksekligi/1000,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
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
      ),
    );
  }
}
