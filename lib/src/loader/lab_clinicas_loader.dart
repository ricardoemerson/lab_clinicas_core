import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';

import '../widgets/app_loader.dart';

class LabClinicasLoader extends AsyncOverlay {
  LabClinicasLoader()
      : super(
          id: 0,
          builder: (BuildContext context, AsyncValue<RouteSettings> settings) {
            return const AppLoader();
          },
        );
}
