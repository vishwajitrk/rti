import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rti/blocs/employee/employees_bloc.dart';
import 'package:rti/config/theme.dart';
import 'package:rti/model/employee.dart';
import 'package:rti/utils/app_utils.dart';
import 'package:rti/widgets/app_bar.dart';
import 'package:rti/widgets/raised_button.dart';
import 'package:rti/widgets/text_field.dart';

class AddEditEmployeePage extends StatelessWidget {
  final Employee? employee;
  const AddEditEmployeePage({Key? key, this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController roleController = TextEditingController();
    TextEditingController startDateController = TextEditingController();
    TextEditingController endDateController = TextEditingController();
    String startDate = '';
    String endDate = '';
    DateFormat dateFormat = DateFormat('dd MMM yyyy');

    if (employee != null) {
      nameController.text = employee!.name;
      roleController.text = employee!.role;

      startDate = employee!.startDate;
      startDateController.text = AppUtils.ddMMMYYYY(startDate);

      if (employee!.endDate != '') {
        endDate = employee!.endDate;
        endDateController.text = AppUtils.ddMMMYYYY(endDate);
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: AppBarTitle(
              title: '${employee != null ? 'Edit' : 'Add'} Employee Details'),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            if (employee != null)
              IconButton(
                onPressed: () {
                  context
                      .read<EmployeesBloc>()
                      .deleteEmployee(employee!.copyWith(
                        deletedAt: DateTime.now().toString(),
                      ));
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: AppColors.white,
                ),
              ),
          ]),
      body: BlocBuilder<EmployeesBloc, EmployeesState>(
        builder: (context, state) {
          if (state is EmployeesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is EmployeesLoaded) {
            return Form(
              key: formKey,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: MTextField(
                          hintText: 'Employee name',
                          controller: nameController,
                          prefixIcon: const Icon(
                            Icons.person_2_outlined,
                            color: AppColors.themePrimary,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: MTextField(
                          hintText: 'Role',
                          validationMsg: 'Please select role',
                          controller: roleController,
                          prefixIcon: const Icon(
                            Icons.cases_outlined,
                            color: AppColors.themePrimary,
                          ),
                          suffixIcon: const Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.themePrimary,
                          ),
                          readOnly: true,
                          onTap: () {
                            showModal(context, roleController);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: MTextField(
                                hintText: 'Today',
                                isValidate: false,
                                controller: startDateController,
                                readOnly: true,
                                prefixIcon: const Icon(
                                  Icons.date_range,
                                  color: AppColors.themePrimary,
                                ),
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2050),
                                  );
                                  if (pickedDate != null) {
                                    String date = dateFormat.format(pickedDate);
                                    startDate = pickedDate.toString();
                                    startDateController.text = date;
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                                width: 50,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.themePrimary,
                                )),
                            Expanded(
                              child: MTextField(
                                hintText: 'No date',
                                controller: endDateController,
                                readOnly: true,
                                prefixIcon: const Icon(
                                  Icons.date_range,
                                  color: AppColors.themePrimary,
                                ),
                                isValidate: false,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2050),
                                  );
                                  if (pickedDate != null) {
                                    String date = dateFormat.format(pickedDate);
                                    endDate = pickedDate.toString();
                                    endDateController.text = date;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MRaisedButton(
                                    text: 'Cancel',
                                    textColor: AppColors.themePrimary,
                                    color: const Color(0xFFEDF8FF),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  const SizedBox(width: 15),
                                  MRaisedButton(
                                      text: 'Save',
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState!.save();
                                          var emp = Employee(
                                            id: employee != null
                                                ? employee!.id
                                                : 0,
                                            name: nameController.value.text,
                                            role: roleController.value.text,
                                            startDate: startDate,
                                            endDate: endDate,
                                            deletedAt: '',
                                          );
                                          if (employee != null) {
                                            await context
                                                .read<EmployeesBloc>()
                                                .editEmployee(emp);
                                          } else {
                                            await context
                                                .read<EmployeesBloc>()
                                                .addEmployee(emp);
                                          }
                                          Future.delayed(
                                              const Duration(seconds: 0),
                                              () async {
                                            Navigator.pop(context);
                                          });
                                        }
                                      })
                                ],
                              )))
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      ),
    );
  }

  void showModal(context, controller) {
    final List<String> roles = [
      'Product Designer',
      'Flutter Developer',
      'QA Tester',
      'Product Owner'
    ];
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            height: 230,
            alignment: Alignment.center,
            child: ListView.separated(
                itemCount: roles.length,
                separatorBuilder: (context, int) {
                  return const Divider(color: AppColors.darkGray);
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          roles[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      )),
                      onTap: () {
                        controller.text = roles[index];
                        Navigator.of(context).pop();
                      });
                }),
          );
        });
  }
}
