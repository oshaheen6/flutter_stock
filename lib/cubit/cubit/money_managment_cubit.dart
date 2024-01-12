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
    if (state is InitialMonth || state is MonthChange) {
      var currentMonth = Jiffy.now().format(pattern: 'MMMM dd');
      var currentState = (state as InitialMonth).currentState;
      var updatedState =
          Jiffy.parse(currentState,pattern: "MMMM dd").add(months: 1).format(pattern: "MMMM dd");

      var isCurrentMonth = Jiffy.parse(updatedState, pattern: "MMMM dd").isSame(Jiffy.parse(currentMonth,pattern: 'MMMM dd'));

      if (isCurrentMonth){
      emit(InitialMonth(currentState: updatedState));
 
      emit(MonthChange(currentState: updatedState));
    }else if(state is MonthChange){
      
      var currentState = (state as MonthChange).currentState;
      var updatedState =
          Jiffy.parse(currentState,pattern: "MMMM dd").add(months: 1).format(pattern: "MMMM dd");
  
}else{
emit(MonthChange(currentState: updatedState));
}
        
    }
  }
  void decrement(){
    if (state is InitialMonth) {
      var currentState = (state as InitialMonth).currentState;
      var updatedState =
          Jiffy.parse(currentState,pattern: "MMMM dd").subtract(months: 1).format(pattern: "MMMM dd");
      emit(MonthChange(currentState: updatedState));
    }else if(state is MonthChange){
      var currentMonth = Jiffy.now().format(pattern: 'MMMM dd');
      var currentState = (state as MonthChange).currentState;
      var updatedState =
          Jiffy.parse(currentState,pattern: "MMMM dd").subtract(months: 1).format(pattern: "MMMM dd");
 var isCurrentMonth = Jiffy.parse(updatedState, pattern: "MMMM dd").isSame(Jiffy.parse(currentMonth,pattern: 'MMMM dd'));

if (isCurrentMonth){
  emit(InitialMonth(currentState: updatedState));
  
}else{
emit(MonthChange(currentState: updatedState));
}
        
    }
}

}