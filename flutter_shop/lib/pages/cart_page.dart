import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车')),
      body: Center(
        child: Center(
          child: Column(
            children: [
              Number(),
              MyButton()
            ],
          ),
        ),
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Provide<Counter>(
        builder: (content, child, counter) {
          return Text(
            '${counter.value}'
          );
        }
      )
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 120),
      child: RaisedButton(
        onPressed: () {
          Provide.value<Counter>(context).increment();
        },
        child: Text('递增'),
      ),
    );
  }
}


