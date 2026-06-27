/// Creates a new execution context for an actor.
pub fn Context::new(system_id : Int, actor_id : Int) -> Context {
  { system_id, actor_id }
}

/// Sends a message to the given actor reference.
pub fn[Msg] Context::send(_self : Context, _target : ActorRef[Msg], _msg : Msg) -> Unit {
  // In a full implementation, this would look up the target actor's mailbox
  // via the ActorSystem and enqueue the message.
}
