import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MarkClosedButton extends StatelessWidget {
  const MarkClosedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 9, bottom: 9),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
           backgroundColor: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children:  [
            SvgPicture.asset('images/checkMarkIcon.svg', 
             width: 14,
             height: 14,
             fit: BoxFit.scaleDown,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 6.0),
              child: Text(
                'Mark as close',
                style: TextStyle(
                  fontSize: 8,
                  color: Color.fromRGBO(54, 55, 64, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
