using Weave

# add depencies for the example
using Pkg;
Pkg.add(["Plots"]);

filename = "hello-julia-weave.jmd"
weave(filename, out_path=:pwd)