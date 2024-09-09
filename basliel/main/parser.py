
def parse_expression(expression):
    def extract_base(expression, start_idx):
        count = 0
        elements = []
        base = expression[start_idx].strip("(")
        idx = start_idx + 1
        while idx < len(expression):
            if expression[idx] == "(":
                count += 1
            elif expression[idx] == ")":
                count -= 1
                if count < 0:
                    break
            elif expression[idx] == "Nil":
                break
            else:
                elements.append(expression[idx])
            idx += 1

        # Returning the extracted expression and the current index position
        return f"({base} {' '.join(elements)})", idx + 1

    idx = 0
    result = []
    tokens = expression.replace("(", " ( ").replace(")", " ) ").split()

    while idx < len(tokens):
        if tokens[idx].startswith("("):
            parsed_exp, new_idx = extract_base(tokens, idx)
            result.append(parsed_exp)
            idx = new_idx
        else:
            idx += 1

    # Removing final extra bracket
    final_result = result[:-1]
    return " ".join(final_result)