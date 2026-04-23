void main() {
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings',
    'nama': 'Ratih',
    'nim ': '244107060055',
  };
  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
    27: 'Ratih',
    28: '244107060055',
  };
  var mhs1 = Map<String, String>();
  mhs1['name'] = 'Ratih';
  mhs1['nim'] = '244107060055';

  var mhs2 = Map<int, String>();
  mhs2[27] = 'Ratih';
  mhs2[28] = '244107060055';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}
