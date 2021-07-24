import 'package:flutter/material.dart';

class DrugItem extends StatelessWidget {
  final onTap;
  DrugItem(this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Losartan',
                    style: TextStyle(
                      color: Color.fromRGBO(33, 33, 33, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Icon(Icons.timer_rounded, color: Color.fromRGBO(61, 61, 61, 1)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        '19:00',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(61, 61, 61, 1)
                        ),
                      ),
                    ),  //next dosage
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Icon(Icons.dynamic_feed, color: Color.fromRGBO(61, 61, 61, 1)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        'daily',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(61, 61, 61, 1)
                        ),
                      ),
                    ), //dosage interval
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Icon(Icons.medication, color: Color.fromRGBO(61, 61, 61, 1)),
                    ),
                    Text(
                      '2.5mg',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(61, 61, 61, 1)
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: Color.fromRGBO(21, 101, 192, 0.15)
              ),
              child: Icon(Icons.done, color: Color.fromRGBO(21, 101, 192, 1)),
            )
          ],
        ),
      ),
    );
  }
}
