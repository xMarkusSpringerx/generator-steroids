path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class S3uploadExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nS3 upload example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"s3upload.html\"")}
          
        For this example, you need to create a bucket to Amazon S3 with eased-off CORS rules like:

        <CORSConfiguration>
         <CORSRule>
           <AllowedOrigin>*</AllowedOrigin>
           <AllowedMethod>GET</AllowedMethod>
           <AllowedMethod>PUT</AllowedMethod>
           <AllowedMethod>POST</AllowedMethod>
           <AllowedMethod>DELETE</AllowedMethod>
           <AllowedHeader>*</AllowedHeader>
         </CORSRule>
        </CORSConfiguration>

        And give access to 'everyone' with at least upload/delete permission to make this work.

        Also configure your bucket name in www/s3upload.html.

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating S3 upload example...

      """
    )

    @copy "s3upload.html", "www/s3upload.html"