# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) ibex_core

set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/ibex-verilog/defines.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_generic_clock_gating.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_22_16_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_22_16_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_28_22_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_28_22_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_39_32_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_39_32_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_64_57_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_64_57_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_72_64_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_72_64_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_hamming_22_16_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_hamming_22_16_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_hamming_39_32_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_hamming_39_32_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_hamming_72_64_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_hamming_72_64_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_hamming_76_68_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_hamming_76_68_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_22_16_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_22_16_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_28_22_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_28_22_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_39_32_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_39_32_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_64_57_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_64_57_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_72_64_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_72_64_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_hamming_22_16_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_hamming_22_16_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_hamming_39_32_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_hamming_39_32_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_hamming_72_64_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_hamming_72_64_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_hamming_76_68_dec.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_secded_inv_hamming_76_68_enc.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_xilinx_clock_gating.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_icache.v
	$script_dir/../../verilog/rtl/ibex-verilog/prim_lfsr.v \
	$script_dir/../../verilog/rtl/ibex-verilog/prim_clock_gating.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_alu.v
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_branch_predict.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_compressed_decoder.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_controller.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_cs_registers.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_csr.v
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_counter.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_decoder.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_ex_block.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_fetch_fifo.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_id_stage.v
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_if_stage.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_load_store_unit.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_multdiv_fast.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_multdiv_slow.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_prefetch_buffer.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_pmp.v
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_wb_stage.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_dummy_instr.v \
	$script_dir/../../verilog/rtl/ibex-verilog/ibex_core.v"

set ::env(DESIGN_IS_CORE) 0 

set ::env(CLOCK_PORT) "clk_i"
set ::env(CLOCK_NET) "clk_i"
set ::env(CLOCK_PERIOD) "20"

# set ::env(FP_SIZING) absolute
# set ::env(DIE_AREA) "0 0 2000 2500"

# set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

# set ::env(PL_BASIC_PLACEMENT) 1
set ::env(FP_CORE_UTIL) 25
set ::env(PL_TARGET_DENSITY) 0.3
#set ::env(FP_ASPECT_RATIO) 0.618
# Maximum layer used for routing is metal 4.
# This is because this macro will be inserted in a top level (user_project_wrapper) 
# where the PDN is planned on metal 5. So, to avoid having shorts between routes
# in this macro and the top level metal 5 stripes, we have to restrict routes to metal4.  
# 
# set ::env(GLB_RT_MAXLAYER) 5

set ::env(RT_MAX_LAYER) {met4}

# You can draw more power domains if you need to 
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

# set ::env(DIODE_INSERTION_STRATEGY) 4 
# If you're going to use multiple power domains, then disable cvc run.
set ::env(RUN_CVC) 1

set ::env(ROUTING_CORES) 6