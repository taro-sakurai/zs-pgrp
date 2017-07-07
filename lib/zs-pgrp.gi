# zs-pgrp.gi
# Taro Sakurai

# This is a supplementary file for
# Sakurai, T.: Central elements of the Jennings basis and certain Morita invariants. Preprint, 2017.
# https://arxiv.org/abs/1701.03799

LoadPackage("LAGUNA", false);;

InstallMethod(PModularGroupAlgebra,
    "for non-trivial p-group",
    [IsPGroup and IsNonTrivial],
    function(G)
        local p;
        p := FactorsInt(Size(G))[1];
        return GroupRing(GF(p), G);
    end
);

InstallMethod(SocleSeries,
    "for non-trivial p-group",
    [IsPGroup and IsNonTrivial],
    function(G)
        local FG, wb, w, b, ll, jb, Soc, n, i;
        FG  := PModularGroupAlgebra(G);
        wb  := WeightedBasis(FG);
        w   := wb.weights;
        b   := wb.weightedBasis;
        ll  := 1 + Maximum(w); # Loewy length of FG
        jb  := [];             # Jennings basis
        Soc := [];
        n   := 0;
        while n < ll do
            n := n + 1;
            for i in [1..(Size(G)-1)] do
                if w[i] = ll - n then
                    Add(jb, b[i]);
                fi;
            od;
            Soc[n] := Subspace(FG, jb, "basis");
        od;
        Assert(0, n = ll);
        Assert(0, Dimension(Soc[1]) = 1);
        Assert(0, Dimension(Soc[ll-1]) = Size(G)-1);
        Add(jb, One(FG));
        Soc[ll] := Subspace(FG, jb, "basis");
        return Soc;
    end
);

InstallMethod(ZS,
    "for non-trivial p-group",
    [IsPGroup and IsNonTrivial],
    function(G)
        local FG, ZFG, Soc;
        FG  := PModularGroupAlgebra(G);
        ZFG := Center(FG);
        Soc := SocleSeries(G);
        return List(Soc, Soc_n -> Intersection(ZFG, Soc_n));
    end
);

InstallMethod(CentralJenningsSpan,
    "for non-trivial p-group",
    [IsPGroup and IsNonTrivial],
    function(G)
        local FG, ZFG, wb, w, b, ll, jb, cjs, n, i;
        FG  := PModularGroupAlgebra(G);
        ZFG := Center(FG);
        wb  := WeightedBasis(FG);
        w   := wb.weights;
        b   := wb.weightedBasis;
        ll  := 1 + Maximum(w); # Loewy length of FG
        jb  := [];             # Jennings basis
        cjs := [];             # Subspaces spanned by central elements of the Jennings basis
        n   := 0;
        while n < ll do
            n := n + 1;
            for i in [1..(Size(G)-1)] do
                if w[i] = ll - n and b[i] in ZFG then
                    Add(jb, b[i]);
                fi;
            od;
            cjs[n] := Subspace(FG, jb, "basis");
        od;
        Assert(0, n = ll);
        Assert(0, Dimension(cjs[1]) = 1);
        Add(jb, One(FG));
        cjs[ll] := Subspace(FG, jb, "basis");
        return cjs;
    end
);
