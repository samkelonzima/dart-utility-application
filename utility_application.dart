import 'dart:convert';
import 'dart:io';

void main() async {
  print("Welcome to the Dart Utility Application!");

  // 1. String Manipulation
  print("\nEnter a string to manipulate:");
  String input = stdin.readLineSync() ?? '';
  print("Choose an operation:\n1. Concatenate\n2. Reverse\n3. Change Case");
  int choice = int.parse(stdin.readLineSync() ?? '1');

  String result;
  switch (choice) {
    case 1:
      print("Enter another string to concatenate:");
      String secondInput = stdin.readLineSync() ?? '';
      result = concatenateStrings(input, secondInput);
      break;
    case 2:
      result = reverseString(input);
      break;
    case 3:
      result = changeCase(input);
      break;
    default:
      result = input;
  }
  print("Result: $result");

  // 2. Collections (List, Set, Map)
  List<String> stringList = [input, result];
  Set<String> uniqueStrings = stringList.toSet();
  Map<String, String> stringMap = {input: result};

  print("\nList: $stringList");
  print("Set (unique values): $uniqueStrings");
  print("Map (original -> result): $stringMap");

  // 3. File Handling (Read from one file, write to another)
  await handleFileOperations(result);

  // 4. Date and Time Operations
  DateTime now = DateTime.now();
  DateTime entryTime = DateTime.parse("2023-01-01 12:00:00");
  Duration difference = now.difference(entryTime);
  print("\nCurrent Date and Time: $now");
  print("Difference with Jan 1, 2023: ${difference.inDays} days");

  print("\n--- End of Application ---");
}

// String Manipulation Functions
String concatenateStrings(String first, String second) => first + second;
String reverseString(String str) => str.split('').reversed.join();
String changeCase(String str) {
  return str.split('').map((char) {
    return char == char.toUpperCase() ? char.toLowerCase() : char.toUpperCase();
  }).join();
}

// File Handling Function
Future<void> handleFileOperations(String content) async {
  try {
    // Write to file
    String filePath = 'output.txt';
    File file = File(filePath);
    await file.writeAsString(content);
    print("\nContent written to $filePath");

    // Read from file
    String fileContent = await file.readAsString();
    print("Read from file: $fileContent");
  } catch (e) {
    print("File operation error: $e");
  }
}
