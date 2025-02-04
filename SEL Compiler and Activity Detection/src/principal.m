function [AFD, AFDnombres, AFDEtiqueta, estados, arrayEdos, videoname,nombrep] = principal(val);
    %clear all
    %clc
    global nombre;
    global imagenes
    global pr;
    global estados;
    global AFD;
    global prvar;
    global primitivas;
    global arrayEdos;
    global ciclos;
    global cicloIF;
    global cicloIFelse;
    global cicloElse;
    global linea;
    global pr2;
    global NG;
    global tamEstados;
    global numEtiqueta;
    global cicloEtiqueta;
    global AFDnombres;
    global AFDnombresNum;
    global AFDEtiqueta;
    global string
    AFDnombresNum = 1;
    tamEstados = 0;
    linea = 1;
    cicloEtiqueta = 0;
    cicloIF = 0;
    NG = 1;
    numEtiqueta = 1;
    cicloIFelse = 0;
    cicloElse = 0;
    estados = [];
    string = [];
    AFD = [, ];
    AFDnombres = {};
    AFDEtiqueta = [];
    arrayEdos = {};
    imagenes = [];
    pr = {'module', 'begin', 'state', 'seq', 'par', 'con', 'load', 'end', 'if', 'else', 'while', 'state', 'string','export'};
    pr2 = {'module', 'begin', 'state', 'load', 'end', 'if', 'else', 'while', 'state', 'string'};
    prvar = {'state', 'string'};
    primitivas = {'seq', 'par', 'con'};
    ciclos = {'if', 'while', 'else'};
    [programas,videoname,nombrep]=Interprete(val);
