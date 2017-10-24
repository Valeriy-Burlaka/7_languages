class Roman:

    def __getattr__(self, name, *args, **kwargs):
        roman = name
        roman = roman.replace("IV", "IIII").\
          replace("IX", "VIIII").\
          replace("XL", "XXXX").\
          replace("XC", "LXXXX")
        return (roman.count("I") + \
                roman.count("V") * 5 + \
                roman.count("X") * 10 + \
                roman.count("L") * 50 + \
                roman.count("C") * 100)

roman = Roman()
print(roman.XXX)
print(roman.IX)
print(roman.XIX)
print(roman.CCLXXIV)
