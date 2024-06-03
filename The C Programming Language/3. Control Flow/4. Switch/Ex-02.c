// This program is flawed since it doesn't account for our copying surpassing the maximum length of an array
// Modify it so that it doesn't! Use #define to denote maximum length.

void escape(char s[],char t[]){
    int i, j = 0;
    while(t[i]!='\0'){
        switch(t[i]){
            case '\n':
                s[j] = '\\';
                s[j] = 'n';
                j+=2;
                break;
            
            case '\t':
                s[j] = '\\';
                s[j] = 't';
                j+=2;
                break;

            default:
                s[j] = t[i];
                j++;
                break;
        }
        i++;
    }

    s[j]='\0';
}

void unescape(char s[],char t[]){
    int i, j = 0;
    while(t[i]!='\0'){
        switch(t[i]){
            case '\\':
                switch(t[i+1]){
                    case 'n':
                        s[j]='\n';
                        ++i;
                        ++j;
                        break;
                    case 't':
                        s[j]='\t';
                        ++i;
                        ++j;
                        break;
                    default:
                        s[j]='\\';
                        ++j;
                        break;
                }
            default:
                s[j] = t[i];
                s[j] = 'n';
                j++;
                break;
        }
        i++;
    }

    s[j]='\0';
}