void lower (char s[]){
    int i;
    for(int i =0; s[i]!='\0'; ++i){
        char c = s[i];
        s[i] = ('a'<=c && c <= 'z') ? (c + 'A' - 'a'): c;
    }
}