class generic_driver extends uvm_driver#(generic_seq_item)

`uvm_component_utils(generic_agent)

uvm_analysis_port#(generic_driver) m_analysis_port;
generic_seq_item m_req_h;
generic_seq_item m_resp_h;

vitual dut_if m_dut_if_h;

function new(string name, uvm_component parent)
super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase)
super.new();
if(!uvm_config_db#(virtual dut_if)::get(this, "",dut_if, m_dut_if_h))
`uvm_error("","uvm_config_db::get failed")
endfunction

function void connect_phase(uvm_phase phase)
super.new();
endfunction

task run_phase()
forever begin: driver_forever
  dut_intitialize();

  seq_item_port.get_next_item(m_req_h);
  
  m_analysis_port.write(m_req_h);            // Write the item to the analysis port for scoreboard to pick up
  
  drive_seq_item(m_req_h);
  
  m_resp_h = generic_seq_item::type_id::create("m_resp_h");
  
  seq_item_port.put(m_resp_h);
  
  seq_item_port.item_done();

endtask: forever_driver

endclass
