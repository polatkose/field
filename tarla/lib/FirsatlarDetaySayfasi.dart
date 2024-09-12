import 'package:flutter/material.dart';
import 'package:tarla/Duyurular.dart';
import 'package:tarla/Firsatlar.dart';
import 'package:tarla/main.dart';

class FirsatlarDetaySayfasi extends StatefulWidget {
  const FirsatlarDetaySayfasi({super.key});

  @override
  State<FirsatlarDetaySayfasi> createState() => _FirsatlarDetaySayfasiState();
}

class _FirsatlarDetaySayfasiState extends State<FirsatlarDetaySayfasi> {

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
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Text(
              "string",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: ekranGenisligi/1,
                height: ekranYuksekligi/4.5,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: ekranGenisligi/2.2),
                      child: Image.asset("resimler/unlem.jpg", width: 30, height: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 5),
                      child: Text("string"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 5),
                      child: Text("13.07.2023"),
                    ),

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
