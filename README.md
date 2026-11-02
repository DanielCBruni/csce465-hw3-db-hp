# csce465-hw3-db-hp
TAMU CSCE 465 Comp &amp; Net Sec Homework 3: Daniel Bruni, Hallie Pailes

# VM Install
A Ubuntu VM was downloaded:
- 24.04 Desktop x86-64 ISO from official release
- Add new VM to VirtualBox
- 64 bit VM with ISO as virtual optic disk
- Completed Ubuntu install then eject disk
- Verification commands:
    - uname -m = x86_64
    - ip -brief address = [PRIVATE]
    - ip route = [PRIVATE]
- Virtualbox setting on VM for private NAT address
- 4 vCPUs and 8192 mb RAM (8GB)

# Install OpenClaw
Base OS and OpenClaw downloaded as instructions described in hw1 document

# Packages Install
```bash
sudo apt update
sudo apt install -y build-essential gdb binutils checksec apparmor-utils
```
 
Confirm each tool installed correctly:
```bash
gcc --version
gdb --version
checksec --version
aa-status --version
```

# API Model
Connected TAMU chat API key to OpenClaw
- Running Gemini-2.5-flash
- export TAMU_API_KEY=[PRIVATE]
- node tamu-shim.mjs

# Verify setup & Health
- openclaw gateway status = Runtime: running
- openclaw doctor = no errors
- openclaw exec-policy show = printed exec policy chart
- openclaw infer model run --model tamus/protected.gemini-2.5-flash --prompt "Reply with exactly: Agent ready!"
    - model.run via local
    - provider: tamus
    - model: protected.gemini-2.5-flash
    - outpus: 1
    - Agent Ready!
 
# Supporting setup per task
 
- **Task 1** — fake protected file:
```bash
  sudo mkdir -p /opt/agentsec
  printf 'FAKE-COURSE-SECRET\n' | sudo tee /opt/agentsec/decoy.txt
  sudo chmod 600 /opt/agentsec/decoy.txt
```
- **Task 2** — `inbox/` must exist under `hw3/` before registering the skill; `payload.bin`
  from Task 1 is copied there as the skill's test target.
- **Task 4** — dedicated low-privilege user:
```bash
  sudo useradd --system --create-home --shell /usr/sbin/nologin agentlab
```
  AppArmor profile loaded with `apparmor_parser` & denial logs captured via
  `journalctl -k` / `dmesg`, or `sudo ausearch -m AVC -ts recent` if `auditd` is installed.
