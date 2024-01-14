% This work © 2023 by Tanaboon Tongbuasirilai is licensed under CC BY-NC-SA 4.0 
function merlWriter(merlfile, r1d,g1d,b1d)

    redScale = 1.0/1500;
    greenScale = 1.15/1500;
    blueScale = 1.66/1500;

    fid = fopen(merlfile, 'w');
    % Header : thsize tdsize pdsize
    fwrite(fid, 90, 'int32', 'l');
    fwrite(fid, 90, 'int32', 'l');
    fwrite(fid, 180, 'int32', 'l');

    r1d = r1d / redScale;
    g1d = g1d / greenScale;
    b1d = b1d / blueScale;
    
    r1d( isnan(r1d) ) = -1;
    g1d( isnan(g1d) ) = -1;
    b1d( isnan(b1d) ) = -1;
    
    fwrite(fid, r1d, 'double', 'l');
    fwrite(fid, g1d, 'double', 'l');
    fwrite(fid, b1d, 'double', 'l');
    
    
    fclose(fid);
end