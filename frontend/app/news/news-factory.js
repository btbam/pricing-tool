(function () {
  'use strict';

  angular.module('news')
    .factory('News', function ($http, API_PATH) {
      return {
        getArticles: function (duns_number) {
          return $http.get(API_PATH + '/api/entity/' + duns_number + '/news');
        },
        search: function (query, start, keywords, tabname) {
          var query_words, full_query ;

          query_words = encodeURIComponent(query);

          if (start === null || start === undefined) {
            start = 1;
          }

          if (keywords !== null && keywords !== undefined) {
            query_words = query_words + '+' +  encodeURIComponent(keywords);
          }
          full_query = API_PATH + '/api/news/search?' + 'page=' + start + '&' +  'q=' + query_words;

          if (tabname === 'News') {
            full_query = full_query + '&news_only=true' ;
          }

          return $http.get(full_query);

        }
      };
    });
})();
