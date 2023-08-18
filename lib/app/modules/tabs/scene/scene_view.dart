import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt_flutter/app/modules/tabs/scene/comp/scene_item.dart';
import 'package:gpt_flutter/core/config/comom.dart';
import '../../../../core/utils/in_app_review.dart';
import '../../chat/chat_view.dart';
import 'scene_controller.dart';

class SceneView extends GetView<SceneController> {
  const SceneView({Key? key}) : super(key: key);

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ChatPage(onTextFieldTap: () {}, autofocus: true),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    // Review.launch();

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            ...controller.list.map((e) {
              return SliverPadding(
                  padding: EdgeInsets.all(8),
                  key: ValueKey(e),
                  sliver: SliverToBoxAdapter(
                      child: SceneItem(
                    group: e,
                    onClick: (String data) {
                      logDev(data);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatPage(
                                autofocus: true, onTextFieldTap: () {})),
                      );
                    },
                  )));
            })
          ],
        ),
      ),
    );
  }

}
