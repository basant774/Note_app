import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:noteapp/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:noteapp/views/widgets/add_note_form.dart';
import 'package:noteapp/views/widgets/constns.dart';
import 'package:noteapp/views/widgets/custom_button.dart';
import 'package:noteapp/views/widgets/custom_textField.dart';
import 'add_note_form.dart';
import 'custom_button.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  // bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: BlocConsumer<AddNotesCubit, AddNotesState>(
              listener: (context, state) {
                if (state is AddNoteFailure) {
                  print('failed ${state.errMessage}');
                }
                if (state is AddNoteSuccess) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                    inAsyncCall: state is AddNoteLoading ? true : false,
                    child: AddNoteForm());
              },
            ),
          ),
        ),
      ),
    );
  }
}
