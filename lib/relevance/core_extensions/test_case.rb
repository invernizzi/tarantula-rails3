require 'action_dispatch/testing/integration'

module Relevance::CoreExtensions::TestCaseExtensions

  def tarantula_crawl(integration_test, options = {})
    url = options[:url] || "/"
    t = tarantula_crawler(integration_test, options)
    t.crawl url
  end

  def tarantula_crawler(integration_test, options = {})
      Relevance::Tarantula::RailsIntegrationProxy.rails_integration_test(integration_test, options)
  end

  def tarantula_activate_HTML_checking(crawler)
      crawler.handlers << Relevance::Tarantula::TidyHandler.new
  end

  def tarantula_activate_form_submissions_attacks(crawler)
      #trivial XSS
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => "<script>bad</script>",
          :output => "<script>bad</script>",
      }

      #Closing tag
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => "><script>bad</script>&",
          :output => "<script>bad</script>",
      }

      #style tag
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => '<style>@import"javascript:bad";</style>',
          :output => '<style>@import"javascript:bad";</style>',
      }

      #check escaping
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => ''';!--"<XSS>=&{()}',
          :output => "<XSS", #correct escaping would be &lt;XSS
      }

      #javascript in images
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => '<IMG SRC=javascript:bad>',
          :output => '<IMG SRC=javascript:bad>',
      }

      #javascript in images, embedded tab
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => "<IMG SRC=java\tscript:bad>",
          :output => "<IMG SRC=java\tscript:bad>",
      }

      #javascript in images, embedded tab, encoded
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => "<IMG SRC=java&#x09script:bad>",
          :output => "<IMG SRC=java\tscript:bad>",
      }

      #javascript in images, embedded newline
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => "<IMG SRC=java\nscript:bad>",
          :output => "<IMG SRC=java\nscript:bad>",
      }

      #javascript in images, embedded newline, encoded
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => "<IMG SRC=java&#x0Ascript:bad>",
          :output => "<IMG SRC=java\nscript:bad>",
      }

      #javascript in images, embedded carriage return
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => "<IMG SRC=java\rscript:bad>",
          :output => "<IMG SRC=java\rscript:bad>",
      }

      #javascript in images, embedded carriage return, encoded
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => "<IMG SRC=java&#x0Dscript:bad>",
          :output => "<IMG SRC=java\rscript:bad>",
      }

      #javascript in images, embedded null
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => "<IM\0G SRC=java\0script:bad>",
          :output => "<IM\0G SRC=java\0script:bad>",
      }

      #javascript in images, embedded newline, multiline
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => "<IMG\n SRC\n=\njava\nscript\n:\nbad>",
          :output => "<IMG\n SRC\n=\njava\nscript\n:\nbad>",
      }

      #malformed tags
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => '<IMG """><SCRIPT>bad</SCRIPT>">',
          :output => '<SCRIPT>bad</SCRIPT>',
      }

      #UTF-8 encoding in hex
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => '<IMG src=&#x6A;&#x61;&#x76;&#x61;&#x73;&#x63;&#x72;&#x69;&#x70;&#x74;&#x3A;&#x62;&#x61;&#x64;>',
          :output => '<IMG src=javascript:bad>',
      }

      #UTF-8 encoding in hex, long strings
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => '<IMG src=&#x000006A;&#x0000061;&#x0000076;&#x0000061;&#x0000073;&#x0000063;&#x0000072;&#x0000069;&#x0000070;&#x0000074;&#x000003A;&#x0000062;&#x0000061;&#x0000064;>',
          :output => '<IMG src=javascript:bad>',
      }

      #UTF-8 encoding in decimal
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => '<IMG src=&#106&#97&#118&#97&#115&#99&#114&#105&#112&#116&#58&#98&#97&#100>',
          :output => '<IMG src=javascript:bad>',
      }


      #Ruby's #{}. It's probably impossible, but it doesn't hurt to check
      Relevance::Tarantula::FormSubmission.attacks << {
          :name => :xss,
          :input => '#{351*887}',
          :output => "311337",
     }

     #Non-alpha-non-digit XSS
     Relevance::Tarantula::FormSubmission.attacks << {
         :name => :xss,
         :input => '<script/ bad',
         :output => "<script> bad",
     }

     #Extraneous open brackets
     Relevance::Tarantula::FormSubmission.attacks << {
         :name => :xss,
         :input => '<<script>bad;//<</script>',
         :output => "<script>bad",
     }

     #unclosed tag
     Relevance::Tarantula::FormSubmission.attacks << {
         :name => :xss,
         :input => '<script>bad',
         :output => "<script>bad",
     }

     #escaping javascript
     Relevance::Tarantula::FormSubmission.attacks << {
         :name => :xss,
         :input => '\";<script>bad',
         :output => "<script>bad",
     }

     #in title
     Relevance::Tarantula::FormSubmission.attacks << {
         :name => :xss,
         :input => '</title><script>bad</script>',
         :output => "<script>bad",
     }

     #possible encodings of "<" (not all of them, they are too many)
     ['<', '%3C', '&lt', '&lt;', '&LT', '&LT;', '&#60', '&#060', '&#0000060',
      '&#60;', '&#060;', '&#0000060;', '&#x3c', '&#x03c', '&#x000003c',
      '&#x3c;', '&#x03c;', '&#x000003c;', '&#X3c', '&#X03c', '&#X000003c',
      '&#X3c;', '&#X03c;', '&#X000003c;', '&#x3C', '&#x03C', '&#x000003C',
      '&#x3C;', '&#x03C;', '&#x003C;', '&#x000003C;',
      '&#X3C', '&#X000003C', '&#X3C;', '&#X000003C;', '\x3c',
      '\x3C', '\u003c', '\u003C'].each do |encoding|
         Relevance::Tarantula::FormSubmission.attacks << {
             :name => :xss,
             :input => encoding + "0598729",
             :output => "<" + "0598729",
         }
     end

     crawler.handlers << Relevance::Tarantula::AttackHandler.new
  end

end

