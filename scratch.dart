void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String result;

  /// data gets returned to this variable as its the initialisation variable

  String test = await task2(result);
  task3(result);

  /// you cant pass the result parameter in there you have to create another variable like  the test variable
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2(String result) async {
  Duration threeSeconds = Duration(seconds: 3);
  //String result;
  await Future.delayed(threeSeconds, () {
    result = 'ji';
    print('Task 2 complete $result');
  });

  return result;
}

void task3(result) {
  //String result = 'task 3 data';
  print('Task 3 complete $result');
}
