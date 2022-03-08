import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:summaries_app/domain/model/result_cep_model.dart';
import 'package:summaries_app/domain/model/result_position_stack_model.dart';
import 'package:summaries_app/services/position_stack_service.dart';
import 'package:summaries_app/services/via_cep_service.dart';

class MapsScreen extends StatefulWidget {
  final ResultCepModel cepModel;
  const MapsScreen({
    Key? key,
    required this.cepModel,
  }) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late Future<ResultPositionStackModel>
      positionStackModel; //=ResultPositionStackModel(0, 0);

  ResultCepModel get cepModel => widget.cepModel;

  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  fetchLocation() async {
    positionStackModel = PositionStackService.fetchLonLat(cepModel);
  }

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildFutureBody(),
    );
  }

  FutureBuilder<ResultPositionStackModel> _buildFutureBody() {
    return FutureBuilder<ResultPositionStackModel>(
      future: positionStackModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          return _buildMap(snapshot.data);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _buildMap(latLng) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(latLng.latitude, latLng.longitude),
        zoom: 14.4746,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
