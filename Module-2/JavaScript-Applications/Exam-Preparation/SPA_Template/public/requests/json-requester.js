const requester = (() => {

	let pathUrl = 'http://localhost:3000';

	function getJSON(url, headers = {}) {
		return new Promise((resolve, reject) => {
			$.ajax({
					url: url,
					// url: pathUrl + url,
					method: 'GET',
					headers: headers,
					contentType: 'application/json'
				})
				.done(resolve)
				.fail(reject);
		});
	}

	function putJSON(url, json, headers = {}) {
		return new Promise((resolve, reject) => {
			$.ajax({
					url: url,
					method: 'PUT',
					headers: headers,
					contentType: 'application/json',
					data: JSON.stringify(json)
				})
				.done(resolve)
				.fail(reject);
		});
	}

	function postJSON(url, json, headers = {}) {
		return new Promise((resolve, reject) => {
			$.ajax({
					url: url,
					// url: pathUrl + url,
					method: 'POST',
					headers: headers,
					contentType: 'application/json',
					data: JSON.stringify(json)
				})
				.done(resolve)
				.fail(reject);
		});
	}

	return {
		getJSON,
		postJSON,
		putJSON
	};
})();