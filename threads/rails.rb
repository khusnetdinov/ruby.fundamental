# config.threadsafe!: what does it do?
# Let’s take a look at the threadsafe! method:

def threadsafe!
 @preload_frameworks = true
 @cache_classes      = true
 @dependency_loading = false
 @allow_concurrency  = true
 self
end

# Calling this method sets four options in our app configuration. Let’s walk
# through each option and talk about what it does.

# Preloading Frameworks
# The first option @preload_frameworks does pretty much what it says, it forces
# the Rails framework to be eagerly loaded on boot. When this option is not
# enabled, framework classes are loaded lazily via autoload. In multi-threaded
# environments, the framework needs to be eagerly loaded before any threads are
# created because of thread safety issues with autoload. We know that loading
# the framework isn’t threadsafe, so the strategy is to load it all up before
# any threads are ready to handle requests.

# Caching classes
# The @cache_classes option controls whether or not classes get reloaded.
# Remember when you’re doing “TDD” in your application? You modify a controller,
# then reload the page to “test” it and see that things changed? Ya, that’s what
# this option controls. When this option is false, as in development, your
# classes will be reloaded when they are modified. Without this option, we
# wouldn’t be able to do our “F5DD” (yes, that’s F5 Driven Development).
# In production, we know that classes aren’t going to be modified on the fly,
# so doing the work to figure out whether or not to reload classes is just
# wasting resources, so it makes sense to never reload class definitions.

# Dependency loading
# This option, @dependency_loading controls code loading when missing constants
# are encountered. For example, a controller references the User model, but the
# User constant isn’t defined. In that case, if @dependency_loading is true,
# Rails will find the file that contains the User constant, and load that file.
# We already talked about how code loading is not thread safe, so the idea here
# is that we should load the framework, then load all user code, then disable
# dependency loading. Once dependency loading is disabled, framework code and
# app code should be loaded, and any missing constants will just raise an
# exception rather than attempt to load code.
# We justify disabling this option in production because (as was mentioned
# earlier) code loading is not threadsafe, and we expect to have all code loaded
# before any threads can handle requests.

# Allowing concurrency
# @allow_concurrency option controls whether or not the Rack::Lock middleware
# is used in your stack. Rack::Lock wraps a mutex around your request. The idea
# being that if you have code that is not threadsafe, this mutex will prevent
# multiple threads from executing your controller code at the same time. When
# threadsafe! is set, this middleware is removed, and controller code can be
# executed in parallel.

