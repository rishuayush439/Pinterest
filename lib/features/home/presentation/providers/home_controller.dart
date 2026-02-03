import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/pin.dart';

class HomeState {
  final bool isGridCompact;
  final List<Pin> pins;

  HomeState({required this.isGridCompact, required this.pins});

  HomeState copyWith({bool? isGridCompact, List<Pin>? pins}) {
    return HomeState(
      isGridCompact: isGridCompact ?? this.isGridCompact,
      pins: pins ?? this.pins,
    );
  }
}

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeState(isGridCompact: false, pins: []));

  void toggleGrid() {
    state = state.copyWith(isGridCompact: !state.isGridCompact);
  }

  void setPins(List<Pin> pins) {
    state = state.copyWith(pins: pins);
  }
}

final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(),
);
