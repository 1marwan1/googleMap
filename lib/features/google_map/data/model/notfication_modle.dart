// ignore: must_be_immutable
import '../../domain/entties/notication.dart';

class NotficationModel extends Notfication {
  NotficationModel({required String title, required String body})
      : super(title: title, body: body);
  @override
  List<Object?> get props => [super.title, super.body];
}
