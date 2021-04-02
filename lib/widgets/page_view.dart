import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide PageScrollPhysics;
import 'package:flutter/physics.dart';
import 'package:flutter/rendering.dart' show ViewportOffset, CacheExtentStyle;

class CustomPageView extends StatefulWidget {
  /// Creates a scrollable list that works page by page from an explicit [List]
  /// of widgets.
  ///
  /// This constructor is appropriate for page views with a small number of
  /// children because constructing the [List] requires doing work for every
  /// child that could possibly be displayed in the page view, instead of just
  /// those children that are actually visible.
  ///
  /// Like other widgets in the framework, this widget expects that
  /// the [children] list will not be mutated after it has been passed in here.
  /// See the documentation at [SliverChildListDelegate.children] for more details.
  ///
  /// {@template flutter.widgets.CustomPageView.allowImplicitScrolling}
  /// The [allowImplicitScrolling] parameter must not be null. If true, the
  /// [CustomPageView] will participate in accessibility scrolling more like a
  /// [ListView], where implicit scroll actions will move to the next page
  /// rather than into the contents of the [CustomPageView].
  /// {@endtemplate}
  CustomPageView({
    Key key,
    this.scrollDirection = Axis.horizontal,
    this.reverse = false,
    PageController controller,
    this.physics,
    this.pageSnapping = true,
    this.onPageChanged,
    List<Widget> children = const <Widget>[],
    this.dragStartBehavior = DragStartBehavior.start,
    this.allowImplicitScrolling = false,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.cacheExtent = 0,
  })  : assert(allowImplicitScrolling != null),
        assert(clipBehavior != null),
        controller = controller ?? PageController(),
        childrenDelegate = SliverChildListDelegate(children),
        super(key: key);

  /// Creates a scrollable list that works page by page using widgets that are
  /// created on demand.
  ///
  /// This constructor is appropriate for page views with a large (or infinite)
  /// number of children because the builder is called only for those children
  /// that are actually visible.
  ///
  /// Providing a non-null [itemCount] lets the [CustomPageView] compute the maximum
  /// scroll extent.
  ///
  /// [itemBuilder] will be called only with indices greater than or equal to
  /// zero and less than [itemCount].
  ///
  /// [CustomPageView.builder] by default does not support child reordering. If
  /// you are planning to change child order at a later time, consider using
  /// [CustomPageView] or [CustomPageView.custom].
  ///
  /// {@macro flutter.widgets.CustomPageView.allowImplicitScrolling}
  CustomPageView.builder({
    Key key,
    this.scrollDirection = Axis.horizontal,
    this.reverse = false,
    PageController controller,
    this.physics,
    this.pageSnapping = true,
    this.onPageChanged,
    @required IndexedWidgetBuilder itemBuilder,
    int itemCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.allowImplicitScrolling = false,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.cacheExtent = 0,
  })  : assert(allowImplicitScrolling != null),
        assert(clipBehavior != null),
        controller = controller ?? PageController(),
        childrenDelegate =
            SliverChildBuilderDelegate(itemBuilder, childCount: itemCount),
        super(key: key);

