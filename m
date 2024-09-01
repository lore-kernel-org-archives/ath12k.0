Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1F3C54FC6
	for <ath12k@archiver.kernel.org>; Sun,  1 Sep 2024 07:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIm+zO+L5qfsIYwWgDszH6aoXy6+fG3On4j3QeypL48=; b=sz2ITjF9aSKZSwyiKpTmBa1L07
	fycAHlxzgjiUTJpjjtNXG2hTtg6Lq9DtXX+F4e+4n7DGtzMnv7DW3mi8vmAuvrKwSm/HNpYKdUe8G
	ajXjEn7+tBFtYwMKBZhGCQ0j9qsjTUKonqwNUjBONd+m8Ea/4PSRrK1lSh/ggUgO8MDQRxt+5gX7a
	eoiB7Vbp3Hv4sp0wzaUphGQlR8hSBX5mFvVHEtjWWg7lVOopu2bzWdfmXR5owbrXmkXSpxxL2GpAi
	a6n7fMHbbukVjQxLrMMxu/WVc1ZU3RpyDwBPErd2enmcHQJ1USGgzihM8sh/iniufhDruMvU2QF5c
	0zI7TAMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skfC0-0000000B7nF-3Z3o
	for ath12k@archiver.kernel.org;
	Sun, 01 Sep 2024 07:40:12 +0000
Received: from mail-lo4gbr01on20723.outbound.protection.outlook.com ([2a01:111:f403:261a::723] helo=GBR01-LO4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skfB7-0000000B7g8-0iY4
	for ath12k@lists.infradead.org;
	Sun, 01 Sep 2024 07:39:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxafNAYbDj68bQdd9BFq/KdGHwMcJ94r2kTLn98hES8q/qImHtYI9sPl2GlXjX4wKUKaG1MrEzhrEO8njxH2vMCE4jMiXUtuSG7d5fUhL5v5YaOZ6Q5EiapJ+wuCSY0hWEoSDBnpMZ3X+Mk9pHzGn1iuEdrNzuVJVJbm/PuRaNHoCFs2lovr5uKpt8gVolKfT5SADIetGWBeIiA2boeVCQl75y+wP/jZ8N3sdiYSAfXyNJs2ba/gCd2AAr5kzTC7bOryfF0e7UXqWcmK6ptuhEmWrqOq3NIij4srQWraBzpCHg16FkkDjT8ICxyQ+3nZHfo/7r3K7kaqgcXF2CayLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIm+zO+L5qfsIYwWgDszH6aoXy6+fG3On4j3QeypL48=;
 b=lKTWUCGUAzIlz/IIuWZ95n6/+994+3ykIUYpUHx1m+8LsneqUfkMcvflQij5t2ip+J1XF39cj0kx15uVvkK80Ybeck2IWZT4jEL6p71NCmb1HBmMiO7oOK923tY8QAtpj139YtraeOfQ6YoySLb1TJKoswnu63rBTemXv+xiNs8vWl7bLe8lvLATK5SLNDQm98SWI004rYtSw9awfHKg99jSdBVBuaQxcTCRPWbBdyivmqlqN/vsKQdiSZTrd+dXC1JgjWYse4ZaCGIiXzUlhp0aM0OpKLb5jYoHbKQglVZ1g//thJrcUeyD8iyZQ8NQ5RxVRsMVl6loxQ/D6VMVrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by CWXP123MB3128.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:3d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Sun, 1 Sep
 2024 07:39:03 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6%6]) with mapi id 15.20.7918.020; Sun, 1 Sep 2024
 07:39:03 +0000
From: david Atkins <david@3adesign.co.uk>
To: Baochen Qiang <quic_bqiang@quicinc.com>, "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
Subject: RE: wcn7850 issues
Thread-Topic: wcn7850 issues
Thread-Index: AQHa7kGb/waLDsK5rUe0AflzG3bOpLInNsxggABezQCAAjnlIIAEFF+AgACLnWCAEPZAAIAAFKQAgAMsa8A=
Date: Sun, 1 Sep 2024 07:39:03 +0000
Message-ID: <LO0P123MB40578A6CEC43AEFE301F9ED8D6912@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <be53813c-3edc-4734-b59d-83f43f14ea91@quicinc.com>
 <LO0P123MB4057C3085F445434F5E87B3AD6872@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <26bb8ec7-7170-4a09-ada3-c7c753c16e87@quicinc.com>
 <LO0P123MB40573F46A6D63145363C6B13D6812@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <cfe8e314-a28b-4ea3-85b2-9f5b4ac2db09@quicinc.com>
 <LO0P123MB405769E063E48B0F7AE18C5FD68C2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057E823BDB7B9ECCCD75840D6972@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <a6c609fc-150b-4779-b3f6-dddbd6ce93dc@quicinc.com>
