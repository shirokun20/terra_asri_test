import 'dart:core';

bool isPalindrome(String word) {
  return word == word.split('').reversed.join('');
}

String preprocessString(String word) {
  return word.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
}

bool isCircularPalindrome(String word) {
  word = preprocessString(word);
  if (word.length <= 1) {
    return false;
  }

  for (int i = 0; i < word.length; i++) {
    String rotatedWord =
        word.substring(i).toLowerCase() + word.substring(0, i).toLowerCase();
    if (isPalindrome(rotatedWord)) {
      return true;
    }
  }

  return false;
}

void main() {
  List<String> words = [
    "racecar",
    "hello world",
    "mAlAyAlaM",
    "12321",
    "@!#A?!A#!@",
    "abcabca"
  ];
  for (String word in words) {
    print("$word: ${isCircularPalindrome(word)}");
  }
}
