%macro mixmod(var=);
ods rtf file = "\\Client\F$\CCOP_DC\CCOP_ANALYSIS\MODERATOR MODEL\GLM\&var GLM1&2 EML CTS.rtf";

title "GLM1: baseline ANOVA";
proc glm data=ccop_test;
WHERE Timepoint=0;
CLASS  Assignment ;
model &var= Assignment EML EML*assignment/solution ss3;
lsmeans Assignment/stderr tdiff pdiff;
run;
%mend;
