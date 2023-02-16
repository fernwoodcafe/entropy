# See https://discourse.julialang.org/t/make-a-webapp-framework-ecosystem-as-awesome-as-rs-shiny-a-challenge-to-julias-community/9533/40
using Interact,Plots,Mux,WebIO

function myModel(p1,p2)
    xrange = collect(-50:+50)
    model = p1.*xrange .+ p2.* (xrange) .^2
    return model
end

function createLayout()
  p1s = slider(-50:50, label = "Par#1 (linear term):", value = 1)
  p2s = slider(-5:0.1:5, label = "Par#2 (quad term):", value = 1)

  mOutput = Interact.@map myModel(&p1s,&p2s)
  plt = Interact.@map plot(collect(-50:50),&mOutput, label="Model output")
  wdg = Widget(["p1" => p1s, "p2" => p2s], output = mOutput)
  @layout! wdg hbox(plt, vbox(:p1, :p2))
end

function serveLayout(port)
    try
      WebIO.webio_serve(page("/", req -> createLayout()), port)
    catch e
      if isa(e, IOError)
        # sleep and then try again
        sleep(0.1)
        serveLayout(port)
      else
        throw(e)
      end
    end
end

serveLayout(8001)
