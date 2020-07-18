class generic_monitor extends uvm_monitor#(generic_seq_item)

`uvm_component_utils(generic_monitor0

uvm_analysis_port#(generic_monitor) m_analysis_port;

virtual dut_if m_dut_if_h;

generic_seq_item m_req_h;

function new(string name, uvm_component parent)
super.new()
endfunction

function void build_phase(uvm_phase phase)
super.build_phase(phase)
if(!uvm_config_db#(virtual dut_if)::get(this,"",dut_if,m_dut_if_h))
`uvm_error("get dut_if failed")
endfunction

function void connect_phase(uvm_phase phase)
super.connect_phase(phase)
endfunction

task run_phase()

forever: monitor_forever_loop
  m_req_h = generic_seq_item::type_id::create("m_req_h", this);
  monitor_if(m_req_h);
  m_analysis_port.write(m_req_h);
endforever

endtask


