import 'package:flutter/material.dart';

class HaberDetaySayfasi extends StatelessWidget {
  final String haberResim;

  HaberDetaySayfasi({required this.haberResim});

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
        title: Padding(
          padding: EdgeInsets.only(left: ekranGenisligi/5),
          child: Text(
            "HABERLER",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: ekranGenisligi/1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Buğdayı satan değil elinde tutan kazanacak! Hasattan sonra 3 ay içinde fiyatların 9-10 lira bandına çıkması bekleniyor!",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ekranYuksekligi/500),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "resimler/$haberResim",
                      width: ekranGenisligi,
                      height: ekranYuksekligi/2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Sanayici ve tüccar, Nisan ayı sonuna kadar yapılan yoğun ithalattan dolayı hasat döneminde piyasaya giren buğdayı almakta gönülsüz olsa da, TMO’nun bu yıl indirimli ürün satmayacak olması, yüksek enflasyondan dolayı fiyatların sürekli yükselmesi ve yurt dışında düşen hububat fiyatlarının artık son noktaya geldiği ve önümüzdeki haftalarda yukarı yönlü fiyat hareketlerinin başlayacağına yönelik beklentiler, Türkiye’de de 6000 ile 6500 TL/ton arasında seyreden buğday piyasa fiyatlarının bu fiyatlarda kalmasını da imkansız kılıyor. Hasattan sonraki 3 ay içinde buğday fiyatlarının 9000 ile 10000 TL/ton bandına çıkması bekleniyor.",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("GEÇTİĞİMİZ YIL ELİNDE TUTAN ZARAR ETTİ BU YIL SATAN ZARAR EDECEK!"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Geçtiğimiz yıl buğday fiyatlarının hasat döneminden sonbahara kadar yüksek seyretmesinden dolayı yıl sonunda fiyatların daha da yükseleceği beklentisi ile buğdayı elinde tutanlar ciddi zarar ederken, bu yıl tam tersi buğdayını satan değil elinde tutanın kazanacağını gösteriyor."),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Geçtiğimiz yıl buğday fiyatlarının hasat döneminden sonbahara kadar yüksek seyretmesinden dolayı yıl sonunda fiyatların daha da yükseleceği beklentisi ile buğdayı elinde tutanlar ciddi zarar ederken, bu yıl tam tersi buğdayını satan değil elinde tutanın kazanacağını gösteriyor."),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("DURUMUN FARKINDA OLAN BAZI SANAYİCİLER PİYASADAN ÜRÜN ÇEKMEYE BAŞLADI!"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Durumun farkında olan bazı sanayicinin yavaş yavaş piyasadan ürün almaya başlaması da dikkat çekerken, ABD ve Avrupa başta olmak üzere buğday stoklarında düşüş yaşanacağına yönelik kaygılar, Ukrayna’da buğday üretiminin düşeceğine yönelik beklentiler, her ne kadar iç piyasada şuanda yüzüne bakılmasa da buğdayın önümüzdeki günlerde değerleneceğinin işareti olarak değerlendiriliyor."),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Bunun için TMO'ya ürün satamayan çiftçilerin piyasaya ihtiyacı kadar ürün satması geri kalan ürününü muhafaza etmesi lehine olacağı kaydediliyor."),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
