var app = angular.module('app', []);

app.controller('MainCtrl', ['$scope', '$http', '$filter',
    function ($scope, $http, $filter) {
        $scope.location = window.location.pathname;

        var req = {
            method: 'GET',
            url: 'https://api.github.com/repos/AlexHedley/Symantec-SEP-Scripts/contents/scripts',
            // https://raw.githubusercontent.com/:owner/:repo/master/:path
            // https://raw.githubusercontent.com/Protirus/Tagger/master/README.md
            headers: {
                'Accept': 'application/vnd.github.mercy-preview+json'
            }
        };

        loadFiles = () => {
            $http(req)
                .then(function(response) {
                    angular.forEach(response.data, function(item) {
                        var fileName = item.name.split('.').slice(0, -1).join('.');
                        var ext = item.name.substr(item.name.lastIndexOf('.')+1);
                        if (ext != 'md') {
                            item.fileName = fileName;
                            $scope.files.push(item);
                        }
                    });
                }
            );

        };

        $scope.loadFile = (file) => {
            $scope.selectedFile = file;
            var fileName = file.name.split('.').slice(0, -1).join('.');
            var ext = file.name.substr(file.name.lastIndexOf('.')+1);
            
            var url = "https://raw.githubusercontent.com/AlexHedley/Symantec-SEP-Scripts/master/scripts/" + file.name;

            var req = {
                method: 'GET',
                url: url,
                headers: {
                    'Accept': 'application/vnd.github.mercy-preview+json'
                }
            };

            $http(req)
                .then(function(response) {
                    $scope.script = response.data;
                    var div = $('<div><pre><code data-language="' + ext + '">'+ $scope.script +'</code></pre></div>');
                    Rainbow.color(div[0], function() {
                        $("#script").empty().append(div[0]);
                    });
                }
            );
        };

        $scope.init = () => {
            $scope.files = [];
            loadFiles();
        };
        //$scope.init();
    }
]
);