#import "macros.typ": *

= Těžké otázky

K získání známky 3 není třeba znát důkazy z této kategorie, proto jsou uvedeny pouze myšlenky důkazů.

== (T1) Věta o korektnosti tablo metody ve výrokové logice

Je-li výrok $phi$ tablo dokazatelný z teorie $T$, potom je $phi$ pravdivý v teorii $T$. $T tack phi => T models phi$.

Důkaz sporem. Kdyby $phi$ v $T$ neplatilo (a přesto bychom ho tablem dokázali), existoval by model, který by odpovídal nějaké nesporné větvi tabla, avšak všechny větve v tablu jsou sporné.

== (T2) Věta o korektnosti tablo metody v predikátové logice

Je-li _sentence_ $phi$ tablo dokazatelná z teorie $T$, potom je $phi$ pravdivá v teorii $T$. $T tack phi => T models phi$.

Obdoba z výrokové logiky. $phi$ musí být sentence, protože v tablu jsou vždy pouze sentence. Důkaz sporem, akorát model není ohodnocení, ale struktura.

== (T3) Věta o úplnosti tablo metody ve výrokové logice

Je-li výrok $phi$ pravdivý v teorii $T$, potom je $phi$ tablo dokazatelné z $T$. $T models phi => T tack phi$.

Důkaz sporem. Dokončené tablo je nutně sporné. Kdyby nebylo, byla by v něm dokončená nesporná větev. Ta by odpovídala nějakému modelu (třeba kanonickému), ve kterém $phi$ neplatí.

Kanonický model je model odpovídající dané větvi tabla, pokud je na větvi položka T$p$ (pro nějakou proměnnou $p$), je v kanonickém modelu $p$ nastavena na 1, jinak je nastavena na 0 (tedy pokud je na větvi položka F$p$, nebo pokud na větvi položka obsahující samotné $p$ není).

== (T4) Věta o úplnosti tablo metody v predikátové logice

Je-li _sentence_ $phi$ pravdivá v teorii $T$, potom je $phi$ tablo dokazatelné z $T$. $T models phi => T tack phi$.

Obdoba z výrokové logiky. Důkaz sporem, akorát model není ohodnocení, ale struktura. Kdyby tablo nebylo sporné, byla by v něm dokončená nesporná větev odpovídající kanonickému modelu, ve kterém $phi$ neplatí.

Kanonický model (struktura) pro danou (dokončenou nespornou) větev:
- pro univerzum vezmeme všechny konstantní a funkční symboly a rekurzivně je na sebe aplikujeme; univerzum obsahuje textové řetězce, pokud jazyk obsahuje alespoň jeden funkční symbol, bude univerzum nekonečné
- relace $R(...)$ platí právě když na větvi je položka T$R(...)$
- funkce vrací prvek z univerza vzniklý spojením funkčního symbolu a symbolů parametrů; příklad v Pythonu pro binární funkci $g$:
```py
def g(a: str, b: str) -> str:
    return f"g({a}, {b})"

g("c0", "c1")  # -> "g(c0, c1)"
# Jak "c0", tak "c1" i "g(c0, c1)" jsou prvky univerza.
# Stejně tak třeba "g(g(c1, c1), c0)" bude.
```

== (T5) Věta o konečnosti sporu, důsledky o konečnosti a systematičnosti důkazů

Konečnost sporu: Je-li $union.big_(i>=0) tau_i$ sporné tablo, potom existuje $n in NN$ takové, že $tau_n$ je sporné _konečné_ tablo.

Konečnost důkazu: Pokud $T tack phi$, potom existuje i _konečný_ tablo důkaz $phi$ z $T$.

Systematičnost důkazu: Pokud $T tack phi$, potom _systematické_ tablo je konečným tablo důkazem $phi$ z $T$.

Tedy pokud dojdeme ke sporu, bude to po konečně mnoha krocích. Dokonce i v případě, kdy je teorie nekonečná. Systematické tablo je algoritmus, který takové tablo sestrojí.

Systematické tablo: Vstup: uspořádaná teorie $T = {alpha_1, alpha_2, ...}$, počáteční položka $R$ (typicky F$phi$).
- $P =$  nejvyšší nejlevější neredukovaná položka na bezesporné větvi
- Pokud jsme našli $P$: redukujeme $P$ přidáním atomického tabla na každou bezespornou větev pod~$P$
- Pokud ještě zbývá axiom $alpha_i$ z $T$: na každou bezespornou větev připojíme T$alpha_i$
- Pokud jsou všechny větve sporné#footnote[Tahle podmínka možná není správně, Systematičnost důkazu sice tvrdí, že tablo je konečné, ale skripta neříkají, kdy se má algoritmus zastavit. Navíc pokud je teorie nekonečná a vstup není sporný, algoritmus se nezastaví nikdy, jak naznačuje podmínka v Konečnosti sporu.]: skončili jsme, máme systematický tablo důkaz
// viz Rozhodnutelnost, tam je podobná věc "buď vrátí ano, nebo nedoběhne"
- Opakujeme

== (T6) Věta o úplnosti rezoluce ve výrokové logice

Je-li formule $S$ (v CNF množinové reprezentaci) nesplnitelná, je rezolucí zamítnutelná. $S tack_R square$.

Důkaz indukcí podle počtu proměnných od $|Var(S)|$ směrem k nule. Podle věty o kompaktnosti, BÚNO $S$ je konečná.

== (T7) [WIP] Věta o úplnosti rezoluce v predikátové logice

Je-li CNF formule $S$ nesplnitelná, potom je zamítnutelná rezolucí.

Lifting lemma: Pro klauzule $C_1$ a $C_2$ s disjunktními množinami proměnných#footnote[Proměnná reprezentuje prvek z univerza, nejedná se o atomický výrok.], pro jejich základní instance $C_1^*$ a $C_2^*$, pro jejich rezolventu $C^*$: existuje rezolventa $C$ klauzulí $C_1$ a $C_2$ taková, že $C^*$ je základní instance $C$.

Základní instance: Pro otevřenou formuli $phi$ proměnných $x_1, ..., x_n$: instance $phi(x_1 slash t_1, ..., x_n slash t_n)$ je _základní instance_, jsou-li termy $t_1, ..., t_n$ konstantní. ${x_1 slash t_1, ..., x_n slash t_n}$ nazýváme _základní substituce_.

Základní instance umožňuje převést výraz z predikátové logiky do výrokové nahrazením atomických sentencí za atomické výroky. Lifting lemma to aplikuje na klauzule a jejich rezolventy.#footnote[Moc tomu nerozumim no.]
