function [programa, videoname,nombrep]=Interprete(script)
    [programa,nombrep]=leerprograma(script);
    [programa, videoname]=fnCabecera(programa);
    programa=fnVariables(programa);
    programa=fnSentencias(programa);
end
