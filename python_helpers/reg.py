# Assuming you have lists in_values and out_values
in_values = [i for i in range(16)]  # Assuming initial values for in[0], in[1], ..., in[15]
out_values = [0] * 16  # Assuming initial values for out[0], out[1], ..., out[15]
load = "load"  # Assuming a constant value for load

bit_statements = []

for i in range(16):
    statement = f'Bit(in=in[{i}], load={load}, out=out[{i}]);'
    bit_statements.append(statement)

for statement in bit_statements:
    print(statement)

