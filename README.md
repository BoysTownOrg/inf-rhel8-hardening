# EL8_hardening

## harden Rocky 8 / RHEL 8 based on DISA STIGS

run "./run.sh check" to check system for application of chosen STIGs<br>
run "./run.sh harden" to apply and check STIG application status<br>

### 
MOUNTS contains a list of mount points that should exist as separate mounts on the system<br>
PACKAGES contains a list of packages to add or remove after inital install of Rocky / RHEL 8<br>
STIG_LIST contains the working set of STIGS, STIGS listed as "Open" in theis list will be applied and/or checked<br>
SCRIPTS directory contains the scripts to apply and/or check each STIG<br>