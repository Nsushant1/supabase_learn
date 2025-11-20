import 'package:flutter/material.dart';
import 'package:supabase_carparking_app/main.dart';
import 'package:supabase_carparking_app/repository/adapter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ParkingRepository extends Adapter {
  @override
  Future<dynamic> addCarProfile(
    String carModel,
    String carNumber,
    String carColor,
    BuildContext context,
  ) async {
    try {
      final data = await supabase.from('vehicle').insert({
        'user_Id': supabaseProvider.userId,
        'car_model': carModel,
        'car_number': carNumber,
        'car_color': carColor,
      }).select();

      if (data.isNotEmpty) {
        if (context.mounted) {
          Navigator.pushNamed(context, "/");
        }
      }
    } on PostgrestException catch (e) {
      if (context.mounted) {
        switch (e.code) {
          case '23505':
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('This already exist')));
            break;
          case '42501':
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Unauthorized: You dont have access"),
              ),
            );
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Unknown Error: ${e.message}")),
            );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("An unexpected error : $e")));
      }
    }
  }

  @override
  Future<dynamic> createAccount(String email, BuildContext context) async {
    try {
      final data = await supabase.from('profile').insert({
        'email': email,
      }).select();

      if (data.isNotEmpty) {
        supabaseProvider.setUserId(data[0]['id']);
        if (context.mounted) {
          Navigator.pushNamed(context, "/emailVerification");
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to create account ")),
          );
        }
      }
    } on PostgrestException catch (e) {
      if (context.mounted) {
        switch (e.code) {
          case '23505':
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('This already exist')));
            break;
          case '42501':
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Unauthorized: You dont have access"),
              ),
            );
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Unknown Error: ${e.message}")),
            );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("An unexpected error : $e")));
      }
    }
  }

  @override
  Future<dynamic> getAllBookings(BuildContext context) {
    // TODO: implement getAllBookings
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getAvailableSlots(BuildContext context, int parkingAreaId) {
    // TODO: implement getAvailableSlots
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getFloorsByParkingLot(
    BuildContext context,
    int parkingAreaId,
  ) {
    // TODO: implement getFloorsByParkingLot
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getMyFavorites(BuildContext context) {
    // TODO: implement getMyFavorites
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getMyNotifications() {
    // TODO: implement getMyNotifications
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getMyVehicles(BuildContext context) {
    // TODO: implement getMyVehicles
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getParkingareas(BuildContext context) async {
    try {
     return await supabase.schema('parking').from('parking_area').select('*');
    } on PostgrestException catch (e) {
      if (context.mounted) {
        switch (e.code) {
          case '23505':
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('This already exist')));
            break;
          case '42501':
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Unauthorized: You dont have access"),
              ),
            );
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Unknown Error: ${e.message}")),
            );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("An unexpected error : $e")));
      }
    }
  }

  @override
  Future<dynamic> getSlotsbyParkingFloor(
    BuildContext context,
    int parkingFloorId,
    int parkingAreaId,
  ) {
    // TODO: implement getSlotsbyParkingFloor
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getSpecificSlot(BuildContext context, int slotId) {
    // TODO: implement getSpecificSlot
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getSpecificVehicle(BuildContext context, int vehicleId) {
    // TODO: implement getSpecificVehicle
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getTotalFee(BuildContext context) {
    // TODO: implement getTotalFee
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getUserProfile(BuildContext context) {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }

  @override
  Future<dynamic> removeFavourite(BuildContext context, int id) {
    // TODO: implement removeFavourite
    throw UnimplementedError();
  }

  @override
  Future<dynamic> saveAsFavorite(int parkingArea, BuildContext context) {
    // TODO: implement saveAsFavorite
    throw UnimplementedError();
  }

  @override
  Future<dynamic> saveParkingDetail(
    BuildContext context,
    String parkingDate,
    String entryTime,
    int durationInHours,
    String exitTime,
    Map<String, dynamic> parkingarea,
    int vehicleId,
    int parkingSlotId,
  ) {
    // TODO: implement saveParkingDetail
    throw UnimplementedError();
  }

  @override
  Future<dynamic> searchFavourite(BuildContext context, String searchWord) {
    // TODO: implement searchFavourite
    throw UnimplementedError();
  }

  @override
  Future<dynamic> searchParkingArea(BuildContext context, String searchWord) {
    // TODO: implement searchParkingArea
    throw UnimplementedError();
  }

  @override
  Future<dynamic> signInUser(String email, BuildContext context) async {
    try {
      final data = await supabase
          .from('profile')
          .select('*')
          .eq('email', email);
      if (context.mounted) {
        if (data.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email address deosnt exists ")),
          );
        } else if (data.length == 1) {
          supabaseProvider.setUserId(data[0]['id']);
          Navigator.pushNamed(context, "/home");
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Failed !!!')));
        }
      }
    } on PostgrestException catch (e) {
      if (context.mounted) {
        switch (e.code) {
          case '23505':
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('This already exist')));
            break;
          case '42501':
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Unauthorized: You dont have access"),
              ),
            );
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Unknown Error: ${e.message}")),
            );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("An unexpected error : $e")));
      }
    }
  }

  @override
  void updateSlotAvailability(int parkingSlotId) {
    // TODO: implement updateSlotAvailability
    throw UnimplementedError();
  }

  @override
  Future<dynamic> updateUserProfile(
    String name,
    String phoneNumber,
    String carModel,
    String carNumber,
    String carColor,
    BuildContext context,
  ) async {
    try {
      final data = await supabase
          .from('profile')
          .update({'name': name, 'phone_no': phoneNumber})
          .eq('id', supabaseProvider.userId)
          .select();

      if (data.isNotEmpty) {
        if (context.mounted) {
          addCarProfile(carModel, carNumber, carColor, context);
        }
      }
    } on PostgrestException catch (e) {
      if (context.mounted) {
        switch (e.code) {
          case '23505':
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('This already exist')));
            break;
          case '42501':
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Unauthorized: You dont have access"),
              ),
            );
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Unknown Error: ${e.message}")),
            );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("An unexpected error : $e")));
      }
    }
  }
}
