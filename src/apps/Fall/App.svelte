<script>
    import { onMount } from 'svelte';
    import { Page } from './network.js';
    import { HTMLParser } from './htmlparser.js';
    import { constructLayout } from './layout.js';
    import { Renderer } from './renderer.js';
    import * as JS from './js/index.js';
    import * as AboutPages from './about/index.js';
  
    let canvas;
    let renderer;
    let initialLoad = true;
    let lastLoad;
    let profile = {};
    let profileSubsteps = {};
  
    window._js = JS;
    window.version = `2023.11.07`;
  
    function welcome() {
      load('about:welcome');
    }
  
    function error(e) {
      // console.error(e);
      load(`about:error?${btoa(JSON.stringify({ error: e.stack ?? e, url: window._location.url }))}`);
    }
  
    window.welcome = welcome;
    window.error = error;
  
    window.onpopstate = ({ state }) => {
      const url = state?.url ?? location.search.slice(1);
      const baseUrl = state?.baseUrl ? new URL(state.baseUrl) : null;
      url ? load(url, baseUrl, false) : welcome();
    };
  
    window.reload = () => load(lastLoad[0], lastLoad[1], false);
  
    window.profileStart = () => {
      const start = performance.now();
      profile = { start };
      profileSubsteps = {};
      profile.last = start;
    };
  
    window.profileStep = (name) => {
      const now = performance.now();
      const time = now - profile.last;
      profile.last = now;
      profile[name] = time;
      if (profile.lastSub) {
        for (const x in profileSubsteps) {
          profile['  ' + x] = profileSubsteps[x];
        }
        profileSubsteps = {};
        delete profile.lastSub;
      }
    };
  
    window.profileSubstep = (name) => {
      const now = performance.now();
      const time = now - (profile.lastSub ?? profile.last);
      profile.lastSub = now;
      profileSubsteps[name] = time;
    };
  
    window.profileStop = () => {
      const start = profile.start;
      profile.total = performance.now() - start;
      delete profile.last;
      delete profile.lastSub;
    };
  
    async function _load(url, baseUrl = null, push = true) {
      window.profileStart();
  
      if (!renderer) {
        renderer = new Renderer(canvas);
      }
      window.profileStep('setup renderer');
  
      window._js.stopAll();
      window.profileStep('stop js');
  
      let realURL = url, html;
      if (url.startsWith('about:')) {
        const page = url.slice('about:'.length).split('?')[0];
        html = AboutPages[page] ? AboutPages[page]({ url }) : `<span>about: page not found</span>`;
        realURL = 'data:text/html,' + encodeURIComponent(html);
        push = false;
      }
  
      if (realURL.startsWith('data:')) baseUrl = new URL('/', location.href);
      window.profileStep('url handling');
  
      window._location = { url, realURL, baseUrl };
  
      history[push && !initialLoad ? 'pushState' : 'replaceState']({ url, baseUrl: baseUrl?.toString?.() }, '', '?' + (baseUrl ? '' : url));
      window.profileStep('history api');
  
      window.beganLoad = Date.now();
  
      const page = new Page(realURL);
      if (baseUrl) page.baseURL = baseUrl;
      window.profileStep('new page');
  
      if (!html) {
        const res = await page.fetch(realURL);
        window.profileStep('fetch');
  
        switch (res.headers.get('Content-Type').split(';')[0]) {
          case 'text/javascript':
          case 'text/css':
            html = `<meta name="color-scheme" content="dark light"><body><pre>${await res.text()}</pre></body>`;
            break;
          default:
            html = await res.text();
            break;
        }
      }
      window.profileStep('get html');
  
      const parser = new HTMLParser();
      const doc = parser.parse(html);
      window._doc = doc;
      window.profileStep('parse html');
  
      doc.page = page;
  
      const layout = await constructLayout(doc, renderer);
  
      const title = layout.querySelector('title');
      document.getElementById('title_setter').textContent = title ? (title.content || title.children[0]?.content).trim() : realURL.replace('https://', '');
  
      document.getElementById('favicon_setter').href = page.resolve('/favicon.ico');
      window.profileStep('use metadata');
  
      initialLoad = false;
      window.profileStop();
    }
  
    function load(...args) {
      lastLoad = args;
      return _load(...args).catch(e => error(e));
    }
  
    window.load = load;
  
    window.omniload = (query) => {
      if (query === null) return;
      let url;
      try {
        url = new URL(query);
      } catch {
        try {
          url = new URL('https://' + query);
        } catch (e) {
          return error(e);
        }
      }
      return load(url.toString());
    };
  
    onMount(() => {
      if (window.crossOriginIsolated === false) {
        navigator.serviceWorker.register('sw.js').then(worker => {
          // handle service worker if necessary
        });
      }
  
      if (location.search) {
        load(decodeURIComponent(location.search.slice(1)));
      } else {
        welcome();
      }
    });
  </script>
  
  <canvas bind:this={canvas}></canvas>
  