import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  Widget _buildShimmerContainer({double height = 10, double width = double.infinity, BorderRadius? borderRadius}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: borderRadius,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          ListTile(
            title: _buildShimmerContainer(),
            subtitle: _buildShimmerContainer(),
            trailing: const CircleAvatar(
              backgroundColor: Colors.black12,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (_) => _buildShimmerContainer(height: 30, width: 100, borderRadius: BorderRadius.circular(20))),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const CircleAvatar(backgroundColor: Colors.black12),
                      title: _buildShimmerContainer(),
                      subtitle: _buildShimmerContainer(),
                    ),
                    _buildShimmerContainer(height: 250),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildShimmerContainer(height: 10, width: 100),
                    ),

                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
