// Extra small<576px
// Small≥576px
// Medium≥768px
// Large≥992px
// Extra large≥1200px
import 'package:flutter/material.dart';

enum BreakPointEnum { xs, sm, md, lg, xl }

class BreakPoint {
  int xs;
  int sm;
  int md;
  int lg;
  int xl;

  BreakPoint({this.xs = 0, this.sm = 0, this.md = 0, this.lg = 0, this.xl = 0});
}

class GridItem {
  Widget child;
  int _xs = 0;
  int _sm = 0;
  int _md = 0;
  int _lg = 0;
  int _xl = 0;

  GridItem({required this.child});

// get function
  int get xs => _xs;
  int get sm => _sm;
  int get md => _md;
  int get lg => _lg;
  int get xl => _xl;

  // set function xs
  set xs(int value) {
    _xs = value;
  }

  // set function sm
  set sm(int value) {
    _sm = value;
  }

  // set function md
  set md(int value) {
    _md = value;
  }

  // set function lg
  set lg(int value) {
    _lg = value;
  }

  // set function xl
  set xl(int value) {
    _xl = value;
  }
}

class GridContrainer extends StatelessWidget {
  List<GridItem> gridSys;

  GridContrainer({super.key, required this.gridSys});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [..._build(context)],
    );
  }

  List<Widget> _build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<Widget> rows = [];
    List<Widget> columns = [];

    int totalWidth = 0;

    for (var i = 0; i < gridSys.length; i++) {
      final currentGrid = gridSys[i];
      final widthSizeBox = _getSizeOfScreen(width, currentGrid);

      totalWidth += widthSizeBox;
      if (totalWidth <= 12) {
        rows.add(Container(
          width: (width / 12) * widthSizeBox,
          child: currentGrid.child,
        ));
      } else {
        columns.add(Row(
          children: [...rows],
        ));
        rows.clear();
        rows.add(Container(
          width: (width / 12) * widthSizeBox,
          child: currentGrid.child,
        ));
        totalWidth -= 12;
      }
    }

    columns.add(Row(
      children: [...rows],
    ));

    return columns;
  }

  //function to check size of the screen from grid item return BreakPointEnum
  int _getSizeOfScreen(double size, GridItem gridItem) {
    if (_isXs(size)) {
      return gridItem.xs;
    } else if (_isSm(size)) {
      return gridItem.sm;
    } else if (_isMd(size)) {
      return gridItem.md;
    } else if (_isLg(size)) {
      return gridItem.lg;
    } else if (_isXl(size)) {
      return gridItem.xl;
    } else {
      return gridItem.xs;
    }
  }

  //function to check if the screen size is xs
  bool _isXs(double width) {
    return width <= 400;
  }

  //function to check if the screen size is sm
  bool _isSm(double width) {
    return width <= 800;
  }

  //function to check if the screen size is md
  bool _isMd(double width) {
    return width <= 1500;
  }

  //function to check if the screen size is lg
  bool _isLg(double width) {
    return width <= 1600;
  }

  //function to check if the screen size is xl
  bool _isXl(double width) {
    return width >= 1900;
  }
}
