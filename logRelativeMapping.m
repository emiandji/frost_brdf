% This work © 2023 by Tanaboon Tongbuasirilai is licensed under CC BY-NC-SA 4.0 
function transformed_x = logRelativeMapping(x, weight, ref, epsilon)

    transformed_x = log( (x.*weight + epsilon)./ (ref + epsilon) );

end

