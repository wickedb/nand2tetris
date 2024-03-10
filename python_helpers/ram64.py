# Assuming you have lists in_values and regout_values
in_values = [i for i in range(16)]  # Assuming initial values for in[0], in[1], ..., in[15]
regout_values = [0] * 16  # Assuming initial values for regout[0], regout[1], ..., regout[15]
load_value = [0] * 16

register_statements = []

for i in range(8):
   # statement = f'Register(in=in, load=reg{i}, out=regout{i});'
    statement = f'RAM8(in=in, load=bank{i}, address=address[0..2], out=outbank{i});'
    register_statements.append(statement)

for statement in register_statements:
    print(statement)
