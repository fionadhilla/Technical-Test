import 'dart:io';

int? makePalindrome(
  List<String> digits,
  List<bool> changed,
  int left,
  int right,
  int k,
) {
  if (left >= right) return k;

  if (digits[left] != digits[right]) {
    if (k == 0) return null;

    String terbesar = digits[left].compareTo(digits[right]) > 0
        ? digits[left]
        : digits[right];

    digits[left] = terbesar;
    digits[right] = terbesar;

    changed[left] = true;
    changed[right] = true;

    k--;
  }

  return makePalindrome(digits, changed, left + 1, right - 1, k);
}

String maximizePalindrome(
  List<String> digits,
  List<bool> changed,
  int left,
  int right,
  int k,
) {
  if (left > right) return digits.join();

  if (left == right) {
    if (k > 0) digits[left] = '9';
    return digits.join();
  }

  if (digits[left] != '9') {
    int cost = changed[left] ? 1 : 2;

    if (k >= cost) {
      digits[left] = '9';
      digits[right] = '9';
      k -= cost;
    }
  }

  // Jika pasangan sudah 9, lanjutkan ke pasangan berikutnya.
  return maximizePalindrome(digits, changed, left + 1, right - 1, k);
}

String highestPalindrome(String s, int k) {
  if (s.isEmpty || int.tryParse(s) == null || k < 0) {
    return '-1';
  }

  List<String> digits = s.split('');
  List<bool> changed = List<bool>.filled(s.length, false);

  int? remaining = makePalindrome(digits, changed, 0, digits.length - 1, k);

  if (remaining == null) return '-1';

  return maximizePalindrome(digits, changed, 0, digits.length - 1, remaining);
}

void main() {
  stdout.write('Masukkan string angka: ');
  String s = stdin.readLineSync()!.trim();

  stdout.write('Masukkan jumlah perubahan maksimal (k): ');
  int k = int.parse(stdin.readLineSync()!);

  String hasil = highestPalindrome(s, k);

  print('Highest Palindrome: $hasil');
}
