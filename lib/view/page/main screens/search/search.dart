import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/view/widgets/longs.dart';
import 'package:my_vofo/view/widgets/my_vos.dart';
import 'package:my_vofo/view/widgets/simple_text_form_field.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Padding(padding: const EdgeInsets.all(8.0), child: Container(
              height: 45,
              child: SimpleTextFormField(
                obscureText: false,
                hintText: 'Search MyVo',
                maxLength: 0,
                isSearch: true, callBack: (String ) {  },
              ))),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80'),
              ),
            )
          ],
          bottom: TabBar(
              controller: _tabController,
              indicatorColor: Color.fromRGBO(0, 159, 183, 1),
              labelColor: Color.fromRGBO(59, 59, 59, 1),
              unselectedLabelColor: Color.fromRGBO(59, 59, 59, 1),
              labelStyle: GoogleFonts.inter(
                textStyle: TextStyle(
                    color: Color.fromRGBO(59, 59, 59, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                    overflow: TextOverflow.ellipsis),
              ),
              labelPadding: EdgeInsets.fromLTRB(1, 1, 1, 1),
              tabs: [
                Tab(
                  text: 'For You',
                ),
                Tab(
                  text: 'Trending',
                ),
                Tab(
                  text: 'Profiles',
                  
                ),
                Tab(
                  text: 'Tags',
                ),
                Tab(
                  text: 'MyVos',
                ),
                Tab(
                  text: 'Longs',
                ),
              ]),
        ),
        body: SingleChildScrollView(
          child: (Column(
            children: [
              // MyVos(voice: null,),
              // MyVos(
              //   isThread: true, voice: null,
              // ),
              Longs(),
              Longs(
                isPromoted: true,
              ),
              // MyVos(
              //   isThread: true,
              // ),
              // MyVos(),
              Longs(),
              Longs(
                isPromoted: true,
              ),
              // MyVos(
              //   isThread: true,
              // ),
              // MyVos(),
              Longs(),
              Longs(
                isPromoted: true,
              )
            ],
          )),
        ),
      ),
    );
  }
}
