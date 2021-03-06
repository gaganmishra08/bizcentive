
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixurbiz_app/Utility/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
class SelectableItem extends StatefulWidget {
  const SelectableItem({
    Key key,
    @required this.index,
    @required this.color,
    @required this.selected,
  }) : super(key: key);

  final int index;
  final MaterialColor color;
  final bool selected;

  @override
  _SelectableItemState createState() => _SelectableItemState();
}

class _SelectableItemState extends State<SelectableItem>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scaleAnimation;
   //List category = ["Entertainment","Shopping","Education","Charity","Sports","Adventure","Travel","Networking"];
  List<dynamic> category = [].obs;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      value: widget.selected ? 1 : 0,
      duration: kThemeChangeDuration,
      vsync: this,
    );
    loadCategories();
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
  }

  loadCategories()
  {

    try{
      final cat = FirestoreService().categories;

      FirestoreService().categories.getDocuments().then((QuerySnapshot querySnapshot) {
  querySnapshot.documents.forEach((doc) {

  setState(() {
    category = doc["categories"];
  });





  });
  });


    } catch(e){
      Get.snackbar("Error", e.toString());
    }
  }
  @override
  void didUpdateWidget(SelectableItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selected != widget.selected) {
      if (widget.selected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Container(
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: DecoratedBox(
              child: child,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.indigo,
              ),
            ),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: Obx(()=> Text(
          category.isEmpty? '':'${category[widget.index]}',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ), ),
      ),
    );
  }

  Color calculateColor() {
    return Color.lerp(
      widget.color.shade200,
      widget.color.shade200,
      _controller.value,
    );
  }
  Color calculateColors() {
    return Color.lerp(
      widget.color.shade500,
      widget.color.shade900,
      _controller.value,
    );
  }
}