library side_header_list_view;

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/**
 *  SideHeaderListView for Flutter
 *
 *  Copyright (c) 2017 Rene Floor
 *
 *  Released under BSD License.
 */

typedef bool HasSameHeader(int a, int b);

class SideHeaderListView extends StatefulWidget {
  final int? itemCount;
  final IndexedWidgetBuilder headerBuilder;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? dividerBuilder;
  final EdgeInsets? padding;
  final MainAxisAlignment horizontalAxisAlignment;
  final HasSameHeader hasSameHeader;
  final itemExtend;
  final bool isHorizontal;

  SideHeaderListView({
    Key? key,
    this.itemCount,
    required this.itemExtend,
    required this.headerBuilder,
    required this.itemBuilder,
    this.dividerBuilder,
    required this.hasSameHeader,
    this.horizontalAxisAlignment = MainAxisAlignment.start,
    this.padding,
    this.isHorizontal = true,
  }) : super(key: key);

  @override
  _SideHeaderListViewState createState() => new _SideHeaderListViewState();
}

class _SideHeaderListViewState extends State<SideHeaderListView> {
  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.isHorizontal) {
      return new Stack(
        children: <Widget>[
          new Positioned(
            child: new Opacity(
              opacity: _shouldShowHeader(currentPosition) ? 0.0 : 1.0,
              child: widget.headerBuilder(
                  context, currentPosition >= 0 ? currentPosition : 0),
            ),
            left: 0.0 + (widget.padding?.left ?? 0),
            top: 0.0 + (widget.padding?.top ?? 0),
          ),
          new ListView.builder(
              padding: widget.padding,
              itemCount: widget.itemCount,
              itemExtent: widget.itemExtend,
              controller: _getScrollController(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final itemColumn = new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: widget.horizontalAxisAlignment,
                  children: <Widget>[
                    new Flexible(
                      child: new Opacity(
                        opacity: _shouldShowHeader(index) ? 1.0 : 0.0,
                        child: widget.headerBuilder(context, index),
                      ),
                    ),
                    new Flexible(
                        flex: 0, child: widget.itemBuilder(context, index))
                  ],
                );

                if (widget.dividerBuilder != null &&
                    _shouldShowDivider(index)) {
                  return Row(
                    children: <Widget>[
                      Expanded(child: itemColumn),
                      widget.dividerBuilder!(context, index),
                    ],
                  );
                }
                return itemColumn;
              }),
        ],
      );
    } else {
      return new Stack(
        children: <Widget>[
          new Positioned(
            child: new Opacity(
              opacity: _shouldShowHeader(currentPosition) ? 0.0 : 1.0,
              child: widget.headerBuilder(
                  context, currentPosition >= 0 ? currentPosition : 0),
            ),
            top: 0.0 + (widget.padding?.top ?? 0),
            left: 0.0 + (widget.padding?.left ?? 0),
          ),
          new ListView.builder(
              padding: widget.padding,
              itemCount: widget.itemCount,
              itemExtent: widget.itemExtend,
              controller: _getScrollController(),
              itemBuilder: (BuildContext context, int index) {
                final itemRow = new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new FittedBox(
                      child: new Opacity(
                        opacity: _shouldShowHeader(index) ? 1.0 : 0.0,
                        child: widget.headerBuilder(context, index),
                      ),
                    ),
                    new Expanded(child: widget.itemBuilder(context, index))
                  ],
                );

                if (widget.dividerBuilder != null &&
                    _shouldShowDivider(index)) {
                  return Column(
                    children: <Widget>[
                      Expanded(child: itemRow),
                      widget.dividerBuilder!(context, index),
                    ],
                  );
                }

                return itemRow;
              }),
        ],
      );
    }
  }

  bool _shouldShowHeader(int position) {
    if (position < 0) {
      return true;
    }
    if (position == 0 && currentPosition < 0) {
      return true;
    }

    if (position != 0 &&
        position != currentPosition &&
        !widget.hasSameHeader(position, position - 1)) {
      return true;
    }

    if (position != ((widget.itemCount ?? 0) - 1) &&
        !widget.hasSameHeader(position, position + 1) &&
        position == currentPosition) {
      return true;
    }
    return false;
  }

  bool _shouldShowDivider(int position) {
    if (position < 0 || position >= (widget.itemCount ?? 0) - 1) {
      return false;
    }
    return !widget.hasSameHeader(position, position + 1);
  }

  ScrollController _getScrollController() {
    var controller = new ScrollController();
    controller.addListener(() {
      var pixels = controller.offset;
      var newPosition = (pixels / widget.itemExtend).floor();

      if (newPosition != currentPosition) {
        setState(() {
          currentPosition = newPosition;
        });
      }
    });
    return controller;
  }
}
