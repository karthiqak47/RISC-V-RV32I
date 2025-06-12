# RISC-V-RV32I
RISC-V RV32I Processor (5-Stage Pipeline) This repository contains the Verilog implementation of a 32-bit RISC-V RV32I processor based on the open-source RISC-V ISA specification. 
# 🚀 RISC-V RV32I Processor (5-Stage Pipeline)

This repository contains a Verilog-based implementation of a 32-bit RISC-V RV32I processor. The design follows a classic 5-stage pipelined architecture and supports the complete RV32I instruction set, compliant with the RISC-V open standard.

---

## 📚 Overview

This processor is built around the following pipeline stages:

1. **IF (Instruction Fetch)**  
2. **ID (Instruction Decode & Register Fetch)**  
3. **EX (Execute / ALU operations)**  
4. **MEM (Memory Access)**  
5. **WB (Write Back)**

It is designed to be modular, scalable, and ideal for academic or experimental projects involving RISC-V architecture.

---

## ✅ Features

- ✔️ Full support for RV32I base instruction set
- 🔁 5-stage pipelined design
- 🔄 Hazard detection and data forwarding
- 🧠 Branch prediction and control logic
- 🧩 Modular Verilog code structure
- 📊 Testbenches for functional validation

## 🛠️ Tools & Requirements

- **Simulator:** Icarus Verilog / ModelSim / Vivado Simulator  
- **Language:** Verilog HDL  
- **Standard:** RISC-V ISA Spec v2.2 (RV32I)

---

## 📌 Future Work

- [ ] Add RV32IM (multiplication/division)
- [ ] Integrate simple I/O peripherals
- [ ] Implement cache and memory-mapped IO
- [ ] Support interrupts and basic OS hooks
