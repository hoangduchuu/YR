import 'package:equatable/equatable.dart';

class Pair<T, U> extends Equatable{
  String erroMsg;
  Pair(this.left, this.right, {this.erroMsg});

  final T left;
  final U right;

  @override
  String toString() => 'Pair[$left, $right]';
}