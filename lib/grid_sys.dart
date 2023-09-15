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
  List<Widget> _colspans;
  List<Widget> _rowspans;

  //move to use BreakPoint
  int _xs = 0;
  int _sm = 0;
  int _md = 0;
  int _lg = 0;
  int _xl = 0;

//ถ้าจะซ่อน set beakpoint เป็น 0 หรือ ไม่ใส่ก็ได้
  // bool _hXS = false;
  // bool _hSM = false;
  // bool _hMD = false;
  // bool _hLG = false;
  // bool _hXL = false;

  double _gapColspan = 0;

  GridItem(
      {this.child = const SizedBox(),
      List<Widget> colspans = const [],
      List<Widget> rowspans = const []})
      : _colspans = colspans,
        _rowspans = rowspans;

  //set function hXS
  // set hXS(bool value) {
  //   _hXS = value;
  // }

  // //get function hXS
  // bool get hXS => _hXS;

// get function
  int get xs => _xs;
  int get sm => _sm;
  int get md => _md;
  int get lg => _lg;
  int get xl => _xl;

  // get function colspan
  List<Widget> get colspans => _colspans;

  // get function rowspan
  List<Widget> get rowspans => _rowspans;

  // set function rowspan
  set rowspans(List<Widget> value) {
    _rowspans = value;
  }

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

  // set function colspan
  set colspan(List<Widget> value) {
    _colspans = value;
  }

  //set function gapColspan
  set gapColspan(double value) {
    _gapColspan = value;
  }

  //get function gapColspan
  double get gapColspan => _gapColspan;
}

const CrossAxisAlignment crossStart = CrossAxisAlignment.start;
const CrossAxisAlignment crossCenter = CrossAxisAlignment.center;
const CrossAxisAlignment crossEnd = CrossAxisAlignment.end;
const CrossAxisAlignment crossBaseline = CrossAxisAlignment.baseline;
const CrossAxisAlignment crossStretch = CrossAxisAlignment.stretch;

// const MainAxisAlignment mainStart = MainAxisAlignment.start;
// const MainAxisAlignment mainCenter = MainAxisAlignment.center;
const MainAxisAlignment mainStart = MainAxisAlignment.start;
const MainAxisAlignment mainCenter = MainAxisAlignment.center;
const MainAxisAlignment mainEnd = MainAxisAlignment.end;
// const MainAxisAlignment crossBaseline = MainAxisAlignment.baseline;
// const MainAxisAlignment crossStretch = MainAxisAlignment.stretch;

class GridContrainer extends StatelessWidget {
  List<GridItem> gridSys;
  double _gapX = 0;
  double _gapY = 0;

  CrossAxisAlignment _rowCrossAlign = crossStart;
  MainAxisAlignment rowMainAlign = mainStart;

  CrossAxisAlignment colCrossAlign = CrossAxisAlignment.start;
  MainAxisAlignment colMainAlign = MainAxisAlignment.start;

  GridContrainer({super.key, required this.gridSys});

  // get function rowCrossAlign
  CrossAxisAlignment get rowcRossAlign => _rowCrossAlign;
  // set function rowCrossAlign
  set rowCrossAlign(CrossAxisAlignment value) {
    _rowCrossAlign = value;
  }

  // set function gapX
  set gapX(double value) {
    _gapX = value;
  }

  // set function gapY
  set gapY(double value) {
    _gapY = value;
  }

  //set function gap
  set gap(double value) {
    _gapX = value;
    _gapY = value;
  }

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
        rows.add(_buildContainer(width, widthSizeBox, currentGrid));
      } else {
        columns.add(Row(
          crossAxisAlignment: rowcRossAlign,
          mainAxisAlignment: rowMainAlign,
          children: [...rows],
        ));
        rows.clear();
        rows.add(_buildContainer(width, widthSizeBox, currentGrid));
        totalWidth -= 12;
      }
    }

    columns.add(Row(
      crossAxisAlignment: rowcRossAlign,
      mainAxisAlignment: rowMainAlign,
      children: [...rows],
    ));

    return columns;
  }

  Container _buildContainer(
      double width, int widthSizeBox, GridItem currentGrid) {
    return Container(
      padding: EdgeInsets.only(
        left: _gapX,
        right: _gapX,
        top: _gapY,
        bottom: _gapY,
      ),
      width: (width / 12) * widthSizeBox,
      child: currentGrid._colspans.isNotEmpty
          ? Column(
              crossAxisAlignment: colCrossAlign,
              mainAxisAlignment: colMainAlign,
              children: [
                ...currentGrid._colspans,
              ],
            )
          : currentGrid._rowspans.isNotEmpty
              ? Row(
                  children: [...currentGrid._rowspans],
                )
              : currentGrid.child,
    );
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
