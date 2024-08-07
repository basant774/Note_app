import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/constns.dart';

class customBottom extends StatelessWidget {
  const customBottom({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            color: KPrimaryColor,
            borderRadius: BorderRadius.circular(
              8,
            )),
        child: Center(
          child: Text(
            'Add',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
