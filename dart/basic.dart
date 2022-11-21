void main() {
  // greetings is inferred as String by Dart
  var greetings = "Hello, world!";

  // type annotations is optional in Dart
  String greetingsAnnotated = "Have a good day!";

  print("${greetings}, ${greetingsAnnotated}");
  // to be noted that Variables can't be declared using both 'var' and a type name.

  /**
   * Below are built-int types in Dart:
   * 
   * Numbers (int, double)
   * Strings (String)
   * Booleans (bool)
   * Lists (List, also known as arrays)
   * Sets (Set)
   * Maps (Map)
   * Runes (Runes; often replaced by the characters API)
   * Symbols (Symbol)
   * The value null (Null)
   * 
   * Other types
   * Object: The superclass of all Dart classes except Null.
   * Enum: The superclass of all enums.
   * Future and Stream: Used in asynchrony support.
   * Iterable: Used in for-in loops and in synchronous generator functions.
   * Never: Indicates that an expression can never successfully finish evaluating.
   * dynamic: Indicates that you want to disable static checking.
   * void: Indicates that a value is never used.
   */

  // null safety is added in Dart 2.12 and Flutter 2.0 or later
  // add '?' for nullable type variables
  int? score;
  score = 100;
  print(score);

  // with sound null safety is enabled,
  // it is required to initialize a non-nullable variable BEFORE USING IT
  int count = 5;
  print(count);

  // however, it's not mandatory to initialize it in the variable declaration,
  // as long as it is initialized before the usage, it's valid
  String name;
  name = "John";
  print(name);

  // with that being said, "Late Variable" is available for such a case
  // declaring a non-nullable variable that’s initialized after its declaration.
  // AKA lazily initializing a variable
  late String lateName;
  lateName = "Alpha";

  // when initializing a late variable at its declaration,
  // it will be initialized the first time it is used.
  late String city = getCity();
  print(lateName);

  // theoretically, the getCity function is only called at this point.
  // thus initializing the city variable.
  print(city);

  // variables modifier that are available other than 'late' are final and const
  // it's used for a variable that are not going to be changed.
  final type = 'boolean';
  final String tpyeAnnotated = 'boolean';
  const pi = 3.14;

  // const is used for a variable that is compile-time constant.
  // basically, const behave like final but with extra spice to it
  // TODO: learn more about final and const

  array() => [1, 2];
  //arrayFinal() => final [1, 2]; can't add the final modifier to a value
  arrayConst() =>
      const [1, 2]; // constant value, but also some kind of constructor

  // return false because it's considered as an object, and since const cant be changed
  // it's different from the basic array which can be altered anytime
  print(array() == arrayConst());

  // if the value is compared, now it will return true
  print(array()[1] == arrayConst()[1]);
}

// a function must annotate its return type.
// here the fucntion used arrow syntax
String getCity() => "Jakarta";
