#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
in vec3 objectCoord;

out vec4 fragColor;

uniform vec4 vermell = vec4(1,0,0,1);
uniform vec4 verd = vec4(0.34,0.7,0.1,1);
uniform vec4 groc = vec4(1,1,0,1);
uniform vec4 blau = vec4(0,0.5,1,1);
uniform vec4 lila = vec4(0.5,0.5,1,1);
uniform vec4 blanc = vec4(1,1,1,1);
uniform vec4 beix = vec4(0.8,0.8,0.5,1);


void triaBandera(int primerDigit, int nota) {
    if(primerDigit == 0 || primerDigit == 1){
        if(nota == 8) {
            // Franges
            int quadrantX = int(vtexCoord.x*3)%3;
            if(quadrantX == 0) fragColor = vermell;
            else if(quadrantX == 1) fragColor = blau;
            else fragColor = groc;
        }
        else if(nota == 9) {

        }
        else if(nota == 10) {
            // Lluna (una rodona tapant una altre rodona)
            vec2 centre1 = vec2(-0.3,0);
            float distancia1 = distance(centre1,objectCoord.xy);
            float s1 = step(0.6,distancia1);
            if(s1 != 1) fragColor = blanc; 
            else fragColor = vermell;
          
            vec2 centre2 = vec2(0.05,0);
            float distancia2 = distance(centre2,objectCoord.xy);
            float s2 = step(0.6,distancia2);
            if(s2 != 1) fragColor = vermell;
            // Rodona
            vec2 centre3 = vec2(0.4,0);
            float distancia3 = distance(centre3,objectCoord.xy);
            float s3 = step(0.3,distancia3);
            if(s3 != 1) fragColor = blanc;
        }
    }
    else if(primerDigit == 2 || primerDigit == 3){
        if(nota == 8) {
            int quadrantY = int(vtexCoord.y*3)%3;
            if(quadrantY == 0) fragColor = blau;
            else if(quadrantY == 1) fragColor = groc;
            else fragColor = verd;

        }
        else if(nota == 9) {
            // Franges
            int quadrantX = int(vtexCoord.x*3)%3;
            if(quadrantX == 0) fragColor = vermell;
            else if(quadrantX == 1) fragColor = blau;
            else fragColor = groc;
            // Rodona
            vec2 centre = vec2(0,0);
            float distancia = distance(centre,objectCoord.xy);
            float s = step(0.3,distancia);
            if(s != 1) fragColor = verd;
        }
        else if(nota == 10) {
            // Lluna (una rodona tapant una altre rodona)
            vec2 centre1 = vec2(0.3,0);
            float distancia1 = distance(centre1,objectCoord.xy);
            float s1 = step(0.6,distancia1);
            if(s1 != 1) fragColor = blanc; 
            else fragColor = blau;
          
            vec2 centre2 = vec2(-0.05,0);
            float distancia2 = distance(centre2,objectCoord.xy);
            float s2 = step(0.6,distancia2);
            if(s2 != 1) fragColor = vermell;
            // Rodona
            vec2 centre3 = vec2(-0.4,0);
            float distancia3 = distance(centre3,objectCoord.xy);
            float s3 = step(0.3,distancia3);
            if(s3 != 1) fragColor = blanc; 
        }
    }
    else if(primerDigit == 4 || primerDigit == 5){
        if(nota == 8) {

        }
        else if(nota == 9) {

        }
        else if(nota == 10) {

        }
    }
    else if(primerDigit == 6 || primerDigit == 7){
        if(nota == 8) {

        }
        else if(nota == 9) {

        }
        else if(nota == 10) {
            // Lluna (una rodona tapant una altre rodona)
            vec2 centre1 = vec2(-0.3,0);
            float distancia1 = distance(centre1,objectCoord.xy);
            float s1 = step(0.6,distancia1);
            if(s1 != 1) fragColor = blanc; 
            else fragColor = beix;
          
            vec2 centre2 = vec2(0.05,0);
            float distancia2 = distance(centre2,objectCoord.xy);
            float s2 = step(0.6,distancia2);
            if(s2 != 1) fragColor = beix;
            // Quadrat
            vec2 centre3 = vec2(0.4,0);
            float distancia3 = distance(centre3,objectCoord.xy);
            if(abs(objectCoord.x - centre3.x) < 0.3 && abs(objectCoord.y - centre3.y) < 0.3) fragColor = blanc;
        }
    }
    else if(primerDigit == 8 || primerDigit == 9){
        if(nota == 8) {

        }
        else if(nota == 9) {

        }
        else if(nota == 10) {

        }
    }
}

void main()
{
    triaBandera(6,10);
}
