## k-means only works with numerical variables,
# so don't give the user the option to select
# a categorical variable
vars <- setdiff(names(mtcars), "Cars")

pageWithSidebar(
    headerPanel('Cars k-means clustering'),
    sidebarPanel(
        selectInput('xcol', 'X variable', vars),
        selectInput('ycol', 'Y variable', vars, selected = vars[[2]]),
        numericInput('clusters', 'Cluster amount', 3, min = 1, max = 9)
    ),
    mainPanel(
        plotOutput('plot1')
    )
)