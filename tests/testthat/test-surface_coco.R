test_that("main", {
    a <- c(
        rep(c("a", "man", NA), 100),
        rep(c("a", "plan", NA), 100),
        rep(c("the", "man", NA), 100),
        rep(c("the", "plan", NA), 100),
        rep(c("another", "man", NA), 100),
        rep(c("another", "plan", NA), 100)
    )
    b <- c(
        rep(c("a", "man", NA), 60),
        rep(c("a", "plan", NA), 100),
        rep(c("a", "canal", NA), 40),
        rep(c("the", "man", NA), 60),
        rep(c("the", "plan", NA), 100),
        rep(c("the", "canal", NA), 40),
        rep(c("another", "man", NA), 60),
        rep(c("another", "plan", NA), 100),
        rep(c("another", "canal", NA), 40)
    )
    nodes <- c("a", "the")

    rv_1 <- CorporaCoCo:::.coco(
        CorporaCoCo:::.surface(a, span = "1R", nodes = NULL, collocates = NULL),
        CorporaCoCo:::.surface(b, span = "1R", nodes = NULL, collocates = NULL),
        nodes = nodes, collocates = NULL, fdr = 0.01
    )
    rv_2 <- CorporaCoCo:::.surface_coco(a, b, span = "1R", nodes = nodes, collocates = NULL, fdr = 0.01)
    expect_identical(rv_1, rv_2)

    rv_3 <- CorporaCoCo:::.coco(
        CorporaCoCo:::.surface(a, span = "1R", nodes = NULL, collocates = "man"),
        CorporaCoCo:::.surface(b, span = "1R", nodes = NULL, collocates = "man"),
        nodes = nodes, fdr = 0.01, collocates = "man"
    )
    rv_4 <- CorporaCoCo:::.surface_coco(a, b, span = "1R", nodes = nodes, fdr = 0.01, collocates = "man")
    expect_identical(rv_3, rv_4)
})
