import 'dart:io';

void main() {
  print("Enter a string: ");
  String? inputString = stdin.readLineSync();

  bool isPalindrome = true; //flag 
  for (int i = 0; i < inputString!.length ~/ 2; i++) {
    if (inputString[i] != inputString[inputString.length - i - 1]) {
      isPalindrome = false;
      break;
    }
  }

  if (isPalindrome) {
    print("The string is a palindrome.");
  } else {
    print("The string is not a palindrome.");
  }
}
