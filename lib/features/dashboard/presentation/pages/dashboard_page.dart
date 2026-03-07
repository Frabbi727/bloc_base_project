import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../domain/entities/shop.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../bloc/dashboard_cubit.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardCubit(getIt<DashboardRepository>())..load(),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatefulWidget {
  const _DashboardView();

  @override
  State<_DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<_DashboardView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    context.read<DashboardCubit>().handleScroll(
          pixels: _scrollController.position.pixels,
          maxScrollExtent: _scrollController.position.maxScrollExtent,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shops'),
        actions: [
          IconButton(
            onPressed: () => context.read<DashboardCubit>().refresh(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state.status == DashboardStatus.loading && state.data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == DashboardStatus.failure &&
              state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }

          final data = state.data;
          if (data == null || data.shops.isEmpty) {
            return const Center(child: Text('No shops found'));
          }

          return RefreshIndicator(
            onRefresh: () => context.read<DashboardCubit>().refresh(),
            child: ListView.separated(
              controller: _scrollController,
              itemCount: data.shops.length + 1,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                if (index == data.shops.length) {
                  final loadingMore = state.status == DashboardStatus.loading &&
                      data.hasNextPage;
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: loadingMore
                          ? const CircularProgressIndicator()
                          : const SizedBox.shrink(),
                    ),
                  );
                }
                final shop = data.shops[index];
                return _ShopTile(shop: shop);
              },
            ),
          );
        },
      ),
    );
  }
}

class _ShopTile extends StatelessWidget {
  final Shop shop;

  const _ShopTile({required this.shop});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${shop.shopNo} • ${shop.ownerName}'),
      subtitle: Text('Meter: ${shop.meterNo ?? '-'} | SQFT: ${shop.sqft ?? '-'}'),
      trailing: Icon(
        shop.isActive ? Icons.check_circle : Icons.cancel,
        color: shop.isActive ? Colors.green : Colors.red,
      ),
    );
  }
}
