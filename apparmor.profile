#include <tunables/global>

/home/student/csce465-agentsec/hw3/legacy_log_parser {
  #include <abstractions/base>

  /home/student/csce465-agentsec/hw3/legacy_log_parser mr,
  /home/student/csce465-agentsec/hw3/payload/** r,
  /home/student/csce465-agentsec/hw3/markers/ rw,
  /home/student/csce465-agentsec/hw3/markers/** rw,
  /dev/pts/* rw,

  audit deny /opt/agentsec/decoy.txt rwklx,
  audit deny /{usr/,}bin/** x,
}
