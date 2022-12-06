import 'package:dashboard/model/extensions.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class NewestChat extends StatelessWidget {
  NewestChat({Key? key}) : super(key: key);

  String date = DateTime.now().toString().changeDateFormat();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Card(
                  color: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(159, 162, 180, 0.08),
                            border: Border(
                              left: BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                                width: 3,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: ListTile(
                              title: const Text(
                                "Haneen",
                                style: TextStyle(
                                  fontSize: 14,
                                  // fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Mulish',
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              minLeadingWidth: 11.37,
                              subtitle: Text(date),
                              leading: const Icon(Icons.face),
                              trailing: Badge(
                                elevation: 0,
                                shape: BadgeShape.circle,
                                padding: EdgeInsets.all(7),
                                badgeContent: const Text(
                                  "0",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          );
        }),
      ),
    );
  }
}
