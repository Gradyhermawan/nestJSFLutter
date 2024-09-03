import 'package:flutter/material.dart';

class ContohMenu extends StatefulWidget {
  const ContohMenu({super.key});
 static String route="menu";
  @override
  State<ContohMenu> createState() => _ContohMenuState();
}

class _ContohMenuState extends State<ContohMenu> {
  int page=0;

  void _updatePage(int newPage) {
    setState(() {
      page = newPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          automaticallyImplyLeading: width>1000?false:true,
          title: Padding(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Logo',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Colors.black,
                    fontSize: 22,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            if(width>1000)...{
              Text("Home",
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Colors.black,
                  fontSize: 22,
                  letterSpacing: 0,
              ),),
              SizedBox(width: 8,),
              Text("Lokasi",
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Colors.black,
                  fontSize: 22,
                  letterSpacing: 0,
              ),),
              SizedBox(width: 8,),
              Text("About Us",
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Colors.black,
                  fontSize: 22,
                  letterSpacing: 0,
                ),
              ),
              SizedBox(width: 8,),
              Text("Contact",
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Colors.black,
                  fontSize: 22,
                  letterSpacing: 0,
                ),
              )
            }
          ],
          centerTitle: false,
          elevation: 2,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: width<=1000?Drawer(
          elevation: 16,
          shadowColor: Colors.red,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                // width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: colors.primary,
                ),
              ),
              ListTile(
                hoverColor: colors.background,
                selectedTileColor: colors.background,
                selected: page==0?true:false,
                title: const Text(
                  'Home',
                  style: TextStyle(
                    // color: Colors.black,
                    fontFamily: 'Outfit',
                    letterSpacing: 0,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  // color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20,
                ),
                // tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                dense: false,
                onTap: () {
                  setState(() {
                    page=0;
                  });
                  Navigator.pop(context);
                },
              ),
              const Divider(
                thickness: 1,
                // color: FlutterFlowTheme.of(context).accent4,
              ),
              ListTile(
                hoverColor: colors.background,
                selectedTileColor: colors.background,
                selected: page==1?true:false,
                title: const Text(
                  'Lokasi',
                  style: TextStyle(
                    // color: Colors.black,
                    fontFamily: 'Outfit',
                    letterSpacing: 0,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  // color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20,
                ),
                // tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                dense: false,
                onTap: () {
                  setState(() {
                    page=1;
                  });
                  Navigator.pop(context);
                },
              ),
              const Divider(
                thickness: 1,
                // color: FlutterFlowTheme.of(context).accent4,
              ),
              ListTile(
                hoverColor: colors.background,
                selectedTileColor: colors.background,
                selected: page==2?true:false,
                title: const Text(
                  'About Us',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    letterSpacing: 0,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  // color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20,
                ),
                // tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                dense: false,
                onTap: () {
                  setState(() {
                    page=2;
                  });
                  Navigator.pop(context);
                },
              ),
              const Divider(
                thickness: 1,
                // color: FlutterFlowTheme.of(context).accent4,
              ),
              ListTile(
                hoverColor: colors.background,
                selectedTileColor: colors.background,
                selected: page==3?true:false,
                title: const Text(
                  'Contact',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    letterSpacing: 0,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  // color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20,
                ),
                // tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                dense: false,
                onTap: () {
                  setState(() {
                    page=3;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ):const SizedBox(),
        body: page==0?Text("Home"):(page==1?const Text("halaman 2 "):(page==2?const Text("Halaman 3"):const Text("Halaman 4")))
    );
  }
}
