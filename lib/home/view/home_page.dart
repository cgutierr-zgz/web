import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web/app/app.dart';
import 'package:web/home/home.dart';
import 'package:web/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const _size = 40.0;
  static const _toolbarHeight = 90.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    final color =
        theme.brightness == Brightness.light ? Colors.black : Colors.white;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _toolbarHeight,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: SizedBox(
                height: _size,
                width: _size,
                child: Assets.images.logo.svg(color: color),
              ),
              onPressed: () => context.read<SettingsCubit>().updateTheme(),
            ),
            Expanded(
              child: Text(
                l10n.pageTitle,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ].joinWithSeparator(HorizontalSpacer.medium()),
        ),
        centerTitle: false,
        actions: [
          SocialIcon(
            icon: Assets.images.github.svg(color: color),
            url: SocialLinks.gitHub,
          ),
          SocialIcon(
            icon: Assets.images.linkedin.svg(color: color),
            url: SocialLinks.linkedIn,
          ),
        ],
      ),
      body: const Center(child: HomeBody()),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  static const mail = SocialLinks.email;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final color =
        theme.brightness == Brightness.light ? Colors.black : Colors.white;

    return TextButton(
      style: TextButton.styleFrom(primary: color),
      child: Text('${l10n.contactMeAt} $mail'),
      onPressed: () => openUrl('mailto:$mail'),
    );
  }
}
