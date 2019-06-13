import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

handleAbsensesThermometer(int absenses) {
  var colorThermomether = {
    'low': Color.fromRGBO(34, 179, 85, 1),
    'medium': Color.fromRGBO(221, 176, 0, 1),
    'high': Color.fromRGBO(255, 71, 15, 1),
  };

  if (absenses <= 8) return colorThermomether['low'];
  if (absenses > 8 && absenses <=14) return colorThermomether['medium'];
  if (absenses > 14 ) return colorThermomether['high'];
}

Card card(
  String course,
  String teacher,
  int presences,
  int absences,
  int maxAbsenses,
  num grade
) {
  return
    Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
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
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            course.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(44, 44, 44, 1),
                            ),
                          ),
                        ),
                      ),

                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 4),
                            child: Icon(
                              FontAwesomeIcons.solidBookmark,
                              size: 11,
                              color: Color.fromRGBO(44, 44, 44, 1),
                            ),
                          ),

                          Container(
                            width: 50,
                            child: Text(
                              'média: ${grade}',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color.fromRGBO(44, 44, 44, 1),
                                fontSize: 11
                              ),
                            )
                          ),
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
                          fontSize: 11
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
                                      size: 11,
                                      color: Colors.blueAccent,
                                    ),
                                  ),

                                  Text(
                                    'presenças: ${presences}',
                                    style: TextStyle(
                                      fontSize: 13,
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
                                      size: 11,
                                      color: handleAbsensesThermometer(absences),
                                    ),
                                  ),

                                  Text(
                                    'faltas: ${absences}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: handleAbsensesThermometer(absences)
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
                          fontWeight: FontWeight.w600,
                          color: handleAbsensesThermometer(absences)
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
