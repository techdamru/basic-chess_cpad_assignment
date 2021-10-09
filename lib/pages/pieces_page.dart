import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:basic_chess_v2/data/piece_data.dart';
import 'package:basic_chess_v2/pages/piece_detail_page.dart';

class PiecesPage extends StatefulWidget {
  @override
  _PiecesPageState createState() => _PiecesPageState();
}

class _PiecesPageState extends State<PiecesPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's learn the basics !!!"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: pieces.length,
          itemBuilder: (context, position) {
            String name = pieces[position].name;
            Widget widget = pieces[position].pieceWidget;

            return PieceCard(
              leftWidget: widget,
              rightWidget: Text(
                name,
                style: TextStyle(fontSize: 16.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MyCustomRoute(
                    builder: (context) => PieceDetailPage(
                      position: position,
                    ),
                  ),
                );
              },
              heroTag: "Piece$position",
            );
          },
        ),
      ),
    );
  }
}

class PieceCard extends StatelessWidget {
  final Widget leftWidget;
  final Widget rightWidget;
  final GestureTapCallback onTap;
  final String heroTag;

  PieceCard(
      {required this.leftWidget,
      required this.rightWidget,
      required this.onTap,
      required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 4.0,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Material(
                      child: Hero(
                        child: leftWidget,
                        tag: heroTag,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: rightWidget,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute(
      {required WidgetBuilder builder,
      RouteSettings? settings}) //change from original
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == '/') return child; //change from original
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: new SlideTransition(
        position: new Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(1.0, 0.0),
        ).animate(secondaryAnimation),
        child: child,
      ),
    );
  }
}
