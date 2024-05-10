part of 'layout_cubit.dart';

@immutable
sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}

final class LayoutLooding extends LayoutState {}

final class ArbicState extends LayoutState {}

final class EnglishState extends LayoutState {}
