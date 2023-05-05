#include<bits/stdc++.h>
using namespace std;
#define __INP_FILE "PRETABLE.INP"
#define __OUT_FILE "PRETABLE.OUT"


int main() {
    freopen(__INP_FILE, "r", stdin);
    freopen(__OUT_FILE, "w", stdout);
    int n, k;
    cin >> n >> k;
    cout << ((n % k) != 0 ? (n / k) + 1 : (n / k));
}