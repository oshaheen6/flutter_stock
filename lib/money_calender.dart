import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stock/cubit/cubit/money_managment_cubit.dart';

class MoneyCalender extends StatelessWidget {
  const MoneyCalender({Key? key}) : super(key: key);
   

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<MoneyManagmentCubit, MoneyManagmentState>(
        builder: (context, state) {
          if(state is InitialMonth){
          var currentMonth = state.currentState;
      return MaterialApp(
        home: Scaffold(
          body: Row(
            children: [
              IconButton(
                onPressed: () =>
                    BlocProvider.of<MoneyManagmentCubit>(context).increment(),
                icon: const Icon(Icons.arrow_upward_rounded),
              ),
              Text(currentMonth,
                  style: Theme.of(context).textTheme.headline2),
              IconButton(
                  onPressed: () =>
                      BlocProvider.of<MoneyManagmentCubit>(context).decrement(),
                  icon: const Icon(Icons.arrow_downward_rounded))
            ],
          ),
        ),
      );
    }if(state is MonthChange){
      var currentMonth = state.currentState;
      return  MaterialApp(
        home: Scaffold(
          body: Row(
            children: [
              const Text('testing git hub'),
              const Text('Osama'),
              IconButton(
                onPressed: () =>
                    BlocProvider.of<MoneyManagmentCubit>(context).increment(),
                icon: const Icon(Icons.arrow_upward_rounded),
              ),
              Text(currentMonth,
                  style: Theme.of(context).textTheme.headline2),
              IconButton(
                  onPressed: () =>
                      BlocProvider.of<MoneyManagmentCubit>(context).decrement(),
                  icon: const Icon(Icons.arrow_downward_rounded))
            ],
          ),
        ),
      );
    }else{
      return Container();
    }});
  }
}
