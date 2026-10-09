import 'dart:io';

String a000124(int n) {
  List<int> hasil = [];

  for (int i = 0; i < n; i++) {
    int angka = (i * (i + 1)) ~/ 2 + 1;
    hasil.add(angka);
  }

  return hasil.join('-');
}

void main() {
  print('Masukkan jumlah angka yang ingin dicetak: ');
  int input = int.parse(stdin.readLineSync()!);

  String hasil = a000124(input);

  print(hasil);
}
