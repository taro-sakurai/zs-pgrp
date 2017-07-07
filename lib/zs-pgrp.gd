# zs-pgrp.gd
# Taro Sakurai

# This is a supplementary file for
# Sakurai, T.: Central elements of the Jennings basis and certain Morita invariants. Preprint, 2017.
# https://arxiv.org/abs/1701.03799

# PModularGroupAlgebra( <G> )
# returns group algebra FG for non-trivial p-group G where F := GF(p)
DeclareAttribute("PModularGroupAlgebra", IsPGroup and IsNonTrivial);

# SocleSeries( <G> )
# returns a list
# [ Soc^n(FG) for 1 <= n <= ll(FG) ]
# for non-trivial p-group G
DeclareAttribute("SocleSeries",          IsPGroup and IsNonTrivial);

# ZS( <G> )
# returns a list
# [ ZS^n(FG) for 1 <= n <= ll(FG) ]
# (where ZS^n(FG) := Z(FG) /\ Soc^n(FG))
# for non-trivial p-group G
DeclareAttribute("ZS",                   IsPGroup and IsNonTrivial);


# CentralJenningsSpan( <G> )
# returns a list
# [ Span(central elements of the Jennings basis lying in Soc^n(FG)) for 1 <= n <= ll(FG) ]
# for non-trivial p-group G
DeclareAttribute("CentralJenningsSpan",  IsPGroup and IsNonTrivial);
