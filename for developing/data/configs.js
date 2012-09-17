var configs = {
	"general": {
		label: "Opzioni generali",
		option: [
			{
				text: "Livello di debug",
				name: "debugLevel",
				value: "0",
				type: "number",
				placeholder: "Livello di debug"
			},
			{
				text: "Modalità di avvio",
				name: "bootmode",
				value: "0",
				options: {
					"0": "Primo avvio::::selected",
					"1": "Avvia l'autoconfig::È necessario che sia impostato ogni volta che si modifica il file",
					"2": "Configurazione automatica",
					"3": "Configurazione personalizzata..."
				},
				type: "select"
			}
		]
	},
	"network": {
		label: "Opzioni di rete",
		option: [
			{
				text: "Device",
				name: "hostName",
				value: "",
				type: "text",
				placeholder: "Nome del device",
				title: "Inserisci il nome del dispositivo in formato 'aB09' senza caratteri speciali"
			},
			{
				text: "AP e rete Mesh",
				name: "accept_clients",
				value: "true",
				options: {
					"true": "ON::::checked",
					"false": "OFF"
				},
				title: "",
				type: "radio"
			},
			{
				text: "Indirizzo IPv4 Mesh",
				name: "ip4addr_mesh",
				value: "172.16.0.1",
				type: "text",
				placeholder: "Indirizzo wireless IPv4",
				title: "Inserisci il tuo indirizzo wireless IPv4 conforme con gli IP su <a href=\"http://wiki.ninux.org/GestioneIndirizzi\" target=\"_blank\">Gestione Indirizzi</a> (forma base: 172.16.CAP.XYZ)"
			},
			{
				text: "Maschera di rete Mesh",
				name: "netmask_mesh",
				value: "255.255.0.0",
				type: "text",
				placeholder: "255.255.255.0",
				title: "Inserisci la tua subnet wireless in conformità con le subnets su <a href=\"http://wiki.ninux.org/GestioneIndirizzi\" target=\"_blank\">Gestione Indirizzi</a>"
			},
			{
				text: "Indirizzo IPv4 LAN",
				name: "ip4addr_lan",
				value: "192.168.1.21",
				type: "text",
				placeholder: "Indirizzo lan IPv4",
				title: "Inserisci il tuo indirizzo lan IPv4 conforme agli IP su <a href=\"http://wiki.ninux.org/GestioneIndirizzi\" target=\"_blank\">Gestione Indirizzi</a> (forma base: 10.CAP.XYZ.ABC)"
			},
			{
				text: "Maschera di rete LAN",
				name: "netmask_lan",
				value: "255.255.255.0",
				type: "text",
				placeholder: "255.255.255.0",
				title: "Inserisci la tua subnet lan precedentemente dichiarata su <a href=\"http://wiki.ninux.org/GestioneIndirizzi\" target=\"_blank\">Gestione Indirizzi</a>"
			},
			{
				text: "Indirizzo IPv6 Mesh",
				name: "ip6addr_mesh",
				value: "2001:4c00:893b:1:cab::1/128",
				type: "text",
				placeholder: "Indirizzo wireless IPv6",
				title: "Inserisci il tuo indirizzo wireless IPv6 in conformità alle subnet stabilite su <a href=\"http://wiki.ninux.org/GestioneIndirizzi\" target=\"_blank\">Gestione Indirizzi</a>"
			},
			{
				text: "Indirizzo IPv6 LAN",
				name: "ip6addr_lan",
				value: "2001:4c00:893b:cab::1/64",
				placeholder: "Indirizzo lan IPv6",
				type: "text",
				title: "Inserisci il tuo indirizzo lan IPv6 dichiarato su <a href=\"http://wiki.ninux.org/GestioneIndirizzi\" target=\"_blank\">Gestione Indirizzi</a>"
			},
			{
				text: "Dispositivo WAN",
				name: "wan_set",
				value: "0",
				options: {
					"true": "ON",
					"false": "OFF::::checked"
				},
				title: "",
				type: "radio"
			},
			{
				text: "Indirizzo IPv4 WAN",
				name: "ip4_wan",
				value: "0.0.0.0",
				placeholder: "Indirizzo WAN IPv4",
				type: "text",
				title: "Inserisci il tuo IP WAN"
			},
			{
				text: "Maschera di rete WAN",
				name: "wan_mask",
				value: "0.0.0.0",
				placeholder: "0.0.0.0",
				type: "text",
				title: "Inserisci la subnet del tuo IP WAN"
			},
			{
				text: "Prefisso radvd",
				name: "radvd_prefix",
				value: "2001:4c00:893b:cab::/64",
				placeholder: "2001:4c00:893b:cab::/64",
				type: "text",
				title: "Inserisci la tua subnet per la configurazione di radvd in conformità a questo metodo: '2001:4c00:893b:SUBNET::/64'"
			}
		],
		list: [
			{
				text: "DNS preferiti",
				name: "resolvers",
				value: "160.80.221.11 8.8.8.8",
				placeholder: "DNS preferiti",
				type: "text",
				title: "Cambia, se lo vuoi, il nameserver dei tuoi DNS preferiti o personalizzati"
			}
		]
	},
	"wireless": {
		label: "Opzioni wireless",
		option: [
			{
				text: "Rete Mesh",
				name: "wifi_mesh",
				value: "true",
				options: {
					"true": "ON::::checked",
					"false": "OFF"
				},
				title: "",
				type: "radio"
			},
			{
				text: "Tipo di Mesh",
				name: "mesh_mode",
				value: "adhoc",
				options: {
					"adhoc": "Ad hoc::::selected",
					"ap": "Access point",
					"sta": "Base (STA)"
				},
				type: "select"
			},
			{
				text: "SSID della Mesh",
				name: "meshSSID",
				value: "mesh.ninux.org",
				placeholder: "SSID",
				type: "text",
				title: ""
			},
			{
				text: "indirizzo MAC del punto di accesso",
				name: "meshBSSID",
				value: "02:aa:bb:cc:dd:00",
				placeholder: "BSSID",
				type: "text",
				title: ""
			},
			{
				text: "Access Point",
				name: "ap_enable",
				value: "true",
				options: {
					"true": "ON::::checked",
					"false": "OFF"
				},
				title: "",
				type: "radio"
			},
			{
				text: "Indirizzo MAC dell'Access Point",
				name: "station_mac",
				value: "",
				placeholder: "00:00:00:00:00:00",
				type: "text",
				maxlength: 17,
				title: "ATTENZIONE: questa opzione va configurata solo se in modalità Base (STA)"
			},
			{
				text: "SSID della Mesh del link AP~STA",
				name: "ap_staSSID",
				value: "ninux.org",
				placeholder: "SSID",
				type: "text",
				title: ""
			},
			{
				text: "SSID dell'AP",
				name: "apSSID",
				value: "www.ninux.org",
				placeholder: "SSID",
				type: "text",
				title: ""
			},
			{
				text: "Chiave di accesso",
				name: "apKEY",
				value: "none",
				placeholder: "chiave",
				type: "text",
				title: ""
			},
			{
				text: "Paese (Codice ISO 3166-1)",
				name: "countrycode",
				value: "US",
				placeholder: "Codice ISO 3166-1",
				type: "text",
				maxlength: 2,
				title: ""
			},
			{
				text: "Canale Wi-Fi",
				name: "wifi_channel",
				value: "13",
				placeholder: "",
				type: "number",
				maxlength: 2,
				title: ""
			},
			{
				text: "Tasso MCS",
				name: "meshMcastRate",
				value: "6000",
				placeholder: "",
				type: "number",
				title: ""
			},
			{
				text: "Numero massimo client",
				name: "apMaxClients",
				value: "25",
				min: "10",
				placeholder: "",
				type: "number",
				title: ""
			},
			{
				text: "Potenza di trasmissione del Wi-Fi",
				name: "tx_power",
				value: "10",
				placeholder: "30",
				type: "number",
				min: "10",
				max: "30",
				title: ""
			}
		]
	},
	"hotspot": {
		label: "Opzioni Hot Spot",
		option: [
			{
				text: "",
				name: "hs_enable",
				value: "false",
				options: {
					"true": "ON",
					"false": "OFF::::checked"
				},
				title: "",
				type: "radio"
			},
			{
				text: "Numero massimo dei client collegabili",
				name: "hsMaxClients",
				value: "50",
				min: "10",
				type: "number",
				maxlength: 2,
				title: ""
			},
			{
				text: "SSID dell'Hot Spot",
				name: "hsSSID",
				value: "www.ninux.org",
				placeholder: "SSID",
				title: "",
				type: "text"
			},
			{
				text: "Indirizzo IPv4",
				name: "ip4addr_hs",
				value: "192.168.10.1",
				placeholder: "Indirizzo IPv4",
				type: "text",
				title: ""
			},
			{
				text: "Maschera di rete Hot Spot",
				name: "netmask_hs",
				value: "255.255.255.0",
				placeholder: "255.255.255.0",
				type: "text",
				title: ""
			}
		]
	},
	"olsrd": {
		label: 'Opzioni <acronym title="Optimized Link State Routing Protocol">OLSR</acronym>',
		option: [
			{
				text: "Multi device",
				name: "supernode",
				value: "false",
				options: {
					"true": "ON",
					"false": "OFF::::checked"
				},
				title: "",
				type: "radio"
			},
			{
				text: "Gateway",
				name: "gw_enable",
				value: "0",
				options: {
					"true": "ON",
					"false": "OFF::::checked"
				},
				title: "",
				type: "radio"
			}
		]
	},
	"snmp": {
		label: 'Opzioni <acronym title="Simple Network Management Protocol">SNMP</acronym>',
		option: [
			{
				text: "",
				name: "enable",
				value: "true",
				options: {
					"true": "ON::::checked",
					"false": "OFF"
				},
				title: "",
				type: "radio"
			},
			{
				text: "Contatto",
				name: "contact",
				value: "contatti@ninux.org",
				type: "email",
				placeholder: "Indirizzo email",
				title: ""
			},
			{
				text: "Nome del nodo",
				name: "location",
				value: "ninux",
				type: "text",
				placeholder: "",
				title: ""
			}
		]
	},
	"gw4server": {
		label: "Opzioni del Server Gateway",
		option: [
			{
				text: "",
				name: "enabled",
				value: "0",
				options: {
					"true": "ON",
					"false": "OFF::::checked"
				},
				title: "",
				type: "radio"
			},
			{
				text: "Verifica rigorosa",
				name: "strictCheck",
				value: "0",
				options: {
					"true": "Abilitata",
					"false": "Disabilitata::::checked"
				},
				title: "",
				type: "radio"
			},
			{
				text: "Tempo di intervallo",
				name: "checkInterval",
				value: "10s",
				placeholder: "",
				type: "text",
				title: ""
			},
			{
				text: "Larghezza di banda",
				name: "bandwidth",
				value: "2000/512",
				placeholder: "",
				type: "text",
				title: ""
			}
		],
		list: [
			{
				text: "Controllo Host",
				name: "checkHosts",
				value: "8.8.8.8",
				placeholder: "",
				type: "text",
				title: ""
			},
			{
				text: "Controllo Host",
				name: "checkHosts",
				value: "8.8.4.4",
				placeholder: "",
				type: "text",
				title: ""
			}
		]
	},
	"pointing": {
		label: "Puntamento",
		option: [
			{
				text: "",
				name: "enabled",
				value: "true",
				options: {
					"true": "ON::::checked",
					"false": "OFF"
				},
				title: "",
				type: "radio"
			}
		]
	},
	"bwtestclient": {
		label: "Test di larghezza di banda da Client",
		option: [
			{
				text: "",
				name: "enabled",
				value: "true",
				options: {
					"true": "ON::::checked",
					"false": "OFF"
				},
				title: "",
				type: "radio"
			}
		]
	},
	"bwtestserver": {
		label: "Test di larghezza di banda da Server",
		option: [
			{
				text: "",
				name: "enabled",
				value: "true",
				options: {
					"true": "ON::::checked",
					"false": "OFF"
				},
				title: "",
				type: "radio"
			}
		]
	},
	"sshserver": {
		label: "Opzioni SSH del Server",
		option: [
			{
				text: "",
				name: "enabled",
				value: "true",
				options: {
					"true": "ON::::checked",
					"false": "OFF"
				},
				title: "",
				type: "radio"
			},
			{
				text: "Autenticazione",
				name: "passwdAuth",
				value: "true",
				options: {
					"true": "ON::::checked",
					"false": "OFF"
				},
				title: "",
				type: "radio"
			},
			{
				text: "Chiavi SSH autorizzate",
				name: "sshAuthorizedKeys",
				value: "",
				placeholder: "",
				type: "textarea",
				title: ""
			}
		]
	},
	"httpinfo": {
		label: "Pagine di informazione sui device",
		option: [
			{
				text: "",
				name: "enabled",
				value: "true",
				options: {
					"true": "ON::::checked",
					"false": "OFF"
				},
				title: "",
				type: "radio"
			}
		]
	}
};