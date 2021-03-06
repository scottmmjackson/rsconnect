% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deployApp.R
\name{deployApp}
\alias{deployApp}
\title{Deploy an Application}
\usage{
deployApp(appDir = getwd(), appFiles = NULL, appFileManifest = NULL,
  appPrimaryDoc = NULL, appSourceDoc = NULL, appName = NULL,
  appTitle = NULL, contentCategory = NULL, account = NULL,
  server = NULL, upload = TRUE,
  launch.browser = getOption("rsconnect.launch.browser", interactive()),
  logLevel = c("normal", "quiet", "verbose"), lint = TRUE,
  metadata = list())
}
\arguments{
\item{appDir}{Directory containing application. Defaults to current working
directory.}

\item{appFiles}{The files and directories to bundle and deploy (only if
\code{upload = TRUE}). Can be \code{NULL}, in which case all the files in
the directory containing the application are bundled. Takes precedence over
\code{appFileManifest} if both are supplied.}

\item{appFileManifest}{An alternate way to specify the files to be deployed;
a file containing the names of the files, one per line, relative to the
\code{appDir}.}

\item{appPrimaryDoc}{If the application contains more than one document, this
parameter indicates the primary one, as a path relative to \code{appDir}.
Can be \code{NULL}, in which case the primary document is inferred from the
contents being deployed.}

\item{appSourceDoc}{If the application is composed of static files (e.g
HTML), this parameter indicates the source document, if any, as a fully
qualified path. Deployment information returned by
\code{\link{deployments}} is associated with the source document.}

\item{appName}{Name of application (names must be unique within an
account). Defaults to the base name of the specified \code{appDir}.}

\item{appTitle}{Free-form descriptive title of application. Optional; if
supplied, will often be displayed in favor of the name. When deploying a
new application, you may supply only the \code{appTitle} to receive an
auto-generated \code{appName}.}

\item{contentCategory}{Optional; the kind of content being deployed (e.g.
\code{"plot"}, \code{"document"}, or \code{"application"}).}

\item{account}{Account to deploy application to. This
parameter is only required for the initial deployment of an application
when there are multiple accounts configured on the system (see
\link{accounts}).}

\item{server}{Server name. Required only if you use the same account name on
multiple servers.}

\item{upload}{If \code{TRUE} (the default) then the application is uploaded
from the local system prior to deployment. If \code{FALSE} then it is
re-deployed using the last version that was uploaded.}

\item{launch.browser}{If true, the system's default web browser will be
launched automatically after the app is started. Defaults to \code{TRUE} in
interactive sessions only.}

\item{logLevel}{One of \code{"quiet"}, \code{"normal"} or \code{"verbose"};
indicates how much logging to the console is to be performed. At
\code{"quiet"} reports no information; at \code{"verbose"}, a full
diagnostic log is captured.}

\item{lint}{Lint the project before initiating deployment, to identify
potentially problematic code?}

\item{metadata}{Additional metadata fields to save with the deployment
record. These fields will be returned on subsequent calls to
\code{\link{deployments}}.}
}
\description{
Deploy a \link[shiny:shiny-package]{shiny} application, an R Markdown
document, a plumber API, or HTML content to a server.
}
\examples{
\dontrun{

# deploy the application in the current working dir
deployApp()

# deploy an application in another directory
deployApp("~/projects/shiny/app1")

# deploy using an alternative application name and title
deployApp("~/projects/shiny/app1", appName = "myapp",
          appTitle = "My Application")

# deploy specifying an explicit account name, then
# redeploy with no arguments (will automatically use
# the previously specified account)
deployApp(account = "jsmith")
deployApp()

# deploy but don't launch a browser when completed
deployApp(launch.browser = FALSE)
}
}
\seealso{
\code{\link{applications}}, \code{\link{terminateApp}}, and
  \code{\link{restartApp}}
}
