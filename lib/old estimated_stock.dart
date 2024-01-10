import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class MoneyCalender extends StatefulWidget {
  const MoneyCalender({Key? key}) : super(key: key);

  @override
  MoneyCalenderState createState() => MoneyCalenderState();
}

class MoneyCalenderState extends State<MoneyCalender> {
  var db = FirebaseFirestore.instance;
  var currentMM1 = Jiffy.now();
  String currentMM = Jiffy.now().format(pattern: 'MMMM');
  var currentYear = Jiffy.now().year;

  @override
  Widget build(BuildContext context) {
    var monthYear = currentMM + currentYear.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Managament'),
      ),
      body: Column(
        children: [
          Text(monthYear),
          currentMonth(),
          const SizedBox(
            height: 20,
          ),
          money(monthYear)
        ],
      ),
    );
  }

  Widget money(t) {
    const mainCollectionPath = 'trackMoney';
    var documentPath = t;

    final mainCollectionRef = db.collection(mainCollectionPath);
    final documentRef = mainCollectionRef.doc(documentPath);

    const income = 'income';
    const expense = 'expense';

    final incomeRef = documentRef.collection(income);
    final expenseRef = documentRef.collection(expense);

// Create a new user with a first and last name
    void incomeAddition() {
      final user = <String, dynamic>{"first": "Ada"};

// Add a new document with a generated ID
      incomeRef.doc(t).set(user);
    }
    ////////////////////

    var moneyMap = {'income': 0, 'expense': 0};
    if (t == 'December2023') {
      moneyMap = {'income': 10000, 'expense': 8000};
    }
    return Column(
      children: [
        Text(moneyMap['income'].toString()),
        ElevatedButton(
            onPressed: () {
              incomeAddition();
            },
            child: const Text('send'))
      ],
    );
  }

  Widget currentMonth() {
    void addMonth() {
      setState(() {
        currentMM1 = Jiffy.parseFromJiffy(currentMM1).add(months: 1);
        currentMM = Jiffy.parseFromJiffy(currentMM1).format(pattern: 'MMMM');
        currentYear = Jiffy.parseFromJiffy(currentMM1).year;
      });
    }

    void decreaseMonth() {
      setState(() {
        currentMM1 = Jiffy.parseFromJiffy(currentMM1).subtract(months: 1);
        currentMM = Jiffy.parseFromJiffy(currentMM1).format(pattern: 'MMMM');
        currentYear = Jiffy.parseFromJiffy(currentMM1).year;
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: decreaseMonth,
          icon: const Icon(Icons.arrow_drop_down_circle),
        ),
        Row(
          children: [
            Text('$currentMM '),
            Text(currentYear.toString()),
          ],
        ),
        IconButton(
          onPressed: addMonth,
          icon: const Icon(Icons.arrow_drop_up),
        ),
      ],
    );
  }
}
