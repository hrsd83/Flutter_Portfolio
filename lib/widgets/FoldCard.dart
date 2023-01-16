import 'dart:math';

import 'package:flutter/material.dart';

class FoldCard extends StatefulWidget {
  const FoldCard(
      {Key? key,
      required this.frontWidget,
      required this.innerWidget,
      this.cardSize = const Size(100.0, 100.0),
      this.unfoldCell = false,
      this.skipAnimation = false,
      this.padding =
          const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 10),
      this.animationDuration = const Duration(milliseconds: 1000),
      this.borderRadius = 0.0,
      this.onOpen,
      this.onClose})
      : assert(frontWidget != null),
        assert(innerWidget != null),
        assert(cardSize != null),
        assert(unfoldCell != null),
        assert(skipAnimation != null),
        assert(padding != null),
        assert(animationDuration != null),
        assert(borderRadius != null && borderRadius >= 0.0),
        super(key: key);

  final Widget? frontWidget;
  final Widget? innerWidget;
  final Size? cardSize;
  final EdgeInsetsGeometry? padding;
  final Duration? animationDuration;
  final double? borderRadius;
  final VoidCallback? onOpen;
  final bool? unfoldCell;
  final bool? skipAnimation;
  final VoidCallback? onClose;

  @override
  FoldCardState createState() => FoldCardState();
}

class FoldCardState extends State<FoldCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.onOpen != null) widget.onOpen!();
      } else if (status == AnimationStatus.dismissed) {
        if (widget.onClose != null) widget.onClose!();
      }
    });

    if (widget.unfoldCell == true) {
      _animationController.value = 1;
      _isExpanded = true;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          final angle = _animationController.value * pi;
          final cellWidth = widget.cardSize?.width;
          final cellHeight = widget.cardSize?.height;

          return Padding(
            padding: widget.padding!,
            child: Container(
              color: Colors.transparent,
              width: cellWidth,
              height: cellHeight! + (cellHeight * _animationController.value),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(widget.borderRadius!),
                        topRight: Radius.circular(widget.borderRadius!)),
                    child: Container(
                      width: cellWidth,
                      height: cellHeight,
                      child: OverflowBox(
                        minHeight: cellHeight,
                        maxHeight: cellHeight * 2,
                        alignment: Alignment.topCenter,
                        child: ClipRect(
                          child: Align(
                            heightFactor: 0.5,
                            alignment: Alignment.topCenter,
                            child: widget.innerWidget,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(angle),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationX(pi),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(widget.borderRadius!),
                            bottomRight: Radius.circular(widget.borderRadius!)),
                        child: Container(
                          width: cellWidth,
                          height: cellHeight,
                          child: OverflowBox(
                            minHeight: cellHeight,
                            maxHeight: cellHeight * 2,
                            alignment: Alignment.topCenter,
                            child: ClipRect(
                              child: Align(
                                heightFactor: 0.5,
                                alignment: Alignment.bottomCenter,
                                child: widget.innerWidget,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(angle),
                    child: Opacity(
                      opacity: angle >= 1.5708 ? 0.0 : 1.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(widget.borderRadius!),
                            topRight: Radius.circular(widget.borderRadius!)),
                        child: Container(
                          width: angle >= 1.5708 ? 0.0 : cellWidth,
                          height: angle >= 1.5708 ? 0.0 : cellHeight,
                          child: widget.frontWidget,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void toggleFold() {
    if (_isExpanded) {
      if (widget.skipAnimation == true) {
        _animationController.value = 0;
      } else {
        _animationController.reverse();
      }
    } else {
      if (widget.skipAnimation == true) {
        _animationController.value = 1;
      } else {
        _animationController.forward();
      }
    }
    _isExpanded = !_isExpanded;
  }
}
