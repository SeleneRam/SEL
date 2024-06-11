function [programa, videoname]=Interprete(script)
    programa=leerprograma(script);
    [programa, videoname]=fnCabecera(programa);
    programa=fnVariables(programa);
    programa=fnSentencias(programa);
end
