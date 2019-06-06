import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/Card.dart';
import '../components/Input.dart';
import '../components/UserInfo.dart';
import '../components/CreateBigWallModal.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key); // prop-types

  @override
  Home createState() => Home();
}

class Home extends State<HomePage> {
  TextEditingController searchController = new TextEditingController();
  TextEditingController courseController = new TextEditingController();
  TextEditingController bigWallDayController = new TextEditingController();

  var name = '';
  var course = '';
  var period = '';
  var avatar = '';

  @override
  void initState() {
    super.initState();

    final Firestore db = Firestore.instance;

    var userInfo = db.collection('user').document('1310481711001').get();

    print('chegou aqui');
    userInfo.then((doc) {
      setState(() {
        name = doc.data['name'];
        course = doc.data['course'];
        period = doc.data['period'];
        avatar = doc.data['avatar'];
      });
    });
  }

  openBigWallModal() {
    showDialog(
        context: context,
        child: createBigWallModal(courseController, bigWallDayController));
  }

  var courses = [
    {
      "course": "Laboratorio de Engenharia de Software IV",
      "teacher": "Danilo Ruy Gomes",
      "presences": 28,
      "absenses": 12,
      "maxAbsences": 20,
      "grade": 6.6
    },
    {
      "course": "Programação Web",
      "teacher": "José Antônio Castanho de Almeida",
      "presences": 22,
      "absenses": 18,
      "maxAbsences": 20,
      "grade": 2
    },
    {
      "course": "Engenharia de Software IV",
      "teacher": "Danilo Ruy Gomes",
      "presences": 28,
      "absenses": 12,
      "maxAbsences": 20,
      "grade": 4.5
    },
    {
      "course": "Programação Web",
      "teacher": "José Antônio Castanho de Almeida",
      "presences": 22,
      "absenses": 18,
      "maxAbsences": 20,
      "grade": 2
    },
    {
      "course": "Engenharia de Software IV",
      "teacher": "Danilo Ruy Gomes",
      "presences": 28,
      "absenses": 12,
      "maxAbsences": 20,
      "grade": 10
    },
    {
      "course": "Programação Web",
      "teacher": "José Antônio Castanho de Almeida",
      "presences": 22,
      "absenses": 18,
      "maxAbsences": 20,
      "grade": 2
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            color: Colors.black87,
            icon: Icon(
              CommunityMaterialIcons.bell,
              size: 30,
            ),
            onPressed: () {
              print("pressed");
            },
          )
        ],
        leading: IconButton(
          color: Colors.deepOrangeAccent,
          icon: Icon(
            CommunityMaterialIcons.wall,
            size: 30,
          ),
          onPressed: () {
            openBigWallModal();
          },
        ),
      ),
      body: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(250, 250, 250, 1)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: userInfo(name, avatar, course),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: input(
                            searchController, true, false, "Buscar matéria"),
                      ),
                      Flexible(
                        flex: 0,
                        child: Container(
                          width: 40,
                          child: IconButton(
                            onPressed: () {
                              print("pressed");
                            },
                            icon: Icon(
                              FontAwesomeIcons.sync,
                              size: 14,
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  // child: StreamBuilder(
                  //   stream: Firestore.instance.collection('user').document('1310481711001').snapshots(),
                  //   builder: (context, snapshot) {
                  //     if(!snapshot.hasData) return const Text("Loading...");

                  //     return ListView.builder(
                  //       itemCount: snapshot.data.documents.length,
                  //       itemBuilder: (context, index) {
                  //         return Container(
                  //           margin: const EdgeInsets.only(bottom: 8),
                  //           child: card(
                  //             snapshot.data.documents[index]["course"],
                  //             snapshot.data.documents[index]["teacher"],
                  //             snapshot.data.documents[index]["presences"],
                  //             snapshot.data.documents[index]["absenses"],
                  //             snapshot.data.documents[index]["maxAbsences"],
                  //             snapshot.data.documents[index]["grade"],
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   },
                  // ),
                  child: ListView.builder(
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: card(
                          courses[index]["course"],
                          courses[index]["teacher"],
                          courses[index]["presences"],
                          courses[index]["absenses"],
                          courses[index]["maxAbsences"],
                          courses[index]["grade"],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
