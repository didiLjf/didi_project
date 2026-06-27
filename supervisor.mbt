/// Defines the strategy used by a supervisor when a child actor fails.
pub enum SupervisionStrategy {
  /// Restart only the failed child actor.
  OneForOne
  /// Restart all child actors managed by the supervisor.
  OneForAll
  /// Restart the failed child actor and any actors started after it.
  RestForOne
}

/// A Supervisor manages a set of child actors and applies a supervision strategy upon failure.
pub struct Supervisor {
  strategy : SupervisionStrategy
  max_retries : Int
}

/// Creates a new Supervisor with the specified strategy and retry limit.
pub fn Supervisor::new(strategy : SupervisionStrategy, max_retries : Int) -> Supervisor {
  { strategy, max_retries }
}

test "supervisor creation" {
  let _s1 = Supervisor::new(OneForOne, 3)
  let _s2 = Supervisor::new(OneForAll, 3)
  let _s3 = Supervisor::new(RestForOne, 3)
}
