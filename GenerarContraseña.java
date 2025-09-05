package com.mycompany.examenlengauejs;


 /*** Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

/**
 *
 * @author lalo7
 */
//MEJIA PEREZ JOSE EDUARDO
import java.util.Scanner;
import java.util.Random;

public class GenerarContraseña {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Random rand = new Random();

        String letrasMinusculas = "abcdefghijklmnopqrstuvwxyz";
        String letrasMayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String numeros = "0123456789";
        String simbolos = "!@#$%^&*()-_=+[]{};:,.<>?";

        int longitud = 0;
        boolean incluirMayusculas, incluirNumeros, incluirSimbolos;

        // Pedir longitud
        do {
            System.out.print("Longitud de la contraseña (8-16): ");
            longitud = sc.nextInt();
        } while (longitud < 8 || longitud > 16);

        sc.nextLine(); // Limpiar buffer

        // Pedir opciones
        System.out.print("Incluir letras mayúsculas? (s/n): ");
        incluirMayusculas = sc.nextLine().equalsIgnoreCase("s");

        System.out.print("Incluir números? (s/n): ");
        incluirNumeros = sc.nextLine().equalsIgnoreCase("s");

        System.out.print("Incluir símbolos? (s/n): ");
        incluirSimbolos = sc.nextLine().equalsIgnoreCase("s");

        // Construir conjunto de caracteres
        String caracteres = letrasMinusculas;
        if (incluirMayusculas) caracteres += letrasMayusculas;
        if (incluirNumeros) caracteres += numeros;
        if (incluirSimbolos) caracteres += simbolos;

        // Generar contraseña
        StringBuilder contrasena = new StringBuilder();
        for (int i = 0; i < longitud; i++) {
            int index = rand.nextInt(caracteres.length());
            contrasena.append(caracteres.charAt(index));
        }

        System.out.println("Contraseña generada: " + contrasena.toString());
        sc.close();
    }
}
