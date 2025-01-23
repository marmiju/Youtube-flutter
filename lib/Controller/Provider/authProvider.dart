import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/Controller/Services/User/authServices.dart';

final AuthProvider = Provider((ref) => AuthService());
