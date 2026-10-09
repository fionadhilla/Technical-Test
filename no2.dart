import 'dart:io';

String denseRanking(List<int> scores, List<int> gitsScores) {
  List<int> ranking = scores.toSet().toList();
  List<int> hasil = [];

  for (int score in gitsScores) {
    int rank = 1;

    for (int leaderboardScore in ranking) {
      if (score < leaderboardScore) {
        rank++;
      } else {
        break;
      }
    }

    hasil.add(rank);
  }

  return hasil.join(' ');
}

void main() {
  stdout.write('Masukkan jumlah pemain yang ikut serta: ');
  int n = int.parse(stdin.readLineSync()!);

  stdout.write('Masukkan skor pemain (urut dari terbesar ke terkecil): ');
  List<int> scores = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  stdout.write('Masukkan jumlah permainan yang diikuti GITS: ');
  int m = int.parse(stdin.readLineSync()!);

  stdout.write('Masukkan skor GITS pada setiap permainan: ');
  List<int> gitsScores = stdin
      .readLineSync()!
      .split(' ')
      .map(int.parse)
      .toList();

  String hasil = denseRanking(scores, gitsScores);

  print('Ranking GITS: $hasil');
}
