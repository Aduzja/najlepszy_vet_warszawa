part of 'clinics_cubit.dart';

@immutable
class ClinicsState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;
  const ClinicsState(
      {required this.documents,
      required this.isLoading,
      required this.errorMessage});
}
