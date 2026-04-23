void main() {

  var record = ('first', a: 2, b: true, 'last');
  print(record);

  var angka = (7, 4);
  print('Sebelum tular: $angka');
  var hasil = tukar(angka);
  print('Sesudah tukar: $hasil');

  (String, int) mahasiswa = ('Ratih', 244107060055);
print(mahasiswa);

var mahasiswa2 = ('Ratih', a: 244107060055, b: true, 'last');
print(mahasiswa2.$1); // Prints 'first'
print(mahasiswa2.a); // Prints 2
print(mahasiswa2.b); // Prints true
print(mahasiswa2.$2); // Prints 'last'
}
  (int, int) tukar((int, int) record) {
    var (a, b) = record;
    return (b, a);
}