In-Reply-To: <a6c609fc-150b-4779-b3f6-dddbd6ce93dc@quicinc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=3adesign.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|CWXP123MB3128:EE_
x-ms-office365-filtering-correlation-id: 8c01cf7b-7825-43ce-ef21-08dcca592711
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RDdLRUxiOXVyUDBIbVEvOXN4Wm1sRDlucnpob0RBRDNzYThpUXdXUnM2ZzQ1?=
 =?utf-8?B?OUV0eVBvYlhySmdaVU5ncUE5cis0QlNEKzYzNW1ENFhvTnVwR3ZwS1haWDVU?=
 =?utf-8?B?UDRaTHVQTDF1SEtaY3VFZ0h0V0gxQTdoKzhmN2p3VmNSRGkyNUFCdVBCSURm?=
 =?utf-8?B?RzdIMWdVVnVPZWV0U2xrN3JXcVk3RGNKYkpBUVdRWTNWSk9sejZsRDF3dVc5?=
 =?utf-8?B?WjJUamRWYkFwOWNlNm5lcnh6R3NUWCtlZGJZUlR6R29ScW1kaForNENLQ1dz?=
 =?utf-8?B?bWlxdHhpKzduazNNenBYSlBveU9LZVhtbXFONFdnRStwSzlFN3VIN21WcGxM?=
 =?utf-8?B?cTVZMXp3Z0U1dHhydjBHSVpSS1dORUFqeUloWHBCYTVLdE9pTHNqRUFmelhs?=
 =?utf-8?B?ek1LSHYzVWJ6Q0NVSDg2bFdnZUJEQTZ1bHFOOGdZNmNMVGRWeGlDYmt6Qk5V?=
 =?utf-8?B?ZGdUdFQ3OTdQRG4wbmRkZEFzSy9kQlNNb0J6V2ZvV3A0b0x1ano1QVBkYWRF?=
 =?utf-8?B?bkViYWZibjFiUkIvRmhkYUJWQVhZK1ZISk9wb2p6Vlk1MmN4V0hlbUNQZHVM?=
 =?utf-8?B?QzE2T3dUWitvN1ZqcDRyYk1BK29FMkdkUlNtNDhBaEczL0JsNTFqK3kwZEp1?=
 =?utf-8?B?ZWhMdW1DOEt6NUx1Vm5yaTV0dGh5aExka0lUdHZnbHc5UEZvNTlMUXVMRGFr?=
 =?utf-8?B?dWJzcW5tK2R1bVlpN01mTmlXTnAyTkhqYWVrN2p5QjQ1UTFGaFE2Z0tyN09l?=
 =?utf-8?B?Q1BvV1NJQjNyQ3Q4WG9lU2ZUTEJGalg4Mzkrc1JuazVZZ2U1N01HdzdrTU8z?=
 =?utf-8?B?V2hBVDFSUmwrZzVVTFBXdXVaSmg5WVBVc2N1R1NWM3VUcElPVkZZVEt4Skk5?=
 =?utf-8?B?c1RVWkR0U05jcERIcnJTWG5QTGJqM2k4OXNVRkx0cTd0MjBmR3NwazlVclJP?=
 =?utf-8?B?aDVza3dxVGRpZk82ZTJldE8wb1lrVFI2a1o5dThqMFFYRHlrMnkzLzJYU0ZG?=
 =?utf-8?B?b0tZeVMrdEdxbVFjVzArdDhhTFBNM28rUDR6d0k3TzFjRHJRVmIvL0hIUlJh?=
 =?utf-8?B?dklnMVBaelRUTUc2ajd4QzNkTUdCT20wRHFqcjdySVRSRVVPYS81R1JLaXg1?=
 =?utf-8?B?K2ZSSXFJcFVTMndxbWJwNnRMMWhaeFNlUzM0TVorUmhMRG9vNHdHRnZMMEdi?=
 =?utf-8?B?N2V5a1g5d2Mxa2d4ZTg0TlJZdGRacVV4ZDJ1ekhWREd4THB1TEJEQkk2NkIv?=
 =?utf-8?B?KzhZK21WNkFiRGd0aS9rZGVXZFFlQTJZOHJIdFlxWjJlN3dleHJUQzZUQVh0?=
 =?utf-8?B?cDFpMndHYm1oR0RjcDYzaWU5ZHQ1SE05RzI2T05mZExpOUNTVHI2STFSUXQr?=
 =?utf-8?B?VHo1SThyQmd4QTE2cGJmYjlCc1R0OVEvZ0NGSVk0TDF0RTMxZnNXTW8ybkI2?=
 =?utf-8?B?RStmc3c1eGQ3VUNFVXV3Y0djQ2wrTEFOeFRWd2lpcm5YNGlLSERabnBuZTJi?=
 =?utf-8?B?aWZGVExvV2JCVTVSV3NuY2ExUGJmNUlRQXFFVmo4RzlrRWFTQkpGZlZvVHVX?=
 =?utf-8?B?S3pRUjZ0bFBBSVNMdFNUR1d6QTB6dkJ6RU43cFJhcFhRWWpPWThDK0lQc3ps?=
 =?utf-8?B?R1pwd3BHbDR3ekJ2ckh3QXFrSWRMUm9pUFZMYzBkL2R1QnhaZ1lBZmltM293?=
 =?utf-8?B?NHhPVnBXRTZYeWJyenMyN1lCdmN0UjJMa0VWamJkcjJ4dlBIZU4zTXVlMHBp?=
 =?utf-8?B?N05vMHlKMDh0NHozUjd5Z2pQRE82V1NIS0RUUlYyRnFTR3VkekUzSHBLYmtH?=
 =?utf-8?B?ZW1SOTZLUDNXMGFYbjE5ekpTbHc0b2xnUUZXdmVOTkRMT2MvNEVhY3I1Y0dx?=
 =?utf-8?B?RnVrUW5HUERWVGgzcitNQURpck1zekkxRUJSREkyajZBeVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmFaNTNMc0JJU0lGQURoZmwrVkx6aks0VzBPQ01HTkVaQXZjeWF1Y2lTQmhs?=
 =?utf-8?B?NE9JU3lsSENSOEtKWlZFeVdQOVZKZ09NaXhzUitkRlNtcVErMDdsVEt6Z2U0?=
 =?utf-8?B?eEVDeHdZWFFJTXB5K0xpVFIxVEVOOUVUT3FEV1BTRVRqM2tpUWRQY0tjZ1FQ?=
 =?utf-8?B?OFBqbTI1d3o2WktVTWpyNE0vMzlBK2xsVWxtK0JWa25aSUxZWWZjbUdKTElS?=
 =?utf-8?B?aXY1Z0xWZlFkdEo1RG0yZDVSeWJrU0w3T3M4SHBaWUNkUU9JazFvVzZmSmo3?=
 =?utf-8?B?UCtjL3BDVDNZTUpDU0RBWVZXb2NHRVZXMk1BdlFVcTM4WERJWHFsM2FBVy9D?=
 =?utf-8?B?SXpGK2NCaS9nMC84L2JSU1FUaHlnSzR6bklFbVlmN1pDSjVMMFVuVWs2R1Uv?=
 =?utf-8?B?UWdHVFJNM2RIRVNNSmowVERhcS9LT0N6eUtIREdudWhxcjdwWmZvRE1vMXQ1?=
 =?utf-8?B?cE1XSWkvYUNGdGVHc21tZFVoTVNPZEVQdGtKaGZxUWMySzdIL296ZldHSjZX?=
 =?utf-8?B?WW8va1FNOWdLbFFXbHpIWk8wek5WaFhjaWtERzBra09zaDhKZjR0WWJYTU9C?=
 =?utf-8?B?b0cvb2JjeFlreTVJalkxc3ZOaUVzZzF1NHh4NHhHZHpwM3hsQlVwSlBTcXl6?=
 =?utf-8?B?bzdNZGRCcUhLNzRuWHIyOEhHTHlTNHhTR1BaU3NXVnk1K1RxNVMwR2diblE0?=
 =?utf-8?B?SmVXaFBrdGZkTU94NWVUNGVvVXFOVW84Uy9wZ0tlTnV1S2hHMnd5a3FHWVd3?=
 =?utf-8?B?TlJYYkpVekM2NjcwZUNnTFN1Vm9SWUFnOFlKN0ZFeVV1ZEorenpJZVFrNEl5?=
 =?utf-8?B?bnYyd0YreGkxMlVxWnFMNElIbFg2YjB0Y1k3SUpRRVphWUY2enIyYVI2RFRM?=
 =?utf-8?B?dGJrVll1RFYrQ0w3NUdpQ2JRYUVOeTkwbzA3aXNob0U2cXdXNEVNM1RUeG5P?=
 =?utf-8?B?RVN3T0lDUjd0ekJ2UEp2eStrZnlzZkE5RllrVUpvQXJLZnhOLzlXQjIyWWhR?=
 =?utf-8?B?Qi85TnYrTE1XK1hsTDQzK3pORTU5c2hzaXNuVmoyYjJ0NjR5WjZ4WVdPVlVu?=
 =?utf-8?B?TTBBWlNuRTljOUVBa1FnWG94ZlQ3T2FxTlZnQnJFR3VuRzlSSlh4VWpIRlVl?=
 =?utf-8?B?RzdVbDQrWGE0ZmVOaTBsVllwODdWb1Jvei9ZaGN3TU5hM0hOSHBNcy9mSXNq?=
 =?utf-8?B?ZE44elVvWWgrOEY2eE1HWnJ4Z3REZWk3eHh0QU53cWNyZm1mQVA3TmxsaVcv?=
 =?utf-8?B?TDV5MlpJN2ZoL0JTYzg1WG1wVmV3bEYzRW1ZdnczSXpqcDkyeDBRVC9ob3Vv?=
 =?utf-8?B?c1Q4Um1vMURIVVJVbVN6M2tCb3RPYW5zTDhOQVQyVk5weXZpcEhQQlBHc3Nk?=
 =?utf-8?B?N0x3NlN6VHp0Tk9MTlB0Z2tFejAyRGFQdGlZOGZaSEJnelU5WVdxNGdiZ25V?=
 =?utf-8?B?dCs4OTlJOUtkb2ZjeWxUTlA5TmtZaG5TN2ZmS2NjQWowWmx5Q29HckJkd2ZY?=
 =?utf-8?B?dGpPUW90TnFMM0FFLzFlQkpLSGoxK3FnSWZKSHRUdkhaSFl1b2JvL29QZExq?=
 =?utf-8?B?WWhJTVl4UnpsVXlieVgvMnFLSWlJRWN2SVRJNkhiOEQ0ZXR2czZwcVZIMGVY?=
 =?utf-8?B?Wm9YMDk3QWFEaWExSGl0QVRSM2FBOVorbHIrcFdpdkZaaWVYSXB3MXdiZDRl?=
 =?utf-8?B?S3dHKy8zVkhtSE1iSEw0OGlPd1A0ZzlFMXYzNEduRjE0dnpjZXN3VVpNN0J3?=
 =?utf-8?B?TXU4ZDhuemtHYWpoRWQ1SkdyVmkxaElOdlJiUDl6SEk0NW8xdzM2bC9pRGl4?=
 =?utf-8?B?QnFBWGliWFVMb2NscmkvTmttUkREY3dEc0dIQ29LSzR5N2RGTXlCcXhneDJy?=
 =?utf-8?B?VVdEeUpSU3FzNUZTSVFjVXR3c0syWi9vYXRXQWNKL0ZnY2I3aGVpNHAwRThF?=
 =?utf-8?B?Z3dQU0c5K1VaS0dLT0Ntb2lvUEpaM2lmejAxb256UXZLZG0rOVB2OUNFdG1p?=
 =?utf-8?B?MXhqL0IybG4rNGhaYXo0eFVneTdLUFpJMXNwdTdQVm9CZ29mN3h5Qk5yUXNH?=
 =?utf-8?B?cEcxQUVVRW91cGRnaWlHQ1N1ZzJKbE4xdXdMMVdUeVpPanMvNE1PdDdxUmFm?=
 =?utf-8?Q?hTeb0FdAm+kHwR35cQb86ODB3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c01cf7b-7825-43ce-ef21-08dcca592711
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2024 07:39:03.5971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +iqsNrkNK2SNe+9gGqgwnTMqvBzF2YwC0V7Fu0wU7jLmqqHPRbhHpPyBTbUgLLF+1FyRr3sGoAWzz5ILoYOdZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_003917_339959_8380D852 
X-CRM114-Status: GOOD (  11.36  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

PiBPbiA4LzMwLzIwMjQgMTo1NSBQTSwgZGF2aWQgQXRraW5zIHdyb3RlOg0KPiA+IEFueSB1cGRh
dGVzIG9uIHRoaXM/IFdlIHN0aWxsIGNhbm5vdCByZWdpc3RlciBhIEhhbWlsdG9uIGNhcmQgd2l0
aA0KPiA+IGF0aDEyayBkcml2ZXIgd2l0aCBhIDR4NCBBUA0KPiANCj4gVGhlICdCYXNpYyBFSFQt
TUNTIEFuZCBOc3MgU2V0JyBpbmRpY2F0ZSB0aGUgbWluaW1hbCByZXF1aXJlbWVudCwgbm90IHRo
ZQ0KPiBtYXgsIHNlZSBzcGVjOg0KPiANCj4gMzUuMTUgRUhUIEJTUyBvcGVyYXRpb24NCj4gMzUu
MTUuMSBCYXNpYyBFSFQgQlNTIG9wZXJhdGlvbg0KPiANCj4gQW4gRUhUIFNUQSBoYXMgZG90MTFF
SFRPcHRpb25JbXBsZW1lbnRlZCBlcXVhbCB0byB0cnVlLg0KPiBUaGUgYmFzaWMgRUhULU1DUyBh
bmQgTlNTIHNldCBpcyB0aGUgc2V0IG9mIDxFSFQtTUNTLCBOU1M+IHR1cGxlcyB0aGF0IGFyZQ0K
PiBzdXBwb3J0ZWQgYnkgYWxsIEVIVCBTVEFzIHRoYXQgYXJlIG1lbWJlcnMgb2YgYW4gRUhUIEJT
Uy4gLi4uDQo+IA0KPiBBbiBFSFQgU1RBIHNoYWxsIG5vdCBhdHRlbXB0IHRvIGpvaW4gKE1MTUUt
Sk9JTi5yZXF1ZXN0IHByaW1pdGl2ZSkgYSBCU1MNCj4gdW5sZXNzIGl0IHN1cHBvcnRzIChpLmUu
LCBpcyBhYmxlIHRvIGJvdGggdHJhbnNtaXQgYW5kIHJlY2VpdmUgdXNpbmcpIGFsbCBvZiB0aGUN
Cj4gPEVIVC1NQ1MsIE5TUz4gdHVwbGVzIGluIHRoZSBiYXNpYyBFSFQtTUNTIGFuZCBOU1Mgc2V0
Lg0KDQpJJ20gdW5zdXJlIHdoYXQncyBtaXNzaW5nIGhlcmUsIHRoaXMgaXMgdGhlIGJlYWNvbiBk
YXRhIHJlbGF0aW5nIHRvIEVIVCBNQ1MvTlNTDQoNCiAgICAgICAgICAgIFN1cHBvcnRlZCBFSFQt
TUNTIGFuZCBOU1MgU2V0DQogICAgICAgICAgICAgICAgRUhULU1DUyBNYXAgKEJXIDw9IDgwTUh6
KTogMHg0NDQ0NDQNCiAgICAgICAgICAgICAgICAgICAgLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4u
IDAxMDAgPSBSeCBNYXggTnNzIFRoYXQgU3VwcG9ydHMgRUhULU1DUyAwLTk6IDQNCiAgICAgICAg
ICAgICAgICAgICAgLi4uLiAuLi4uIC4uLi4gLi4uLiAwMTAwIC4uLi4gPSBUeCBNYXggTnNzIFRo
YXQgU3VwcG9ydHMgRUhULU1DUyAwLTk6IDQNCiAgICAgICAgICAgICAgICAgICAgLi4uLiAuLi4u
IC4uLi4gMDEwMCAuLi4uIC4uLi4gPSBSeCBNYXggTnNzIFRoYXQgU3VwcG9ydHMgRUhULU1DUyAx
MC0xMTogNA0KICAgICAgICAgICAgICAgICAgICAuLi4uIC4uLi4gMDEwMCAuLi4uIC4uLi4gLi4u
LiA9IFR4IE1heCBOc3MgVGhhdCBTdXBwb3J0cyBFSFQtTUNTIDEwLTExOiA0DQogICAgICAgICAg
ICAgICAgICAgIC4uLi4gMDEwMCAuLi4uIC4uLi4gLi4uLiAuLi4uID0gUnggTWF4IE5zcyBUaGF0
IFN1cHBvcnRzIEVIVC1NQ1MgMTItMTM6IDQNCiAgICAgICAgICAgICAgICAgICAgMDEwMCAuLi4u
IC4uLi4gLi4uLiAuLi4uIC4uLi4gPSBUeCBNYXggTnNzIFRoYXQgU3VwcG9ydHMgRUhULU1DUyAx
Mi0xMzogNA0KICAgICAgICBFeHQgVGFnOiBFSFQgT3BlcmF0aW9uICg4MDIuMTFiZSBEMy4wKQ0K
ICAgICAgICAgICAgRXh0IFRhZyBsZW5ndGg6IDggKFRhZyBsZW46IDkpDQogICAgICAgICAgICBF
eHQgVGFnIE51bWJlcjogRUhUIE9wZXJhdGlvbiAoODAyLjExYmUgRDMuMCkgKDEwNikNCiAgICAg
ICAgICAgIEVIVCBPcGVyYXRpb24gUGFyYW1ldGVyczogMHgwMSwgRUhUIE9wZXJhdGlvbiBJbmZv
cm1hdGlvbiBQcmVzZW50DQogICAgICAgICAgICAgICAgLi4uLiAuLi4xID0gRUhUIE9wZXJhdGlv
biBJbmZvcm1hdGlvbiBQcmVzZW50OiBUcnVlDQogICAgICAgICAgICAgICAgLi4uLiAuLjAuID0g
RGlzYWJsZWQgU3ViY2hhbm5lbCBCaXRtYXAgUHJlc2VudDogRmFsc2UNCiAgICAgICAgICAgICAg
ICAuLi4uIC4wLi4gPSBFSFQgRGVmYXVsdCBQRSBEdXJhdGlvbjogRmFsc2UNCiAgICAgICAgICAg
ICAgICAuLi4uIDAuLi4gPSBHcm91cCBBZGRyZXNzZWQgQlUgSW5kaWNhdGlvbiBMaW1pdDogRmFs
c2UNCiAgICAgICAgICAgICAgICAuLjAwIC4uLi4gPSBHcm91cCBBZGRyZXNzZWQgQlUgSW5kaWNh
dGlvbiBFeHBvbmVudDogMA0KICAgICAgICAgICAgICAgIDAwLi4gLi4uLiA9IFJlc2VydmVkOiAw
eDANCiAgICAgICAgICAgIEJhc2ljIEVIVC1NQ1MgQW5kIE5zcyBTZXQ6IDB4NDQ0NDQ0NDQNCiAg
ICAgICAgICAgIENvbnRyb2w6IDB4MDIsIENoYW5uZWwgV2lkdGg6IDgwIE1IeiBFSFQgQlNTIGJh
bmR3aWR0aA0KICAgICAgICAgICAgICAgIC4uLi4gLjAxMCA9IENoYW5uZWwgV2lkdGg6IDgwIE1I
eiBFSFQgQlNTIGJhbmR3aWR0aCAoMikNCiAgICAgICAgICAgICAgICAwMDAwIDAuLi4gPSBSZXNl
cnZlZDogMHgwMA0KDQpBcmUgeW91IHNheWluZyB0aGUgYXRoMTJrIGRyaXZlciBkb2VzIG5vdCBz
dXBwb3J0IHRoZXNlIGZlYXR1cmVzPyBJZiBub3QgY2FuIHlvdSBjbGFyaWZ5IHRoZSBpc3N1ZSBz
byBJIGNhbiByYWlzZSB3aXRoIHRoZSBBUCB0ZWFtLg0KDQpEYXZpZA0KDQoNCg0K

