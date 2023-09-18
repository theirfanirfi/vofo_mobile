import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/calls/conversation/GetConversations.dart';
import 'package:my_vofo/models/Conversation.dart';
import 'package:my_vofo/view/page/profile%20screens/profile.dart';
import 'package:my_vofo/view/widgets/simple_text_form_field.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _Message();
}

class _Message extends State<Message> {
  List<Conversation> _conversations = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchConversations();
  }

  _fetchConversations() async {
    List<Conversation> conversations = await getConversations();
    print('_fetch conversations');
    // print(voiceRecords.first.voice_record);
    setState(() {
      _conversations= conversations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            'Messages',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: Color.fromRGBO(59, 59, 59, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                      height: 45,
                      child: SimpleTextFormField(
                        obscureText: false,
                        hintText: 'Search Messages',
                        maxLength: 0,
                        isSearch: true,
                        callBack: (val) => print(val),
                      )),
                ),
                ListView.builder(
                    itemCount: _conversations.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      var conversation = _conversations[index];
                      return ListTile(
                        leading: GestureDetector(
                          onTap: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile(isMe: conversation.amIuserOne)))),
                          child: CircleAvatar(
                            radius: 22,
                            backgroundImage: NetworkImage(
                                'https://media.istockphoto.com/id/1300972574/photo/millennial-male-team-leader-organize-virtual-workshop-with-employees-online.jpg?b=1&s=170667a&w=0&k=20&c=96pCQon1xF3_onEkkckNg4cC9SCbshMvx0CfKl2ZiYs='),
                          ),
                        ),
                        title: Text(
                          conversation.amIuserOne ? conversation.userTwoInfo.name : conversation.userOneInfo.name,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(59, 59, 59, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          'Sent a Message',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(89, 101, 111, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Text(
                          conversation.created_at.toString(),
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(89, 101, 111, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
