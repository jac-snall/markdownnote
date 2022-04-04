import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markdownnote/menu/cubit/menu_cubit.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({
    Key? key,
    required this.icon,
    required this.value,
    required this.groupValue,
  }) : super(key: key);

  final IconData icon;
  final MenuTab value;
  final MenuTab groupValue;

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
    var active = widget.value == widget.groupValue;
    return MouseRegion(
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: active ? hoverColor : backgroundColor,
                width: 3,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Icon(
              widget.icon,
              color: active ? hoverColor : (hover ? hoverColor : iconColor),
            ),
          ),
        ),
        onTap: () => context.read<MenuCubit>().setTab(widget.value),
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
