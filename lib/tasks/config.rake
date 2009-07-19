MetricFu::Configuration.run do |config|
    #define which metrics you want to use
    # TODO: Find out why flog is causing the build to break.
    #config.metrics  = [:churn, :saikuro, :stats, :flog, :flay, :reek, :roodi, :rcov]
    config.metrics  = [:churn, :saikuro, :stats, :flay, :reek, :roodi, :rcov]
    config.graphs   = [:flay, :reek, :roodi, :rcov]
    config.flay     = { :dirs_to_flay => ['app', 'lib']  }
    #config.flog     = { :dirs_to_flog => ['app', 'lib']  }
    config.reek     = { :dirs_to_reek => ['app', 'lib']  }
    config.roodi    = { :dirs_to_roodi => ['app', 'lib'] }
    config.saikuro  = { :output_directory => 'scratch_directory/saikuro',
                        :input_directory => ['app', 'lib'],
                        :cyclo => "",
                        :filter_cyclo => "0",
                        :warn_cyclo => "5",
                        :error_cyclo => "7",
                        :formater => "text"} #this needs to be set to "text"
    config.churn    = { :start_date => "1 year ago", :minimum_churn_count => 10 }
    config.rcov     = { :test_files => ['test/functional/*test.rb',
                                        'test/performance/*test.rb',
                                        'test/unit/*test.rb' ],
                        :rcov_opts => ["--sort coverage",
                                       "--no-html",
                                       "--text-coverage",
                                       "--no-color",
                                       "--profile",
                                       "--rails",
                                       "--exclude /gems/,/Library/,spec,lib,test" ]}
end
