from hyperon import *
from hyperon.ext import register_atoms
from .parser import parse_expression

@register_atoms(pass_metta=True)

def parser_atom(metta):
    parsed_atom = OperationAtom("parse_expression", lambda *args: parse_expression(metta, *args)) # type: ignore
    
    return parsed_atom
# expression = "(Inherie (y (x (a (u (Nil (Inherie (y (x (a (Nil (Inheritance (y (x (b (d (Nil ())))))))))))))))))"
# parsed_expression = parse_expression(expression)
# print(parsed_expression)



