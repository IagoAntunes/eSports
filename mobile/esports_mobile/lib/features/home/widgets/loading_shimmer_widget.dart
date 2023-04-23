import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/colors/app_colors.dart';

class LoadingShimmerWidget extends StatelessWidget {
  const LoadingShimmerWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {},
          child: SizedBox(
            child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.green, AppColors.black.withOpacity(0.4)],
                  ).createShader(
                    Rect.fromLTRB(0, 0, rect.width, rect.height),
                  );
                },
                blendMode: BlendMode.dstIn,
                child: Shimmer.fromColors(
                  baseColor: AppColors.greyDark,
                  highlightColor: AppColors.white.withOpacity(0.1),
                  direction: ShimmerDirection.ltr,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: AppColors.greyDark,
                    ),
                    child: Container(
                      width: size.width * 0.5,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.black.withOpacity(0.0),
                            AppColors.black.withOpacity(0.5),
                            AppColors.black.withOpacity(0.8),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.red,
                            ),
                            child: Text(
                              'wadwwadad',
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "announcement(s)",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppColors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
