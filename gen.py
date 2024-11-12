inputs = [
    ["A", "B", "C"],
    ["A", "B", "c"],
    ["A", "b", "C"],
    ["A", "b", "c"],
    ["a", "B", "C"],
    ["a", "B", "c"],
    ["a", "b", "C"],
    ["a", "b", "c"],
]


for i, (a, b, c) in enumerate(inputs):
    print(f"nand(x[{i}], {a}, {b});")
    print(f"nand(y[{i}], x[{i}], x[{i}]);")
    print(f"nand(z[{i}], y[{i}], {c});")
    print(f"nand(d[{i}], z[{i}], z[{i}]);")
    print()
