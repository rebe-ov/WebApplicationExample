var mainContent;
var titleContent;

document.addEventListener("DOMContentLoaded", function() {
    $(function() {
        mainContent = $("#MainContent"); /// render partial views.  
        titleContent = $("title"); // render titles.  
    });

    var routingApp = Sammy("#MainContent",
        function() {
            this.get("/UserProjects/ViewProjects",
                function(context) {
                    titleContent.html("View Projects Page");
                    $.get("/UserProjects/ViewProjects",
                        {
                            UserId: context.params.id
                        },
                        function(data) {

                            context.$element().html(data);
                        });
                });

        });

    $(function () {
        routingApp.run("/UserProjects/ViewProjects"); // default routing page.  
    });
});


