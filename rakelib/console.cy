// vi: ft=javascript

function controller() {
  return [[[[BRApplicationStackManager singleton] stack] controllers] lastObject];
}

function $(classNameRegexp, control) {
  if (control == undefined) control = controller();
  for each (var subcontrol in control.subcontrols) {
    if (class_getName(subcontrol.class).match(classNameRegexp)) {
      return subcontrol;
    } else {
      var found = $(classNameRegexp, subcontrol);
      if (found) return found;
    }
  }
  return null;
}

// This dumps the control tree to /var/log/syslog.
function dump(control) {
  if (control == undefined) control = controller();
  [control _dumpControlTree];
}
