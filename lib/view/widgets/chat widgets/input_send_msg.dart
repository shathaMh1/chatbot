import 'package:chatbot_template/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InputMsg extends StatelessWidget {
  const InputMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
                  width: 1, color: Color.fromRGBO(243, 244, 246, 1))),
        ),
        child: TextField(
            style: const TextStyle(color: kBlackColor),
            cursorColor: kBlackColor,
            decoration: InputDecoration(
                hintText: 'Write a message',
                hintStyle: const TextStyle(
                    color: Color.fromRGBO(51, 71, 91, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/SendMsg.svg',
                    width: 18,
                    height: 18,
                    fit: BoxFit.scaleDown,
                  ),
                  onPressed: () {
                    print('sending msg ..');
                  },
                ))),
      ),
    );
  }
}
