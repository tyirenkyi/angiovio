import 'package:angiovio/providers/drug_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jiffy/jiffy.dart';

import '../providers/drug.dart';

class DrugItem extends StatefulWidget {
  final onTap;
  DrugItem(this.onTap);

  @override
  _DrugItemState createState() => _DrugItemState();
}

class _DrugItemState extends State<DrugItem> {
  var color = Colors.black;
  String nextDoseTime = '7:00 am';

  updateDrug(String name, int nextDose) {
    Provider.of<DrugProvider>(context, listen: false).setNextDose(name, nextDose);
  }

  determineNextDoseTime(Drug drug) {
    switch(drug.repeats) {
      case 4:
        repeatScenarioFour(drug);
        break;
      case 3:
        repeatScenarioThree(drug);
        break;
      case 2:
        repeatScenarioTwo(drug);
        break;
      case 1:
        repeatScenarioOne(drug);
        break;
    }
  }

  repeatScenarioFour(Drug drug) {
    if(Jiffy().hour < 1) {
      determineHoursToNextDose(1);
      setState(() {
        nextDoseTime = '1:00 am';
      });
      updateDrug(drug.name, 1);
    } else if(Jiffy().hour < 7) {
      determineHoursToNextDose(7);
      setState(() {
        nextDoseTime = '7:00 am';
      });
      updateDrug(drug.name, 7);
    } else if(Jiffy().hour < 13) {
      determineHoursToNextDose(13);
      setState(() {
        nextDoseTime = '1:00 pm';
      });
      updateDrug(drug.name, 13);
    } else if(Jiffy().hour < 19) {
      determineHoursToNextDose(19);
      setState(() {
        nextDoseTime = '7:00 pm';
      });
      updateDrug(drug.name, 19);
    } else {
      determineHoursToNextDose(7);
      setState(() {
        nextDoseTime = '7:00 am';
      });
      updateDrug(drug.name, 7);
    }
  }

  repeatScenarioThree(Drug drug) {
    if(Jiffy().hour < 7) {
      determineHoursToNextDose(7);
      setState(() {
        nextDoseTime = '7:00 am';
      });
      updateDrug(drug.name, 7);
    } else if(Jiffy().hour < 15) {
      determineHoursToNextDose(15);
      setState(() {
        nextDoseTime = '3:00 pm';
      });
      updateDrug(drug.name, 15);
    } else if(Jiffy().hour < 23) {
      determineHoursToNextDose(23);
      setState(() {
        nextDoseTime = '11:00 pm';
      });
      updateDrug(drug.name, 23);
    } else {
      determineHoursToNextDose(7);
      setState(() {
        nextDoseTime = '7:00 am';
      });
      updateDrug(drug.name, 7);
    }
  }

  repeatScenarioTwo(Drug drug) {
    if(Jiffy().hour < 7) {
      determineHoursToNextDose(7);
      setState(() {
        nextDoseTime = '7:00 am';
      });
      updateDrug(drug.name, 7);
    } else if(Jiffy().hour < 19) {
      determineHoursToNextDose(19);
      setState(() {
        nextDoseTime = '7:00 pm';
      });
      updateDrug(drug.name, 19);
    } else {
      determineHoursToNextDose(7);
      setState(() {
        nextDoseTime = '7:00 am';
      });
      updateDrug(drug.name, 7);
    }
  }

  repeatScenarioOne(Drug drug) {
    determineHoursToNextDose(7);
    setState(() {
      nextDoseTime = '7:00 am';
    });
    updateDrug(drug.name, 7);
  }

  determineHoursToNextDose(int nextDose) {
    var now = Jiffy();
    var later = Jiffy().startOf(Units.HOUR).add(hours: nextDose - now.hour);
    var difference = later.diff(now, Units.MINUTE); // difference in minutes
    determineBackgroundColor(difference.abs());
  }

  determineBackgroundColor(difference) {
    if(difference <= 30)
      setBackgroundColor(Color.fromRGBO(255, 113, 113, 1));
    else if(difference <= 60)
      setBackgroundColor(Color.fromRGBO(255, 193, 7, 1));
    else if(difference <= 120)
      setBackgroundColor(Color.fromRGBO(255, 235, 153, 1));
  }

  setBackgroundColor(backgroundColor) {
    setState(() {
      color = backgroundColor;
    });
  }

  @override
  void initState() {
    final drug = Provider.of<Drug>(context, listen: false);
    determineNextDoseTime(drug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final drug = Provider.of<Drug>(context, listen: false);
    return GestureDetector(
      onTap: () {
        widget.onTap(drug);
      },
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
        decoration: BoxDecoration(
          color: color,
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
                    drug.name,
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
                      child: SizedBox(
                        width: 65,
                        child: Text(
                          nextDoseTime,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(230, 230, 230, 1),
                          ),
                        ),
                      ),
                    ),  //next dosage
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Icon(Icons.dynamic_feed, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: SizedBox(
                        width: 90,
                        child: Text(
                          'every ${drug.interval} hours',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(230, 230, 230, 1)
                          ),
                        ),
                      ),
                    ), //dosage interval
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Icon(Icons.medication, color: Colors.white),
                    ),
                    Text(
                      '${drug.dosage}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(230, 230, 230, 1)
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
