using Discord
using DotEnv

DotEnv.config()

f = open("pipi.txt", "r")
pipi = readline(f)
close(f)

c = Client(ENV["TOKEN"]; presence=(game=(name="with Discord.jl", type=AT_GAME),))

function handler(c::Client, e::MessageCreate)
    if e.message.author.bot !== true && occursin("pipi", lowercase(e.message.content))
        reply(c, e.message, pipi)
    end
end

add_handler!(c, MessageCreate, handler)

open(c)
wait(c)