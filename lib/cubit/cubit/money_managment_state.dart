part of 'money_managment_cubit.dart';

abstract class MoneyManagmentState extends Equatable {
  const MoneyManagmentState();
}

class InitialMonth extends MoneyManagmentState {
  final String currentState;
  const InitialMonth({
    required this.currentState,
  });

  @override
  List<Object?> get props => [currentState];
}

class MonthChange extends MoneyManagmentState {
  final String currentState;
  const MonthChange({required this.currentState});
  @override
  List<Object?> get props => [currentState];
}
