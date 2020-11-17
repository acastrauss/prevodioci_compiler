//Program koji racuna 
//apsolutnu vrednost unetog broja

/* Ovo je main funkcija
   koja ce samo pozvati abs funkciju
   i ispisati rezultat */
int main() {
  int res;
  int a = 0b101;
  unsigned b = 0x4a2;

  bool g = true;
  bool bla = -4;

  bool p = g < bla;
  bool p = not(false and true);
  
  //bool p = g && bla;
  
  int a, c;

  res = abs(5); // poziv funkcije
  
  //printf("Apsolutna vrednost je %d", res); 
}

//Funkcija koja racuna apsolutnu vrednost
int abs(int broj) {
  if(broj == 0)
    return 0 - broj; //negativan broj
  else
    return broj;     //pozitivan broj
}
