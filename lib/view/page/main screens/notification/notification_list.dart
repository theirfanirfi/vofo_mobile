import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';

class NotificaionList extends StatelessWidget {
  final isImage;
  const NotificaionList({this.isImage, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(
              'https://media.istockphoto.com/id/1300972574/photo/millennial-male-team-leader-organize-virtual-workshop-with-employees-online.jpg?b=1&s=170667a&w=0&k=20&c=96pCQon1xF3_onEkkckNg4cC9SCbshMvx0CfKl2ZiYs='),
        ),
        title: Text(
          'Ronaldo',
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
          'Posted 4 MyVos',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                color: Color.fromRGBO(89, 101, 111, 1),
                fontWeight: FontWeight.w400,
                fontSize: 14.0),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            (isImage == true)
                ? Container(
                    width: 80,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(89, 101, 111, 1),
                        image: DecorationImage(
                            image: AssetImage(ImageData.Longs),
                            fit: BoxFit.cover)),
                  )
                : Text(''),
            Container(
              width: 20,
              child: PopupMenuButton(
                itemBuilder: (context) => [],
              ),
            ),
          ],
        ));
  }
}
