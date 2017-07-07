# example.g
# Taro Sakurai

# This is a supplementary file for
# Sakurai, T.: Central elements of the Jennings basis and certain Morita invariants. Preprint, 2017.
# https://arxiv.org/abs/1701.03799

Read("../lib/zs-pgrp.gd");
Read("../lib/zs-pgrp.gi");

N := 16; # upper bound for orders of p-groups

# search counterexamples for the following assertion:
# ZS^n(FG) := Z(FG) /\ Soc^n(FG)
# is spanned by central elements of the Jennings basis
counterexamples := [];
for G in AllSmallGroups(Size, [2..N], IsPGroup, true) do
    dimZS  := List(ZS(G),                  Dimension);
    dimCJS := List(CentralJenningsSpan(G), Dimension);
    Assert(0, Length(dimZS) = Length(dimCJS));
    if dimZS <> dimCJS then
        Add(counterexamples, G);
    fi;
od;

# show counterexamples of order <= N;
# [ "D16", "QD16", "Q16" ] is expected for N = 16
Display(List(counterexamples, StructureDescription));
