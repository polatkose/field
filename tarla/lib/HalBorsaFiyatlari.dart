class HalBorsaFiyatlari{
  late int Borsa_ID;
  late String Borsa_Adi;
  late double Borsa_Fiyat;
  late int Sehir_ID;
  late double Borsa_HalFiyat;
  late String Borsa_Resim;

  HalBorsaFiyatlari(
      {required this.Borsa_ID,
        required this.Borsa_Adi,
        required this.Borsa_Fiyat,
        required this.Sehir_ID,
        required this.Borsa_HalFiyat,
        required this.Borsa_Resim});
}