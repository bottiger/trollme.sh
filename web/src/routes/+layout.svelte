<script lang="ts">
	import '../app.postcss';
	import { AppShell, AppBar } from '@skeletonlabs/skeleton';

	import Footer from '$lib/components/Footer/Footer.svelte';

	import '@fortawesome/fontawesome-free/css/all.min.css';

</script>

<!-- App Shell -->
<AppShell>
	<svelte:fragment slot="header">
		<!-- App Bar -->
		<AppBar>
			<svelte:fragment slot="lead">
				<strong class="text-xl"><code>TrollMe.sh</code> 🧌</strong>
			</svelte:fragment>
			<svelte:fragment slot="trail">
				<a
					class="btn btn-sm variant-ghost-surface"
					href="https://discord.com/users/530120102776143892"
					target="_blank"
					rel="noreferrer"
				>
					Discord
				</a>
				<a
					class="btn btn-sm variant-ghost-surface"
					href="https://buymeacoffee.com/bottiger"
					target="_blank"
					rel="noreferrer"
				>
					Sponsor&nbsp;&nbsp;☕
				</a>
				<a
					class="btn btn-sm variant-ghost-surface"
					href="https://github.com/bottiger/trollme.sh"
					target="_blank"
					rel="noreferrer"
				>
					GitHub
				</a>
			</svelte:fragment>
		</AppBar>
	</svelte:fragment>
	<!-- Page Route Content -->
	<slot />

	<!-- Page Footer -->
	<svelte:fragment slot="pageFooter">
		<Footer />
	</svelte:fragment>
</AppShell>
