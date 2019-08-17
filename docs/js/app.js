var app = angular.module('app', ['ngAnimate', 'ngSanitize', 'ui.bootstrap']);

app.controller('MainCtrl', ['$scope', '$http', '$filter',
    function ($scope, $http, $filter) {
        
        $scope.totalItems = 0;
        $scope.currentPage = 1;
        $scope.maxSize = 5;
        $scope.itemsPerPage = 5;
        
        $scope.setPage = function (pageNo) {
            $scope.currentPage = pageNo;
        };

        $scope.pageChanged = function() {
            $log.log('Page changed to: ' + $scope.currentPage);
        };

        //$scope.location = window.location.pathname;

        var req = {
            method: 'GET',
            //url: 'https://api.github.com/repos/AlexHedley/Symantec-SEP-Scripts/contents/scripts/',
            url: 'https://raw.githubusercontent.com/AlexHedley/Symantec-SEP-Scripts/master/scripts/scripts.json',
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
                        $scope.files.push(item);
                    });

                    $scope.totalItems = response.data.length
                }
            );

        };

        $scope.loadFile = (file) => {
            $scope.selectedFile = file;
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
                    var ext = file.name.substr(file.name.lastIndexOf('.')+1);
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

$("#copyscriptbutton").on("click", function() {
    var button = $(this)[0];
    console.log(button);
    button.innerText = 'Copied!';
    var text = $('#script > div > pre')[0].innerText;
    console.log(text);
    //document.execCommand("copy");
    clipboard.writeText(text);

    setTimeout(function () {
        button.innerText = 'Copy';
    }, 2000);
});