import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({
    Key? key,
    required this.icon,
    this.active = false,
  }) : super(key: key);

  final IconData icon;
  final bool active;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Theme.of(context).backgroundColor;
    var hoverColor = Theme.of(context).hoverColor;
    var iconColor = Theme.of(context).iconTheme.color;
    return MouseRegion(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: widget.active ? hoverColor : backgroundColor,
              width: 3,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Icon(
            widget.icon,
            color:
                widget.active ? hoverColor : (hover ? hoverColor : iconColor),
          ),
        ),
      ),
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          hover = true;
        });
      },
      onExit: (event) {
        setState(() {
          hover = false;
        });
      },
    );
  }
}
