var router = (function () {
	const navigo = new Navigo(null, true);

	function start() {
		navigo.resolve();
	}

	navigo.on(() => {
		navigo.navigate('/home');
	});

	navigo.on('/home', () => {
		homeController.main();
	});

	navigo.on('/login', () => {
		loginController.login();
	});


	navigo.on('/logout', () => {
		loginController.logout();
	});

	navigo.on('/todos', () => {
		todoController.all();
	});

	navigo.on('/todos/add', () => {
		todoController.add();
	});

	navigo.notFound(() => {
		navigo.navigate('/home');
	});

	return {
		start
	}
})();