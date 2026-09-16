# Main purpose of the Rake

Rake is the `make` descendand, and it is primary task is to run code based on
timespamps of the files, to track a wide and high trees of compilation and
linking. Thus Rake task runs when prerequisites are new than a task file.

That is very very opaque in Rake documentation. So even I have some doubs. But
I read The Art of Unix Programming and know history of make.

So I start this tiny project to prove myself that Rake regenerates files based
on their timestamp. And I goning to have some tiny tests.

`one.txt` - first prerequesite  
`two.txt` - second preprequesit  
`multiplexer.rb` - tool that add `one.txt` and `two.txt`  
`Rake` - the rake file that adds one.txt and two.txt and generate an answer  
`result.txt` - the result itself  

Evetuatlly Rake starts `multiplexer.rb` and it adds `one.txt` and `two.txt`
into `result.txt`. Thus changing or unchanghin `one.txt` and `two.txt` the
Rake will run or will not run a multiplexer. Ok Let's start. Yes! and even
`multiplexer` itself may change.


## The documentation problem: not skip when exists, skip when too new! 


Here is super opaqe explanation of Rake, the generation (running a task) may
be if file already exists, but if it is outdated - that is the main puprose of
rake.


https://ruby.github.io/rake/doc/rakefile_rdoc.html#file-tasks

```
Tasks that generate these files may be skipped if the file already exists.
```

Need to rewrite the docs. But first I will make a test. This doucmentation is
harfull for a newbie, an one like I was in the past. I coult no get a clue, what
is Rake used for.

Only After I read a brillian story from the Eric Raymond in "The Art of Unix
Programming" - a got it. Rake is to run `generators` basing on filestaps. That
was crusial for C workflow with compiling and linkig phases.

The srting for the Rake-doc makes thinks to complicated, because it poorly
written. Need to write more prescely like this:

```
Tasks that generage files my be skipped if prerequsistes are older then a
generated file. That is a main purpose of Rake keep track of tasks that NEED
to be run.
```

So need some time for polishing. But Idea is clear.

And here is the link to the history of `make`:  

The Art of Unix Programming (c) Eric Raymond   
Chapter 15 'Tools'    
Section 'make: Automating Your Recipes'  
page 396;  

```
Make originated with a visit from Steve Johnson (author of yacc, etc.), storming
into my office, cursing the Fates that had caused him to waste a morning debug-
ging a correct program (bug had been fixed, file hadn’t been compiled, cc *.o was
therefore unaffected). As I had spent a part of the previous evening coping with
the same disaster on a project I was working on, the idea of a tool to solve it
came up. It began with an elaborate idea of a dependency analyzer, boiled down
to something much simpler, and turned into Make that weekend. Use of tools
that were still wet was part of the culture. Makefiles were text files, not magi-
cally encoded binaries, because that was the Unix ethos: printable, debuggable,
understandable stuff.
—
<author>StuartFeldman</author>
```


## So the Experiment

As I planed

1) Run and fall because of error.
2) Run and have empty `result.txt`, but file exiest.
3) Changed `multiplexer.rb` and it REGENERATE FILE.
4) Run again and noting. Run many may times. Rake skips.
5) Change `first.txt` and run `rake`. Rake fires, and REGENERATE FILE.

Finally: Rake starts tasks if prerequisites are newer than a task file. Need
chane a documentation.



