# Adapted for the course from Chapter 3 of R4DS (https://r4ds.had.co.nz/)

# loading the library
library(tidyverse)

# taking a look at the data (yes it's about cars...)
mpg

# first plot - hypothesis: is there are relationship between 
# displacement (engine size) and 
# fuel efficiency (number of miles per gallon on the highway)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# Yes, there is! Pretty much and inverse linear relationship, 
# bigger engine, smaller range. However, it seems like some cars
# with the biggest engines remain comparatively efficient.
#
# A note on the grammar of graphic, the synopsis for ggplot is as follows:
#
# ggplot(<DATA>) +
#   geom_...(AESTHETIC)
#
# The ... is a placeholder for the many GEOMETRICS available: https://ggplot2.tidyverse.org/reference/index.html
#
# Time for the first iteration (transform -> visualise -> model) 
# of the data science process.
#
# Are these cars maybe using different source of energy (hybrid)?
#
# We have additional information on the type of cars
mpg$class

# So let's use that to test our hypothesis. Here, we set an extra aesthetic, the color
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# It is quite obvious that the majority of the outliers are 2-seaters, hence probably not
# hybrids, but sports cars: large engines but better dynamics than typical SUVs / pickups.

# There are many aesthetics one can use, but they will not always be relevant
#
# points transparency - caveat, it might be hard to differentiate a discrete variable
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# shape - caveat, ggplot only has six shapes, henve the SUV will not show up
# Luckily, tidyverse is verbose and informs us :-)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, 
                           shape = class))

# Aesthetics do not always need to be a part of the mapping. They often
# can be defined as part of the geom function. The following example
# plots all the dots in blue.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# Outside the mapping, one can define single "simple" aesthetics
# Within the mapping, one associates a variable with an aesthetic
# A common mistake is to mix these up. The following example will
# plot all dots in the same color (red as a matter of fact, as 
# it is ggplot's first color in its default palette)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

# Similarly, passing a character instead of a variable will have the same 
# effect.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "class"))

# Compare with
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# What about more layers?
# Actually that's fairly easy, you can add as many layers as you want
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# What about positioning?
# There are a lot of positioning you can fine tune. You might want for example to
# stack bars in a bargraph or rather have them side-by-side ("dodge").
# For dots, a common positioning, useful to reveal stacked dots is "jitter"
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), 
             position = "jitter")

# What about splitting the graph into multiple panels?
# This is a feature often useful when one want to make visual comparisons.
# For that we can use facets.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), 
             position = "jitter") +
  geom_smooth(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

# What about being a little less verbose?
# So far, we have added the aesthetics' mapping to all layers
# but many layers had the same mapping, could we set a default?
# Yes! We just have to set them in the `ggplot` function `aes`
# argument, like so:
ggplot(data = mpg,aes(x = displ, y = hwy)) + 
  geom_point() +
  geom_smooth()

# Much easier! And then, we can still adjust the geom aesthetic individually
ggplot(data = mpg,aes(x = displ, y = hwy)) + 
  geom_point(position="jitter") +
  geom_smooth(se=FALSE)

# To conclude, the complete grammar of graphics is as followS:

# ggplot(data = <DATA>) + 
#   <GEOM_FUNCTION>(
#     mapping = aes(<MAPPINGS>),
#     stat = <STAT>, 
#     position = <POSITION>
#   ) +
#   <COORDINATE_FUNCTION> +
#   <FACET_FUNCTION>

# Two aspects no covered in this examples are the more advanced `stat` aspect of the geom object and the `coordinate` grammar.
# Refer to Chapter 3.7 and 3.9 of R4DS (https://r4ds.had.co.nz/).

# Finally, some good practice
sessionInfo()
