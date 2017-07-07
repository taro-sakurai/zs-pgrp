# testall.g
# Taro Sakurai

# This is a supplementary file for
# Sakurai, T.: Central elements of the Jennings basis and certain Morita invariants. Preprint, 2017.
# https://arxiv.org/abs/1701.03799

# Try
# ReadTest("testall.g");

gap> Read("../lib/zs-pgrp.gd");;
gap> Read("../lib/zs-pgrp.gi");;

gap> D8 := DihedralGroup(8);;
gap> List(SocleSeries(D8), Dimension);
[ 1, 3, 5, 7, 8 ]
gap> List(ZS(D8), Dimension);
[ 1, 3, 4, 4, 5 ]
gap> List(CentralJenningsSpan(D8), Dimension);
[ 1, 3, 4, 4, 5 ]

gap> D16 := DihedralGroup(16);;
gap> List(SocleSeries(D16), Dimension);
[ 1, 3, 5, 7, 9, 11, 13, 15, 16 ]
gap> List(ZS(D16), Dimension);
[ 1, 3, 4, 4, 5, 5, 6, 6, 7 ]
gap> List(CentralJenningsSpan(D16), Dimension);
[ 1, 3, 4, 4, 5, 5, 5, 5, 6 ]
gap> gens := MinimalGeneratingSet(D16);;
gap> s := gens[1];; Order(s);
2
gap> r := gens[2];; Order(r);
8
gap> r^s = r^(-1);
true
gap> FD16 := PModularGroupAlgebra(D16);;
gap> emb := Embedding(D16, FD16);;
gap> s := s^emb;; r := r^emb;; e := One(FD16);;
gap> x := s - e;; y := s*r - e;; z := r^2 - e;; w := r^4 - e;;
gap> soc := SocleSeries(D16);;
gap> zs  := ZS(D16);;
gap> cjs := CentralJenningsSpan(D16);;
gap> x in soc[8] and not x in soc[7];
true
gap> y in soc[8] and not y in soc[7];
true
gap> z in soc[7] and not z in soc[6];
true
gap> w in soc[5] and not z in soc[4];
true
gap> v := z + x*z + y*z + x*y*z + x*w + y*w + x*y*w;;
gap> v in zs[7] and not v in cjs[7]; # explicit difference between zs from cjs
true

gap> G := ExtraspecialGroup(3^3, "+");;
gap> List(SocleSeries(G), Dimension);
[ 1, 3, 7, 11, 16, 20, 24, 26, 27 ]
gap> List(ZS(G), Dimension);
[ 1, 3, 6, 8, 9, 9, 10, 10, 11 ]
gap> List(CentralJenningsSpan(G), Dimension);
[ 1, 3, 6, 8, 9, 9, 10, 10, 11 ]

gap> G := ExtraspecialGroup(3^3, "-");;
gap> List(SocleSeries(G), Dimension);
[ 1, 3, 6, 9, 12, 15, 18, 21, 24, 26, 27 ]
gap> List(ZS(G), Dimension);
[ 1, 3, 6, 8, 9, 9, 9, 10, 10, 10, 11 ]
gap> List(CentralJenningsSpan(G), Dimension);
[ 1, 3, 6, 8, 9, 9, 9, 10, 10, 10, 11 ]
