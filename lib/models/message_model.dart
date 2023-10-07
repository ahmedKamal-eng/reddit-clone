
class Message{
  String? userName;
  String? time;
  String? text;
  int? voteNum;
  bool? isActive;
  List<Message>? replies;

  Message({required this.userName,required this.time,required this.text,required this.voteNum,required this.isActive,this.replies});
}


List<Message> messages=[
  Message(userName: "ahmed25",time: '5h',voteNum: 5,text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",isActive: false,replies: [Message(userName: "hassan",time: '3h',voteNum: 3,text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",isActive: false)]),
  Message(userName: "ali25",time: '6h',voteNum: 7,text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",isActive: true,replies: []),
  Message(userName: "hassan",time: '3h',voteNum: 3,text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",isActive: false,replies: []),
  Message(userName: "kamal",time: 'now',voteNum: 8,text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",isActive: true,replies: []),
  Message(userName: "Mohamed",time: '6h',voteNum: 9,text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ",isActive: false,replies: []),
];