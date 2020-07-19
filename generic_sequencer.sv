class generic_sequencer extends uvm_sequencer

`uvm_component_utils(generic_sequencer)

function new(string name,uvm_component parent)
super.new();
endfunction

function void build_phase(uvm_phase phase)
super.build_phase(phase);
endfunction

function void connect_phase(uvm_phase phase)
super.connect_phase(phase)
endfunction

endclass
