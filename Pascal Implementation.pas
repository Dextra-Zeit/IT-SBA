program HousingApp;

var
    tmp: string;
    flag_L, flag_H, flag_F: string; 
    val_LPH, val_HHD, val_FHD: integer; 
    r_flag, sesV: integer;
    Net_Sal: real;
    H_Comm_Name, App_Name: string;
    q_stat, calc_hH, calc_hF, calc_hL: real;
    H_Acr: string;
    c_str, c_1: string;
    G_S, S_D, U_I, L_E, total_ex, eX_Approved, Savings: real;

function vlid(s: string): boolean;
var
    d_count, j: integer;
begin
    d_count := 0;
    j := 1;
    vlid := true;
    if Length(s) = 0 then 
    begin 
        vlid := false; 
        exit; 
    end;
    if s[1] = '-' then 
    begin
        j := 2;
    end;
    while j <= Length(s) do
    begin
        if s[j] = '.' then
        begin
            if d_count = 1 then 
            begin 
                vlid := false; 
                exit; 
            end
            else 
            begin
                d_count := 1;
            end;
        end
        else if not (s[j] in ['0'..'9']) then
        begin
            vlid := false;
            exit;
        end;
        j := j + 1;
    end;
end;

begin
    val_LPH := 150500;
    val_HHD := 440000;
    val_FHD := 700500;

    repeat
        repeat
            sesV := 1;
            flag_L := '0'; 
            flag_H := '0'; 
            flag_F := '0';
            r_flag := 0;

            Write('Housing Community Acronym (3 Letters MAX): '); 
            Readln(H_Acr);
            Write('Applicant name: '); 
            Readln(App_Name);

            Write('Gross Salary: '); 
            Readln(tmp);
            if not vlid(tmp) then 
            begin 
                Readln; 
                halt; 
            end;
            G_S := StringToFloat(tmp);

            Write('Total Salary Deductions: '); 
            Readln(tmp);
            if not vlid(tmp) then 
            begin 
                Readln; 
                halt; 
            end;
            S_D := StringToFloat(tmp);

            Net_Sal := G_S - S_D;

            if (H_Acr = 'HHD') and (sesV = 1) then
            begin
                calc_hH := val_HHD * 0.75;
                if Net_Sal >= calc_hH then 
                begin 
                    Writeln('Applicant Qualify'); 
                    flag_H := '1'; 
                end
                else 
                begin 
                    Writeln('Applicant Not Qualify.'); 
                    sesV := 0; 
                end;
            end;

            if (H_Acr = 'FHD') and (sesV = 1) then
            begin
                calc_hF := val_FHD * 0.75;
                if Net_Sal >= calc_hF then 
                begin 
                    Writeln('Applicant Qualify'); 
                    flag_F := '1'; 
                end
                else 
                begin 
                    Writeln('Applicant Not Qualify.'); 
                    sesV := 0; 
                end;
            end;

            if (H_Acr = 'LPH') and (sesV = 1) then
            begin
                calc_hL := val_LPH * 0.75;
                if Net_Sal >= calc_hL then 
                begin 
                    Writeln('Applicant Qualify'); 
                    flag_L := '1'; 
                end
                else 
                begin 
                    Writeln('Applicant Not Qualify.'); 
                    sesV := 0; 
                end;
            end;

            if sesV = 0 then
            begin
                Write('Input Data for another applicant? [ N | y ]: '); 
                Readln(c_str);
                if (c_str = 'y') or (c_str = 'Y') then 
                begin
                    r_flag := 1;
                end
                else 
                begin
                    r_flag := 0;
                end;
            end;

            if flag_L = '1' then 
            begin
                H_Comm_Name := 'La Parfaite Harmonie';
            end;
            if flag_H = '1' then 
            begin
                H_Comm_Name := 'Hauraruni Housing Development';
            end;
            if flag_F = '1' then 
            begin
                H_Comm_Name := 'Fitzhope Housing Development';
            end;

        until r_flag = 0;

        Write('Applicant Total Utility Expenses: '); 
        Readln(tmp);
        if not vlid(tmp) then 
        begin 
            Readln; 
            halt; 
        end;
        U_I := StringToFloat(tmp);

        Write('Applicant Total Living Expenses: '); 
        Readln(tmp);
        if not vlid(tmp) then 
        begin 
            Readln; 
            halt; 
        end;
        L_E := StringToFloat(tmp);

        total_ex := U_I + L_E;
        Savings := Net_Sal - total_ex;
        eX_Approved := 0;
        if Savings >= (total_ex * 0.5) then 
        begin
            eX_Approved := 1;
        end;

        Writeln('-------------------------------');
        Writeln('Applicant Name: ', App_Name);
        Writeln('Housing Community: ', H_Comm_Name);
        
        if H_Acr = 'LPH' then 
        begin
            Writeln('Cost: $', val_LPH);
        end;
        if H_Acr = 'FHD' then 
        begin
            Writeln('Cost: $', val_FHD);
        end;
        if H_Acr = 'HHD' then 
        begin
            Writeln('Cost: $', val_HHD);
        end;

        if eX_Approved = 1 then 
        begin
            Writeln('Approval Status: Approved.');
        end
        else 
        begin
            Writeln('Approval Status: Not Approved.');
        end;

        Write('Input Data for another applicant? [ N | y ]: '); 
        Readln(c_1);

    until (c_1 <> 'y') and (c_1 <> 'Y');
end.
