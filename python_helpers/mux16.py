a_values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
b_values = [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
sel_values = [0, 1]  # Assuming sel can be 0 or 1
out_values = [0] * 15

assignments = []

for i in range(16):
	assignment = f'Mux (a = a[{i}], b = b[{i}], sel = sel, out = out[{i}]);'
	assignments.append(assignment)

for assignment in assignments:
    print(assignment)

