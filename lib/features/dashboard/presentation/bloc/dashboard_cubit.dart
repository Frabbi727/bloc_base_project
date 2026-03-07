import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/entities/shops_page.dart';
import '../../domain/repositories/dashboard_repository.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository repository;
  bool _isLoadingMore = false;
  static const double _scrollThreshold = 200;

  DashboardCubit(this.repository) : super(const DashboardState());

  Future<void> load({int page = 1, int perPage = 10}) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    final result = await repository.getShops(page: page, perPage: perPage);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: DashboardStatus.failure,
          errorMessage: ErrorHandler.getErrorMessage(failure),
        ),
      ),
      (pageData) => emit(
        state.copyWith(
          status: DashboardStatus.success,
          data: pageData,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> nextPage() async {
    final data = state.data;
    if (data == null || !data.hasNextPage || _isLoadingMore) return;
    _isLoadingMore = true;
    emit(state.copyWith(status: DashboardStatus.loading));
    final result = await repository.getShops(
      page: data.currentPage + 1,
      perPage: data.perPage,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: DashboardStatus.failure,
          errorMessage: ErrorHandler.getErrorMessage(failure),
        ),
      ),
      (pageData) {
        final merged = data.shops + pageData.shops;
        final mergedPage = ShopsPage(
          currentPage: pageData.currentPage,
          shops: merged,
          firstPageUrl: pageData.firstPageUrl,
          from: pageData.from,
          lastPage: pageData.lastPage,
          lastPageUrl: pageData.lastPageUrl,
          links: pageData.links,
          nextPageUrl: pageData.nextPageUrl,
          path: pageData.path,
          perPage: pageData.perPage,
          prevPageUrl: pageData.prevPageUrl,
          to: pageData.to,
          total: pageData.total,
        );
        emit(
          state.copyWith(
            status: DashboardStatus.success,
            data: mergedPage,
            errorMessage: null,
          ),
        );
      },
    );
    _isLoadingMore = false;
  }

  Future<void> prevPage() async {
    final data = state.data;
    if (data == null || !data.hasPrevPage) return;
    await load(page: data.currentPage - 1, perPage: data.perPage);
  }

  Future<void> refresh() async {
    final data = state.data;
    await load(page: data?.currentPage ?? 1, perPage: data?.perPage ?? 10);
  }

  void handleScroll({
    required double pixels,
    required double maxScrollExtent,
  }) {
    if (pixels >= maxScrollExtent - _scrollThreshold) {
      nextPage();
    }
  }
}
