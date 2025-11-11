import 'package:flutter_riverpod/legacy.dart';

// my model class
class SearchMModel {
  final String searchItem;
  final bool getOffer;

  SearchMModel({
    required this.searchItem,
    required this.getOffer,
  });

  SearchMModel copyWith({
    String? searchItem,
    bool? getOffer,
  }) {
    return SearchMModel(
      searchItem: searchItem ?? this.searchItem,
      getOffer: getOffer ?? this.getOffer,
    );
  }
}

// my notifier class
class SearchMNotifier extends StateNotifier<SearchMModel> {
  SearchMNotifier()
      : super(SearchMModel(searchItem: "", getOffer: false));

  void searchFnc(String query) {
    state = state.copyWith(searchItem: query);
  }

  void onChangeOffer(bool offer) {
    state = state.copyWith(getOffer: offer);
  }
}

// my provider
final searchSNPod =
    StateNotifierProvider<SearchMNotifier, SearchMModel>((ref) {
  return SearchMNotifier();
});