  /// Creates a scrollable list that works page by page with a custom child
  /// model.
  ///
  /// {@tool snippet}
  ///
  /// This [CustomPageView] uses a custom [SliverChildBuilderDelegate] to support child
  /// reordering.
  ///
  /// ```dart
  /// class MyCustomPageView extends StatefulWidget {
  ///   @override
  ///   _MyCustomPageViewState createState() => _MyCustomPageViewState();
  /// }
  ///
  /// class _MyCustomPageViewState extends State<MyCustomPageView> {
  ///   List<String> items = <String>['1', '2', '3', '4', '5'];
  ///
  ///   void _reverse() {
  ///     setState(() {
  ///       items = items.reversed.toList();
  ///     });
  ///   }
  ///
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return Scaffold(
  ///       body: SafeArea(
  ///         child: CustomPageView.custom(
  ///           childrenDelegate: SliverChildBuilderDelegate(
  ///             (BuildContext context, int index) {
  ///               return KeepAlive(
  ///                 data: items[index],
  ///                 key: ValueKey<String>(items[index]),
  ///               );
  ///             },
  ///             childCount: items.length,
  ///             findChildIndexCallback: (Key key) {
  ///               final ValueKey<String> valueKey = key as ValueKey<String>;
  ///               final String data = valueKey.value;
  ///               return items.indexOf(data);
  ///             }
  ///           ),
  ///         ),
  ///       ),
  ///       bottomNavigationBar: BottomAppBar(
  ///         child: Row(
  ///           mainAxisAlignment: MainAxisAlignment.center,
  ///           children: <Widget>[
  ///             TextButton(
  ///               onPressed: () => _reverse(),
  ///               child: Text('Reverse items'),
  ///             ),
  ///           ],
  ///         ),
  ///       ),
  ///     );
  ///   }
  /// }
  ///
  /// class KeepAlive extends StatefulWidget {
  ///   const KeepAlive({Key key, required this.data}) : super(key: key);
  ///
  ///   final String data;
  ///
  ///   @override
  ///   _KeepAliveState createState() => _KeepAliveState();
  /// }
  ///
  /// class _KeepAliveState extends State<KeepAlive> with AutomaticKeepAliveClientMixin{
  ///   @override
  ///   bool get wantKeepAlive => true;
  ///
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     super.build(context);
  ///     return Text(widget.data);
  ///   }
  /// }
  /// ```
  /// {@end-tool}
  ///
  /// {@macro flutter.widgets.CustomPageView.allowImplicitScrolling}
  CustomPageView.custom({
    Key key,
    this.scrollDirection = Axis.horizontal,
    this.reverse = false,
    PageController controller,
    this.physics,
    this.pageSnapping = true,
    this.onPageChanged,
    @required this.childrenDelegate,
    this.dragStartBehavior = DragStartBehavior.start,
    this.allowImplicitScrolling = false,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.cacheExtent = 0,
  })  : assert(childrenDelegate != null),
        assert(allowImplicitScrolling != null),
        assert(clipBehavior != null),
        controller = controller ?? PageController(),
        super(key: key);

  /// Controls whether the widget's pages will respond to
  /// [RenderObject.showOnScreen], which will allow for implicit accessibility
  /// scrolling.
  ///
  /// With this flag set to false, when accessibility focus reaches the end of
  /// the current page and the user attempts to move it to the next element, the
  /// focus will traverse to the next widget outside of the page view.
  ///
  /// With this flag set to true, when accessibility focus reaches the end of
  /// the current page and user attempts to move it to the next element, focus
  /// will traverse to the next page in the page view.
  final bool allowImplicitScrolling;

  /// {@macro flutter.widgets.scrollable.restorationId}
  final String restorationId;

  /// The axis along which the page view scrolls.
  ///
  /// Defaults to [Axis.horizontal].
  final Axis scrollDirection;

  /// Whether the page view scrolls in the reading direction.
  ///
  /// For example, if the reading direction is left-to-right and
  /// [scrollDirection] is [Axis.horizontal], then the page view scrolls from
  /// left to right when [reverse] is false and from right to left when
  /// [reverse] is true.
  ///
  /// Similarly, if [scrollDirection] is [Axis.vertical], then the page view
  /// scrolls from top to bottom when [reverse] is false and from bottom to top
  /// when [reverse] is true.
  ///
  /// Defaults to false.
  final bool reverse;

  /// An object that can be used to control the position to which this page
  /// view is scrolled.
  final PageController controller;

  /// How the page view should respond to user input.
  ///
  /// For example, determines how the page view continues to animate after the
  /// user stops dragging the page view.
  ///
  /// The physics are modified to snap to page boundaries using
  /// [PageScrollPhysics] prior to being used.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics physics;

  /// Set to false to disable page snapping, useful for custom scroll behavior.
  final bool pageSnapping;

  /// Called whenever the page in the center of the viewport changes.
  final ValueChanged<int> onPageChanged;

  /// A delegate that provides the children for the [CustomPageView].
  ///
  /// The [CustomPageView.custom] constructor lets you specify this delegate
  /// explicitly. The [CustomPageView] and [CustomPageView.builder] constructors create a
  /// [childrenDelegate] that wraps the given [List] and [IndexedWidgetBuilder],
  /// respectively.
  final SliverChildDelegate childrenDelegate;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.hardEdge].
  final Clip clipBehavior;

  final double cacheExtent;

  @override
  _CustomPageViewState createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  int _lastReportedPage = 0;

  @override
  void initState() {
    super.initState();
    _lastReportedPage = widget.controller.initialPage;
  }

