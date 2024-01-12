import 'package:bloc/bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:equatable/equatable.dart';
part 'money_managment_state.dart';

class MoneyManagmentCubit extends Cubit<MoneyManagmentState> {
  MoneyManagmentCubit()
      : super(InitialMonth(
          currentState: Jiffy.now().format(pattern: "MMMM dd"),
        ));

  void increment() { updateTheMonth(1);}
  void decrement(){ updateTheMonth(-1);}

    void updateTheMonth(int num){
      var currentState ="";
      var currentMonth = Jiffy.now().format(pattern: 'MMMM dd');

    if (state is InitialMonth || state is MonthChange) {
      if(state is InitialMonth){
       currentState = (state as InitialMonth).currentState;}else{
        currentState = (state as MonthChange).currentState;
      }
      var updatedState =
          Jiffy.parse(currentState,pattern: "MMMM dd").add(months: num).format(pattern: "MMMM dd");
emit(MonthChange(currentState: updatedState));
      var isCurrentMonth = Jiffy.parse(updatedState, pattern: "MMMM dd").isSame(Jiffy.parse(currentMonth,pattern: 'MMMM dd'));

      if (isCurrentMonth){
      emit(InitialMonth(currentState: updatedState));
 
      
    }    
}
    }
}