import 'package:equatable/equatable.dart';

class PageLink extends Equatable {
  final String? url;
  final String label;
  final int? page;
  final bool active;

  const PageLink({
    required this.url,
    required this.label,
    required this.page,
    required this.active,
  });

  @override
  List<Object?> get props => [url, label, page, active];
}
