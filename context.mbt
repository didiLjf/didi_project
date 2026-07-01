/// Creates a new execution context for an actor.
pub fn Context::new(system_id : Int, actor_id : Int) -> Context {
  { system_id, actor_id }
}

/// Sends a message to the given actor reference.
pub fn[Msg] Context::send(_self : Context, target : ActorRef[Msg], msg : Msg) -> Unit {
  try {
    let _ = target.mailbox.try_put(msg)
  } catch {
    _ => ()
  }
}
