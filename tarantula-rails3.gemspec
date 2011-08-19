# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tarantula-rails3}
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Relevance, Inc.}, %q{Luca Invernizzi}]
  s.date = %q{2011-08-19}
  s.description = %q{A big hairy fuzzy spider that crawls your site, wreaking havoc}
  s.email = [%q{opensource@thinkrelevance.com}, %q{invernizzi.l@gmail.com}]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "CHANGELOG",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "examples/example_helper.rb",
    "examples/relevance/core_extensions/ellipsize_example.rb",
    "examples/relevance/core_extensions/file_example.rb",
    "examples/relevance/core_extensions/response_example.rb",
    "examples/relevance/core_extensions/test_case_example.rb",
    "examples/relevance/tarantula/attack_handler_example.rb",
    "examples/relevance/tarantula/basic_attack_example.rb",
    "examples/relevance/tarantula/crawler_example.rb",
    "examples/relevance/tarantula/form_example.rb",
    "examples/relevance/tarantula/form_submission_example.rb",
    "examples/relevance/tarantula/html_document_handler_example.rb",
    "examples/relevance/tarantula/html_report_helper_example.rb",
    "examples/relevance/tarantula/html_reporter_example.rb",
    "examples/relevance/tarantula/invalid_html_handler_example.rb",
    "examples/relevance/tarantula/io_reporter_example.rb",
    "examples/relevance/tarantula/link_example.rb",
    "examples/relevance/tarantula/log_grabber_example.rb",
    "examples/relevance/tarantula/rails_integration_proxy_example.rb",
    "examples/relevance/tarantula/result_example.rb",
    "examples/relevance/tarantula/tidy_handler_example.rb",
    "examples/relevance/tarantula/transform_example.rb",
    "examples/relevance/tarantula_example.rb",
    "laf/images/header_bg.jpg",
    "laf/images/logo.png",
    "laf/images/tagline.png",
    "laf/javascripts/jquery-1.2.3.js",
    "laf/javascripts/jquery-ui-tabs.js",
    "laf/javascripts/jquery.tablesorter.js",
    "laf/javascripts/tarantula.js",
    "laf/stylesheets/tarantula.css",
    "lib/relevance/core_extensions/ellipsize.rb",
    "lib/relevance/core_extensions/file.rb",
    "lib/relevance/core_extensions/metaclass.rb",
    "lib/relevance/core_extensions/response.rb",
    "lib/relevance/core_extensions/string_chars_fix.rb",
    "lib/relevance/core_extensions/test_case.rb",
    "lib/relevance/tarantula.rb",
    "lib/relevance/tarantula/attack.rb",
    "lib/relevance/tarantula/attack_handler.rb",
    "lib/relevance/tarantula/basic_attack.rb",
    "lib/relevance/tarantula/blessing.rb",
    "lib/relevance/tarantula/crawler.rb",
    "lib/relevance/tarantula/detail.html.erb",
    "lib/relevance/tarantula/form.rb",
    "lib/relevance/tarantula/form_submission.rb",
    "lib/relevance/tarantula/html_document_handler.rb",
    "lib/relevance/tarantula/html_report_helper.rb",
    "lib/relevance/tarantula/html_reporter.rb",
    "lib/relevance/tarantula/index.html.erb",
    "lib/relevance/tarantula/invalid_html_handler.rb",
    "lib/relevance/tarantula/io_reporter.rb",
    "lib/relevance/tarantula/link.rb",
    "lib/relevance/tarantula/log_grabber.rb",
    "lib/relevance/tarantula/rails_integration_proxy.rb",
    "lib/relevance/tarantula/recording.rb",
    "lib/relevance/tarantula/response.rb",
    "lib/relevance/tarantula/result.rb",
    "lib/relevance/tarantula/test_report.html.erb",
    "lib/relevance/tarantula/text_presence.rb",
    "lib/relevance/tarantula/tidy_handler.rb",
    "lib/relevance/tarantula/transform.rb",
    "lib/relevance/tasks/tarantula_tasks.rake",
    "lib/tarantula-rails3.rb",
    "template/blessed.rb",
    "template/tarantula_test.rb"
  ]
  s.homepage = %q{http://github.com/invernizzi/tarantula-rails3}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.8}
  s.summary = %q{A big hairy fuzzy spider that crawls your site, wreaking havoc}
  s.test_files = [
    "examples/example_helper.rb",
    "examples/relevance/core_extensions/ellipsize_example.rb",
    "examples/relevance/core_extensions/file_example.rb",
    "examples/relevance/core_extensions/response_example.rb",
    "examples/relevance/core_extensions/test_case_example.rb",
    "examples/relevance/tarantula/attack_handler_example.rb",
    "examples/relevance/tarantula/basic_attack_example.rb",
    "examples/relevance/tarantula/crawler_example.rb",
    "examples/relevance/tarantula/form_example.rb",
    "examples/relevance/tarantula/form_submission_example.rb",
    "examples/relevance/tarantula/html_document_handler_example.rb",
    "examples/relevance/tarantula/html_report_helper_example.rb",
    "examples/relevance/tarantula/html_reporter_example.rb",
    "examples/relevance/tarantula/invalid_html_handler_example.rb",
    "examples/relevance/tarantula/io_reporter_example.rb",
    "examples/relevance/tarantula/link_example.rb",
    "examples/relevance/tarantula/log_grabber_example.rb",
    "examples/relevance/tarantula/rails_integration_proxy_example.rb",
    "examples/relevance/tarantula/result_example.rb",
    "examples/relevance/tarantula/tidy_handler_example.rb",
    "examples/relevance/tarantula/transform_example.rb",
    "examples/relevance/tarantula_example.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<htmlentities>, [">= 4.2.0"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0.8.1"])
      s.add_runtime_dependency(%q<tidy>, [">= 0"])
      s.add_development_dependency(%q<micronaut>, [">= 0"])
      s.add_development_dependency(%q<log_buddy>, [">= 0"])
    else
      s.add_dependency(%q<htmlentities>, [">= 4.2.0"])
      s.add_dependency(%q<hpricot>, [">= 0.8.1"])
      s.add_dependency(%q<tidy>, [">= 0"])
      s.add_dependency(%q<micronaut>, [">= 0"])
      s.add_dependency(%q<log_buddy>, [">= 0"])
    end
  else
    s.add_dependency(%q<htmlentities>, [">= 4.2.0"])
    s.add_dependency(%q<hpricot>, [">= 0.8.1"])
    s.add_dependency(%q<tidy>, [">= 0"])
    s.add_dependency(%q<micronaut>, [">= 0"])
    s.add_dependency(%q<log_buddy>, [">= 0"])
  end
end

