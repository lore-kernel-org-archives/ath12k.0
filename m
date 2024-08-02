Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399C2C52D71
	for <ath12k@archiver.kernel.org>; Fri,  2 Aug 2024 06:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7mTLFtBb/pWwCulI48n98B+fNimKtDSErsyexVGqRo=; b=YLJdmjNMeuQ9D4moCVGj5X//1W
	bp401YzIa9wdaV6jJZ9yCywmLVJwJDWzMpDiU1PBHdyY1IsZR5oohsPUFeWiBlrbgVwBPZ26jP/GN
	lyTwUJir9+wVQOKBE0X5NA21v4BWkkBZkLvE0Hjp4atYcAkEkYyCW83pscgq16WiRdqndQR3dtunC
	cW6K4K9eSrKqEA9ZCTnnBpQSHQk7+IGuZyUa+difY96yM+7tpUCozGqUbgYYZcbimX9BJ+kXJUeux
	ZCbFR+IMHV3T0HBPKQ6KXnKyS1HbidfhCwNKrl+HB874g1nNYuPCpOdCzLpFx+mnTLYKXidFc0WV+
	0qrQ4R+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZlnc-00000007nyr-2qBG
	for ath12k@archiver.kernel.org;
	Fri, 02 Aug 2024 06:30:00 +0000
Received: from mail-lo4gbr01on20700.outbound.protection.outlook.com ([2a01:111:f403:261a::700] helo=GBR01-LO4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZlnX-00000007nx5-3dQX
	for ath12k@lists.infradead.org;
	Fri, 02 Aug 2024 06:29:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3GRyPSO2bf4S9fBfNZa6o2cKpjfYSR6qo1GdHunzxRr6Fq0WUk84w8nM9aJnH2KzQMDjb0fovx10jpDcCKc6hz26WEPPKLIpMuZ65Ht0SfzDVWxzREyMHB1HkjiIXT6dV6IZfPyaYOmg8Utm2Au8jLX3L1nuX8f5/UDtJEGI1eE3fuybFYSk/ahMx2SZB5Fgt+e87KU+xSs23LpNGg+wILO8wQ4x1Rp7IhJzNZj0Mh893AWYR0Kv48UtKSxaCkxSg4fQXtsxiCfZ7xf6snXgIO/AnYUIquFpuYfUZxPZeF+ONaS8ZlVrVvh9vwSSKK9/W5hJDWBWfTf5FLSXplARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7mTLFtBb/pWwCulI48n98B+fNimKtDSErsyexVGqRo=;
 b=A9eRw/Son/3e9D3WfiUlHWKCKvbuO/UHvjyy6EsFiu7tOEBmqojrnve70eKuDILv4wyocN3XaMdlTTJpfWYkvEkRVXx1ENV5IspRdIKGbM0jvMhbQIn1vqkJsWC3XtFkVZyEToWwHeV1969HLHa7z+IqDeaZXlnC1isGU00Eeo+gtwFh9JaG3FAGVe+gqcF82glWADPIxfC/09YQGSx7bWKAXYolS/xoy4x13vpcxzazqLXrUjEEumve/TU3/4BXz7VC44pxg1e1flpYS+zlNWSxkJLL9plP17N8YPqu85hYiZIwA1IhI+KxoUh1T8BU9LYuv/wL+ujKYRbLiSxzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by LO8P123MB7475.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:3a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 06:29:49 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6%3]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 06:29:49 +0000
From: david Atkins <david@3adesign.co.uk>
To: Kalle Valo <kvalo@kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH] Wi-Fi: ath12k: Support Rx PDEV HTT stats
Thread-Topic: [PATCH] Wi-Fi: ath12k: Support Rx PDEV HTT stats
Thread-Index: AQHa5KVg0q3x6C8hkEG6gnkXWYiy3A==
Date: Fri, 2 Aug 2024 06:29:49 +0000
Message-ID: <LO0P123MB4057D72DA01700D91DFEB390D6B32@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
References: <20240725054227.986851-1-quic_rgnanase@quicinc.com>
	<LO0P123MB40573B6A94FB2775E73F0211D6AB2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <8734nplslq.fsf@kernel.org>
