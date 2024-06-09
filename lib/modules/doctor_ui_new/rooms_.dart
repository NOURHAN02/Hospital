import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_project1/class/cubit/doctor_states.dart';

import '../../class/cubit/doctor_cubit.dart';
import '../../shared/components/components.dart';

class Rooms extends StatelessWidget {
  const Rooms({this.patient, super.key});
  final patient;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: () {
        CubitDoctorHosptial.get(context).GetRooms();
      }(),
      builder: (context, snapshot) {
        return BlocConsumer<CubitDoctorHosptial, DoctorStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var Room = CubitDoctorHosptial.get(context).room;
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  'Rooms',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          // backgroundColor: Color(0xff3D85C6),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Rooms(
                                  patient: patient,
                                )));
                        CubitDoctorHosptial.get(context)
                            .removeFirstPatient();
                        CubitDoctorHosptial.get(context).showFinishRequestSentDialo(context);
                      },
                      child: const Text(
                        "Finish",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.blue,
                          fontFamily: 'Readex Pro',
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: state is InitialRoomsState
                    ? const Center(
                        child: SizedBox(
                          width: 50,
                          height: 20,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => RoomShap(
                                  Room[index], context, patient, index),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 10,
                              ),
                              itemCount: Room.length,
                            ),
                          ),
                        ],
                      ),
              ),
            );
          },
        );
      },
    );
  }
}
