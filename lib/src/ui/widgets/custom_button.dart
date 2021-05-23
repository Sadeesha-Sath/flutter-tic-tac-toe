import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final onPressed;

  const CustomButton({Key? key, required this.text, required this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.grey.shade100,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey.shade100, fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ],
            ),
          ),
        ),
        // child: ListTile(
        //   leading: Icon(
        //     icon,
        //     color: Colors.grey.shade100,
        //   ),
        //   title: Text(
        //     text,
        //     style: TextStyle(color: Colors.grey.shade100, fontWeight: FontWeight.w500),
        //   ),
        // ),
      ),
    );
  }
}
