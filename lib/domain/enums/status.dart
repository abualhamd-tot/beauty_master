enum Status {
  pending,
  approved,
  cancelled;

  static Status fromString(String status) {
    return switch (status.toLowerCase()) {
      'pending' => Status.pending,
      'approved' => Status.approved,
      'cancelled' => Status.cancelled,
      _ => Status.pending,
    };
  }
}
