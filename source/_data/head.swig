<script>
  window.onblur = function() {
       document.title = 'Σ(っ°Д°;)っ喔哟，崩溃啦!';
  }

  window.onfocus = function() {
       document.title = '(o゜▽゜)o☆咦，又好啦!';
  }
</script>
{% if theme.fireworks %}
    <canvas class="fireworks" style="position: fixed;left: 0;top: 0;z-index: 1; pointer-events: none;" ></canvas> 
    <script type="text/javascript" src="//cdn.bootcss.com/animejs/2.2.0/anime.min.js"></script> 
    <script type="text/javascript" src="/js/fireworks.js"></script>
  {% endif %}
