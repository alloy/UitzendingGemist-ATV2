// vi: ft=javascript

// Returns the full controller stack.
//
function stack() {
  return [[[BRApplicationStackManager singleton] stack] controllers];
}

// Returns the current top-most controller on the controller stack.
//
function controller() {
  return [stack() lastObject];
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

function methods(objectOrClass) {
  var count = new new Type("I");
  var methods = class_copyMethodList([objectOrClass class], count);
  var methodsArray = [];
  for(var i = 0; i < *count; i++) {
    var method = methods[i];
    //methodsArray.push({selector:method_getName(method), implementation:method_getImplementation(method)});
    methodsArray.push(method_getName(method));
  }
  free(methods);
  free(count);
  return methodsArray;
}

function protocols(objectOrClass) {
  var count = new new Type("I");
  var protocols = class_copyProtocolList([objectOrClass class], count);
  var protocolsArray = [];
  for(var i = 0; i < *count; i++) {
    var protocol = protocols[i];
    protocolsArray.push(protocol_getName(protocol));
  }
  free(protocols);
  free(count);
  return protocolsArray;
}
