import 'package:flutter/material.dart';
import 'package:moviealike/domain/movies/models/cast_member.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/remote_image/remote_image.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/widgets/container_with_ripple_effect.dart';

class CastAndCrewList extends StatelessWidget {
  final List<CastMember> members;
  final bool isLoading;
  final Function(String) onTap;
  const CastAndCrewList(
      {Key? key,
      required this.members,
      required this.onTap,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.dimensionScheme.screenMargin),
          child: Text(
            context.text.castAndCrew,
            style: context.typography.heading3.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 125,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
                horizontal: context.dimensionScheme.screenMargin),
            itemCount: members.length,
            separatorBuilder: (_, __) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              final member = members[index];
              if (member.profilePath == null) {
                return const SizedBox.shrink();
              }
              return SizedBox(
                width: 100,
                child: Column(
                  children: [
                    RemoteImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w185/${member.profilePath}",
                      imageBuilder: (context, imageProvider) =>
                          ContainerWithRippleEffect(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        onTap: () {
                          onTap(member.id.toString());
                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: imageProvider,
                        ),
                      ),
                      placeholder: const CircleAvatar(
                        radius: 40,
                        child: Center(
                          child:
                              Icon(Icons.person, color: Colors.white, size: 40),
                        ),
                      ),
                      errorWidget: (context, url, error) => const CircleAvatar(
                        radius: 40,
                        child: Center(
                          child:
                              Icon(Icons.person, color: Colors.white, size: 40),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        member.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        member.knownForDepartment == "Acting"
                            ? member.character
                            : member.job ?? member.knownForDepartment,
                        style: context.typography.heading6.copyWith(
                          color: AppColors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
