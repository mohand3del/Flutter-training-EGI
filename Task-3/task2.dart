import 'dart:io';

void main() {
  print("Enter num of element");
  int? n = int.parse(stdin.readLineSync()!);
  List<int>? elements = [n];
  for (var i = 0; i < n; i++) {
    print("Enter element5: ");
    int NumberElement = int.parse(stdin.readLineSync()!.trim());
    elements.add(NumberElement);
  }
  print("Elements entered: ");
  for (var x in elements) {
    if (n < 5) {
      print(x);
    }
  }
}
