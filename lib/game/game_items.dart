import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Abstract class which represents The Game Items e.g Rock , Paper , Scissor
abstract class GameItem extends StatelessWidget {
  final Offset position;

  const GameItem({required this.position, Key? key}) : super(key: key);

  // Abstract method that returns a new instance of the subclass with a new position value
  GameItem copyWith({required Offset position});

  double get size;
}

// Subclass which represents the rock item
class Rock extends GameItem {
  const Rock({required Offset position, Key? key})
      : super(position: position, key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/rock.svg',
      width: size,
      height: size,
    );
  }

  @override
  Rock copyWith({required Offset position}) {
    return Rock(position: position);
  }

  @override
  double get size => 25;
}

// Subclass which represents the paper item
class Paper extends GameItem {
  const Paper({required Offset position, Key? key})
      : super(position: position, key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/paper.svg',
      width: size,
      height: size,
    );
  }

  @override
  Paper copyWith({required Offset position}) {
    return Paper(position: position);
  }

  @override
  double get size => 25;
}

// Subclass which represents the scissor item
class Scissor extends GameItem {
  const Scissor({required Offset position, Key? key})
      : super(position: position, key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/scissor.svg',
      width: size,
      height: size,
    );
  }

  @override
  Scissor copyWith({required Offset position}) {
    return Scissor(position: position);
  }

  @override
  double get size => 25;
}
