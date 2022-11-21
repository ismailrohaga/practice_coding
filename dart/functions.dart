// ignore_for_file: todo

// TODO: check what's the implication of not expressing the return type in main function
// in default, dart has this 'main' function as its primary 'entry point'
main(List<String> args) {
  // add the optional List param as an argument
  printer(args);

  // calling a function
  printer(helloWorld() + ' ' + greetings());

  // example of named parameters
  // print(add(1, 2)); can't be done, named param must be explicitly assigned
  printer(add(param2: 2, param1: 1));
  printer(add(param2: 6));
  printer(getX(2, 2));
  printer(getX(2, 2, 3));

  anotherPrinter(printer('this is crazy'));

  const callsign = ['alpha', 'beta', 'charlie'];

  // another example of passing a function to a function
  callsign.forEach(printer);

  // anonymous function, IMO not so 'anonymous' afterall
  callsign.forEach((element) {
    print(element);
  });
}

printer(arg) => print('this: ${arg}');

String helloWorld() {
  return "Hello, world!";
}

// act just the same like helloWorld() functions,
// for functions that are just containing one expression can use this 'fat arrow' syntax
// it's also can be declared without expressing the return type
greetings() => "Greetings, world!";

// example of named parameters, that are having an optional and mandatory parameter
add({int param1 = 0, required int param2}) => param1 + param2;

// example of positional parameters with an optional positional parameter
getX(int param1, int param2, [int param3 = 1]) => param1 + param2 * param3;

// even a function can be passed as a parameter
anotherPrinter(printer) => printer;
