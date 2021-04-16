import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../widgets/optimized_image.dart';
import '../../widgets/reader_explorer/state.dart';

class ReaderExplorer extends StatefulHookWidget {
  const ReaderExplorer({
    Key key,
    @required this.itemCount,
    @required this.getPhotoUrl,
    @required this.pageController,
  }) : super(key: key);

  final String Function(int index) getPhotoUrl;
  final int itemCount;
  final PageController pageController;

  @override
  _ReaderExplorerState createState() => _ReaderExplorerState();
}

class _ReaderExplorerState extends State<ReaderExplorer> {
  @override
  Widget build(BuildContext context) {
    final state = use(ReaderExplorerStateHook(
      widget.pageController,
      widget.itemCount,
    ));

    return Provider(
      create: (_) => state,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Observer(
            builder: (context) => state.itemCount > 0
                ? ScrollablePositionedList.separated(
                    initialScrollIndex: state.currentPage,
                    initialAlignment: 0.1,
                    itemScrollController: state.scrollController,
                    itemPositionsListener: state.scrollListener,
                    padding: const EdgeInsets.all(20),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) => _Page(
                      key: ValueKey('page-$i'),
                      pageNumber: i,
                      photoUrl: widget.getPhotoUrl(i),
                      maxHeight: constraints.maxHeight,
                    ),
                    separatorBuilder: (_, __) => const SizedBox(width: 20),
                    itemCount: state.itemCount,
                  )
                : const SizedBox(),
          );
        }),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({
    Key key,
    @required this.pageNumber,
    @required this.photoUrl,
    @required this.maxHeight,
  }) : super(key: key);

  final int pageNumber;
  final String photoUrl;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ReaderExplorerState>(context);
    return GestureDetector(
      onTap: () => state.setActivePage(pageNumber),
      child: Column(
        children: [
          Expanded(
            child: OptimizedImage(
              url: photoUrl,
              optimizedAxis: Axis.vertical,
              quality: 50,
              placeholder: (context, _) =>
                  const AspectRatio(aspectRatio: 2 / 3),
              imageBuilder: (context, imageProvider) => Stack(
                fit: StackFit.passthrough,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4))
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image(image: imageProvider),
                  ),
                  Observer(
                    builder: (context) => state.currentPage == pageNumber
                        ? Positioned.fill(
                            child: DecoratedBox(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4, color: Colors.blue[600]),
                                borderRadius: BorderRadius.circular(15)),
                          ))
                        : const SizedBox(),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Observer(
            builder: (context) => Text(
              '${pageNumber + 1}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: state.currentPage == pageNumber
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: state.currentPage == pageNumber
                    ? Colors.blue[600]
                    : Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
