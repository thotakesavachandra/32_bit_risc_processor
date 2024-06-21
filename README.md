# 32-bit RISC-like Processor Design in Verilog

## Project Overview

This project involves the design, synthesis, and testing of a 32-bit RISC-like processor using Verilog. The processor is designed to support a set of instructions and addressing modes as specified in the assignment. The project is divided into several tasks, each focusing on a different component of the processor.

## Group Information

- **Group No:** 45
- **Members:**
    - Kovvada Dhyana Vardhan (21CS30030)
    - Thota Kesava Chandra (21CS30056)

## Tasks Overview

### Task 1: ALU Design

- **Objective:** Design the ALU to support all arithmetic and logic operations required by the instruction set.
- **Status:** Completed and tested on FPGA.
- **Files:** `alu.v`

### Task 2: Instruction Format and Control Unit

- **Objective:** Design the instruction format and the control unit of the processor.
- **Status:** Completed with schematic diagrams and detailed documentation.
- **Files:** `control_signal_decoding.pdf`

### Task 3: Register Bank Integration

- **Objective:** Implement the register bank and integrate it with the ALU.
- **Status:** Completed and tested on FPGA.
- **Files:** `regbank.v`, `alu.v`

### Task 4: Complete Processor Design

- **Objective:** Implement the data path and control path to complete the processor design.
- **Status:** Completed and tested on FPGA.
- **Files:** `control_path.v`, `datapath.v`, `top_module.v`

### Task 5: Test Benches

- **Objective:** Write test benches for two specific problems: finding the GCD of two integers and sorting a set of 5 integers using bubble sort.
- **Status:** Completed and tested.
- **Files:** `testbench.v`, `test_run.txt`(details about the implentation of programs)

## Instruction Set

### Arithmetic and Logic Instructions

- `ADD`, `SUB`, `AND`, `OR`, `XOR`, `NOT`, `SLA`, `SRA`, `SRL`
- Immediate addressing versions: `ADDI`, `SUBI`, etc.

### Load and Store Instructions

- `LD`, `ST`, `LDSP`, `STSP`

### Branch Instructions

- `BR`, `BMI`, `BPL`, `BZ`

### Stack Instructions

- `PUSH`, `POP`, `CALL`, `RET`

### Register to Register Transfer

- `MOVE`

### Program Control

- `HALT`, `NOP`

## Addressing Modes

- Register addressing
- Immediate addressing
- Base addressing for accessing memory
- PC relative addressing for branch
- SP relative addressing

## Files and Directory Structure

- `32_bit_risc_processor`
    - `Code`
        - `alu.v`
        - `control_path.v`
        - `datapath.v`
        - `memory.v`
        - `regbank.v`
        - `testbench.v`
        - `top_module.v`
    - `control_signal_decoding.pdf`
    - `CPU-specs.pdf`
    - `datapath.jpg`
    - `README.md`
    - `test_run_details.txt`

## How to Run

1. For command line simulation use iverilog.
2. For more detailed simulation use advanced tools like Vivado.
3. For FPGA implementation use Xilinx Vivado.