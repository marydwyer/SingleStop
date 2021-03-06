close all; clearvars; clc;
X = readtable('SingleStop_Combined.xls');

zip = X{:,29};
zip_str = string(zip);
income = X{:,23};
outcome = X{:,14};

zipinout = table(zip_str,income,outcome);

m = zipinout.income(zipinout.zip_str == string(10002));
n = zipinout.outcome(zipinout.zip_str == string(10002));

inout = table(m,n);

enrolled = inout.m(inout.n == 1);
enrolled = array2table(enrolled);
s = size(enrolled);
totalenrolled = s(1);

% First Income Bracket
i =1;
bracket1 = 0;
while i <= totalenrolled
    if enrolled{i,1} < 1000 
        bracket1 = bracket1 +1;
    end
i = i+1;
end
p1 = bracket1/totalenrolled * 100;

% Second Income Bracket
i=1;
bracket2 = 0;
while i <= totalenrolled
    if enrolled{i,1} >= 1000 && enrolled{i,1} <10000
        bracket2 = bracket2 +1;
    end
i = i+1;
end
p2 = bracket2/totalenrolled * 100;

% Third Income Bracket
i=1;
bracket3 = 0;
while i <= totalenrolled
    if enrolled{i,1} >= 10000 && enrolled{i,1} <20000
        bracket3 = bracket3 +1;
    end
i = i+1;
end
p3 = bracket3/totalenrolled * 100;

% Fourth Income Bracket
i=1;
bracket4 = 0;
while i <= totalenrolled
    if enrolled{i,1} >= 20000 && enrolled{i,1} <30000
        bracket4 = bracket4 +1;
    end
i = i+1;
end
p4 = bracket4/totalenrolled * 100;

% Fifth Income Bracket
i=1;
bracket5 = 0;
while i <= totalenrolled
    if enrolled{i,1} >= 30000 && enrolled{i,1} <40000
        bracket5 = bracket5 +1;
    end
i = i+1;
end
p5 = bracket5/totalenrolled * 100;

% Sixth Income Bracket
bracket6 = 0;
while i <= totalenrolled
    if enrolled{i,1} >= 40000 
        bracket6 = bracket6 +1;
    end
i = i+1;
end
p6 = bracket6/totalenrolled * 100;

% NaNs
i =1;
notnum= 0;
while i <= totalenrolled
    if isnan(enrolled{i,1})==1 
        notnum = notnum +1;
    end
i = i+1;
end
notnum;
pn = notnum/totalenrolled * 100;

angle1 = p1/100 * 90;
angle2 = p2/100 * 90;
angle3 = p3/100 * 90;
angle4 = p4/100 * 90;
angle5 = p5/100 * 90;
angle6 = p6/100 * 90;
anglen = pn/100 * 90;

results = table(angle6, angle5, anglen, angle4, angle2, angle3,angle1)



