program HousingApp;
uses crt;

var
    Lh, Hh, Fh: string[2];
    LPH, HHD, FHD, NS, GS, SD, UI, LE, EX, S, EX_A: integer;
    r, sesV: integer;
    HC, AN, HA: string;
    c_short, c_long: string[2];
    hH, hF, hL: real;

begin
    LPH := 150500; HHD := 440000; FHD := 700500;

    repeat
        { APPLICANT INIT }
        repeat
            sesV := 1; Lh := '0'; Hh := '0'; Fh := '0'; r := 0;

            write('Housing Community Acronym (LPH, HHD, FHD): '); readln(HA);
            write('Applicant Name: '); readln(AN);
            write('Gross Salary: '); readln(GS);
            write('Total Salary Deductions: '); readln(SD);

            NS := GS - SD;

            if (HA = 'HHD') and (sesV = 1) then
            begin
                hH := HHD * 0.75;
                if NS >= hH then begin writeln('Applicant Qualify'); Hh := '1'; end
                else begin writeln('Applicant Not Qualify.'); sesV := 0; end;
                Hh := '1';
            end;

            if (HA = 'FHD') and (sesV = 1) then
            begin
                hF := FHD * 0.75;
                if NS >= hF then begin writeln('Applicant Qualify'); Fh := '1'; end
                else begin writeln('Applicant Not Qualify.'); sesV := 0; end;
                Fh := '1';
            end;

            if (HA = 'LPH') and (sesV = 1) then
            begin
                hL := LPH * 0.75;
                if NS >= hL then begin writeln('Applicant Qualify'); Lh := '1'; end
                else begin writeln('Applicant Not Qualify.'); sesV := 0; end;
                Lh := '1';
            end;

            if sesV = 0 then
            begin
                write('Input Data for another applicant? [ N | y ]: '); readln(c_short);
                if (c_short = 'y') or (c_short = 'Y') then r := 1 else halt;
            end;

            if Lh = '1' then HC := 'La Parfaite Harmonie';
            if Hh = '1' then HC := 'Hauraruni Housing Development';
            if Fh = '1' then HC := 'Fitzhope Housing Development';

        until r = 0;

        { Expense calculation }
        write('Applicant Total Utility Expenses: '); readln(UI);
        write('Applicant Total Living Expenses: '); readln(LE);

        EX := UI + LE;
        S := NS - EX;
        EX_A := 0;
        if S >= (EX * 0.5) then EX_A := 1;

        writeln('-------------------------------');
        writeln('Applicant Name:    ', AN);
        writeln('Housing Community: ', HC);
        if HA = 'LPH' then writeln('Cost:              $', LPH);
        if HA = 'FHD' then writeln('Cost:              $', FHD);
        if HA = 'HHD' then writeln('Cost:              $', HHD);
        
        if EX_A = 1 then writeln('Approval Status:   Approved.')
        else writeln('Approval Status:   Not Approved.');

        write('Input Data for another applicant? [ N | y ]: '); readln(c_long);
    until (c_long <> 'y') and (c_long <> 'Y');
end.

