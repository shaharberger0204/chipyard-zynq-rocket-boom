module plusarg_reader #(
    parameter FORMAT = "",
    parameter DEFAULT = 0,
    parameter WIDTH = 1
) (
    output [WIDTH-1:0] out
);

    assign out = DEFAULT[WIDTH-1:0];

endmodule