import 'package:flutter/foundation.dart';

enum OrderStatus {
  pending,
  processing,
  shipped,
  delivered,
  cancelled,
  refunded,
}

enum LabsOrderStatus { pending, processing, received, completed, cancelled }

enum ReservationStatus { pending, processing, completed, cancelled }

// ==================== Classes ====================

class Order {
  final OrderStatus status;

  Order(this.status);

  bool canCancel() {
    // YES: Pending, Processing
    if (status == OrderStatus.pending || status == OrderStatus.processing) {
      return true;
    }

    // NO MESSAGE: Cannot cancel (Shipped, Delivered)
    if (status == OrderStatus.shipped || status == OrderStatus.delivered) {
      return false;
    }

    // NO MESSAGE: Already Cancelled/Refunded
    if (status == OrderStatus.cancelled || status == OrderStatus.refunded) {
      return false;
    }

    return false;
  }
}

class LabsOrder {
  final LabsOrderStatus status;

  LabsOrder(this.status);

  bool canCancel() {
    // YES: Pending, Processing
    if (status == LabsOrderStatus.pending ||
        status == LabsOrderStatus.processing) {
      return true;
    }

    // NO MESSAGE: Cannot cancel (Received, Completed)
    if (status == LabsOrderStatus.received ||
        status == LabsOrderStatus.completed) {
      return false;
    }

    // Already cancelled
    if (status == LabsOrderStatus.cancelled) {
      return false;
    }

    return false;
  }
}

class Reservation {
  final ReservationStatus status;

  Reservation(this.status);

  bool canCancel() {
    // YES: Pending, Processing
    if (status == ReservationStatus.pending ||
        status == ReservationStatus.processing) {
      return true;
    }

    // NO: Completed, Cancelled
    if (status == ReservationStatus.completed ||
        status == ReservationStatus.cancelled) {
      return false;
    }

    return false;
  }
}

// ==================== StateHelper ====================

class StateHelper {
  /// Convert string to OrderStatus (case-insensitive)
  static OrderStatus? parseOrderStatus(String state) {
    final lowerState = state.toLowerCase().trim();

    for (var status in OrderStatus.values) {
      if (status.name.toLowerCase() == lowerState) {
        return status;
      }
    }
    return null;
  }

  /// Convert string to LabsOrderStatus (case-insensitive)
  static LabsOrderStatus? parseLabsOrderStatus(String state) {
    final lowerState = state.toLowerCase().trim();

    for (var status in LabsOrderStatus.values) {
      if (status.name.toLowerCase() == lowerState) {
        return status;
      }
    }
    return null;
  }

  /// Convert string to ReservationStatus (case-insensitive)
  static ReservationStatus? parseReservationStatus(String state) {
    final lowerState = state.toLowerCase().trim();

    for (var status in ReservationStatus.values) {
      if (status.name.toLowerCase() == lowerState) {
        return status;
      }
    }
    return null;
  }

  /// Check if an order can be cancelled by string state
  static bool canCancelOrder(String state) {
    final status = parseOrderStatus(state);
    if (status == null) return false;
    return Order(status).canCancel();
  }

  /// Check if a labs order can be cancelled by string state
  static bool canCancelLabsOrder(String state) {
    final status = parseLabsOrderStatus(state);
    if (status == null) return false;
    return LabsOrder(status).canCancel();
  }

  /// Check if a reservation can be cancelled by string state
  static bool canCancelReservation(String state) {
    final status = parseReservationStatus(state);
    if (status == null) return false;
    return Reservation(status).canCancel();
  }

  static bool showPaymenyButtonOrder(String state) {
    final status = parseOrderStatus(state);

    if (status == null) return false;

    if (status == OrderStatus.pending) {
      if (kDebugMode) {
        print("Reservation status:********************************** $status");
      }
      return true;
    }

    return false;
  }

  static bool showPaymenyButtonLabs(String state) {
    final status = parseLabsOrderStatus(state);
    if (status == null) return false;

    if (status == LabsOrderStatus.pending) {
      return true;
    }

    return false;
  }

  static bool showPaymenyButtonReservation(String state) {
    final status = parseReservationStatus(state);

    if (status == null) return false;

    if (status == ReservationStatus.pending) {
      return true;
    }

    return false;
  }
}
