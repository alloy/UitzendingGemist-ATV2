// vi: ft=javascript

// Returns the current top-most controller on the controller stack.
//
function controller() {
  return [[[[BRApplicationStackManager singleton] stack] controllers] lastObject];
}

// Returns the control in the control tree whose class name matches the given
// regexp.
//
// When the `control` argument is omitted, this starts traversal from the
// current top-most controller.
//
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
//
// When the `control` argument is omitted, this starts traversal from the
// current top-most controller.
//
function dump(control) {
  if (control == undefined) control = controller();
  [control _dumpControlTree];
}
