import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:sofvare/apibase/repository.dart';
import 'package:sofvare/model/match.dart';
import 'package:sofvare/services/snackbar_services.dart';
import 'package:sofvare/values/app_strings.dart';
import 'package:sofvare/values/enumerations.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  NetworkState teamState = NetworkState.idle;

  ObservableList<Team> teamsList = ObservableList.of([]);

  @computed
  String get appBarTitle {
    if (teamsList.isEmpty) {
      return 'Cricket match';
    }
    return '${teamsList.first.nameFull} vs ${teamsList.last.nameFull}';
  }

  Future<void> getMatchDetails() async {
    try {
      teamState = NetworkState.loading;
      final result = await Repository.instance.getMatchDetails();
      if (result != null ) {
        teamsList.addAll(result);
        teamState = NetworkState.success;
      } else {
        throw Exception();
      }
    } catch (e) {
      teamState = NetworkState.error;
      debugPrint(e.toString());
      SnackBarService.showSnack(AppStrings.somethingWentWrong);
    }
  }
}