  AxisDirection _getDirection(BuildContext context) {
    switch (widget.scrollDirection) {
      case Axis.horizontal:
        assert(debugCheckHasDirectionality(context));
        final TextDirection textDirection = Directionality.of(context);
        final AxisDirection axisDirection =
            textDirectionToAxisDirection(textDirection);
        return widget.reverse
            ? flipAxisDirection(axisDirection)
            : axisDirection;
      case Axis.vertical:
        return widget.reverse ? AxisDirection.up : AxisDirection.down;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final AxisDirection axisDirection = _getDirection(context);
    final ScrollPhysics physics = _ForceImplicitScrollPhysics(
      allowImplicitScrolling: widget.allowImplicitScrolling,
    ).applyTo(widget.pageSnapping
        ? const PageScrollPhysics().applyTo(widget.physics)
        : widget.physics);

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification.depth == 0 &&
            widget.onPageChanged != null &&
            notification is ScrollUpdateNotification) {
          final PageMetrics metrics = notification.metrics as PageMetrics;
          final int currentPage = metrics.page.round();
          if (currentPage != _lastReportedPage) {
            _lastReportedPage = currentPage;
            widget.onPageChanged(currentPage);
          }
        }
        return false;
      },
      child: Scrollable(
        dragStartBehavior: widget.dragStartBehavior,
        axisDirection: axisDirection,
        controller: widget.controller,
        physics: physics,
        restorationId: widget.restorationId,
        viewportBuilder: (BuildContext context, ViewportOffset position) {
          return Viewport(
            cacheExtent: widget.cacheExtent,
            cacheExtentStyle: CacheExtentStyle.viewport,
            axisDirection: axisDirection,
            offset: position,
            clipBehavior: widget.clipBehavior,
            slivers: <Widget>[
              SliverFillViewport(
                viewportFraction: widget.controller.viewportFraction,
                delegate: widget.childrenDelegate,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description
        .add(EnumProperty<Axis>('scrollDirection', widget.scrollDirection));
    description.add(
        FlagProperty('reverse', value: widget.reverse, ifTrue: 'reversed'));
    description.add(DiagnosticsProperty<PageController>(
        'controller', widget.controller,
        showName: false));
    description.add(DiagnosticsProperty<ScrollPhysics>(
        'physics', widget.physics,
        showName: false));
    description.add(FlagProperty('pageSnapping',
        value: widget.pageSnapping, ifFalse: 'snapping disabled'));
    description.add(FlagProperty('allowImplicitScrolling',
        value: widget.allowImplicitScrolling,
        ifTrue: 'allow implicit scrolling'));
  }
}

class PageScrollPhysics extends ScrollPhysics {
  /// Creates physics for a [PageView].
  const PageScrollPhysics({ScrollPhysics parent}) : super(parent: parent);

  @override
  PageScrollPhysics applyTo(ScrollPhysics ancestor) {
    return PageScrollPhysics(parent: buildParent(ancestor));
  }

  double _getPage(ScrollMetrics position) {
    if (position is _PagePosition) {
      return position.page;
    }
    return position.pixels / position.viewportDimension;
  }

  double _getPixels(ScrollMetrics position, double page) {
    if (position is _PagePosition) {
      return position.getPixelsFromPage(page);
    }
    return page * position.viewportDimension;
  }

  double _getTargetPixels(
      ScrollMetrics position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }
    return _getPixels(position, page.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels) {
      final spring = SpringDescription.withDampingRatio(
        mass: 0.2,
        stiffness: 120.0,
        ratio: 1.1,
      );
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}

// ignore: unused_element
class _PagePosition extends ScrollPositionWithSingleContext
    implements PageMetrics {
  _PagePosition({
    @required ScrollPhysics physics,
    @required ScrollContext context,
    this.initialPage = 0,
    bool keepPage = true,
    double viewportFraction = 1.0,
    ScrollPosition oldPosition,
  })  : assert(initialPage != null),
        assert(keepPage != null),
        assert(viewportFraction != null),
        assert(viewportFraction > 0.0),
        _viewportFraction = viewportFraction,
        _pageToUseOnStartup = initialPage.toDouble(),
        super(
          physics: physics,
          context: context,
          initialPixels: null,
          keepScrollOffset: keepPage,
          oldPosition: oldPosition,
        );

  final int initialPage;
  double _pageToUseOnStartup;

  @override
  Future<void> ensureVisible(
    RenderObject object, {
    double alignment = 0.0,
    Duration duration = Duration.zero,
    Curve curve = Curves.ease,
    ScrollPositionAlignmentPolicy alignmentPolicy =
        ScrollPositionAlignmentPolicy.explicit,
    RenderObject targetRenderObject,
  }) {
    // Since the _PagePosition is intended to cover the available space within
    // its viewport, stop trying to move the target render object to the center
    // - otherwise, could end up changing which page is visible and moving the
    // targetRenderObject out of the viewport.
    return super.ensureVisible(
      object,
      alignment: alignment,
      duration: duration,
      curve: curve,
      alignmentPolicy: alignmentPolicy,
      targetRenderObject: null,
    );
  }

  @override
  double get viewportFraction => _viewportFraction;
  double _viewportFraction;
  set viewportFraction(double value) {
    if (_viewportFraction == value) {
      return;
    }
    final double oldPage = page;
    _viewportFraction = value;
    if (oldPage != null) {
      forcePixels(getPixelsFromPage(oldPage));
    }
  }

  // The amount of offset that will be added to [minScrollExtent] and subtracted
  // from [maxScrollExtent], such that every page will properly snap to the center
  // of the viewport when viewportFraction is greater than 1.
  //
  // The value is 0 if viewportFraction is less than or equal to 1, larger than 0
  // otherwise.
  double get _initialPageOffset =>
      math.max(0, viewportDimension * (viewportFraction - 1) / 2);

  double getPageFromPixels(double pixels, double viewportDimension) {
    final double actual = math.max(0.0, pixels - _initialPageOffset) /
        math.max(1.0, viewportDimension * viewportFraction);
    final double round = actual.roundToDouble();
    if ((actual - round).abs() < precisionErrorTolerance) {
      return round;
    }
    return actual;
  }

  double getPixelsFromPage(double page) {
    return page * viewportDimension * viewportFraction + _initialPageOffset;
  }

  @override
  double get page {
    assert(
      !hasPixels || (minScrollExtent != null && maxScrollExtent != null),
      'Page value is only available after content dimensions are established.',
    );
    return !hasPixels
        ? null
        : getPageFromPixels(
            pixels.clamp(minScrollExtent, maxScrollExtent), viewportDimension);
  }

  @override
  void saveScrollOffset() {
    PageStorage.of(context.storageContext)?.writeState(
        context.storageContext, getPageFromPixels(pixels, viewportDimension));
  }

  @override
  void restoreScrollOffset() {
    if (!hasPixels) {
      final double value = PageStorage.of(context.storageContext)
          ?.readState(context.storageContext) as double;
      if (value != null) {
        _pageToUseOnStartup = value;
      }
    }
  }

  @override
  void saveOffset() {
    context.saveOffset(getPageFromPixels(pixels, viewportDimension));
  }

  @override
  void restoreOffset(double offset, {bool initialRestore = false}) {
    assert(initialRestore != null);
    assert(offset != null);
    if (initialRestore) {
      _pageToUseOnStartup = offset;
    } else {
      jumpTo(getPixelsFromPage(offset));
    }
  }

  @override
  bool applyViewportDimension(double viewportDimension) {
    final double oldViewportDimensions =
        hasViewportDimension ? this.viewportDimension : null;
    if (viewportDimension == oldViewportDimensions) {
      return true;
    }
    final bool result = super.applyViewportDimension(viewportDimension);
    final double oldPixels = hasPixels ? pixels : null;
    final double page = (oldPixels == null || oldViewportDimensions == 0.0)
        ? _pageToUseOnStartup
        : getPageFromPixels(oldPixels, oldViewportDimensions);
    final double newPixels = getPixelsFromPage(page);

    if (newPixels != oldPixels) {
      correctPixels(newPixels);
      return false;
    }
    return result;
  }

  @override
  bool applyContentDimensions(double minScrollExtent, double maxScrollExtent) {
    final double newMinScrollExtent = minScrollExtent + _initialPageOffset;
    return super.applyContentDimensions(
      newMinScrollExtent,
      math.max(newMinScrollExtent, maxScrollExtent - _initialPageOffset),
    );
  }

  @override
  PageMetrics copyWith({
    double minScrollExtent,
    double maxScrollExtent,
    double pixels,
    double viewportDimension,
    AxisDirection axisDirection,
    double viewportFraction,
  }) {
    return PageMetrics(
      minScrollExtent: minScrollExtent ??
          (hasContentDimensions ? this.minScrollExtent : null),
      maxScrollExtent: maxScrollExtent ??
          (hasContentDimensions ? this.maxScrollExtent : null),
      pixels: pixels ?? (hasPixels ? this.pixels : null),
      viewportDimension: viewportDimension ??
          (hasViewportDimension ? this.viewportDimension : null),
      axisDirection: axisDirection ?? this.axisDirection,
      viewportFraction: viewportFraction ?? this.viewportFraction,
    );
  }
}

class _ForceImplicitScrollPhysics extends ScrollPhysics {
  const _ForceImplicitScrollPhysics({
    @required this.allowImplicitScrolling,
    ScrollPhysics parent,
  })  : assert(allowImplicitScrolling != null),
        super(parent: parent);

  @override
  _ForceImplicitScrollPhysics applyTo(ScrollPhysics ancestor) {
    return _ForceImplicitScrollPhysics(
      allowImplicitScrolling: allowImplicitScrolling,
      parent: buildParent(ancestor),
    );
  }

  @override
  final bool allowImplicitScrolling;
}
