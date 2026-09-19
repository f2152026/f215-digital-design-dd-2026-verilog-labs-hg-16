// tb.v
// Self-checking testbench for alu

module tb;

  reg [3:0] t_a;
  reg [3:0] t_b;
  reg       t_op;

  wire [3:0] t_result;

  reg [3:0] expected;

  integer errors;
  integer total;

  alu DUT (
    .a      (t_a),
    .b      (t_b),
    .op     (t_op),
    .result (t_result)
  );

  initial begin

    errors = 0;
    total = 0;

    // Test addition and subtraction for multiple operand pairs

    // A = 5, B = 3
    t_a = 4'd5;
    t_b = 4'd3;

    t_op = 1'b0;       // ADD
    #1;
    expected = t_a + t_b;

    total = total + 1;
    if (t_result !== expected) begin
      $display("FAIL: A=%d B=%d OP=ADD | got=%d expected=%d",
               t_a, t_b, t_result, expected);
      errors = errors + 1;
    end

    t_op = 1'b1;       // SUB
    #1;
    expected = t_a - t_b;

    total = total + 1;
    if (t_result !== expected) begin
      $display("FAIL: A=%d B=%d OP=SUB | got=%d expected=%d",
               t_a, t_b, t_result, expected);
      errors = errors + 1;
    end


    // A = 9, B = 4
    t_a = 4'd9;
    t_b = 4'd4;

    t_op = 1'b0;
    #1;
    expected = t_a + t_b;

    total = total + 1;
    if (t_result !== expected) begin
      $display("FAIL: A=%d B=%d OP=ADD | got=%d expected=%d",
               t_a, t_b, t_result, expected);
      errors = errors + 1;
    end

    t_op = 1'b1;
    #1;
    expected = t_a - t_b;

    total = total + 1;
    if (t_result !== expected) begin
      $display("FAIL: A=%d B=%d OP=SUB | got=%d expected=%d",
               t_a, t_b, t_result, expected);
      errors = errors + 1;
    end


    // A = 3, B = 7
    t_a = 4'd3;
    t_b = 4'd7;

    t_op = 1'b0;
    #1;
    expected = t_a + t_b;

    total = total + 1;
    if (t_result !== expected) begin
      $display("FAIL: A=%d B=%d OP=ADD | got=%d expected=%d",
               t_a, t_b, t_result, expected);
      errors = errors + 1;
    end

    t_op = 1'b1;
    #1;
    expected = t_a - t_b;

    total = total + 1;
    if (t_result !== expected) begin
      $display("FAIL: A=%d B=%d OP=SUB | got=%d expected=%d",
               t_a, t_b, t_result, expected);
      errors = errors + 1;
    end


    $display("RESULT: %0d passed out of %0d tests, %0d errors",
             total - errors, total, errors);

    $finish;

  end

endmodule