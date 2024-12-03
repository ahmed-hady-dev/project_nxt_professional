import 'package:flutter/material.dart';

class PaginationWidget extends StatefulWidget {
  PaginationWidget({
    super.key,
    required this.child,
    required this.loading,
    required this.function,
    this.axisDirection = Axis.vertical,
  });
  final Widget child;
  bool loading;
  final Axis axisDirection;
  final Future<void> Function() function;

  @override
  State<PaginationWidget> createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends State<PaginationWidget> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !widget.loading) {
      setState(() {
        widget.loading = true;
      });
      if (widget.loading == true) {
        await widget.function();
      }
      setState(() {
        widget.loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController..addListener(scrollListener),
      scrollDirection: widget.axisDirection,
      clipBehavior: Clip.none,
      child: Column(
        children: [
          widget.child,
          if (widget.loading) const CircularProgressIndicator()
        ],
      ),
    );
  }
}
