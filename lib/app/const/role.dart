enum Role {
  carry,
  support,
  nuker,
  disabler,
  jungler,
  durable,
  escape,
  pusher,
  initiator,
}

extension RoleExtension on Role {
  String get roleName {
    switch (this) {
      case Role.carry:
        return 'Carry';
      case Role.support:
        return 'Support';
      case Role.nuker:
        return 'Nuker';
      case Role.disabler:
        return 'Disabler';
      case Role.jungler:
        return 'Jungler';
      case Role.durable:
        return 'Durable';
      case Role.escape:
        return 'Escape';
      case Role.pusher:
        return 'Pusher';
      case Role.initiator:
        return 'Initiator';
    }
  }
}
