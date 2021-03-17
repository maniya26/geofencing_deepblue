import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geofencing_deepblue/patient/send_data_to_map.dart';

class MapView extends StatefulWidget {
  static const String id = 'MapView';

  final String currentPatient;
  MapView(this.currentPatient);
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  DatabaseReference ref = FirebaseDatabase.instance.reference();

  List<myData> roomData = [];
  var inRoom1, inRoom2, inRoom3, inRoom4, inRoom5;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDetails();

    // if(roomData.);
  }

  getDetails() async {
    await ref.child('roomview').once().then((DataSnapshot snapshot) {
      roomData.clear();
      if (snapshot.value != null) {
        try {
          var data = snapshot.value;
          // var keys = snapshot.value.keys;
          roomData.clear();

          // if (keys != null) {
          //   for (var key in keys) {
          setState(() {
            myData folderCard = new myData(
              room1_in: data['room1_in'],
              room1_out: data['room1_out'],
              room2_in: data['room2_in'],
              room2_out: data['room2_out'],
              room3_in: data['room3_in'],
              room3_out: data['room3_out'],
              room4_in: data['room4_in'],
              room4_out: data['room4_out'],
              room5_in: data['room5_in'],
              room5_out: data['room5_out'],
            );

            if (folderCard.room1_out != folderCard.room1_in &&
                folderCard.room1_out != "" &&
                folderCard.room1_in == "") {
              inRoom1 = data['room1_out'];
            }
            if (folderCard.room2_out != folderCard.room2_in &&
                folderCard.room2_out != "" &&
                folderCard.room2_in == "") {
              inRoom2 = data['room2_out'];
            }
            if (folderCard.room1_out == folderCard.room1_in) {
              inRoom1 = "";
              ref.child('roomview').update({'room1_in': ''});
              ref.child('roomview').update({'room1_out': ''});
              //    write in realtimedata base make room1_in/out null
            }
            if (folderCard.room2_out == folderCard.room2_in) {
              inRoom2 = "";
              ref.child('roomview').update({'room2_in': ''});
              ref.child('roomview').update({'room2_out': ''});
            }
            if (folderCard.room3_out != folderCard.room3_in &&
                folderCard.room3_out != "" &&
                folderCard.room3_in == "") {
              inRoom3 = data['room3_out'];
            }
            if (folderCard.room4_out != folderCard.room4_in &&
                folderCard.room4_out != "" &&
                folderCard.room4_in == "") {
              inRoom4 = data['room4_out'];
            }
            if (folderCard.room3_out == folderCard.room3_in) {
              inRoom3 = "";
              ref.child('roomview').update({'room3_in': ''});
              ref.child('roomview').update({'room3_out': ''});
            }
            if (folderCard.room4_out == folderCard.room4_in) {
              inRoom4 = "";
              ref.child('roomview').update({'room4_in': ''});
              ref.child('roomview').update({'room4_out': ''});
            }
            if (folderCard.room5_out != folderCard.room5_in &&
                folderCard.room5_out != "" &&
                folderCard.room5_in == "") {
              inRoom5 = data['room5_out'];
            }
            if (folderCard.room3_out == folderCard.room3_in) {
              inRoom5 = "";
              ref.child('roomview').update({'room5_in': ''});
              ref.child('roomview').update({'room5_out': ''});
            }

            roomData.add(folderCard);

            //  to set room values
          });
          // }

          // }
          // } else {
          //   debugPrint("eerro2 ");
          // }
        } catch (e) {
          debugPrint("eerro1 ");

          debugPrint(e.toString());
        }
      }
    });

    if (roomData == []) {
      debugPrint("lIsst is empty");
    }

    roomData.forEach((element) {
      debugPrint(element.room1_in);
      debugPrint(element.room1_out);
      debugPrint(element.room2_in);
      debugPrint(element.room2_out);
      debugPrint(element.room3_in);
      debugPrint(element.room3_out);
      debugPrint(element.room4_in);
      debugPrint(element.room4_out);
      debugPrint(element.room5_in);
      debugPrint(element.room5_out);

      debugPrint(widget.currentPatient);
    });
  }

  @override
  Widget build(BuildContext context) {
    getDetails();
    return StreamBuilder<Event>(
      stream: ref.child('roomview').onValue,
      builder: (context, snapshot) {
        return snapshot.hasData && !snapshot.hasError
            ? Scaffold(
                appBar: AppBar(
                  title: Text('Patient Location'),
                  // actions: [
                  //   IconButton(
                  //     icon: Icon(
                  //       Icons.assignment_ind_rounded,
                  //       color: Colors.white,
                  //     ),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, AddPatient.id);
                  //     },
                  //     tooltip: 'add new patient info',
                  //     padding: EdgeInsets.only(right: 50.0),
                  //     iconSize: 35.0,
                  //   ),
                  // ],
                ),
                body: Container(
                  color: Colors.grey.shade50,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              // flex: 1,
                              child: Stack(
                                fit: StackFit.expand,
                                // alignment: AlignmentDirectional.topStart,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      // padding: EdgeInsets.all(01.0),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/geofencing room3_1.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    // flex: 1,
                                    child: Container(
                                      // alignment: Alignment.center,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              child: inRoom1 != "" &&
                                                      inRoom1 ==
                                                          widget.currentPatient
                                                  ? IconButton(
                                                      icon: Center(
                                                        child: Icon(
                                                          Icons.accessibility,
                                                          color:
                                                              Colors.blueAccent,
                                                          semanticLabel:
                                                              inRoom1 != ""
                                                                  ? inRoom1
                                                                  : '',
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            ' this is room view$roomData');
                                                      },
                                                      tooltip: inRoom1,
                                                      // padding: EdgeInsets.only(right: 50.0),
                                                      iconSize: 35.0,
                                                    )
                                                  : Container()),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                fit: StackFit.expand,
                                // alignment: AlignmentDirectional.topStart,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/geofencing_room5.png'),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: inRoom2 != "" &&
                                            inRoom2 == widget.currentPatient
                                        ?
                                        // alignment: Alignment.center,
                                        IconButton(
                                            icon: Icon(
                                              Icons.accessibility,
                                              color: Colors.blueAccent,
                                              semanticLabel:
                                                  inRoom2 != '' ? inRoom2 : '',
                                            ),
                                            onPressed: null,
                                            tooltip: inRoom2,
                                            // padding: EdgeInsets.only(right: 50.0),
                                            iconSize: 35.0,
                                          )
                                        : Container(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          fit: StackFit.expand,
                          // alignment: AlignmentDirectional.topStart,
                          children: <Widget>[
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(width: 235.0),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/geofencing_room1.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: inRoom3 != "" &&
                                      inRoom3 == widget.currentPatient
                                  ?
                                  // alignment: Alignment.center,
                                  IconButton(
                                      icon: Icon(
                                        Icons.accessibility,
                                        color: Colors.blueAccent,
                                        semanticLabel:
                                            inRoom3 != "" ? inRoom3 : '',
                                      ),
                                      onPressed: null,
                                      tooltip: inRoom3,
                                      // padding: EdgeInsets.only(right: 50.0),
                                      iconSize: 35.0,
                                    )
                                  : Container(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Stack(
                                fit: StackFit.expand,
                                // alignment: AlignmentDirectional.topStart,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/geofencing room3_2.png'),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: inRoom4 != "" &&
                                            inRoom4 == widget.currentPatient
                                        ?
                                        // alignment: Alignment.center,
                                        IconButton(
                                            icon: Icon(
                                              Icons.accessibility,
                                              color: Colors.blueAccent,
                                              semanticLabel:
                                                  inRoom4 != "" ? inRoom4 : '',
                                            ),
                                            onPressed: null,
                                            tooltip: inRoom4,
                                            // padding: EdgeInsets.only(right: 50.0),
                                            iconSize: 35.0,
                                          )
                                        : Container(),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                fit: StackFit.expand,
                                // alignment: AlignmentDirectional.topStart,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/geofencing_room4.png'),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: inRoom5 != "" &&
                                            inRoom5 == widget.currentPatient
                                        ?
                                        // alignment: Alignment.center,
                                        IconButton(
                                            icon: Icon(
                                              Icons.accessibility,
                                              color: Colors.blueAccent,
                                              semanticLabel:
                                                  inRoom5 != "" ? inRoom5 : '',
                                            ),
                                            onPressed: null,
                                            tooltip: inRoom2,
                                            // padding: EdgeInsets.only(right: 50.0),
                                            iconSize: 35.0,
                                          )
                                        : Container(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ),
              );
        ;
      },
    );
  }
}
