import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../database/database.dart';
import '../../../protos/library.pb.dart' as protos;
import '../../../services/backend.dart';
import '../../../utils/double.dart';
import 'state.dart';

class ChapterItem extends HookWidget {
  const ChapterItem({
    Key key,
    this.chapter,
    this.chapterId,
    this.onTap,
  }) : super(key: key);

  final protos.Chapter chapter;
  final String chapterId;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final state = use(ChapterItemStateHook(
      database: Database.of(context),
      backend: BackendService.of(context),
      chapter: chapter,
      chapterId: chapterId,
    ));

    return Provider(
      create: (_) => state,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: const _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ChapterItemState>(context);
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffeeeeee),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Stack(
        children: [
          Center(
            child: Observer(
              builder: (context) => state.chapter?.number != null
                  ? Text(
                      state.chapter.number.normalize(),
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: const Color(0xff555555),
                            fontSize: 20,
                          ),
                    )
                  : const SizedBox(),
            ),
          ),
          Observer(
            builder: (context) => state.progress != null
                ? Positioned(
                    bottom: 8,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3),
                          bottomLeft: Radius.circular(3),
                        ),
                        color: Color(0xff8e8e8e),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 12),
                      child: Center(
                        child: Text(
                            state.progress.isRead
                                ? 'LU'
                                : '${(state.progress.progress * 100).toStringAsFixed(0)}%',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      height: 1.2,
                                      fontSize: 10,
                                    )),
                      ),
                    ),
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
