--exec SalesRangeByCity 'Cincinnati',40000,60000;

exec SalesRangeByCity @lowsales = 40000, @highsales = 70000;