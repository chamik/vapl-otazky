#import "macros.typ": *
= Lehké otázky

== (L1) Množinu modelů nad konečným jazykem lze axiomatizovat výrokem v CNF, výrokem v DNF.

Mějme konečný jazyk $PP$ a libovolnou $M subs MP$. Pak existují $phi_"DNF" "a" phi_"CNF"$ takové, že $M = MP(phi_"DNF") = MP(phi_"CNF")$; konkrétně:

$ phi_"DNF" = or.big_(v in M) and.big_(p in PP) p^(v(p)) $
$ phi_"CNF" = and.big_(v in overline(M)) or.big_(p in PP) overline(p^(v(p))) = and.big_(v in.not M) or.big_(p in PP) p^(1 - v(p)) $

_Důkaz_: Pro DNF, každá elementární konjunkce popisuje jeden model. CNF je duální k $phi_"DNF"$ sestrojenému pro doplněk $M' = overline(M)$; každá klauzule v konjunkci "zakazuje jeden nemodel". Každý výrok má svoji pravdivostní funkci, pro kterou zvládneme jednotlivým popisem/zákazem modelu/nemodelu vytvořit správnou formuli.

== (L2) 2-SAT, algoritmus implikačního grafu, jeho korektnost

2-SAT je sat kde má každá klauzule nejvýše dva literály. 2-klauzuli $cl_1 or cl_2$ lze chápat jako implikace $cln_1 impl cl_2 "a" cln_2 impl cl_1$. Implikační graf je graf, kde vrcholy jsou literály a hrany jsou dány implikacemi. Chceme najít komponenty silné souvislosti v tomto grafu, neboť všechny literály v této komponentě musí být ohodnoceny stejně (jinak by se nám rozbil implikační řetízek). Dvojice opačných literálů v jedné komponentě tedy znamená nesplnitelnost.

Výrok $phi$ je splnitelný, když v implikačním grafu komponenta silné souvislosti neobsahuje $cln "a" cl$

_Důkaz_: Mějme implikační graf $G_phi$. Vytvořme $G_phi^*$ _kontrakcí_ komponent silné souvislosti (čímž odstraníme cykly). $G_phi^*$ je DAG, zvolme na něm topologické uspořádání. Pak vždy volím první neohodnocenou komponentu a nastavím literály v ní na 0. Proč pak $phi$ platí?

Jednotková klauzule musí platit, protože v $G_phi$ máme $cln impl cl$ a tato hrana je i v $G_phi^*$, tudíž v topologickém uspořádání $cln$ předchází $cl$.

Podobně pro 2-klauzule. Pokud mám $cl_1 or cl_2$, tak v $G_phi$ je $cln_1 impl cl_2 "a" cln_2 impl cl_1$. Pokud jsme $l_1$ ohodnotili dříve, pak to kvůli topologickému uspořádání bylo $cln_1 = 0$, tedy $cl_1$ platí. Podobně i v opačném případě.

== (L3) Horn-SAT, Algoritmus jednotkové propagace, jeho korektnost

Viz (P8) co to je Horn-SAT. _Jednotková propagace:_ pokud náš výrok obsahuje jednotkovou klauzuli, víme, jak musí být ohodnocena výroková proměnná v této klauzuli -- tuto znalost můžeme propagovat, využít k zjednodušení výroku:
- každá výroková proměnná obsahující pozitivní literál je splněna a můžeme ji z výroku odstranit
- negativní literál nemůže být splněn, můžeme ho tedy odebrat ze všech klauzulí, které ho obsahují.

Výsledkem je zjednodušený výrok označený $phi^cl$ pro jednotkovou klauzuli (literál) $cl$ co jsme odstranili. Všimněme si, že $phi^cl$ neobsahuje $cl$, ani $cln$ a zřejmě platí, že modely $phi$ jsou právě modely ${phi^cl, cl}$, neboli modely $phi^cl$ v původním jazyce $PP$, ve kterých platí $cl$.

Nyní algoritmus:

`IN`: $phi$ v Horn-SAT. `OUT`: Model, nebo informace, že neexistuje

1. Pokud $phi$ obsahuje (jednotkové klauzule) $cl "i" cln$, pak není splnitelný
2. Pokud $phi$ neobsahuje jednotkovou klauzuli, ohodnoť všechny zbývající proměnné 0 (konec)\*
3. Pokud $phi$ obsahuje jednotkovou klauzuli $cl$, ohodnoť $cl = 1$, proveď _jednotkovou propagaci_, nahraď $phi$ výrokem $phi^cl$
4. Opakuj

\*To funguje díky "hornovskosti" výroku. Pokud ve výroku není jednotkový literál, pak každá klauzule obsahuje alespoň dva literály a nejvýše jeden z nich může být pozitivní. Když tedy nastavíme všechny zbývající literály na 0, určitě tím splníme všechny klauzule.

== (L4) Vlastnosti extenze teorií

== (L5) Vztah definovatelných množin a automorfismů

