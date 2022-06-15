import 'package:json_parse/book.dart';

final testData = [
  Book(id: 1, name: '111', phone: '111'),
  Book(id: 2, name: '222', phone: '222'),
  Book(id: 3, name: 'Война и мир', phone: 'Л.Н. Толстой'),
];

const jsonString = ''' [
  {
    "id":1,
    "name":"111",
    "phone":"111"
  },
  {
    "id":2,
    "name":"222",
    "phone":"222"
  },
  {
    "id":3,
    "name":"Война и мир",
    "phone":"Л.Н. Толстой"
    }
]''';
