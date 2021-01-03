import 'package:flutter/material.dart';

push(BuildContext context,Widget goto){

  Navigator.of(context).push(
    MaterialPageRoute(
        builder: (_) => goto),
  );
}

push_r(BuildContext context,Widget goto){
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
        builder: (_) => goto),
  );
}

push_remove(BuildContext context,Widget goto){


  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (_) => goto), (e) => false);

}


pop(BuildContext context){
  Navigator.of(context).pop();
}