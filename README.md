# Controller Usage

Track usage of Rails 3.x controller actions and identify unused code.

## Synopsis

    echo 'gem "controller_usage"' >> Gemfile
    bundle install
    rake -T cu
    
## Warning

 * Writes one line to `#{RAILS_ROOT}/log/controller-usage.log` for every page hit.
 * Has not been extensively tested.
 