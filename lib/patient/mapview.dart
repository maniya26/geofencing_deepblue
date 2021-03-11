import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapView extends StatefulWidget {
  static const String id = 'MapView';
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        color: Colors.white,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
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
                          child: Container(
                            // alignment: Alignment.center,
                            child: IconButton(
                              icon: Icon(
                                Icons.accessibility,
                                color: Colors.blueAccent,
                              ),
                              onPressed: null,
                              tooltip: 'add new patient info',
                              // padding: EdgeInsets.only(right: 50.0),
                              iconSize: 35.0,
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
                          // alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(
                              Icons.accessibility,
                              color: Colors.blueAccent,
                            ),
                            onPressed: null,
                            tooltip: 'add new patient info',
                            // padding: EdgeInsets.only(right: 50.0),
                            iconSize: 35.0,
                          ),
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
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/geofencing_room1.png'),
                      ),
                    ),
                  ),
                  Container(
                    // alignment: Alignment.center,
                    child: IconButton(
                      icon: Icon(
                        Icons.accessibility,
                        color: Colors.red,
                      ),
                      onPressed: null,
                      tooltip: 'add new patient info',
                      // padding: EdgeInsets.only(right: 50.0),
                      iconSize: 35.0,
                    ),
                  )
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
                          // alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(
                              Icons.accessibility,
                              color: Colors.yellow,
                            ),
                            onPressed: null,
                            tooltip: 'add new patient info',
                            // padding: EdgeInsets.only(right: 50.0),
                            iconSize: 35.0,
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
                                  'assets/images/geofencing_room4.png'),
                            ),
                          ),
                        ),
                        Container(
                          // alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(
                              Icons.accessibility,
                              color: Colors.yellow,
                            ),
                            onPressed: null,
                            tooltip: 'add new patient info',
                            // padding: EdgeInsets.only(right: 50.0),
                            iconSize: 35.0,
                          ),
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
    );
  }
}
