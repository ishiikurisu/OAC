/*
 * Unidade de Forward
 * 
 * iID_NumRs:       Numero do registrador rs no estagio ID
 * iID_NumRt:       Numero do registrador rt no estagio ID
 * iEX_NumRs:       Numero do registrador rs no estagio EX
 * iEX_NumRt:       Numero do registrador rt no estagio EX
 * iMEM_NumRd:      Numero do registrador rd no estagio MEM
 * iMEM_RegWrite:   Se a instrucao no estagio MEM escreve no banco de registradores
 * iWB_NumRd:       Numero do registrador rd no estagio WB
 * iWB_RegWrite:    Se a instrucao no estagio WB escreve no banco de registradores
 * iWB_MemRead:     Se a instrucao no estagio WB le da memoria
 * oFwdA/B:         Seletores de mux para as entradas A/B da ALU
 *                    10 - Forwarding MEM -> EX
 *                    01 - Forwarding WB -> EX
 *                    00 - Sem forwarding 
 * oFwdBranchRs/Rt: Seletores de mux para as entradas no calculo de branch (ID)
 * 
 */

module ForwardUnitM (
	input [4:0] iID_NumRs, iID_NumRt,
	input [4:0] iEX_NumRs, iEX_NumRt,
	input [4:0] iMEM_NumRd, iWB_NumRd,
	input iMEM_RegWrite, iWB_RegWrite, iWB_MemRead,
	output [1:0] oFwdA, oFwdB,
	output oFwdBranchRs, oFwdBranchRt
);
	
	always @(*) begin
		// If MEM_NumRD == WB_NumRD, MEM has priority since it's more recent
		
		// rs
		oFwdA = ((iMEM_RegWrite) && (iMEM_NumRd != 5'b0) && (iMEM_NumRd == iEX_NumRs)) ? 2'b10 // MEM -> EX
		      : ((iWB_RegWrite) && (iWB_NumRd != 5'b0) && (iMEM_NumRd != iEX_NumRs) && (iWB_NumRd == iEX_NumRs)) ? 2'b01 // WB -> EX
          : 2'b00; // no forwarding
		
		// rt
		oFwdB = ((iMEM_RegWrite) && (iMEM_NumRd != 5'b0) && (iMEM_NumRd == iEX_NumRt)) ? 2'b10 // MEM -> WB
          : ((iWB_RegWrite) && (iWB_NumRd != 5'b0) && (iMEM_NumRd != iEX_NumRt) && (iWB_NumRd == iEX_NumRt)) ? 2'b01 // WB -> EX
          : 2'b00; // no forwarding
		
		// MEM -> ID (branch)
		oFwdBranchRs = ( iMEM_RegWrite && (iID_NumRs != 5'b0) && (iMEM_NumRd == iID_NumRs)) ? 1'b1 : 1'b0;
		oFwdBranchRt = ( iMEM_RegWrite && (iID_NumRt != 5'b0) && (iMEM_NumRd == iID_NumRt)) ? 1'b1 : 1'b0;		
	end 
	
endmodule
