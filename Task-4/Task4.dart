import 'dart:io';


class Seat {
  int? seatNumber;
  SeatType? type;
  bool? isAvailable;
  
  Seat(this.seatNumber, this.type) {
    isAvailable = true;
  }
}

enum SeatType {
  FIRST_CLASS,
  BUSINESS_CLASS,
  ECONOMY_CLASS,
}

class Flight {
  List<Seat>? seats;
  
  Flight() {
    seats = [];
    for (int i = 0; i < 50; i++) {
      seats!.add(Seat(i + 1, SeatType.FIRST_CLASS));
    }
    for (int i = 50; i < 100; i++) {
      seats!.add(Seat(i + 1, SeatType.BUSINESS_CLASS));
    }
    for (int i = 100; i < 150; i++) {
      seats!.add(Seat(i + 1, SeatType.ECONOMY_CLASS));
    }
  }
  
  int reserveSeat(SeatType type) {
    for (Seat seat in seats!) {
      if (seat.type == type && seat.isAvailable!) {
        seat.isAvailable = false;
        return seat.seatNumber!;
      }
    }
    return -1;
  }
  
  void displaySeats() {
    print("Seat Number\tType\tAvailability");
    for (Seat seat in seats!) {
     // print("$(seat.seatNumber)\t\t$(seat.type)\t\t$(seat.isAvailable ? 'Available' : 'Not Available')");
    }
  }
}

void main() {
  Flight flight = Flight();
  
  while (true) {
    print("\nAirline Reservation System\n");
    print("1. Reserve Seat");
    print("2. View Seats");
    print("3. Exit");
    print("Enter your choice: ");
    
    int choice = int.parse(stdin.readLineSync()!);
    
    if (choice == 1) {
      print("Enter seat type (FIRST_CLASS, BUSINESS_CLASS, ECONOMY_CLASS): ");
      String? seatType = stdin.readLineSync();
      SeatType type;
      switch (seatType) {
        case "FIRST_CLASS":
          type = SeatType.FIRST_CLASS;
          break;
        case "BUSINESS_CLASS":
          type = SeatType.BUSINESS_CLASS;
          break;
        case "ECONOMY_CLASS":
          type = SeatType.ECONOMY_CLASS;
          break;
        default:
          print("Invalid seat type");
          continue;
      }
      int seatNumber = flight.reserveSeat(type);
      if (seatNumber == -1) {
        print("No seats available");
      } else {
        print("Seat reserved: $seatNumber");
      }
    } else if (choice == 2) {
      flight.displaySeats();
    } else if (choice == 3) {
      break;
    } else {
      print("Invalid choice");
    }
  }
}