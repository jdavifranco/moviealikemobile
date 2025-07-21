import 'package:flutter/material.dart';
import 'package:moviealike/domain/movies/models/movie_provider.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/extensions/text_style_extensions.dart';
import 'package:moviealike/presentation/common/remote_image/remote_image.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/widgets/container_with_ripple_effect.dart';
import 'package:url_launcher/url_launcher.dart';

class WatchProvidersList extends StatefulWidget {
  final List<MovieProvider> watchProviders;

  const WatchProvidersList({super.key, required this.watchProviders});

  @override
  State<WatchProvidersList> createState() => _WatchProvidersListState();
}

class _WatchProvidersListState extends State<WatchProvidersList> {
  late double textSize = 30;

  @override
  void didChangeDependencies() {
    textSize = context.typography.body2
        .getTextSize(context: context, maxLines: 1, maxWidth: 70)
        .height;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            context.text.availableOn,
            style: context.typography.heading3.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: context.dimensionScheme.movierProviderSize +
              textSize +
              10, // Fixed height for the horizontal list
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: widget.watchProviders.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final provider = widget.watchProviders[index];
              return SizedBox(
                width:
                    context.dimensionScheme.movierProviderSize + textSize + 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          8), // Rounded corners for the logo
                      child: ContainerWithRippleEffect(
                        onTap: () async {
                          final url = provider.link;
                          if (url != null &&
                              await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url),
                                mode: LaunchMode.externalApplication);
                          } else {
                            print("Could not launch $url");
                          }
                        },
                        child: RemoteImage(
                          imageUrl:
                              "https://image.tmdb.org/t/p/original/${provider.logoPath}",
                          width: context.dimensionScheme.movierProviderSize,
                          height: context.dimensionScheme.movierProviderSize,
                          fit: BoxFit.cover,
                          color: AppColors.secondary,
                          placeholder: Container(
                            child: Center(
                              child: Icon(Icons.stream, size: 30),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            child: Center(
                              child: Icon(Icons.stream, size: 30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      provider.providerName ?? "",
                      style: context.typography.body2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
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
