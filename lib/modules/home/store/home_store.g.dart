// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  Computed<String>? _$appBarTitleComputed;

  @override
  String get appBarTitle =>
      (_$appBarTitleComputed ??= Computed<String>(() => super.appBarTitle,
              name: '_HomeStore.appBarTitle'))
          .value;

  late final _$teamStateAtom =
      Atom(name: '_HomeStore.teamState', context: context);

  @override
  NetworkState get teamState {
    _$teamStateAtom.reportRead();
    return super.teamState;
  }

  @override
  set teamState(NetworkState value) {
    _$teamStateAtom.reportWrite(value, super.teamState, () {
      super.teamState = value;
    });
  }

  @override
  String toString() {
    return '''
teamState: ${teamState},
appBarTitle: ${appBarTitle}
    ''';
  }
}
