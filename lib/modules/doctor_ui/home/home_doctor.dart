import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../class/cubit/doctor_cubit.dart';
import '../../../class/cubit/doctor_states.dart';
import '../../../shared/components/components.dart';

class HomeDoctor extends StatelessWidget {
  const HomeDoctor({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: () {
        CubitDoctorHosptial.get(context).getdata();
      }(),
      builder: (context, snapshot) {
        return BlocBuilder<CubitDoctorHosptial, DoctorStates>(
          builder: (context, state) {
            var patientitem = CubitDoctorHosptial.get(context).patient;
            // make it this screen remove the frist patient in list and put it in current
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_new_sharp,
                      color: Colors.white),
                ),
                title: const Text(
                  "welcome back",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),

              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: state is InitialPatientState
                    ? const Center(
                        child: SizedBox(
                          width: 50,
                          height: 20,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  width: double.infinity,
                                  height: 150,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          color: const Color(0xff3D85C6),
                                          width: double.infinity,
                                          height: 30,
                                          child: const Center(
                                            child: Text(
                                              "Current Patient",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        // current patient
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 5.0, 0.0, 5.0),
                                          child: patientitem.isNotEmpty
                                              ? PatientUsertime(
                                                  patientitem[0], context)
                                              : const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 40, 10, 40),
                                                  child: Text(
                                                    'No current patient',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      // changes position of shadow
                                    ),
                                  ],
                                ),
                                width: double.infinity,
                                height: 400,
                                child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Container(
                                          color: const Color(0xff3D85C6),
                                          width: double.infinity,
                                          height: 30,
                                          child: const Center(
                                            child: Text(
                                              " ALL Patient",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )),
                                      patientitem.isNotEmpty
                                          ? Expanded(
                                              child: ListView.separated(
                                                scrollDirection: Axis.vertical,
                                                itemBuilder: (context, index) =>
                                                    PatientUsertime(
                                                        patientitem[index],
                                                        context),
                                                separatorBuilder:
                                                    (context, index) =>
                                                        const SizedBox(
                                                  height: 10,
                                                ),
                                                itemCount: patientitem.length,
                                              ),
                                            )
                                          : const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 150, 10, 150),
                                              child: Text(
                                                'No current patient',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
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
