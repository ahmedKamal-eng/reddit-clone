import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reddit_clone/models/message_model.dart';

class CommentWidget extends StatefulWidget {
  Message message;
  CommentWidget({required this.message});

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  double _upvotePadding = 0;
  String _vote = "notVoting";
  bool _upvoteClicked = false;

  double _downvotePadding = 0;
  bool _downvoteClicked = false;
  late int votNum;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    votNum = widget.message.voteNum!;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool active = widget.message.isActive!;

    return Card(
      margin: EdgeInsets.all(8),
      color: Colors.white10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          child: FaIcon(
                            FontAwesomeIcons.redditAlien,
                            size: 20,
                            color: Colors.black54,
                          ),
                          backgroundColor: Colors.redAccent,
                        ),
                        active
                            ? Positioned(
                                bottom: -2,
                                right: -2,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.black54,
                                  child: CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Colors.greenAccent,
                                  ),
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(widget.message.userName! +
                        " . " +
                        widget.message.time!),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                    width: size.width * .6, child: Text(widget.message.text!)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (widget.message.userName == 'hassan') {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: size.height * .5,
                                  child: ListView(
                                    children: [
                                      ListTile(
                                        leading: FaIcon(
                                          FontAwesomeIcons.arrowUpFromBracket,
                                          size: 20,
                                        ),
                                        title: Text(
                                          'share',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.bookmark_add_outlined,
                                          size: 20,
                                        ),
                                        title: Text(
                                          'Save',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.notifications,
                                          size: 20,
                                        ),
                                        title: Text(
                                          'Stop reply notifications',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.copy,
                                          size: 20,
                                        ),
                                        title: Text(
                                          'copy text',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.close_fullscreen_sharp,
                                          size: 20,
                                        ),
                                        title: Text(
                                          'collapse thread',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.edit,
                                          size: 20,
                                        ),
                                        title: Text(
                                          'Edite',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'you can not restore comments that have been deleted'),
                                                  title: Text('Are You sure'),
                                                  backgroundColor:
                                                      Colors.black38,
                                                  actions: [
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 30),
                                                        child: Text("CANCEL"),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors
                                                                      .white10),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 30),
                                                        child: Text("DELETE"),
                                                      ),
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor: Color(0xfffe4200),
                                                     ),
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.delete_outline_rounded,
                                            size: 20,
                                          ),
                                          title: Text(
                                            'delete',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          child: Center(
                                              child: Text(
                                            'Close',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white10),
                                          height: 40,
                                          width: size.width * .8,
                                          margin: EdgeInsets.all(15),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        },
                        icon: Icon(
                          Icons.more_horiz,
                          color: Colors.white54,
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    SvgPicture.asset(
                      "assets/svg/reply.svg",
                      height: 25,
                      color: Colors.white54,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_vote == "upVote") {
                          _vote = "notVoting";
                          setState(() {});
                          return;
                        }
                        setState(() {
                          _upvotePadding = 10;
                          _vote = "upVote";
                          votNum++;
                        });
                        Future.delayed(Duration(milliseconds: 400), () {
                          _upvotePadding = 0;
                          setState(() {});
                        });
                      },
                      // Color(0xffFE4200)
                      child: AnimatedPadding(
                        padding: EdgeInsets.only(bottom: _upvotePadding),
                        duration: Duration(milliseconds: 200),
                        child: _vote == 'upVote'
                            ? SvgPicture.asset(
                                'assets/svg/up-vote.svg',
                                color: Color(0xfffe4200),
                                width: 20,
                              )
                            : SvgPicture.asset(
                                'assets/svg/upvote.svg',
                                color: Colors.white54,
                                width: 20,
                              ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('${votNum.toString()}'),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_vote == "downVote") {
                          _vote = "notVoting";
                          setState(() {});
                          return;
                        }
                        setState(() {
                          _downvotePadding = 10;
                          _vote = 'downVote';

                          votNum--;
                        });
                        Future.delayed(Duration(milliseconds: 400), () {
                          _downvotePadding = 0;
                          _downvoteClicked = false;

                          setState(() {});
                        });
                      },
                      child: AnimatedPadding(
                        padding: EdgeInsets.only(top: _downvotePadding),
                        duration: Duration(milliseconds: 200),
                        child: _vote == 'downVote'
                            ? SvgPicture.asset(
                                'assets/svg/down-vote.svg',
                                color: Color(0xff94B4FC),
                                width: 20,
                              )
                            : SvgPicture.asset(
                                'assets/svg/downvote.svg',
                                color: Colors.white54,
                                width: 20,
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (widget.message.userName == "ahmed25")
              Row(
                children: [
                  SizedBox(
                    width: size.width * .02,
                  ),
                  Container(
                    color: Colors.white10,
                    width: 1,
                    height: 90,
                  ),
                  SizedBox(
                    width: size.width * .02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                child: FaIcon(
                                  FontAwesomeIcons.redditAlien,
                                  size: 20,
                                  color: Colors.black54,
                                ),
                                backgroundColor: Colors.redAccent,
                              ),
                              Positioned(
                                bottom: -2,
                                right: -2,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.black54,
                                  child: CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Colors.greenAccent,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(messages[2].userName! +
                              " . " +
                              messages[2].time!),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                          width: size.width * .6,
                          child: Text(messages[2].text!)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.more_horiz,
                            color: Colors.white54,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset(
                            "assets/svg/reply.svg",
                            height: 25,
                            color: Colors.white54,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              // if(_vote == "upVote")
                              // {
                              //   _vote="notVoting";
                              //   setState(() {
                              //
                              //   });
                              //   return;
                              // }
                              // setState(() {
                              //   _upvotePadding = 10;
                              //   _vote = "upVote";
                              //   votNum++;
                              // });
                              // Future.delayed(Duration(milliseconds: 400), () {
                              //   _upvotePadding = 0;
                              //   setState(() {});
                              // });
                            },
                            // Color(0xffFE4200)
                            child: SvgPicture.asset(
                              'assets/svg/upvote.svg',
                              color: Colors.white54,
                              width: 20,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('1'),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              // if(_vote == "downVote")
                              // {
                              //   _vote="notVoting";
                              //   setState(() {
                              //
                              //   });
                              //   return;
                              // }
                              // setState(() {
                              //   _downvotePadding = 10;
                              //   _vote = 'downVote';
                              //
                              //   votNum--;
                              // });
                              // Future.delayed(Duration(milliseconds: 400), () {
                              //   _downvotePadding = 0;
                              //   _downvoteClicked = false;
                              //
                              //   setState(() {});
                              // });
                            },
                            child: SvgPicture.asset(
                              'assets/svg/downvote.svg',
                              color: Colors.white54,
                              width: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
