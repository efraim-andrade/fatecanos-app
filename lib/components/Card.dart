import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Card card(
  String course,
  String teacher,
  int presences,
  int absences,
  int maxAbsenses,
  num media
) {
  return
    Card(
      child: 
        Container(
          padding: EdgeInsets.all(20),
          child:
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 6.00),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        course.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(44, 44, 44, 1),
                        ),
                      ),

                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 4),
                            child: Icon(
                              FontAwesomeIcons.solidBookmark,
                              size: 14,
                              color: Color.fromRGBO(44, 44, 44, 1),
                            ),
                          ),
                          
                          Text(
                            'média: ${media}',
                            style: TextStyle(color: Color.fromRGBO(44, 44, 44, 1),),
                          )
                        ],
                      )
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  child: Row(
                    children: <Widget>[
                      Text(
                        teacher,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  child: Divider(
                    color: Color.fromRGBO(235, 235, 235, 1),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(right: 18),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(right: 8),

                                    child: Icon(
                                      FontAwesomeIcons.userCheck,
                                      size: 14,
                                      color: Colors.blueAccent,
                                    ),
                                  ),

                                  Text(
                                    'presenças: ${presences}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blueAccent
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(right: 8),

                                    child: Icon(
                                      FontAwesomeIcons.userSlash,
                                      size: 14,
                                      color: Color.fromRGBO(221, 176, 0, 1),
                                    ),
                                  ),

                                  Text(
                                    'faltas: ${absences}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(221, 176, 0, 1)
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

                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        'você pode faltar ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300
                        ),
                      ),

                      Text(
                        '${maxAbsenses - absences} aulas ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                        ),
                      ),

                      Text(
                        '(verifique quantas aulas tem no dia)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ),
    );
}