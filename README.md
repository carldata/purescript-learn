# Machine Learning library

[![Build status](https://travis-ci.org/carldata/purescript-learn.svg?branch=master)](https://travis-ci.org/carldata/purescript-learn)
<a href="https://pursuit.purescript.org/packages/purescript-learn">
  <img src="https://pursuit.purescript.org/packages/purescript-learn/badge"
       alt="purescript-learn on Pursuit">
  </img>
</a>

Just In Time Machine (Statistical) Learning. 

JIT means that instead of building models on the backend while receiving data, we only apply ML to data we want to process. 
This gives us the flexibility to fast retrain models while for example user is editing the data.



## Installation

```
bower install purescript-learn
```

## Features

  * Anomaly detection
    * [x] Outlier Detection (Unsupervised)
  * Metrics
    * [x] Confusion matrix
    * [x] F score


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
