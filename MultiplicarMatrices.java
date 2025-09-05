/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.examenlengauejs;

/**
 *
 * @author lalo7
 */
//MEJIA PEREZ JOSE EDUARDO
import java.util.Scanner;

public class MultiplicarMatrices {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // Dimensiones
        System.out.print("Filas de A: ");    int rA = sc.nextInt();
        System.out.print("Columnas de A: "); int cA = sc.nextInt();
        System.out.print("Filas de B: ");    int rB = sc.nextInt();
        System.out.print("Columnas de B: "); int cB = sc.nextInt();

        if (cA != rB) {
            System.out.println("No se pueden multiplicar: columnas de A (" + cA +
                               ") debe ser igual a filas de B (" + rB + ").");
            sc.close();
            return;
        }

        int[][] A = new int[rA][cA];
        int[][] B = new int[rB][cB];

        // Leer A
        System.out.println("Introduce la matriz A:");
        for (int i = 0; i < rA; i++)
            for (int j = 0; j < cA; j++) {
                System.out.print("A[" + i + "][" + j + "]: ");
                A[i][j] = sc.nextInt();
            }

        // Leer B
        System.out.println("Introduce la matriz B:");
        for (int i = 0; i < rB; i++)
            for (int j = 0; j < cB; j++) {
                System.out.print("B[" + i + "][" + j + "]: ");
                B[i][j] = sc.nextInt();
            }

        // C = A x B
        int[][] C = new int[rA][cB];
        for (int i = 0; i < rA; i++)
            for (int j = 0; j < cB; j++) {
                int suma = 0;
                for (int k = 0; k < cA; k++)
                    suma += A[i][k] * B[k][j];
                C[i][j] = suma;
            }

        System.out.println("Resultado C = A x B:");
        imprimirMatriz(C);

        sc.close();
    }

    private static void imprimirMatriz(int[][] M) {
        for (int[] fila : M) {
            for (int v : fila) System.out.printf("%8d", v);
            System.out.println();
        }
    }
}
