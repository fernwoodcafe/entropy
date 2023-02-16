
Download, install, and start Julia.

https://julialang.github.io/IJulia.jl/stable/manual/installation/

Then follow these instructions to install the Quarto necessities for Julia:

https://quarto.org/docs/computations/julia.html

Summary:

Open the Julia prompt and run these commands.

```
# Install IJulia

using Pkg
Pkg.add("IJulia")
using IJulia

# Install Jupyter via Conda (choose yes)
notebook() 

# Install Revise
using Pkg
Pkg.add("Revise")

# Install Plots
import Pkg
Pkg.add("Plots")
```

Add this to `.julia/config/startup_ijulia.jl`. The directory often lives in ~/.

```
try
  @eval using Revise
catch e
  @warn "Revise init" exception=(e, catch_backtrace())
end
```

Run `quarto preview .\hello-julia.qmd` after adding content to the qmd file.
