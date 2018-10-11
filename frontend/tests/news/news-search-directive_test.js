/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('newsSearch', function() {
  var scope,
    element,
    $httpBackend;

  beforeEach(module('shared'));
  beforeEach(module('news', 'news/news-search/news-search-directive.tpl.html'));

  beforeEach(inject(function($compile, $rootScope, _$httpBackend_) {
    $httpBackend = _$httpBackend_;
    scope = $rootScope.$new();
    element = $compile(angular.element('<news-search></news-search>'))(scope);
    $httpBackend.when('GET', "http://127.0.0.1:3000/api/news/search?page=0&q=llc%20allintext%3A%22undefined%22")
      .respond({
        "results": [{
          "title": "Denver company buying Village Voice Media Holdings and Westword",
          "url": "http://www.denverpost.com/ci_21622712/denver-company-buying-village-voice-media-holdings-and",
          "date": "2012-09-25T07:00:00.000+00:00",
          "description": "25 Sep 2012 ... A new Denver holding company, Voice Media Group, announced Monday it ... \nowned by Village Voice Media Holdings LLC, including Westword."
        }, {
          "title": "Village Voice Alt-Weekly Chain Sold In Management Buyout - Forbes",
          "url": "http://www.forbes.com/sites/jeffbercovici/2012/09/24/village-voice-alt-weekly-chain-sold-in-management-buyout/",
          "date": "2012-09-24T07:00:00.000+00:00",
          "description": "24 Sep 2012 ... The Village Voice is changing hands again. The free downtown paper and the 12 \nother alternative weeklies that make up Village Voice Media\u0026nbsp;..."
        }, {
          "title": "Village Voice Owner Ponders M\u0026A Options - CMO Today - WSJ",
          "url": "http://blogs.wsj.com/cmo/2015/01/27/village-voice-owner-ponders-ma-options/",
          "date": "2015-01-27T08:00:00.000+00:00",
          "description": "27 Jan 2015 ... Voice Media Group, owner of 11 alternative weeklies including the Village ... \nweeklies that was named Village Voice Media Holdings LLC."
        }, {
          "title": "Denver group buying Westword and other Village Voice weeklies ...",
          "url": "http://www.denverpost.com/ci_21618496/new-denver-company-purchase-village-voice-media-including",
          "date": "2012-09-24T07:00:00.000+00:00",
          "description": "24 Sep 2012 ... A newly formed Denver holding company, Voice Media Group, ... related sales \nproperties owned by Village Voice Media Holdings LLC. ... Backpage.com, also \nowned by Village Voice Media Holdings, is not part of the buyout."
        }, {
          "title": "Village Voice being sold; Backpage.com left behind",
          "url": "http://www.huffingtonpost.com/huff-wires/20120924/us-village-voice-media/",
          "date": "2012-09-24T07:00:00.000+00:00",
          "description": "24 Sep 2012 ... The buyout is being led by Scott Tobias, the chief operating officer of Village \nVoice Media Holdings LLC. Tobias will become the new\u0026nbsp;..."
        }, {
          "title": "Village Voice Has a Child Prostitution Problem (Updated)",
          "url": "http://gawker.com/5642182/village-voice-has-a-child-prostitution-problem",
          "date": "1970-01-01T00:00:00.000+00:00",
          "description": "We've received a statement from Village Voice Media's Steve Suskind. ..... \nattorney attempted to milk a tragedy by suing Village Voice Media Holdings, LLC \nand\u0026nbsp;..."
        }, {
          "title": "The Dallas Observer Has New Owners; Village Voice Media ...",
          "url": "http://blogs.dallasobserver.com/unfairpark/2012/09/the_dallas_observer_has_new_ow.php",
          "date": "2012-09-24T07:00:00.000+00:00",
          "description": "24 Sep 2012 ... NEWLY FORMED DENVER HOLDING COMPANY VOICE MEDIA GROUP TO ... \nsales properties owned by Village Voice Media Holdings, LLC."
        }, {
          "title": "Riverfront Times parent Village Voice Media sold to management ...",
          "url": "http://www.bizjournals.com/stlouis/news/2012/09/24/riverfront-times-parent-village-voice.html",
          "date": "2012-09-24T07:00:00.000+00:00",
          "description": "24 Sep 2012 ... Village Voice Media Holdings LLC, which own metropolitan newsweeklies \nincluding the Riverfront Times in St. Louis, has agreed to sell its\u0026nbsp;..."
        }, {
          "title": "Ropes \u0026 Gray Litigation Team Files Federal Lawsuit Against ...",
          "url": "http://www.prnewswire.com/news-releases/ropes--gray-litigation-team-files-federal-lawsuit-against-backpagecoms-online-child-sex-trade-279484442.html",
          "date": "2014-10-16T07:00:00.000+00:00",
          "description": "16 Oct 2014 ... ... that the defendants, Backpage.com LLC, its parent company, Camarillo \nHoldings LLC, known until recently as Village Voice Media Holdings,\u0026nbsp;..."
        }, {
          "title": "Sale severs Backpage.com's ties with Dallas Observer, other Village ...",
          "url": "http://www.dallasnews.com/news/local-news/20120924-village-voice-sale-severs-backpage.com-s-ties-with-papers-including-dallas-observer.ece",
          "date": "2012-09-24T07:00:00.000+00:00",
          "description": "24 Sep 2012 ... Village Voice Media Holdings LLC executive Scott Tobias is buying the \ncompany's papers from current owners Jim Larkin and Michael Lacey,\u0026nbsp;..."
        }, {
          "title": "Senate resolution tells Village Voice to take down 'adult entertainment'",
          "url": "http://thehill.com/blogs/floor-action/senate/274293-senate-resolution-tells-village-voice-to-take-down-adult-entertainment-section",
          "date": "2012-12-21T08:00:00.000+00:00",
          "description": "21 Dec 2012 ... “The profit-first mentality at Village Voice Media, which prioritizes the ... that \nBackpage.com is owned by Village Voice Media Holdings, LLC."
        }, {
          "title": "Treme Character Works for The Village Voice, Is Accurate, Awesome ...",
          "url": "http://blogs.villagevoice.com/runninscared/2010/05/treme_character.php",
          "date": "2010-05-03T07:00:00.000+00:00",
          "description": "3 May 2010 ... Never underestimate the power of the HBO-Media-Industrial Complex. ... A of the \nVillage Voice Media Holdings, LLC employee handbook."
        }, {
          "title": "Village Voice Denies Bankruptcy Speculation - Business Insider",
          "url": "http://www.businessinsider.com/village-voice-facing-backruptcy-in-21-million-ad-price-fixing-suit-2010-1",
          "date": "2010-01-15T08:00:00.000+00:00",
          "description": "15 Jan 2010 ... Village Voice shoots down Bloomberg report. ... \"Village Voice Media Holdings, \nLLC will be filing a demand for correction this afternoon with\u0026nbsp;..."
        }, {
          "title": "Maloney and Nadler Join Calls for Village Voice to Shut Down Sex ...",
          "url": "http://observer.com/2012/05/maloney-and-nadler-join-calls-for-village-voice-to-shut-down-sex-ads/",
          "date": "2012-05-07T07:00:00.000+00:00",
          "description": "7 May 2012 ... Village Voice Media has been under increasing fire in recent weeks as ... by \nVillage Voice Media Holdings, LLC (“Village Voice”), is frequently\u0026nbsp;..."
        }, {
          "title": "Voice Media Group eyeing sale - POLITICO.com",
          "url": "http://www.politico.com/blogs/media/2015/01/voice-media-group-eyeing-sale-201692.html",
          "date": "2015-01-27T08:00:00.000+00:00",
          "description": "27 Jan 2015 ... Voice Media, which is made up of a group of editors, bought 13 publications from \nVillage Voice Media Holdings in 2012 and sold off SF Weekly\u0026nbsp;..."
        }, {
          "title": "Attorneys general targets Internet trafficking | HeraldNet.com ...",
          "url": "http://www.heraldnet.com/article/20141020/NEWS03/141029925",
          "date": "2014-10-20T07:00:00.000+00:00",
          "description": "20 Oct 2014 ... Messages seeking comment from lawyers for the website's owner, Phoenix-\nbased Village voice Media Holdings LLC, were not immediately\u0026nbsp;..."
        }, {
          "title": "Village Voice HQ Is Being Protested for 'Facilitation of Sex Trafficking'",
          "url": "http://blogs.villagevoice.com/runninscared/2011/11/village_voice_protest.php",
          "date": "2011-11-16T08:00:00.000+00:00",
          "description": "16 Nov 2011 ... You should also understand that Village Voice Media is the industry .... Village \nVoice Media Holdings, LLC displays a reckless disregard for\u0026nbsp;..."
        }, {
          "title": "Westword being bought by Voice Media Group - 7NEWS Denver ...",
          "url": "http://www.thedenverchannel.com/money/business-news/westword-being-bought-by-voice-media-group",
          "date": "2012-09-24T07:00:00.000+00:00",
          "description": "24 Sep 2012 ... Voice Media Group announced Monday it signed an agreement to buy ... which is \ncurrently owned by Village Voice Media Holdings LLC,\u0026nbsp;..."
        }, {
          "title": "Village Voice Media Split From Backpage.com -- NYMag",
          "url": "http://nymag.com/daily/intelligencer/2012/09/village-voice-media-split-from-backpage.html",
          "date": "2012-09-24T07:00:00.000+00:00",
          "description": "24 Sep 2012 ... Village Voice Media Sells Newspapers, Keeps Controversial ... the journalism to \na new Denver company, Village Media Holdings, ..... Vulture®, Grub Street® and \nThe Cut® are registered trademarks of New York Media LLC."
        }, {
          "title": "New company buying Westword, other newspapers - Denver ...",
          "url": "http://www.bizjournals.com/denver/news/2012/09/24/new-company-buying-westword-other.html",
          "date": "2012-09-24T07:00:00.000+00:00",
          "description": "24 Sep 2012 ... Scott Tobias, the COO of Village Voice Media Holdings, is behind the buyout as \nCEO of Voice Media Group. Tobias has been with Westword\u0026nbsp;..."
        }],
        "stats": {
          "total": 125000,
          "time": 0.915164,
          "pages": 6250
        }
      });
  }));

  afterEach(function() {
    $httpBackend.verifyNoOutstandingExpectation();
    $httpBackend.verifyNoOutstandingRequest();
  });

  it('should have correct text', function() {
    scope.$digest();
    expect(element.isolateScope().newsSearch.name).toEqual('newsSearch');
  });

  it('should return results and set them to the correct variable', function() {
    scope.$digest();
    $httpBackend.expectGET('http://127.0.0.1:3000/api/news/search?page=0&q=llc%20allintext%3A%22undefined%22');
    element.isolateScope().newsSearch.search("llc", 0);
    $httpBackend.flush();
    expect(element.isolateScope().newsSearch).toBeDefined();
    expect(element.isolateScope().newsSearch.stats).toBeDefined();
    expect(element.isolateScope().newsSearch.pageRange).toBeDefined(10);
    expect(element.isolateScope().newsSearch.results.length).toBe(20);
    expect(element.isolateScope().newsSearch.currentPage).toBe(1);
  });

});