In-Reply-To: <8734nplslq.fsf@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=3adesign.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|LO8P123MB7475:EE_
x-ms-office365-filtering-correlation-id: 2a25c377-aec6-4610-60b1-08dcb2bc82ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?MP27BWBrV/sY95NNUG3L+vjaMwhZc34iLmJG3Io+d+vO5DZujydQMYJS8Pn9?=
 =?us-ascii?Q?A+nOO4XKmxtYs2PvCkaYTtUnBK/LmHwTsJ3K0M2nyxQtJfkMezcSwakhEn3Q?=
 =?us-ascii?Q?r8DjWdUyxohWG8a/JB7wwZfXiLVg5hb5h8gbrcT3rqjyENuBdblEtbE8cZrL?=
 =?us-ascii?Q?gfR4htFMb2Wb4cYH0Ta0XIbYZ7AMRT+2sIbHpGkzUpbcftAmz+1rLWSF3Che?=
 =?us-ascii?Q?GdNDDTijW/n3e38cYCRtsKHlJwSCD79MlQhuj9OqeiVq83sBPpIfIEQR/UNh?=
 =?us-ascii?Q?w3JzR9EfLOaMKUqMT+bvyvQQ/DjLKTF87zlHZnM0Dd0jjskC3e0lPWqhFFCJ?=
 =?us-ascii?Q?3LNMvHrF64G1MPOJAVAPDzo0j56bqPId7nPRmMdKGGP/P3cuHmM1SAqrWRDh?=
 =?us-ascii?Q?tuHDbNSpPm3vDUuADktyaixUG3rWVdG6GL8BKWegqvUlsU2g51oBKBOOzq1D?=
 =?us-ascii?Q?VsdnjPm6ZGjhFbpgE69dBbW33aN/zKz/ZS4Z6BYTx3xqHr/H3gXgHkMMEPHW?=
 =?us-ascii?Q?f5FdNeLRFkHc0omZ71dDciT2/s90PsUeOFFKtrV5hQwpquS2FSOCorgV52a2?=
 =?us-ascii?Q?fBpLGaxxher5sjylQrsKW6EZlIFKWxTWFOSxW4TXnR7ieLs/YKSjw0BmAGGv?=
 =?us-ascii?Q?b5frvxnuczewcN1gLYKwkHautmpvFEhZjLnWkwdYWsULJsVs2FBy/z46iKEo?=
 =?us-ascii?Q?TJIVB1fjlhnZdjfe9EyZSujrlY4mslMtcXXBIT4FJGAyAU9BtBTWED6o9K0Z?=
 =?us-ascii?Q?K1iQWWymahm8F+eiZOPfAmjsrxJMU0D/u7iwfsbH8+VoeochdFt3nOp7VThL?=
 =?us-ascii?Q?q+b/i24DnpodzrBzze3DjMpOfQ/JZPOcDoKdcHf+SPZ4iYjB1BOt3xllvzEE?=
 =?us-ascii?Q?Efz14TH8isUjaYQHo1ZqaxWjOfoFMnj5ewzTr5bOhart4d0rKQerDDnyJ+7o?=
 =?us-ascii?Q?X02TSJ3wkpsbCE0Sw28sgxabCF3WalkKbjkwABWehuYAK//zDAlRRNR0JHbJ?=
 =?us-ascii?Q?nTPrBKC6GS7eZp6dlqDvRQ0N/+gOQ9tBYOBD2b6gJxN54QIN+16WonB5HfP7?=
 =?us-ascii?Q?iDPKpS7s7cFriFxTVveb4QHQuCUqlXmovFIaMsJYHZ5Bzn4nkUTrcMhxjxnw?=
 =?us-ascii?Q?tCrMbOtayz6NySuRsAz4bK0Sy8EaZnka7f9DnrQOpvbrN3tiejLvLemaXVac?=
 =?us-ascii?Q?DDY0pftvIQYfZaC60/hssHYfBiey3RkgackovEshSS9khKjAbqeP443sDTWM?=
 =?us-ascii?Q?BLrapCkecXcNDzkibLyKzbOM52UH+IJX1qkf9Wm/8wfzmoQHIg8ctsixnv14?=
 =?us-ascii?Q?hFPP+1Mnp9acYPRHqIAMSKpfjOQki5lKUJ3xuOXeLry5A0FLxfO7yMTxG13Q?=
 =?us-ascii?Q?aB6bo2s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ku5H0MBkZQvmf25dv0cX9vs+8O10LMy8kxd1e5p2SYFToQcwAdgtbuusBG3E?=
 =?us-ascii?Q?b8slZGZQNZ9IQ0h0hsxyBv3b92SG8qjluQ2agQeTbGdzonfOWv8x5jDkOxpO?=
 =?us-ascii?Q?IPop2FCsTYBgAtrJjrdfm8chxv7Y6M/AQGJPLvyZ9enmoBGv8UeatAVx8UIK?=
 =?us-ascii?Q?7ouSosPQZbhr1fYwtP5nG3zFcznT6X52Wtjqbf80nLJXMlo+d62m56Q80Xfx?=
 =?us-ascii?Q?gtVZM0fJ+S8o7Om4kxPrLwCcYct3y7MKeUlZe8RHBNQ3HUABR1xOK3ZbcVF4?=
 =?us-ascii?Q?pfhun84r5RCnHFWCPfHr+9ZHKQC0qcEy5RIgOKTEOz9iVmCB72gkU+N8Qlsy?=
 =?us-ascii?Q?0q1d8esT10PhFd/11MvbKNxr5vVysoTc1mVM3CIXWrfm+T1dkHJh1qmqtxeD?=
 =?us-ascii?Q?zAzwJGWY38KH7fCy+CXoTqfAu9hRdjtvsMBNaowp4/vqIds3raCeMgtuMy2D?=
 =?us-ascii?Q?05ruh1WCztXeQg1+mwy8ffFI0srrHBzJ0EAaEvvpQ4Ybz7rOlQjI1+vZTm6N?=
 =?us-ascii?Q?E5IzOZgts2aN4YUXHnUrQHcjnqL2DUpIVCqfMZ6prSpVuXajTs0wa5NXkjsB?=
 =?us-ascii?Q?CRTMn8sWpO99/A3wMPH6N4Lan9XCTiJqiiQ2fJbd30LgMTwy7vmXcBjT9Lyn?=
 =?us-ascii?Q?xEdGIaJuWdRtg1V4ru9eBaULUB+TyToCLLFW8NtjXZWSqwtFbziUPMSHw+c6?=
 =?us-ascii?Q?m4DwJXDvnsQwaM9E3PEwIg/eAwxL8nsoaUDmnVbKw3L8oR2VevIl99D21fTQ?=
 =?us-ascii?Q?ERsmb9Yi97zoG+Yrs91N8z4U2TfBlAeGbF0NpOMS0YLIX7nZ04+0V8EbJuf8?=
 =?us-ascii?Q?MchAlj4EnUDYjySbh5LRjzbtYzt0MXOC2aWWrFUJADgdMY2fqeB9IabGNTG3?=
 =?us-ascii?Q?BUzCazrxmJ1DtR29F7c0lPSeu9unDAwjtbtEwCFi5PqeFgr5j+tX/bRolNkQ?=
 =?us-ascii?Q?LT19gLOIfK6bV8Tl+N15Bfb6FKhyk5ojHWhc0qujKicGW8NkBEIT4qcIsWm+?=
 =?us-ascii?Q?YbGXqRFBvRAh1fKU5GNN20gfdAeEPv+JrWbv4S+GUE4emXMd0Db4J8SOq58D?=
 =?us-ascii?Q?DhtYuT+OwkfzGNr/VrIWujFPYZKif/GIMvNBGQf8QLbkVoVESLEF/EfyZYOi?=
 =?us-ascii?Q?6sjJEe6F/W+xcuAwbAoZ/f2MMgpfAce7sX2UlyUK5qYXE/BCvwm7C+2bKqSr?=
 =?us-ascii?Q?l6Fs47RW0dBJc3ZjZMWvRwT8BdcyrMrNAQiscnk160EOSK2lwdJxfK89xWai?=
 =?us-ascii?Q?Ck0GVdtN/fKsRxS8cS5HBxSqCMXKQjMKdmL+GsitSToeML1XEDJ5nK01X5jh?=
 =?us-ascii?Q?kVYV3QRE5g2+CK8quJeNbOXJlQim0OBXq+O1UfOUOf1VsxiLakPQ9y8fi+Lx?=
 =?us-ascii?Q?+svQLreyCAw5kJ5RhRiQy4dA92pe+71yR1GfNmkqMNDr1PmCW362m6NF0rag?=
 =?us-ascii?Q?6Hu5hyir3BUWQJ2rAcCQBakkxAZJYTo5vrSSbTK0rJ7zGNWFtO3iEiMsSOUW?=
 =?us-ascii?Q?c62AR7OOal1jkQrgH3DHPDDxayIDOIrcViGyIG6Szl768aLAYeFY5WXb9hhz?=
 =?us-ascii?Q?B8TjlLGBtgO01oq+PUXEbzS8NW1ULPmVX6GZzG6U?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a25c377-aec6-4610-60b1-08dcb2bc82ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 06:29:49.7152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: swzvY47bsQEwNY1W+rC2QaMvuczgHQ8TOlfmDLB6hPJQDt/76VW8E8DhzKxk/uIYF6YQIurLUWt9tZ5yozT0ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P123MB7475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_232955_935745_2C0B6685 
X-CRM114-Status: GOOD (  10.63  )
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

Will do, messed up that time....


> -----Original Message-----
> From: Kalle Valo <kvalo@kernel.org>
> Sent: Wednesday, July 31, 2024 12:16 PM
> To: david Atkins <david@3adesign.co.uk>
> Cc: ath12k@lists.infradead.org
> Subject: Re: [PATCH] wifi: ath12k: Support Rx PDEV HTT stats
>=20
> david Atkins <david@3adesign.co.uk> writes:
>=20
> > Just retested the WCN7850 on systems to see if its working on Wifi-7 fo=
r me.
> >
> > Initial results promising but driver fails after a few minutes, do see
> > 1 giga bit/s for a while with iperf3
>=20
> Please start a new thread about your problems, don't hijack an existing
> thread.
>=20
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>=20
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
t
> ches

