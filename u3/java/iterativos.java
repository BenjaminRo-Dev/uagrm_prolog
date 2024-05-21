class Iterativos{

    //1. mostrarDivisores( N ) : Predicado que muestra los divisores del entero N. Muestra desde el 1 a N.
    //Divisores de un numero son los numeros por los que se puede dividir N y el residuo = 0
    //Ej: 12 = 1,2,3,4,6,12
    public void mostrarDivisores(int n){
        int i = 1;
        while(i <= n){
            if(n % i == 0){
                System.out.println(i);
            }
            i++;
        }
    }

    //2. primo( N ) : Predicado que es True, si el entero N es un número primo.
    //Primos son los que solo se pueden dividir entre 1 y ellos mismos
    public boolean primo(int n){
        int i = 1;
        int c = 0;
        while (i <= n) {
            if(n % i == 0){
                c++;
            } 
            i++;
        }
        if(c > 2) return false;
        return true;
    }

    //3. mostrarDivisoresPrimos( N ) : Predicado que muestra los divisores primos del entero N.
    public void mostrarDivisoresPrimos(int n){
        int i = 1;
        while(i <= n){
            if(n % i == 0){
                if(primo(i)){
                    System.out.println(i);
                }
            }
            i++;
        }
    }
    //4. mostrarPrimos(A, B) : Predicado que muestra, los número primos entre A y B. inclusive.
    public String mostrarPrimos(int A, int B){
        int i = A;
        String salida = "Primos: ";
        while(i <= B){
            if(primo(i))
                salida += i + " - " ;
            i++;
        }
        return salida;
    }

    //5. mostrarDivisoresDesc( N ): Predicado que muestra los divisores del entero N. Muestra desde el N a 1.
    public String mostrarDivisoresDesc(int n){
        int i = n;
        String s = "Divisores desc: ";
        while(i > 0){
            if(n % i == 0){
                s += i + " - ";
            }
            i--;
        }
        return s;
    }

    //Funcion auxiliar:
    private boolean esDivisor(int n, int divisor){
        return n % divisor == 0;
    }
    //6. mostrarDivisoresComunes(N, M) : Predicado que muestra los divisores comunes de los entero N y M.
    public String mostrarDivisoresComunes(int n, int m){
        int i = 1;
        int j = 1;
        String s = "Divisores Comunes: ";
        while(i <= n || j <= m){
            if(esDivisor(n, i) && esDivisor(m, j))
            s+= i + " - ";
            i++;
            j++;
        }
        return s;
    }

    // 7. mostrarDivisoresPares( N ) : Predicado que muestra los divisores pares de N.
    public String mostrarDivisoresPares(int n){
        int i = 1;
        String s = "Divisores pares: ";
        while(i < n){
            if(esDivisor(n, i) && i % 2 == 0)
                s+= i + " - ";
            i++;
        }
        return s;
    }

    // 8. mostrarDivisoresImpares( N ): Predicado que muestra los divisores impares de N.
    private boolean esImpar(int n){
        return n % 2 != 0;
    }
    public String mostrarDivisoresImpares(int n){
        int i = 1;
        String s = "Divisores impares: ";
        while(i <= 20){
            if(esImpar(i) && esDivisor(n, i))
                s+= i + " - ";
            i++;
        }
        return s;
    }

    // 5. mostrarDivisores(N, A, B) : Predicado que muestra los divisores de N, comprendidos entre A y B inclusive.
    public String mostrarDivisoresEntre(int n, int a, int b){
        int i = a;
        String s = "Divisores entre " + a + " y " + b + ": ";
        while(i <= b){
            if(esDivisor(n, i))
            s+= i + " - ";
            i++;
        }
        return s;
    }

    // 9. proximoPrimo(N, P) : Predicado que encuentra en P, el primo después de N. Si N es primo,  P toma el valor de N.
    public int proximoPrimo(int n){
        int p = 0;
        while (p == 0){
            if(primo(n)){
                p = n;
            }
            n++;
        }
        return p;
    }

    //Nota: el 10 y 11 son similares
    // 10. anteriorPrimo(N, A) : Predicado que encuentra en A, el anterior primo antes de N. Si N es primo,  A toma el valor de N.
    public int anteriorPrimo(int n){
        while(!primo(n)){
            n--;
        }
        return n;
    }

    // 11. mostrarDivisoresPrimosAsc(N) : Predicado que muestra los divisores primos de N. Muestra desde 1 hasta N.
    public String mostrarDivisoresPrimosAsc(int n){
        String s = "Divisores primos asc : ";
        int i = 1;
        while(i <= n){
            if (primo(i) && esDivisor(n, i)) {
                s+= i + " - ";
            }
            i++;
        }
        return s;
    }

    // 12. mostrarDivisoresPrimosDesc( N ) : Predicado que muestra los divisores primos de N. Muestra desde N hasta 1.
    public String mostrarDivisoresPrimosDesc(int n){
        String s = "Divisores primos desc: ";
        int i = n;
        while (i >= 1) {
            if(primo(i) && esDivisor(n, i))
                s+= i + " - ";
            i--;
        }
        return s;
    }
    /*13. mostrarFactoriales( N ): Predicado que muestra los factoriales de 1 a N.
    Si N = 5
    1! = 1
    2! = 2
    3! = 6
    4! = 24
    5! = 120 */
    //Funcion auxiliar:
    private int factorial(int n){
        int i = 1;
        int factorial = 1;
        while(i <= n){
            factorial = factorial * i;
            i++;
        }
        return factorial;
    }
    public String mostrarFactoriales(int n){
        String s = "Factoriales: ";
        int i = 1;
        while(i <= n){
            s+= factorial(i) + " - ";
            i++;
        }
        return s;
    }

    // 14. mostrarCoefBin( N ) :Predicado que muestra los coeficientes binomiales de un binomio elevado a la N.
    // Ej. Si N = 2, muestra 1, 2, 1. Si N = 4,  muestra    1, 4, 6, 4, 1.

    // 15. mostrarFib( N ): Predicado que muestra los primeros N términos de la secuencia de Fibonacci.
    public String mostrarFib(int n){
        String s = "";
        int i = 0;
        int ant2 = 0;
        int ant1 = 1;
        int fibo = 0;
        while(i <= n){
            fibo = ant1 + ant2;
            s+= fibo + " ";
            ant2 = ant1;
            ant1 = fibo;
            i++;
        }
        return s;
    }//0,1,1,2,3,5,8,13,21

    // 16. Ejercicios de lógica. (no cíclicos)
    // dosPrimos(A, B),
    public boolean dosPrimos(int a, int b){
        return primo(a) && primo(b);
    }
    // dosPrimos(A, B, C),
    public boolean dosPrimos(int a, int b, int c){
        return 
            primo(a) && primo(b) ||
            primo(a) && primo(c) ||
            primo(b) && primo(c);
    }

    // dosPrimos(A, B, C, D) : Predicado que es True, si existe dos primos exactamente entre los argumentos.
    public boolean dosPrimos(int a, int b, int c, int d){
        return 
            primo(a) && primo(b) && !primo(c) && !primo(d) ||
            primo(a) && primo(c) && !primo(b) && !primo(d) ||
            primo(a) && primo(d) && !primo(b) && !primo(c) ||
            primo(b) && primo(c) && !primo(a) && !primo(d) ||
            primo(b) && primo(d) && !primo(a) && !primo(c) ||
            primo(c) && primo(d) && !primo(a) && !primo(b);
    }

    //17. 
    
    //existePrimoNP(A, B),
    public boolean existePrimoNP(int a, int b){
        return 
            primo(a) && !primo(b) ||
            primo(b) && !primo(a);
    }
    
    //existePrimoNP(A, B, C),
    public boolean existePrimoNP(int a, int b, int c){
        return 
        primo(a) && !primo(b) ||
        primo(b) && !primo(a) ||
        primo(a) && !primo(c) ||
        primo(c) && !primo(a) ||
        primo(b) && !primo(c) ||
        primo(c) && !primo(b);
    }
    
    // existePrimoNP(A, B, C, D) : Predicado que es True, si existe al menos un primo y un no primo entre los argumentos.
    public boolean existePrimoNP(int a, int b, int c, int d){
        return 
            existePrimoNP(a, b, c) || existePrimoNP(c, d);
    }
    
    
    // 18.
    // primosAlternos(A, B),
    public boolean primosAlternos(int a, int b){
        return primo(a) && !primo(b);
    }

    // primosAlternos(A, B, C),
    public boolean primosAlternos(int a, int b, int c){
        return 
            primo(a) && !primo(b) && primo(c) ||
            !primo(a) && primo(b) && !primo(c);
    }

    // primosAlternos(A, B, C, D) : Predicado que es True, si la secuencia de argumentos están alternados entre primos y no primos.
    public boolean primosAlternos(int a, int b, int c, int d){
        return 
            primo(a) && !primo(b) && primo(c) && !primo(d) ||
            !primo(a) && primo(b) && !primo(c) && primo(d);
    }


    public static void main(String[] args) {
        Iterativos iterativos = new Iterativos();
        // iterativos.mostrarDivisores(12);
        // System.out.println(iterativos.primo(9));
        // iterativos.mostrarDivisoresPrimos(5);
        // System.out.println(iterativos.mostrarPrimos(1, 20));
        // System.out.println(iterativos.mostrarDivisoresDesc(20));
        // System.out.println(iterativos.mostrarDivisoresComunes(12, 9));
        // System.out.println(iterativos.mostrarDivisoresPares(12));
        // System.out.println(iterativos.mostrarDivisoresImpares(12));
        // System.out.println(iterativos.mostrarDivisoresEntre(20, 5, 15));
        // System.out.println(iterativos.proximoPrimo(8));
        // System.out.println(iterativos.anteriorPrimo(10));
        // System.out.println(iterativos.mostrarDivisoresPrimosAsc(20));
        // System.out.println(iterativos.mostrarDivisoresPrimosDesc(15));
        // System.out.println(iterativos.factorial(4));
        // System.out.println(iterativos.mostrarFactoriales(5));
        // System.out.println(iterativos.mostrarFib(5));
        // System.out.println(iterativos.dosPrimos(2,4, 8, 6));
        // System.out.println(iterativos.existePrimoNP(1,2,3,4));
        // System.out.println(iterativos.primosAlternos(3, 4, 5, 7));
    }
}
