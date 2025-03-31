import 'package:bookify/features/home/presentation/views/widgets/recently_viewed_bloc_builder.dart';
import 'package:flutter/material.dart';

class RecentlyViewedSection extends StatelessWidget {
  const RecentlyViewedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RecentlyViewedBlocBuilder();
  }
}
