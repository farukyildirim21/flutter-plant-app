import 'package:flutter_bloc/flutter_bloc.dart';

// 0 = monthly, 1 = yearly (default)
class PaywallCubit extends Cubit<int> {
  PaywallCubit() : super(1);

  void selectPlan(int plan) => emit(plan);
}