_Automorfismus_ je izomorfismus struktury $cA$ na $cA$. Viz (P15) pro definovatelné množiny.

Je-li $D subs A^n$ _definovatelná_ ve struktuře $cA$, potom pro každý automorfismus $h in "Aut"(cA)$ platí $h[D] = D$ (kde $h[D]$ značí ${h(overline(a) | overline(a) in D)}$). Je-li $D$ definovatelná s parametry $b$, platí totéž pro automorfismy identické na $overline(b)$ _($thin$fixující $overline(b)$)_, tj. takové, že $h(overline(b)) = overline(b)$.

_Důkaz:_ Jen verze s parametry. Nechť $D = phi^(cA, overline(b))(overline(x), overline(y))$. Potom pro každé $overline(a) in A^n$ platí ekvivalence:

$ overline(a) in D &arrow.l.r.double&& cA models phi[e(overline(x)\/overline(a), overline(y)\/overline(b))]\
&arrow.l.r.double&& cA models phi[(e compose h)(overline(x)\/overline(a), overline(y)\/overline(b))]\
&arrow.l.r.double&& cA models phi[e(overline(x)\/h(overline(a)), overline(y)\/h(overline(b)))]\
&arrow.l.r.double&& cA models phi[e(overline(x)\/h(overline(a)), overline(y)\/overline(b))]\
&arrow.l.r.double&& h(overline(a)) in D
$

== (L7) Věta o kompaktnosti a její aplikace <L7>

_Věta o kompaktnosti:_ Teorie má model, právě tehdy, když každá její konečná část má model.

_Důkaz_: Model teorie je modelem každé její části. Pokud $T$ nemá model, je sporná, tedy $T tack fal$. Vezměme nějaký její _konečný_ tablo důkaz $fal "z" T$. K jeho konstrukci stačí konečně mnoho $alpha in T$, ty tvoří konečnou podteorii $T'$, která nemá model. $qed$

Důsledek: Teorie konečných grafů není axiomatizovatelná: Mějme $T$ a její modely, všechny konečné grafy.
1. Vytvoříme $T^*$. Přidáme do ní _nekonečně mnoho_ nových axiomů říkajících, že:\
 $exists x_1$ (existuje alespoň jeden prvek)\
 $exists x_1, x_2: x_1 neq x_2$ (existují alespoň dva prvky)\
 $dots$
2. Každá konečná podmnožina $T^*$ má model. Řekněme, že největší axiom vybrán v něm je $exists x_1, dots, x_n$. Konečný graf s $n$ vrcholy toto určitě splňuje. 
3. Podle věty o kompaktnosti má celá rozšířená teorie $T^*$ model. Ale tento model musí splňovat všechny přidané axiomy, tedy obsahovat nekonečně mnoho prvků - je to nekonečný graf. Zároveň ale musí být modelem původní teorie T, tedy konečným grafem. Spor!

== (L8) Korektnost rezoluce ve výrokové logice

Je-li CNF formule S rezolucí zamítnutelná, je S nesplnitelná.

_Důkaz_: Nechť $S scripts(tack)_R square$ a důkaz $C_0, C_1, dots, C_n = square$. Pro spor nechť je $S$ splnitelná, tedy $cV models S$ pro nějaké ohodnocení $cV$. Indukcí podle $i$ dokážeme $cV models C_i$.

- pro $i = 0$ platí, neb $C_0 in S$
- pro $i > 0$ nastanou dva případy:
  - $C_i in S$

== (L15) Gödelovy věty neúplnosti

_Robinsonova aritmetika_ je teorie $Q$ v jazyce aritmetiky sestávající z následujících axiomů:

#align(center, table(
  columns: (auto, auto),
  stroke: none,
  $not S(x) = 0$,
  $S(x) = S(y) impl x = y$,
  $x + 0 = x$,
  $x + S(y) = S(x + y)$,
  $x dot 0 = 0$,
  $x dot S(y) = x dot y + x$,
  $not x = 0 impl (exists y)(x = S(y))$,
  $x <= y eqviv (exists z)(z + x = y)$
))

_První věta o neúplnosti_: Pro každou bezespornou rekurzivně axiomatizovanou extenzi $T$ Robinsonovy aritmetiky existuje sentence, která je pravdivá v $underline(NN)$, ale není dokazatelná v $T$.

_Peanova aritmetika_ je extenze Robinsonovy aritmetiky $Q$ o _schéma indukce_, tj. pro každou $L$-formuli $phi(x, overline(y))$ přidáme axiom: $ (phi(0, overline(y)) and (forall x)(phi(x, overline(y)) impl phi(S(x), overline(y)))) impl (forall x) phi(x, overline(y))) $

_Druhá věta o neúplnosti_: Pro každou bezespornou a rekurzivně axiomatizovanou extenzi T Peanovy aritmetiky platí, že $"Con"_T$ není dokazatelná v $T$. $"Con"_T$ je: $ not(exists y)"Prf"_T (0 = S(0), y) $ resp. není konzistentní.