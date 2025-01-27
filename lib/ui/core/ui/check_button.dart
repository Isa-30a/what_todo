import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:what_todo/config/assets.dart';
import 'package:what_todo/ui/add_task/view_model/todo_provider.dart';

class CheckButton extends StatefulWidget {
  const CheckButton(
      {super.key, required this.isCompleted, required this.onPressed});

  final bool isCompleted;
  final VoidCallback onPressed;

  @override
  _CheckButtonState createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, value, child) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: TextButton(
            onPressed: widget.onPressed,
            child: isHovered
                ? Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    height: 30,
                    width: 30,
                    child: CircleAvatar(
                      radius: 1,
                      backgroundColor: Theme.of(context).canvasColor,
                    ),
                  )
                : widget.isCompleted
                    ? Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.purple],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset(
                          Assets.iconcheck,
                          fit: BoxFit.scaleDown,
                        ),
                      )
                    : Icon(
                        Icons.circle_outlined,
                        size: 35,
                        color: Theme.of(context).disabledColor,
                      ),
          ),
        );
      },
    );
  }
}
