#include <iostream>
#include <cstdlib>
#include <ctime>
#include <string>

using namespace std;

int main() {
    srand(time(0)); // Semilla para números aleatorios

    string letrasMinusculas = "abcdefghijklmnopqrstuvwxyz";
    string letrasMayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    string numeros = "0123456789";
    string simbolos = "!@#$%^&*()-_=+[]{};:,.<>?";

    int longitud;
    char resp;
    bool incluirMayusculas, incluirNumeros, incluirSimbolos;

    // Pedir longitud
    do {
        cout << "Longitud de la contraseña (8-16): ";
        cin >> longitud;
    } while (longitud < 8 || longitud > 16);

    // Pedir opciones
    cout << "Incluir letras mayusculas? (s/n): ";
    cin >> resp;
    incluirMayusculas = (resp == 's' || resp == 'S');

    cout << "Incluir numeros? (s/n): ";
    cin >> resp;
    incluirNumeros = (resp == 's' || resp == 'S');

    cout << "Incluir simbolos? (s/n): ";
    cin >> resp;
    incluirSimbolos = (resp == 's' || resp == 'S');

    // Construir conjunto de caracteres
    string caracteres = letrasMinusculas;
    if (incluirMayusculas) caracteres += letrasMayusculas;
    if (incluirNumeros)    caracteres += numeros;
    if (incluirSimbolos)   caracteres += simbolos;

    // Generar contraseña
    string contrasena = "";
    for (int i = 0; i < longitud; i++) {
        int index = rand() % caracteres.length();
        contrasena += caracteres[index];
    }

    cout << "Contraseña generada: " << contrasena << endl;

    return 0;
}
