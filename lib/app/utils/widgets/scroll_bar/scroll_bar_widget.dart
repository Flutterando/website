import 'package:flutter/material.dart';

class ScrollBarWidget extends StatefulWidget {
  final ScrollController _scrollController;
  ScrollBarWidget(this._scrollController);

  @override
  _ScrollBarWidgetState createState() =>
      _ScrollBarWidgetState(_scrollController);
}

class _ScrollBarWidgetState extends State<ScrollBarWidget> {
  ScrollController _scrollController;
  _ScrollBarWidgetState(this._scrollController);
  double _offset = 0;
  double _scrollFactor;
  double sizeCursor = 40;
  double heightScreen;
  _scrollListener() {
    setState(() {
      _scrollFactor = _scrollController.position.maxScrollExtent /
          (heightScreen - sizeCursor);
      _offset = _scrollController.position.pixels / _scrollFactor;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    heightScreen = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      width: 20.0,
      margin: EdgeInsets.only(left: widthScreen - 20.0),
      decoration: BoxDecoration(color: Colors.black12),
      child: Container(
        alignment: Alignment.topCenter,
        child: GestureDetector(
          child: Container(
            height: 40.0,
            width: 15.0,
            margin: EdgeInsets.only(left: 5.0, right: 5.0, top: _offset),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(3.0))),
          ),
          onVerticalDragUpdate: (dragUpdate) {
            final maxSizeScroll = _scrollController.position.maxScrollExtent;
            setState(() {
              if (dragUpdate.globalPosition.dy > 0 &&
                  dragUpdate.globalPosition.dy < heightScreen - sizeCursor) {
                _offset = dragUpdate.globalPosition.dy;
              } else if (dragUpdate.globalPosition.dy <= 0) {
                _offset = 0;
              } else if (dragUpdate.globalPosition.dy >=
                  heightScreen - sizeCursor) {
                _offset = heightScreen - sizeCursor;
              }
              _scrollController.jumpTo(
                  (_offset) * (maxSizeScroll / (heightScreen - sizeCursor)));
            });
          },
        ),
      ),
    );
  }
}
