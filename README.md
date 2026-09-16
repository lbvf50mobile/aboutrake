# Main purpose of the Rake

Rake is the make descendand, and it is primary task is to run code based on
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


## That is I am agaings with (is it correct English, I do not care)


Here is super opaqe explanation of Rake,  the generation may be if file
already exists, but if it is outdated - that is the main puprose of rake.


https://ruby.github.io/rake/doc/rakefile_rdoc.html#file-tasks

```
Tasks that generate these files may be skipped if the file already exists.
```

Need to rewrite the docs. But first I will make a test.

## So the Experiment

As I planed

1) Run and fall because of error.
2) Run and have empty `result.txt`, but file exiest.
3) Changed `multiplexer.rb` and it REGENERATE FILE.
4) Run again and noting. Run many may times. Rake skips.
5) Change `first.txt` and run `rake`. Rake fires, and REGENERATE FILE.

Finally: Rake starts tasks if prerequisites are newer than a task file. Need
chane a documentation.



