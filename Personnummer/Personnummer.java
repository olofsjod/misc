import java.lang.Math;
import java.util.ArrayList;

// Personnummergenerator, av Olof Sjödin 2016-07-23

class Personnummer {
    public static String ArrayIntTillString(int[] array) {
        StringBuilder b = new StringBuilder();
        for (int i : array) {
            b.append(i);
        }
        return b.toString();
    }

    public static ArrayList<Integer> StringTillArrayListInt(String s) {
        String[] array = s.split("");
        ArrayList<Integer> ret = new ArrayList<Integer>();
        for ( String str : array ) {
            ret.add(Integer.parseInt(str));
        }
        return ret;
    }

    public static int SummeraArray(int[] arr) {
        int sum = 0;
        for (int i : arr) {
            sum += i;
        }
        return sum;
    }

    public static int TaBortForstaSiffran(int tal) {
       ArrayList<Integer> arrayList = StringTillArrayListInt(Integer.toString(tal)); 
       return arrayList.get(arrayList.size()-1);
    }

    public static int[] IntegerToInt(Integer[] arr) {
        int[] ret = new int[arr.length];
        for (int i = 0; i < arr.length; i++) {
            ret[i] = arr[i];
        }
        return ret;
    }

    public static int[] TillIntArray(ArrayList<Integer> arr) {
       Integer[] arrInteger = arr.toArray(new Integer[arr.size()]);
       int[] ret = IntegerToInt(arrInteger);
       return ret;
    }

    public static int[] TalTillIntArray(int i) {
        ArrayList<Integer> arrList = StringTillArrayListInt(Integer.toString(i));
        int[] ret = TillIntArray(arrList);
        return ret;
    }

    public static int[] SattIhopArrays(int[] arr1, int[] arr2) {
        int[] ret = new int[arr1.length + arr2.length];

        int i = 0;
        for (int k : arr1) {
            ret[i] = k;
            i++;
        }

        for (int k : arr2) {
            ret[i] = k;
            i++;
        }
        return ret;
    }

    public static int GenereraKontrollsiffra(int[] array) {
        int k = 1;
        ArrayList<Integer> nyLista = new ArrayList<Integer>();

        for (int i : array) {
            k++;
            if ( k % 2 == 0 ) {
                k = 0;
                if (2*i > 9) {
                    ArrayList<Integer> arr =
                        StringTillArrayListInt(Integer.toString(2*i));
                    for (int v : arr) {
                        nyLista.add(v);
                    }
                } else {
                    nyLista.add(2*i);
                }
            } else {
                nyLista.add(i);
            }
        }
        Integer[] arrInt = nyLista.toArray(new Integer[nyLista.size()]);
        int[] arrInt2 = IntegerToInt(arrInt);
        int sum = SummeraArray(arrInt2);

        int sistaSiffran = TaBortForstaSiffran(sum);
        int ret = 0;
        if ((10 - sistaSiffran) < 10)
            ret = (10 - sistaSiffran);
        return ret;
    }
    

    public static String GenereraPersonnummer(int ar, int manad, int dag) {
        int[] arArr = TalTillIntArray(ar);
        int[] manadArr = TalTillIntArray(manad); 
        int[] dagArr = TalTillIntArray(dag);

        int[] arr1 = SattIhopArrays(arArr, manadArr);
        arr1 = SattIhopArrays(arr1, dagArr);

        int rnd = (int) (1000.0 * Math.random());
        int[] arr2 = TalTillIntArray(rnd);

        int[] arr = SattIhopArrays(arr1, arr2);

        int kontrollsiffra = GenereraKontrollsiffra(arr);

        StringBuilder b = new StringBuilder();
        for (int i : arr)
            b.append(i);
        b.append(kontrollsiffra);

        return b.toString();
    }

    public static void main(String[] args) {
        String s = GenereraPersonnummer(16,12,24);
        System.out.println(s);

    }
}
