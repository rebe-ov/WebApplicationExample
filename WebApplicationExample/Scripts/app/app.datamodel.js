﻿function AppDataModel() {
    var self = this;
    // Routes
    self.userInfoUrl = "/api/Me";
    self.siteUrl = "/";
    self.viewUserProject = "/api/UserProjects/ViewProjects";

    // Route operations

    // Other private operations

    // Operations

    // Data
    self.returnUrl = self.siteUrl;

    // Data access operations
    self.setAccessToken = function (accessToken) {
        sessionStorage.setItem("accessToken", accessToken);
    };

    self.getAccessToken = function () {
        return sessionStorage.getItem("accessToken");
    };
}
