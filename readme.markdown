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
<h3>Stop Haml from escaping PHP opening closing brackets</h3>
<p>
In some cases we would like to add our php code to be in a html attribute 
</p>
<pre>
<code>
%content
  %p{ :id => "&lt;?php echo 'paragraph'; ?&gt;" }
</code>
</pre>
<p>
but the Haml parser by default escapes PHP opening and closing brackets.
Work around is to hack the Haml code to do this find the haml folder inside your gems folder open haml-3.0.11\lib\haml\helpers.rb find
</p>
<p>
<strong>NOTE:</strong> If you have  HAML 3.1.4 you can set in config file <em>@hamloptions = {:attr_wrapper => '"', :escape_attrs => false }</em>
to stop HAML from escaping charactersif you have a previouse version you canfollow the instructions bellow.
</p>
<code>
<pre>
HTML_ESCAPE = { '&'=>'&amp;', '<'=>'&lt;', '>'=>'&gt;', '"'=>'&quot;', "'"=>'&#039;', }
</pre>
</code>
Comment out the existing code and add the code below
<pre>
<code>
#HTML_ESCAPE = { '&'=>'&amp;', '<'=>'&lt;', '>'=>'&gt;', '"'=>'&quot;', "'"=>'&#039;', }
HTML_ESCAPE = { '&'=>'&amp;', '<'=>'<', '>'=>'>', '"'=>'&quot;', "'"=>'&#039;', }
</code>
</pre>
<strong>NOTE: Make sure you just comment the existing code, so you can go back to this when not using PHP.</strong>

<h3>Add a block of PHP code without having to indent the code</h3>

<p>
Just add <code>:plain</code> tag and Haml will render the code below this tag as you write see example below
</p>

<pre><code>
#content
  %p
    PHP block code example
  :plain
    &lt;?php function helloworld()
      {
          $haml = "Hellow world";
          return $haml;
      }
      ?&gt;
  #wrapper
    &lt;?php helloworld(); ?&gt;
</code></pre>
