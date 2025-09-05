#include <iostream>
using namespace std;

const int MAX = 10; // tamaño máximo

int main() {
    int rA, cA, rB, cB;
    int A[MAX][MAX], B[MAX][MAX], C[MAX][MAX];

    cout << "Filas de A: "; cin >> rA;
    cout << "Columnas de A: "; cin >> cA;
    cout << "Filas de B: "; cin >> rB;
    cout << "Columnas de B: "; cin >> cB;

    if (cA != rB) {
        cout << "No se pueden multiplicar: columnas de A (" << cA
             << ") debe ser igual a filas de B (" << rB << ")." << endl;
        return 0;
    }

    // Leer matriz A
    cout << "Introduce la matriz A:" << endl;
    for(int i=0;i<rA;i++)
        for(int j=0;j<cA;j++){
            cout << "A["<<i<<"]["<<j<<"]: ";
            cin >> A[i][j];
        }

    // Leer matriz B
    cout << "Introduce la matriz B:" << endl;
    for(int i=0;i<rB;i++)
        for(int j=0;j<cB;j++){
            cout << "B["<<i<<"]["<<j<<"]: ";
            cin >> B[i][j];
        }

    // Inicializar C a cero
    for(int i=0;i<rA;i++)
        for(int j=0;j<cB;j++)
            C[i][j] = 0;

    // Multiplicar
    for(int i=0;i<rA;i++)
        for(int j=0;j<cB;j++)
            for(int k=0;k<cA;k++)
                C[i][j] += A[i][k]*B[k][j];

    // Imprimir resultado
    cout << "Resultado C = A x B:" << endl;
    for(int i=0;i<rA;i++){
        for(int j=0;j<cB;j++)
            cout.width(8), cout << C[i][j];
        cout << endl;
    }

    return 0;
}
