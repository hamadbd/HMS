import 'package:flutter/material.dart';

import 'my_constant.dart';

class TextInputForm extends StatelessWidget {
  final String text;
  final TextEditingController textEditingController;
  final bool tOrf;

  const TextInputForm({required this.text,required this.textEditingController, required this.tOrf  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border.all(
            color: accentColor,
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Visibility(
          child: TextFormField(
            obscureText: tOrf,
            controller: textEditingController,
            decoration: InputDecoration(
              labelText: text,
              border: InputBorder.none,
            ),

          ),
        ),
      ),
    );
  }
}
