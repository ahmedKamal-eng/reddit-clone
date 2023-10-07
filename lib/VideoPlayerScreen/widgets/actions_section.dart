import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottom_sheet_body.dart';

class ActionsSection extends StatefulWidget {
  const ActionsSection({
    super.key,
  });

  @override
  State<ActionsSection> createState() => _ActionsSectionState();
}

class _ActionsSectionState extends State<ActionsSection> {
  double upvotePadding = 0;
  String vote = "notVoting";
  bool upvoteClicked = false;

  double downvotePadding = 0;
  bool downvoteClicked = false;

  int voteNum = 200;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 60,
      right: 10,
      child: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if(vote == "upVote")
                {
                  vote="notVoting";
                  setState(() {

                  });
                  return;
                }
                setState(() {
                  upvotePadding = 10;
                  vote = "upVote";
                  voteNum++;
                });
                Future.delayed(Duration(milliseconds: 400), () {
                  upvotePadding = 0;
                  setState(() {});
                });
              },
              // Color(0xffFE4200)
              child: AnimatedPadding(
                padding: EdgeInsets.only(bottom: upvotePadding),
                duration: Duration(milliseconds: 200),
                child: vote == 'upVote'
                    ? SvgPicture.asset(
                        'assets/svg/up-vote.svg',
                        color: Color(0xfffe4200),
                        width: 30,
                      )
                    : SvgPicture.asset(
                        'assets/svg/upvote.svg',
                        color: Colors.white,
                        width: 30,
                      ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text('${voteNum.toString()}'),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                if(vote == "downVote")
                {
                  vote="notVoting";
                  setState(() {

                  });
                  return;
                }
                setState(() {
                  downvotePadding = 10;
                  vote = 'downVote';

                  voteNum--;
                });
                Future.delayed(Duration(milliseconds: 400), () {
                  downvotePadding = 0;
                  downvoteClicked = false;

                  setState(() {});
                });
              },
              child: AnimatedPadding(
                padding: EdgeInsets.only(top: downvotePadding),
                duration: Duration(milliseconds: 200),
                child: vote == 'downVote'
                    ? SvgPicture.asset(
                        'assets/svg/down-vote.svg',
                        color: Color(0xff94B4FC),
                        width: 30,
                      )
                    : SvgPicture.asset(
                        'assets/svg/downvote.svg',
                        color: Colors.white,
                        width: 30,
                      ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomSheetBody();
                    },
                  );
                },
                icon: FaIcon(FontAwesomeIcons.message)),
            Text("50"),
            SizedBox(
              height: 20,
            ),
            IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.arrowUpFromBracket,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
