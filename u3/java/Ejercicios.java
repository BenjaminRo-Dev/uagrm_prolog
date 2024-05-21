// package iterativos;

public class Ejercicios {
    
    public void factorialIterativo(int numero){
        if(numero <= 0)
            System.out.println(1);
        int factorial = 1;
        while(numero > 1){
            factorial = factorial * numero;
            numero --;
        }
        System.out.println(factorial);
    }
    
    public int factorialRecursivo(int n){
        if(n == 0){
            return 1;
        }else{
            n = n * factorialRecursivo(n-1);
        }
        return n;
    }
    
    public void potencia(int n){
        System.out.println(potencia(n, 3));
    }
    private int potencia(int n, int x){
        if(x == 0)
            return 1;
        else{
            n = n * potencia(n, x -1);
            return n;
        }
    }
    
    //Fibonacci
    public void fibo(int n){
        System.out.println(fibonacci(n));
    }
    // fibonacci(1) = 1
    // fibonacci(2) = 1
    // fibonacci(3) = fibonacci(n-1) + fibonacci(n-2);
    private int fibonacci(int n){
        if(n == 0)
            n = 0;
        if(n == 1 || n == 2)
            n = 1;
        else{
            n = fibonacci(n-1) + fibonacci(n-2);
        }
        return n;
    }
    
    //Numeros combinatorios
    public void combinatorios(int n, int r){
        System.out.println(combi(n, r));
    }
    private int combi(int n, int r){
        if(r == 0 || n == r)
            n = 1;
        else{
            n = combi(n-1, r) + combi(n-1, r-1);
        }
        return n;
    }
    //Al menos 6 problemas adicionales cualesquiera
    private int mayDig(int n){
        int dm;
        if(n<10){
            dm = n;
        }else{
            dm = mayDig(n/10);
            if(dm < n%10){
                dm = n%10;
            }
        }
        return dm;
    }
    
    private int sumarDigitos(int n){
        int sum;
        if(n<10)
            return n;
        else{
            sum = n%10 + sumarDigitos(n/10);
        }
        return sum;
    }
    private int contarDig(int n){
        int c;
        if(n<10)
            c = 1;
        else{
            c = 1 + contarDig(n/10);
        }
        return c;
    }
    
    //Nota, en prolog hice sumar digitos pares (No es lo mismo)
    public int cantidadDigitosPares(int n){
        int sum;
        if(n < 10){
            sum = n%2 == 0? 1 : 0;
        }else{
            int dig = n%10;
            sum = cantidadDigitosPares(n/10);
            if(dig%2 == 0){
                sum++;
            }
        }
        return sum;
    }
    
    public int eliminarDigito(int n, int d){
        if(n<10){
            if(n == d)
                return 0;
            else
                return n;
        }else{
            int dg = n%10;//digito guardado;
            n = eliminarDigito(n/10, d);
            if(dg != d){
                n = n*10 + dg;//Apilando
            }
            return n;
        }
    }
    
    public static void main(String[] args) {
        Ejercicios e = new Ejercicios();
//        e.factorial(-4);
//        e.potencia(2);
//        System.out.println(e.fibonacci(7));
//        e.combinatorios(4, 3);
//        System.out.println(e.mayDig(9814));
//        System.out.println(e.sumarDigitos(7));
//        System.out.println(e.contarDig(21));
        System.out.println(e.cantidadDigitosPares(12412261));
//        System.out.println(e.eliminarDigito(65403, 0));
//        System.out.println(e.factorialRecursivo(4));
    }
}



