# Assuming you have lists c_values, a_values, b_values, and out_values
c_values = ['c0'] + [f'c{i}' for i in range(1, 16)]  # Assuming initial values for c0, c1, c2, ..., c15
a_values = [i for i in range(16)]  # Assuming initial values for a[1], a[2], ..., a15
b_values = [i + 3 for i in range(16)]  # Assuming initial values for b[1], b[2], ..., b15
out_values = [0] * 16  # Assuming initial values for out[1], out[2], ..., out15

full_adder_statements = []

for i in range(1, 16):  # Generating statements for indices 1 to 15
    statement = f'FullAdder (a = {c_values[i-1]}, b = a[{i}], c = b[{i}], sum = out[{i}], carry = {c_values[i]});'
    full_adder_statements.append(statement)

for statement in full_adder_statements:
    print(statement)

