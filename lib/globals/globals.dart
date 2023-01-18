import 'dart:io';

List<Map<String, dynamic>> allContacts = [
  {
    'id': 1,
    'name': 'Harshil',
    'des': 'Typing...',
    'time': 'Now',
    'phone': '+91 97645 97867',
    'image': 'assets/images/person.jpg',
  },
  {
    'id': 2,
    'name': 'Akash',
    'des': 'Hello',
    'time': '05:02 AM',
    'phone': '+91 97757 76465',
    'image': 'assets/images/person.jpg',
  },
  {
    'id': 3,
    'name': 'Dharmik',
    'des': 'Good Morning',
    'time': '7:00 AM',
    'phone': '+91 97785 97867',
    'image': 'assets/images/person.jpg',
  },
  {
    'id': 4,
    'name': 'Kishan',
    'des': 'How are you ?',
    'time': '3:02 PM',
    'phone': '+91 75845 97867',
    'image': 'assets/images/person.jpg',
  },
  {
    'id': 5,
    'name': 'Pratik',
    'des': 'Good afternoon',
    'time': '8:09 PM',
    'phone': '+91 97645 75788',
    'image': 'assets/images/person.jpg',
  },
  {
    'id': 6,
    'name': 'Parth',
    'des': 'Hey',
    'time': 'yesterday',
    'phone': '+91 97645 97867',
    'image': 'assets/images/person.jpg',
  },
  {
    'id': 7,
    'name': 'Jeel',
    'des': 'Hello',
    'time': 'yesterday',
    'phone': '+91 97656 97867',
    'image': 'assets/images/person.jpg',
  },
  {
    'id': 8,
    'name': 'Arshit',
    'des': 'By',
    'time': 'yesterday',
    'phone': '+91 97645 87655',
    'image': 'assets/images/person.jpg',
  },

  {
    'id': 9,
    'name': 'Samarth',
    'des': 'By',
    'time': 'yesterday',
    'phone': '+91 97645 87655',
    'image': 'assets/images/person.jpg',
  },

  {
    'id': 10,
    'name': 'jay',
    'des': 'By',
    'time': 'yesterday',
    'phone': '+91 97645 87655',
    'image': 'assets/images/person.jpg',
  },
  // {'id':7, 'name':'Iron Man','des':'Tony Stark','time':'11:02 AM','phone':'+91 97645 97867'},
];
class Globals {
  static String? name;
  static String? description;
  static String? call;
  static File? image;

  static bool isIos = false;
}
