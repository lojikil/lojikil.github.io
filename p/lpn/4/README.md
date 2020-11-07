# Thoughts on match forms

I was working on a new function in [carML's C implementation](https://github.com/lojikil/carML/commit/f8f99f804a15d08be1bfa01416720969a5eb696d) and
wrote the following notes...

(We need) a very simple function (to) walk the spine of children from a `match` form
and return YES if we have found *any* guard clauses, and NO otherwise
then, the code generation can make an informed decision.

This is mostly a hack due to the fact that we don't process `match`
forms into a lower-level form prior to ending up in the code generator
The best way to solve this would be to transform the various types of
match into lower-level forms, and then generate code for those.
for example:

```
match x with
    (Foo.Some y) => ...
    (Foo.None) => ...
end

match z with
   10 => ...
   11 => ...
   12 => ...
end

match g with
   y given (> g 10) => ...
   z => ...
end
```

these three forms could all be written to different
lower-level forms, the first a `type-match`, the second a
`case-match`, and the third a `guard-match`, and then we
easily know how to dispatch from there. My other thinking
was how nice it would be to smash cases together and reduce
the number of dispatches. To wit:

```
match x with
    (Foo.Some y) given (> y 10) =>
    (Foo.Some z) => ...
    (Foo.None) => ...
end
```

The naive case would be to simply generate two cases there:

```
if(x.tag == Tag_FOO_SOME && x.m_1 > 10) {
   ...
} else if (x.tag == TAG_FOO_SOME) {
   ...
} else if (x.tag == Tag_FOO_NONE) {
   ...
}
```

Whilst this works, it means that we have redundant checks for
the tag. Something like [Rust's MIR](https://blog.rust-lang.org/2016/04/19/MIR.html)
would be really interesting...
