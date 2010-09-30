<h1> Haml &amp; Sass Watcher for PHP developers </h1>
<p>
To use Watcher download source code open <strong>config.rb</strong>
</p>
<ul>
<li>Change properties to match your machine</li>
<li>Open your command line and navigate to the folder where you downloaded the source and run <code>rake watch</code></li>
<li>Open the haml-sass directory (or in the codeigniter example the haml folder) and edit index.haml or <strong>index.phaml</strong> make a change save it</li>
<li>phaml files will be saved as .php files, haml files will be saved as .html files</li>
<li>Open the <strong>php</strong> directory or your codeigniter <strong>views</strong> directory folder and open index.html or index.php in your editor to view your changes.</li>
</ul>

<h3>Syntax demo Haml - PHP</h3>
<pre>
<code>
&lt;?php $heading = "Haml & Sass Watcher for PHP develope"; ?&gt;
!!! Strict
%html
  %head
    %title
       Haml &amp; Sass Watcher for PHP developers
  %body
    %h1
      &lt;?php echo $heading; ?&gt;
</code>
</pre>