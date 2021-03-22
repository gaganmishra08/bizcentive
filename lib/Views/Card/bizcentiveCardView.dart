
import 'package:fixurbiz_app/Model/cardViewModel.dart';
import 'package:flutter/material.dart';

class CardItemView extends StatelessWidget {
  final CardViewModel model;

  const CardItemView({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: model.cardColor,
          width: 2.0,
        ),
      ),
      child: Container(
        child: Wrap(
          direction: Axis.horizontal,
          children: [
           _titleView(),
            Divider(
              height: 1,
              thickness: 1.1,
              color: Colors.grey,
            ),
           _middleItemView(),
            Divider(
              height: 1,
              thickness: 1.1,
              color: Colors.grey,
            ),
            _buttonBarView(),
          ],
        ),
      ),
    );
  }

  _titleView(){
   return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text(
            model.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8,),
          Text(
            model.description,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  _middleItemView(){
    return  Row(
      mainAxisSize: MainAxisSize.max,
      children: [


        Expanded(
          child: Padding(
            padding:
            const EdgeInsets.only(left: 20.0, top: 5, bottom: 5),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: "Bizcentive ID: ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: model.id,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "FullFilledBy: ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: model.fullFiledBy,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Bizcentive ID: ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: model.id,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "FullFilledBy: ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: model.fullFiledBy,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Bizcentive ID: ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: model.id,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "FullFilledBy: ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: model.fullFiledBy,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Bizcentive ID: ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: model.id,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "FullFilledBy: ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: model.fullFiledBy,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Bizcentive ID: ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: model.id,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "FullFilledBy: ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: model.fullFiledBy,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        
        
        Container(

           //color: Colors.red,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              //color: Colors.red
          ),
        ),

        Expanded(
          child: Padding(
            padding:
            const EdgeInsets.only(right: 20.0, top: 5, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Cost:",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(model.cost)
              ],
            ),
          ),
        ),
      ],
    );
  }
  _buttonBarView(){
    return ButtonBar(
      buttonMinWidth: 70,
      alignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
      children: [
        FlatButton(
          height: 42,
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(8)),
          onPressed: () {},
          child: Text(
            "Terms",
            style: TextStyle(fontSize: 15, color: Colors.grey[500]),
          ),
        ),
        FlatButton(
          height: 42,
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(8)),
          onPressed: () {},
          child: Text(
            "Refer",
            style: TextStyle(fontSize: 15, color: Colors.grey[500]),
          ),
        ),
        FlatButton(
          height: 42,
          //minWidth: 60,
          color: Colors.red[900],
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(8)),
          onPressed: () {},
          child: Text(
            "Reject",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
        FlatButton(
          height: 42,
          //minWidth: 60,
          color: Colors.green[700],
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(8)),
          onPressed: () {},
          child: Text(
            "Accept",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ],
    );
  }
}


