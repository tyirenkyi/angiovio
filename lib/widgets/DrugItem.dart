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
        padding: EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(4))
        ),
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
                      color: Colors.white,
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
                      child: Icon(Icons.timer_rounded, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        '19:00',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey
                        ),
                      ),
                    ),  //next dosage
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Icon(Icons.dynamic_feed, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        'daily',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey
                        ),
                      ),
                    ), //dosage interval
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Icon(Icons.medication, color: Colors.white),
                    ),
                    Text(
                      '2.5mg',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey
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
