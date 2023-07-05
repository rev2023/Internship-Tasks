import 'package:flutter/cupertino.dart';
import 'package:counter_app/provider/counter_provider.dart';

class FactProvider with ChangeNotifier {
  CounterProvider counter = CounterProvider();
  int count = 0;

  FactProvider(){
    notifyListeners();
  }

  String returnFact(int countValue, int i){
    List<String>? facts = factsMap[countValue];
    return facts![i];

  }

  final Map<int, List<String>> factsMap = {
    0: ['The concept of zero as a number was first developed by ancient civilizations such as the Babylonians and Mayans. However, it was the Indian mathematicians who introduced the digit "0"',
    'In many spiritual and philosophical traditions, the number 0 symbolizes potential, nothingness, or infinity.',
  'The number 0 has significant importance in mathematics. It serves as the identity element for addition and subtraction, meaning that adding or subtracting 0 from a number leaves the number unchanged.',
    'In many spiritual and philosophical traditions, the number 0 symbolizes potential, nothingness, or infinity.'],
    1: [
      'The number 1 is the first natural number.',
      'In binary, the number 1 is represented as 1.',
      'In Roman numerals, the number 1 is represented as I.',
      'One is the loneliest number, according to the popular song.',
    ],
    2: [
      'The number 2 is the only even prime number.',
      'In binary, the number 2 is represented as 10.',
      'The number 2 is the base of the binary number system.',
      'Two is better than one, as the saying goes.',
    ],
    3: [
      'The number 3 is the first odd prime number.',
      'In binary, the number 3 is represented as 11.',
      'The number 3 is considered a mystical number in many cultures.',
      'Third time\'s the charm, as they say.',
    ],
    4: [
      'The number 4 is the smallest composite number.',
      'In binary, the number 4 is represented as 100.',
      'There are four suits in a standard deck of playing cards.',
      'Four-leaf clovers are considered lucky.',
    ],
    5: [
      'The number 5 is the fifth natural number.',
      'In binary, the number 5 is represented as 101.',
      'The number 5 is a common choice for jersey numbers in sports.',
      'High five! A gesture of celebration or congratulations.',
    ],
    6: [
      'The number 6 is a highly composite number.',
      'In binary, the number 6 is represented as 110.',
      'The number 6 is associated with harmony and balance in many cultures.',
      'The sixth sense refers to an intuitive or psychic ability.',
    ],
    7: [
      'The number 7 is a prime number.',
      'In binary, the number 7 is represented as 111.',
      'There are seven days in a week.',
      'Lucky number 7 is often associated with good fortune.',
    ],
    8: [
      'The number 8 is the cube of 2.',
      'In binary, the number 8 is represented as 1000.',
      'There are eight bits in a byte.',
      'Eight is considered a lucky number in Chinese culture.',
    ],
    9: [
      'The number 9 is a square number.',
      'In binary, the number 9 is represented as 1001.',
      'In many cultures, the number 9 is associated with spirituality.',
      'Nine lives are often attributed to cats.',
    ],
    10: [
      'The number 10 is the base of the decimal number system.',
      'In binary, the number 10 is represented as 1010.',
      'There are ten fingers and ten toes on a human body.',
      'Ten is a common milestone age for children.',
    ],
    11: [
      'The number 11 is a prime number.',
      'In binary, the number 11 is represented as 1011.',
      'In numerology, the number 11 is considered a master number.',
      'Eleven players are usually on a football (soccer) team.',
    ],
    12: [
      'The number 12 is highly divisible.',
      'In binary, the number 12 is represented as 1100.',
      'There are twelve months in a year.',
      'Twelve is often associated with completeness or perfection.',
    ],
    13: [
      'The number 13 is considered unlucky in many cultures.',
      'In binary, the number 13 is represented as 1101.',
      'There are thirteen stripes on the United States flag.',
      'Friday the 13th is considered an unlucky day.',
    ],
    14: [
      'The number 14 is a composite number.',
      'In binary, the number 14 is represented as 1110.',
      'There are fourteen stations of the Cross in Christianity.',
      'Fourteen is the atomic number of silicon.',
    ],
    15: [
      'The number 15 is a triangular number.',
      'In binary, the number 15 is represented as 1111.',
      'There are fifteen players on a rugby union team.',
      'Fifteen is the age of eligibility for a driver\'s permit in many countries.',
    ],
  };

}
