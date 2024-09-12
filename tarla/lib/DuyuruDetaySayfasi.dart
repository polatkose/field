import 'package:flutter/material.dart';
import 'package:tarla/Duyurular.dart';
import 'package:tarla/Firsatlar.dart';
import 'package:tarla/main.dart';

class DuyuruDetaySayfasi extends StatefulWidget {
  const DuyuruDetaySayfasi({super.key});

  @override
  State<DuyuruDetaySayfasi> createState() => _DuyuruDetaySayfasiState();
}

class _DuyuruDetaySayfasiState extends State<DuyuruDetaySayfasi> {

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
        flexibleSpace: FlexibleSpaceBar(
          title: Center(
            child: Padding(
              padding: EdgeInsets.only(top: ekranYuksekligi/5, left: ekranGenisligi/5),
              child: Text(
                "ÇATALCA MURATBEY MAHALLESİ'NDE TARLA YANGINI",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: ekranYuksekligi/100),
                child: Container(
                  width: ekranGenisligi/1,
                  height: ekranYuksekligi/1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(
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
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          "resimler/tarla_duyuru.jpg",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: ekranYuksekligi/2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("İstanbul Çatalca'da buğday tarlasında çıkan yangın, itfaiye ekipleri tarafından söndürüldü. Yangında 200 dönümlük buğday tarlası zarar gördü."),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Muratbey Mahallesi'nde bulunan buğday tarlasında saat 17.00 sıralarında bilinmeyen bir nedenle yangın çıktı. Buğday tarlasının yandığını görenlerin bildirmesiyle araziye birçok ilçeden itfaiye ekibi sevk edildi."),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: ekranYuksekligi/25, right: ekranGenisligi/1.3),
                        child: Text("12.07.2023"),
                      )
                    ],
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
