using CSV
using DataFrames
df=DataFrame(serialno=[1,2,3,4,5],dataname=["x","y","z","t","v"],weight=[23,45,32,63,18]);
print(df);
CSV.write("D:\\other\\JuliaWorks\\CSVFiles\\export_df.csv",df);