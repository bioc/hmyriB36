datacache <- new.env(hash=TRUE, parent=emptyenv())

hmyriAmbB36_23a_dbconn <- function() dbconn(datacache) # lexical scope?
hmyriAmbB36_23a_dbfile <- function() dbfile(datacache)

.onLoad <- function(libname, pkgname)
{
    require("methods", quietly=TRUE)
    ## Connect to the SQLite DB
    dbfile <- system.file("extdata", "hmyriAmbB36_23a.sqlite", 
       package=pkgname, lib.loc=libname)
    assign("dbfile", dbfile, envir=datacache)
    dbconn <- dbFileConnect(dbfile)
    assign("dbconn", dbconn, envir=datacache)
    ## Create the AnnObj instances
    aae = AnnotationDbi:::addToNamespaceAndExport
    aae("hmyriAmbB36_23a_dbconn", hmyriAmbB36_23a_dbconn, pkgname)
    aae("hmyriAmbB36_23a_dbfile", hmyriAmbB36_23a_dbfile, pkgname)
}

.onUnload <- function(libpath)
{
    dbFileDisconnect(hmyriAmbB36_23a_dbconn())
}

