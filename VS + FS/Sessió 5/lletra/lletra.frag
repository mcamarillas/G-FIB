#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform int slice = 10;
uniform float proporcio = 0.1;

uniform vec4 magenta = vec4(1,0,1,1);
uniform vec4 negre = vec4(0,0,0,1);
void main()
{
    // Mirar quadrant
    int quadrantX = int(vtexCoord.x * slice)%slice;
    int quadrantY = int(vtexCoord.y * slice)%slice;
    float fractX = fract(vtexCoord.x * slice);
    float fractY = fract(vtexCoord.y * slice); 
    fragColor = negre;
    if(quadrantX == 2) {
        if(quadrantY == 1) {
            if(fractX > proporcio &&  fractX < fractY) fragColor = magenta;
        }
        else if(quadrantY == 2 || quadrantY == 3) {
            if(fractX > proporcio) fragColor = magenta;
        }
        else if(quadrantY == 4) {
            if(fractX > proporcio &&  fractX + fractY < 1) fragColor = magenta;
        }
        else if(quadrantY == 5) {
            if(fractX > proporcio &&  fractX < fractY) fragColor = magenta;
            
        }
        else if(quadrantY == 6 || quadrantY == 7) {
            if(fractX > proporcio) fragColor = magenta;
        }
        else if(quadrantY == 8) {
            if(fractX > proporcio && fractX + fractY < 1) fragColor = magenta;
        }
    }
    else if(quadrantX == 3) {
        if(quadrantY == 7) {
            if(fractX > proporcio && fractX + fractY < 1) fragColor = magenta;
        }
        else if(quadrantY == 6) {
            if(fractX > proporcio && fractX + fractY > 1) fragColor = magenta;
        }
    }
    else if(quadrantX == 4) {
        if(quadrantY == 6) {
            if(fractX + fractY < 1) fragColor = magenta;
        }
        else if(quadrantY == 5) {
            if(fractX + fractY > 1) fragColor = magenta;
        }
    }
    else if(quadrantX == 5) {
        if(quadrantY == 6) {
            if(fractX > fractY) fragColor = magenta;
        }
        else if(quadrantY == 5) {
            if(fractX < fractY) fragColor = magenta;
        }
    }
    else if(quadrantX == 6) {
        if(quadrantY == 7) {
            if(fractX > fractY) fragColor = magenta;
        }
        else if(quadrantY == 6) {
            if(fractX < fractY) fragColor = magenta;
        }
    }
    else if(quadrantX == 7) {
        if(quadrantY == 1) {
            if(fractX > proporcio &&  fractX + fractY > 1) fragColor = magenta;
        }
        else if(quadrantY == 2 || quadrantY == 3) {
            if(fractX > proporcio) fragColor = magenta;
        }
        else if(quadrantY == 4) {
            if(fractX > proporcio &&  fractX > fractY) fragColor = magenta;
        }
        else if(quadrantY == 5) {
            if(fractX > proporcio &&  fractX + fractY > 1) fragColor = magenta;
        }
        else if(quadrantY == 6 || quadrantY == 7) {
            if(fractX > proporcio) fragColor = magenta;
        }
        else if(quadrantY == 8) {
            if(fractX > proporcio && fractX > fractY) fragColor = magenta;
        }
    }
}
