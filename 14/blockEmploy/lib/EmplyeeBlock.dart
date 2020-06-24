// when Ever we implements Block we have to do following things

//TODO: imports

//TODO: StramController

//TODO:Stream Sink Getter

//TODO: Add data listne to changes

//TODO: Core Functionality

//TODO: dispose



import 'dart:async';
import 'package:blockEmploy/Employee.dart';


class EmployeeBloc{


  //sink to get in pipe
  //stream to get data from pipe
  List<Emplyee> _employeeList =[
    Emplyee(1, "First", 10000.0),
    Emplyee(2, "Second", 20000.0),
    Emplyee(3, "Third", 30000.0),
    Emplyee(4, "Fourth", 40000.0),
    Emplyee(5, "Fifth", 50000.0)
  ];


  final _employeeListStreamController = StreamController<List<Emplyee>>();
 
  // for increment and decrement
  final _employeeSalaryIncrementSteamController = StreamController<Emplyee>();
  final _employeeSalaryDecrementSteamController = StreamController<Emplyee>();


  //getters
  Stream<List<Emplyee>> get employeeListStream => _employeeListStreamController.stream;

  StreamSink<List<Emplyee>> get employeeListSink => _employeeListStreamController.sink;

  StreamSink<Emplyee> get employeeSalaryIncrement =>  _employeeSalaryIncrementSteamController.sink;
  StreamSink<Emplyee> get employeeSalaryDecrement =>  _employeeSalaryDecrementSteamController.sink;

  EmployeeBloc(){
    _employeeListStreamController.add(_employeeList);
    _employeeSalaryIncrementSteamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementSteamController.stream.listen(_decrementSalary);
  }


  _incrementSalary(Emplyee employee){
    double salary = employee.salary;

    double incrementedSlalary = salary * 20/100;

    _employeeList[employee.id-1].salary = salary + incrementedSlalary;

    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Emplyee employee){
    double salary = employee.salary;

    double decrementedSlalary = salary * 20/100;

    _employeeList[employee.id-1].salary = salary - decrementedSlalary;

    employeeListSink.add(_employeeList);
  }

  void dispose(){
    _employeeListStreamController.close();
    _employeeSalaryDecrementSteamController.close();
    _employeeSalaryIncrementSteamController.close();
  }

}