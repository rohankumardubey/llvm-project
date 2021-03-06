// RUN: llvm-mc -triple=aarch64 -show-encoding -mattr=+sme-f64 < %s \
// RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
// RUN: not llvm-mc -triple=aarch64 -show-encoding < %s 2>&1 \
// RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sme-f64 < %s \
// RUN:        | llvm-objdump -d --mattr=+sme-f64 - | FileCheck %s --check-prefix=CHECK-INST
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sme-f64 < %s \
// RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN
// Disassemble encoding and check the re-encoding (-show-encoding) matches.
// RUN: llvm-mc -triple=aarch64 -show-encoding -mattr=+sme-f64 < %s \
// RUN:        | sed '/.text/d' | sed 's/.*encoding: //g' \
// RUN:        | llvm-mc -triple=aarch64 -mattr=+sme-f64 -disassemble -show-encoding \
// RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST

// --------------------------------------------------------------------------//
// Non-widening (double-precision)

fmops   za0.d, p0/m, p0/m, z0.d, z0.d
// CHECK-INST: fmops   za0.d, p0/m, p0/m, z0.d, z0.d
// CHECK-ENCODING: [0x10,0x00,0xc0,0x80]
// CHECK-ERROR: instruction requires: sme-f64
// CHECK-UNKNOWN: 10 00 c0 80 <unknown>

fmops   za5.d, p5/m, p2/m, z10.d, z21.d
// CHECK-INST: fmops   za5.d, p5/m, p2/m, z10.d, z21.d
// CHECK-ENCODING: [0x55,0x55,0xd5,0x80]
// CHECK-ERROR: instruction requires: sme-f64
// CHECK-UNKNOWN: 55 55 d5 80 <unknown>

fmops   za7.d, p3/m, p7/m, z13.d, z8.d
// CHECK-INST: fmops   za7.d, p3/m, p7/m, z13.d, z8.d
// CHECK-ENCODING: [0xb7,0xed,0xc8,0x80]
// CHECK-ERROR: instruction requires: sme-f64
// CHECK-UNKNOWN: b7 ed c8 80 <unknown>

fmops   za7.d, p7/m, p7/m, z31.d, z31.d
// CHECK-INST: fmops   za7.d, p7/m, p7/m, z31.d, z31.d
// CHECK-ENCODING: [0xf7,0xff,0xdf,0x80]
// CHECK-ERROR: instruction requires: sme-f64
// CHECK-UNKNOWN: f7 ff df 80 <unknown>

fmops   za5.d, p3/m, p0/m, z17.d, z16.d
// CHECK-INST: fmops   za5.d, p3/m, p0/m, z17.d, z16.d
// CHECK-ENCODING: [0x35,0x0e,0xd0,0x80]
// CHECK-ERROR: instruction requires: sme-f64
// CHECK-UNKNOWN: 35 0e d0 80 <unknown>

fmops   za1.d, p1/m, p4/m, z1.d, z30.d
// CHECK-INST: fmops   za1.d, p1/m, p4/m, z1.d, z30.d
// CHECK-ENCODING: [0x31,0x84,0xde,0x80]
// CHECK-ERROR: instruction requires: sme-f64
// CHECK-UNKNOWN: 31 84 de 80 <unknown>

fmops   za0.d, p5/m, p2/m, z19.d, z20.d
// CHECK-INST: fmops   za0.d, p5/m, p2/m, z19.d, z20.d
// CHECK-ENCODING: [0x70,0x56,0xd4,0x80]
// CHECK-ERROR: instruction requires: sme-f64
// CHECK-UNKNOWN: 70 56 d4 80 <unknown>

fmops   za0.d, p6/m, p0/m, z12.d, z2.d
// CHECK-INST: fmops   za0.d, p6/m, p0/m, z12.d, z2.d
// CHECK-ENCODING: [0x90,0x19,0xc2,0x80]
// CHECK-ERROR: instruction requires: sme-f64
// CHECK-UNKNOWN: 90 19 c2 80 <unknown>

fmops   za1.d, p2/m, p6/m, z1.d, z26.d
// CHECK-INST: fmops   za1.d, p2/m, p6/m, z1.d, z26.d
// CHECK-ENCODING: [0x31,0xc8,0xda,0x80]
// CHECK-ERROR: instruction requires: sme-f64
// CHECK-UNKNOWN: 31 c8 da 80 <unknown>

fmops   za5.d, p2/m, p0/m, z22.d, z30.d
// CHECK-INST: fmops   za5.d, p2/m, p0/m, z22.d, z30.d
// CHECK-ENCODING: [0xd5,0x0a,0xde,0x80]
// CHECK-ERROR: instruction requires: sme-f64
// CHECK-UNKNOWN: d5 0a de 80 <unknown>

fmops   za2.d, p5/m, p7/m, z9.d, z1.d
// CHECK-INST: fmops   za2.d, p5/m, p7/m, z9.d, z1.d
// CHECK-ENCODING: [0x32,0xf5,0xc1,0x80]
// CHECK-ERROR: instruction requires: sme-f64
// CHECK-UNKNOWN: 32 f5 c1 80 <unknown>

fmops   za7.d, p2/m, p5/m, z12.d, z11.d
// CHECK-INST: fmops   za7.d, p2/m, p5/m, z12.d, z11.d
// CHECK-ENCODING: [0x97,0xa9,0xcb,0x80]
// CHECK-ERROR: instruction requires: sme-f64
// CHECK-UNKNOWN: 97 a9 cb 80 <unknown>
