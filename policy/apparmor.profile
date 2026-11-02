#include <tunables/global>

/home/student/csce465-agentsec/hw3/legacy_log_parser {
  #include <abstractions/base>

  /home/student/csce465-agentsec/hw3/legacy_log_parser mr,
  /home/student/csce465-agentsec/hw3/payload/** r,
  /home/student/csce465-agentsec/hw3/markers/ w,
  /home/student/csce465-agentsec/hw3/markers/** w,
  /dev/pts/* rw,

  audit deny /opt/agentsec/decoy.txt rwklx,
  audit deny /{usr/,}bin/** x,
}
