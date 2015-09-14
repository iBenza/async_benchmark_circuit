;;;
;;; `minimal'
;;; Minimal tech. description
;;;
;;; 24 May 2007, Andrew Bardsley
;;;

(net-signature-for-netlist-format 'verilog #t)

(set! breeze-gates-net-files '("aclass-cells" "balsa-cells"))
(set! breeze-gates-mapping-file (string-append breeze-tech-dir "gate-mappings"))
(set! breeze-gates-drive-file (string-append breeze-tech-dir "drive-table"))

;;; max. no. of inputs for and/or/nand/nor gates and c-elements
(set! tech-gate-max-fan-in 4)
(set! tech-c-element-max-fan-in 3)

;;; use name mapping to keep names less than ~48 chars
(set! tech-map-cell-name (net-simple-cell-name-mapping #f))
(set! tech-map-cell-name-import net-simple-cell-name-import)
(set! tech-map-cell-name-export net-simple-cell-name-export)
(set! tech-cell-name-max-length 48)

(set! tech-gnd-component-name "GND")
(set! tech-vcc-component-name "VCC")

(set! tech-netlist-test-includes '("aclass.v"))
