<h1 dir="auto"><img src="https://i.gyazo.com/5d2322450b17f0692fd7d48014cc70d6.png" alt="" /></h1>
<h1 dir="auto">You must have approval from @ADMIN before installing community server to get added to the community server list</h1>
<h1 dir="auto">H1emu-community-server-install</h1>
<p dir="auto">Install H1emu community server</p>
<p dir="auto">(Tested with Ubuntu 20.4 Clean install) (may work on other distros&nbsp; this script will force install some packages &amp; upgrade old packages **use at your own risk**)</p>
<ol>
<li><code>sudo</code></li>
<li><code>apt install git -y</code></li>
<li><code>git clone https://github.com/H1emu/H1emu-community-server-install.git<br /></code></li>
<li><code>cd H1emu-community-server-install</code></li>
<li><code>chmod +x communityinstall.sh</code></li>
<li><code>./communityinstall.sh</code></li>
</ol>
<p dir="auto"></p>
<h2>Starting Community Server</h2>
<table>
<tbody>
<tr>
<td>Stop server</td>
<td>pm2 kill</td>
</tr>
<tr>
<td>Start server</td>
<td>cd /H1emu-community-server-install/h1z1-server/</td>
<td>RUN >> <code>pm2 kill && npm install && ./start.sh && pm2 log</code></td>
</tr>
<tr>

</tr>
</tbody>
</table>
<h2>Updating Community Server Info</h2>
<p dir="auto">To update the H1emu community server to the latest version, follow these steps:</p>
<ol>
<li>Open your terminal and navigate to the directory where the H1emu community server is installed.</li>
<li>Run the command <code>git pull</code> to pull the latest update from the GitHub repository.</li>
<li>Use <code>git checkout master</code> to select the latest master build.</li>
<li>Restart the server using pm2 method described in the previous instructions.</li>
</ol>
<p dir="auto">Remember to back up your data before updating the server info, and be aware of any potential risks or issues that could arise during the update process.</p>
