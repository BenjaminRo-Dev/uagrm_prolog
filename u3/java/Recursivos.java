public class Recursivos {

    // 1. mostrarDivisores( N ) : Predicado que muestra los divisores del entero N. Muestra desde el 1 a N.
    public void mostrarDivisores(int n){
        mostrarDivisores(n, 1);
    }
    private void mostrarDivisores(int n, int i){
        if(i <= n){
            if(n % i == 0)
                System.out.println(i);
                mostrarDivisores(n, i+1);
        }
    }

    // 2. primo( N ) : Predicado que es True, si el entero N es un número primo.
    public boolean primo(int n){
        return primo(n, 1, 0);
    }
    private boolean primo(int n, int i, int c){
        if(i <= n){
            if(n % i == 0){
                c++;
                // System.out.println(c);
            }
            return primo(n, i+1, c);
        }
        return c == 2;//
    }

    // 3. mostrarDivisoresPrimos( N ) : Predicado que muestra los divisores primos del entero N.
    public void mostrarDivisoresPrimos(int n){
        mostrarDivisoresPrimos(n, 1);
    }
    private void mostrarDivisoresPrimos(int n, int i){
        if(i <= n){
            if(n % i == 0){
                if(primo(i)){
                    System.out.println(i);
                }
            }
            mostrarDivisoresPrimos(n, i+1);
        }
    }

    // 4. mostrarPrimos(A, B) : Predicado que muestra, los número primos entre A y B. inclusive.
    public void mostrarPrimos(int a, int b){
        if(a <= b){
            if(primo(a)){
                System.out.println(a);
            }
            mostrarPrimos(a+1, b);
        }
    }

    // 5. mostrarDivisoresDesc( N ): Predicado que muestra los divisores del entero N. Muestra desde el N a 1.
    public void mostrarDivisoresDesc(int n){
        mostrarDivisoresDesc(n, n);
    }
    private void mostrarDivisoresDesc(int n, int i){
        if(i >= 1){
            if(n % i == 0){
                System.out.println(i);
            }
            mostrarDivisoresDesc(n, i-1);
        }
    }

    //6. mostrarDivisoresComunes(N, M) : Predicado que muestra los divisores comunes de los entero N y M.
    public void mostrarDivisoresComunes(int n, int m){
        mostrarDivisoresComunes(n, m, 1);
    }
    private void mostrarDivisoresComunes(int n, int m, int i){
        if(i <= n && i <= m){
            if(n % i == 0 && m % i == 0)
                System.out.println(i);
            mostrarDivisoresComunes(n, m, i+1);
        }
    }

    //7. mostrarDivisoresPares( N ) : Predicado que muestra los divisores pares de N.
    public void mostrarDivisoresPares(int n){
        mostrarDivisoresPares(n, 1);
    }

    private void mostrarDivisoresPares(int n, int i){
        if(i <= n){
            if(i % 2 == 0 && n % i == 0)
                System.out.println(i);
            mostrarDivisoresPares(n, i+1);
        }
    }

    // 8. mostrarDivisoresImpares( N ): Predicado que muestra los divisores impares de N.
    //Nota: lo mismo pero devolviendo String
    public void mostrarDivisoresImpares(int n){
        System.out.println(mostrarDivisoresImpares(n, 1, ""));
    }

    private String mostrarDivisoresImpares(int n, int i, String s){
        if(i <= n){
            if(i % 2 != 0 && n % i == 0)
                s+= i + "  ";
            return mostrarDivisoresImpares(n, i+1, s);
        }
        return s;
    }

    //5. mostrarDivisores(N, A, B) : Predicado que muestra los divisores de N, comprendidos entre A y B inclusive.ç
    public void mostrarDivisoresEntre(int n, int a, int b){
        if(a <= b){
            if(n % a == 0)
                System.out.println(a);
            mostrarDivisoresEntre(n, a+1, b);
        }
    }

    // 9. proximoPrimo(N, P) : Predicado que encuentra en P, el primo después de N. Si N es primo,  P toma el valor de N.
    
    public int proximoPrimo(int n){
        if(primo(n))
            return n;
        else
            return proximoPrimo(n+1);
    }

    //10. anteriorPrimo(N, A) : Predicado que encuentra en A, el anterior primo antes de N. Si N es primo,  A toma el valor de N.
    public int anteriorPrimo(int n){
        if(n > 1){
            if(primo(n)){
                return n;
            }
            return anteriorPrimo(n-1);
        }
        return 0;
    }

    // 11. mostrarDivisoresPrimosAsc(N) : Predicado que muestra los divisores primos de N. Muestra desde 1 hasta N.
    public void mostrarDivisoresPrimosAsc(int n){
        System.out.println(mostrarDivisoresPrimosAsc(n, 1, ""));
    }
    private String mostrarDivisoresPrimosAsc(int n, int i, String s){
        if (n >= i) {
            if(n % i == 0 && primo(i))
                s+= i + "  ";
            return mostrarDivisoresPrimosAsc(n, i+1, s);
        }
        return s;
    }

    // 12. mostrarDivisoresPrimosDesc( N ) : Predicado que muestra los divisores primos de N. Muestra desde N hasta 1.
    public void mostrarDivisoresPrimosDesc(int n){
        System.out.println(mostrarDivisoresPrimosDesc(n, n, ""));
    }
    private String mostrarDivisoresPrimosDesc(int n, int i, String s){
        if(i > 1){
            if(n % i == 0 && primo(i)){
                s+= i + "  ";
            }
            return mostrarDivisoresPrimosDesc(n, i-1, s);
        }
        return s;
    }

    // 13. mostrarFactoriales( N ): Predicado que muestra los factoriales de 1 a N.
    // Si N = 5
    // 1! = 1
    // 2! = 2
    // 3! = 6
    // 4! = 24
    // 5! = 120
    public void mostrarFactoriales(int n){
        mostrarFactoriales(n, 1, 1);
    }
    private void mostrarFactoriales(int n, int i, int factorial){
        if(i <= n){
            factorial = i * factorial;
            System.out.println(factorial);
            mostrarFactoriales(n, i+1, factorial);
        }
    }

    // 14. mostrarCoefBin( N ) : Predicado que muestra los coeficientes binomiales de un binomio elevado a la N. Ej. Si N = 2, muestra 1, 2, 1. Si N = 4,  muestra    1, 4, 6, 4, 1.
    
    // 15. mostrarFib( N ): Predicado que muestra los primeros N términos de la secuencia de Fibonacci.
    public void mostrarFib(int n){
        mostrarFib(n, 1, 0, 0, 1);//n, empieza en 1, resultado inicial 0
    }
    public void mostrarFib(int n, int i, int fibo, int ant2, int ant1){
        if(i <= n){
            fibo = ant1 + ant2;
            System.out.println(fibo);
            ant2 = ant1;
            ant1 = fibo;
            mostrarFib(n, i+1, fibo, ant2, ant1);
        }
    }//1, 1, 2, 3, 5, 8, 13, 21, 34

    // public int fibo(int n){
    //     if(n == 0){
    //         return 0;
    //     }
    //     if(n == 1){
    //         return 1;
    //     }else{
    //         n = n-1;
    //         return fibo(n) + fibo(n-1);
    //     }
    // }

    // 16. Ejercicios de lógica. (no cíclicos)
    // dosPrimos(A, B),
    // dosPrimos(A, B, C),
    // dosPrimos(A, B, C, D) : Predicado que es True, si existe dos primos exactamente entre los argumentos.

    public static void main(String[] args) {
        Recursivos r = new Recursivos();
        // r.mostrarDivisores(51);
        // System.out.println(r.primo(6));
        // r.mostrarDivisoresPrimos(15);
        // r.mostrarPrimos(4, 16);
        // r.mostrarDivisoresDesc(12);
        // r.mostrarDivisoresComunes(12, 15);
        // r.mostrarDivisoresPares(12);
        // r.mostrarDivisoresImpares(12);
        // r.mostrarDivisores(12);
        // r.mostrarDivisoresEntre(12, 6, 12);
        // System.out.println(r.proximoPrimo(48));
        // System.out.println(r.anteriorPrimo(1));
        // r.mostrarDivisoresPrimos(10);
        // r.mostrarDivisoresPrimosDesc(12);
        // r.mostrarFactoriales(5);
        // System.out.println(r.fibo(2));
        r.mostrarFib(6);
    }

}