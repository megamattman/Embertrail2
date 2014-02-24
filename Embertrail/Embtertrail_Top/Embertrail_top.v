//embertrail top level

module Embertrail_top(
input wire iClock,
input wire [31:0] iPC,
input wire [31:0] iIR,
input wire iReset,

input wire [31:0] iDataDataBus,

output wire [31:0] oDataAddrBus,
output wire [15:0] oInstAddrBus,

output wire oDataMem1RW,
output wire oDataMem2RW,
output wire oData1BusEn,
output wire oData2BusEn
);

Embertrail_ctrl i1 (
// port map - connection between master ports and signals/registers   
  .iIR(iIR),
  .iPC(iPC),
  .iReset(iReset),
  .iClock(iClock),
	
  .iDataDataBus(iDataDataBus),  
  .oDataAddrBus(oDataAddrBus),  
  .oInstAddrBus(oInstAddrBus),
  .oDataMem1RW(oDataMem1RW),
  .oDataMem2RW(oDataMem2RW),
  .oData1BusEn(oData1BusEn),
  .oData2BusEn(oData2BusEn)
);

endmodule