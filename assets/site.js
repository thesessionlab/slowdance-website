(function () {
  var head = document.querySelector('.site-head');
  var hero = document.querySelector('.hero .frame');
  var menu = document.getElementById('menu');
  var openBtn = document.querySelector('[data-open-menu]');
  var closeBtn = document.querySelector('[data-close-menu]');

  // White header while it sits over the dark hero image
  function onScroll() {
    if (!head || !hero) return;
    var r = hero.getBoundingClientRect();
    head.classList.toggle('on-dark', r.bottom > 60 && r.top < 40);
  }
  window.addEventListener('scroll', onScroll, { passive: true });
  onScroll();

  function setMenu(open) {
    menu.classList.toggle('open', open);
    document.body.classList.toggle('locked', open);
    menu.setAttribute('aria-hidden', open ? 'false' : 'true');
    openBtn.setAttribute('aria-expanded', open ? 'true' : 'false');
    if (open) closeBtn.focus(); else openBtn.focus();
  }
  if (menu && openBtn && closeBtn) {
    openBtn.addEventListener('click', function () { setMenu(true); });
    closeBtn.addEventListener('click', function () { setMenu(false); });
    menu.querySelectorAll('a').forEach(function (a) {
      a.addEventListener('click', function () { setMenu(false); });
    });
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && menu.classList.contains('open')) setMenu(false);
    });
  }

  // Gentle fade in on scroll
  var items = document.querySelectorAll('.reveal');
  if ('IntersectionObserver' in window) {
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (en) {
        if (en.isIntersecting) { en.target.classList.add('in'); io.unobserve(en.target); }
      });
    }, { rootMargin: '0px 0px -8% 0px' });
    items.forEach(function (el) { io.observe(el); });
  } else {
    items.forEach(function (el) { el.classList.add('in'); });
  }

  // Floating preview on the work list
  var hov = document.querySelector('.hover-img');
  if (hov && window.matchMedia('(hover: hover)').matches) {
    var hi = hov.querySelector('img');
    document.querySelectorAll('.index a').forEach(function (a) {
      a.addEventListener('mouseenter', function () { hi.src = a.dataset.img; hov.classList.add('on'); });
      a.addEventListener('mouseleave', function () { hov.classList.remove('on'); });
      a.addEventListener('mousemove', function (e) { hov.style.left = (e.clientX + 230) + 'px'; hov.style.top = e.clientY + 'px'; });
    });
  }

  // Hide the floating button once the black bar is on screen
  var fl = document.querySelector('.float-cta'), bar = document.querySelector('.cta-bar, .site-foot');
  if (fl && bar && 'IntersectionObserver' in window) {
    new IntersectionObserver(function (en) { fl.classList.toggle('hide', en[0].isIntersecting); }).observe(bar);
  }

  // Send people to the thank you page after the form posts
  document.querySelectorAll('form.enq').forEach(function (f) {
    var nx = f.querySelector('input[name="_next"]');
    if (nx) nx.value = new URL('thanks/index.html', document.baseURI.replace(/[^/]*$/, '')).href;
  });

  var y = document.getElementById('year');
  if (y) y.textContent = new Date().getFullYear();
})();
