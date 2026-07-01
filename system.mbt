/// An ActorSystem manages the lifecycle and execution of actors.
pub struct ActorSystem {
  name : String
  next_actor_id : Ref[Int]
  group : @async.TaskGroup[Unit]
}

/// Creates a new ActorSystem.
pub fn ActorSystem::new(name : String, group : @async.TaskGroup[Unit]) -> ActorSystem {
  { name, next_actor_id: { val: 0 }, group }
}

/// Spawns a new actor with the given behavior and initial state.
pub fn[State, Msg] ActorSystem::spawn(
  self : ActorSystem,
  behavior : Behavior[State, Msg],
  initial_state : State
) -> ActorRef[Msg] {
  let id = self.next_actor_id.val
  self.next_actor_id.val = id + 1
  
  let mailbox = @aqueue.Queue(kind=@aqueue.Unbounded)
  let actor_ref = { id, mailbox }
  
  let context = { system_id: 0, actor_id: id }
  
  self.group.spawn_bg(no_wait=true, () => {
    actor_loop(context, initial_state, behavior, mailbox)
  })
  
  actor_ref
}

async fn[State, Msg] actor_loop(
  context : Context,
  initial_state : State,
  behavior : Behavior[State, Msg],
  mailbox : @aqueue.Queue[Msg]
) -> Unit {
  let mut state = initial_state
  try {
    for ;; {
      let msg = mailbox.get()
      state = behavior(context, state, msg)
    }
  } catch {
    _ => ()
  }
}
