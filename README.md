# Machine Learning library

[![Build status](https://travis-ci.org/carldata/purescript-learn.svg?branch=master)](https://travis-ci.org/carldata/purescript-learn)
<a href="https://pursuit.purescript.org/packages/purescript-learn">
  <img src="https://pursuit.purescript.org/packages/purescript-learn/badge"
       alt="purescript-learn on Pursuit">
  </img>
</a>

Machine Learning for Just In Time learning. JIT means that machine learning that instead of building models
on the backend while receiving data, we only apply ML to data we want to process. 
We can also retrain models during data editing. 
For example we can in interactive way edit time series. After few corection ML will train model and fix next
points automatically.



## Installation

```
bower install purescript-learn
```

## Features

  * Anomaly detection
    * [x] Outliers


## Documentation

Module documentation is [published on Pursuit](http://pursuit.purescript.org/packages/purescript-learn).


## Build

```bash
bower update
pulp test
```


# Join in!

We are happy to receive bug reports, fixes, documentation enhancements,
and other improvements.

Please report bugs via the
[github issue tracker](http://github.com/carldata/learn/issues).



# Redistributing

purescript-learn source code is distributed under the Apache-2.0 license.

**Contributions**

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall be
licensed as above, without any additional terms or conditions.
