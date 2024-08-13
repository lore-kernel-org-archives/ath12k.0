Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC0DC52D7C
	for <ath12k@archiver.kernel.org>; Tue, 13 Aug 2024 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EN/M+k9KGp2EwgYZmd2AZ9mDcjMbx8rGf9ohnyHOdz8=; b=z9ypPrb/yL/Ih/m3PzFEB59YJu
	LxTzN9xzYAko7jnxmk6ZCmeVT8DGg/5ziaFaYfMPJh7bijIu5yOvf3MyoBfattV2QaUQpSt2zUPnK
	3u3scYOOr8mZR8YekpJpKhiYDFyMvDx0obH/8R4IFrOz8a+8UlBxbf9qBaAnKOGIqWDTvkkkj0v8S
	vN93OnpkYWLGzf0J4bcahLQr2s+JyZf2vQX3XOC9G7FcFJmuoJ12IYVMWlCDzNeoxxKPxJKjjCvjn
	lI5hWVHqV2hyZuvu1qPjW9CgQp0iQAH+XviEqOpZLIgb8kdyGpEY+P+BveYC2nsC7U6jeZUVUdIn7
	YVNSHoqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdrSW-00000003qV0-0u8O
	for ath12k@archiver.kernel.org;
	Tue, 13 Aug 2024 13:21:08 +0000
Received: from mail-lo4gbr01on20700.outbound.protection.outlook.com ([2a01:111:f403:261a::700] helo=GBR01-LO4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdrSQ-00000003qUH-0B7K
	for ath12k@lists.infradead.org;
	Tue, 13 Aug 2024 13:21:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwpUStm96Zdtp6hQBzGKolGfpZvqu1QtR3djvy1V9auBBuaX08TRxsRy1iOuW1/4ug25cHhxrVbN9n7K+old4iwXhpijVHVTVdFEWuKARjj/3NeIAflDBnoA8xCnVO693ClWkO2ZwNV39FqV3jDCAI8iYIhdKSXIihuu4xpHx1fmuleklJ37litKM3X6v8f+o1Dk/nhqyT5EC4iJsdcL1iyW9zbi+tBIvCE1gq0kdR0eliRPWjfOKRWZI0VZI/aHz+BthJK8HS/C3BeV4Z5JDRumL+XnnhGfFZa2f2ywcGdB4IocrjLjGD9g/v3i9mAGRaLZbpSk9OYb7fMGQ4HSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EN/M+k9KGp2EwgYZmd2AZ9mDcjMbx8rGf9ohnyHOdz8=;
 b=uMsdWpHlQwddz7/yFiNeZjbKF6pxSjZAJ6J3kBSlW/i9Uz7d0s46YzCGbs+y9BkqEfqqg+PtPYKd7E6EjnVtb3/3C+ly23WSfpQ2IMqqFydbzSrgLiPu00m2VrxOCxQq1wbV5jhouA69MqeOi7vKyZOndDKJ5R6uh7wchnjuNo+D5HAK+SettcvpIzdnjeWTj/aUObD7rPQ+fICGtkyX0NLNoHBloqIrun1D44OR0Kpv25FINGmz6Yi4wzpDqOM7HX15W2DHrfsmiBiXUhYVZUoyBy2JFcvNj0ESCAoxSpcCG5k6rCfoLQU0gCM0BZlup6P350g8jn0nm96rCU5eig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by CWXP123MB3191.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:41::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 13:20:47 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6%3]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 13:20:47 +0000
From: david Atkins <david@3adesign.co.uk>
To: david Atkins <david@3adesign.co.uk>, "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
Subject: RE: wcn7850  issues 
Thread-Topic: wcn7850  issues 
Thread-Index: Adrny0FwHnce1PsLQ021YkDT6GU++wADCGTgAWsIhKA=
Date: Tue, 13 Aug 2024 13:20:47 +0000
Message-ID: <LO0P123MB40577366753FB23BFB9EA050D6862@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
In-Reply-To: <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=3adesign.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|CWXP123MB3191:EE_
x-ms-office365-filtering-correlation-id: 4dc4edd7-6da9-41d6-8508-08dcbb9abe97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?FU7CcRbzCKpychyD1U107hPz5jCuHbXkscjhHDjZPuIBq3yVYPUAN4KfWh?=
 =?iso-8859-1?Q?X/Amh0I5GxA/JvH5jVsfNMpfwhWTGMu7I+UDzhtfoqEYwnkBUUFGdYiWEl?=
 =?iso-8859-1?Q?aLuIoRPiVWxNcxVLvHvmmhLmYq0mq5wMgqKRBfbSpv805QMVA6JHDfAquy?=
 =?iso-8859-1?Q?4cE/fCr9V/vVAnW/WdCNJQwG4zoIbzFxnLkicA7DXhnwaYHl7MlO2bszlH?=
 =?iso-8859-1?Q?rBlURdqWfuhql9Tl911e00njONcWP2JnnDK5VU9P8eoGDuMaPLgF7GVgKK?=
 =?iso-8859-1?Q?YHEZ6b9CJFlSKMncHePnHWecGLCjXIw98Ipf8YjczcypTNn7Ofouwfq3nr?=
 =?iso-8859-1?Q?scWVWmE7Yh7oOJG+dYWT12QiTCjmwHKfIzBn/MOObNuLxbfrun72Ite6Ij?=
 =?iso-8859-1?Q?xvzJXhEZvQb2hcDhz3xS2vlAcG4xAj17y036wZd3hFGAkBuJqOJVW9WfIh?=
 =?iso-8859-1?Q?B957tVLPgKb07Oibuhz/MnLwroBvVpP2aJI9ptdT/aiGLWznqlSoG/IVWi?=
 =?iso-8859-1?Q?UQ0mFIT/zYUzflL21vUx67yLq3pZTuA4Wtztck/kej0pL8+38GPRMy16U1?=
 =?iso-8859-1?Q?BA+0v04gEM6u9vFQArY+J2im2BRR/GuOcLmXj0yNw/kETwM4r032lreds5?=
 =?iso-8859-1?Q?k/2/LSPieQY2s/PiAWB2koJPW86lZqaKc+5VhEoJgE8ab3Vu0/xeazV9hN?=
 =?iso-8859-1?Q?JfHXwDOAWH9JzGiridbDgfcMG84B3BAtw3oHUQTHZYMi5cokHgLpj3jkvn?=
 =?iso-8859-1?Q?J9jsYnKAmlys+We9Spv5OgJUqFvlb5siGCoqyoYISS1ozkxKhYOYAbbB5j?=
 =?iso-8859-1?Q?x6J9bU6SPHVwb2fPPYbx6WdUn/8KZWoSHZ7lrnkgbMZUtlpj7DlZQ+3QU1?=
 =?iso-8859-1?Q?0MDCVA0WJEeYFKMmkAsDJdmXZsId6K+DHwMPDOzYgcl5Eci9mavKuOTeEJ?=
 =?iso-8859-1?Q?HMD9cGCBiEI4paANRqOM5A2UWVc76qZSe/FWiQAEkCuzRfApnKVn6+YesB?=
 =?iso-8859-1?Q?cA+02FAs8kp+Nju1hGZ0QmDUBJ+1bpuUqtsrtkM6448CTSGVJIfEHUSGiQ?=
 =?iso-8859-1?Q?kRvxLfIGD1chok/w01OrfsYLSYRtSlVJgiVuJoFL4i9eeTI3TcDXp7aUos?=
 =?iso-8859-1?Q?ja2q09f8W/20z6XCf1mVPZ1F5tLViNApYI2Sv0AkYZ7aZ51otQvVUMa1cu?=
 =?iso-8859-1?Q?8L3kHtOYBoFTDsQgUh2f0+b+uqrQ3TIvFSbO1D7sxN4q+OAVMp6HEOBYYr?=
 =?iso-8859-1?Q?B+uU3WFbuoMHbrkX15BDUJUvF7LnAhE/ESLbJDMfQy02Y4r0G+er/zjTkp?=
 =?iso-8859-1?Q?xDb7T+55UQunSALshkF6LKGdHmH+Nc4ejKtaqpcwiBbzNEs3rD2M9660uR?=
 =?iso-8859-1?Q?8jEp39fS0pugovV/NMyH/Nr/AvjGFNY/uR/+GjCMpBp5hPqwD4pzQEJZNO?=
 =?iso-8859-1?Q?qXr3JkCyPWgno+0GHqSN5NOmnD4HZWwwUFIdxA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bznbOaV/F5QvXKw4abmcY++LP+T9FJ2/3pTpt1yME/aBTFYqTETauNl5EL?=
 =?iso-8859-1?Q?lo/Ir5Q49TN6mPKxs5tqNTVkM5wIGZ8mHMFkatKrck9kC8SwCgCWKHJnnJ?=
 =?iso-8859-1?Q?oFMbbB8YtJA4qtegDNfVSkFuJZonvvrXHMQRlD4F8XkjWjcTjsinQiZS9i?=
 =?iso-8859-1?Q?hjwCLiVfoQfqhgI/warai8eYp95Pw5DM6lF3Ha1DPYu8qhU5QM64LAKI0Y?=
 =?iso-8859-1?Q?gwsg5WhIxR18rbDzqTkE39a0O0rp173XRTEK+XVis8DowZXcnmcuXTjL96?=
 =?iso-8859-1?Q?Xb1BBmszPjnn1LezaS0Sjm+zcbJxoQlONJXjvKy4W235+L3x3HlR82j4M8?=
 =?iso-8859-1?Q?eOVhabpvufjY5Oz3PPJoyYKx1PYTIdlTqfIIQ5AN/djFmQP/KQtTFNINK9?=
 =?iso-8859-1?Q?DDWqji9ISRFXvjbXyunkzdMEqwWn4O1jvC1J1bEX7EPIpLKAbkRChIDm++?=
 =?iso-8859-1?Q?jg0QTRTZ8E4RsjEzC6eghkAIzKrkBxJhhYfrqqrdR4obYfVTrbHwFUXZ3V?=
 =?iso-8859-1?Q?W0JO36Zg9AE0Yi5FRBYMZG9ncdZsKp1MdOmLj56UKDQWA9Z6O21mrJo1a+?=
 =?iso-8859-1?Q?TgwTtDr2AFu2K+xWWyNvSYV2FCcKP/RNgH7KgpGvWpJKG97kuSvoApqFvv?=
 =?iso-8859-1?Q?8N0BKDc2eUWWQBjbSudpqei6FAveqzTSfCGXb98e26tqPx0Z1BYdshiRVj?=
 =?iso-8859-1?Q?+ZV7KSOf1BWaomde25TXHB7ZER3eCnqjsL9HPYKY+4y37xp0BM7Ng9CjTi?=
 =?iso-8859-1?Q?pb4keznpsSWMwsoAroWKZtjrUmn8t8eDnfNiSw4wPIAtagtTUst/z8ubEA?=
 =?iso-8859-1?Q?TLdgtvvnRIH+NgSxjTDXQ80VGLJJ4nru+zEtGYSAXILh9fRvnvIVkDgGrE?=
 =?iso-8859-1?Q?dZHsBG7YpiB4+OOh/kVfx8QwJB2KGg0QyxF9OAmJD0Y785b/UrvlIl0Fvl?=
 =?iso-8859-1?Q?b4zekY4+8UqH9hRqYlAxvFbDnmY0UEF6Rze1nXIkLZ/tTwCXYYFTjoPogZ?=
 =?iso-8859-1?Q?GVMRtgYLBsFl3nvvj/LHalf9v2Tz11bdjJJUfuwDtnvOA9loHEYo1Agxu6?=
 =?iso-8859-1?Q?fCVI+QUBmOTjwJkMK/hcVmWWq4QxbWFGJnAdQmnhQTA1/HjetrQdlBgMdv?=
 =?iso-8859-1?Q?aIL2CyB4B//5+oWuX0sV0zDEQtJTCqL0Joz5H0IHnZ79gfrxYmOUoqjiCJ?=
 =?iso-8859-1?Q?uNR2Pyi5QKE+Oc3RUZuY+akDRyQJK4o5RVuUbeC7empSudsNNA9KB2yq94?=
 =?iso-8859-1?Q?QKVDSzB4pMYi6sHx/UfCIYTpZ5DwAWoLUKSHdddcYqeUJVr5aSaAlbjMgR?=
 =?iso-8859-1?Q?YWNiEX/L/WFwdhMDrX71S4NL4Jt7vnypD2vkybUyLRd4nTUnf3LpEoyktZ?=
 =?iso-8859-1?Q?oZnQBnrGCMFHQdmc5OH4CaNEK2LrAkjTv0QYwwLKR2ik2bJ3Ag/U4/VMQd?=
 =?iso-8859-1?Q?aT1rVrxQ0Qegb96bEf0w8qgJF8eguzIuTca89xYAaT6KXwyrWxMtFAyaQ6?=
 =?iso-8859-1?Q?APERanq6Y32uTs1N9KwAUa8TBylOUFe5DGltWeRmeHw7NoV/30ZzWeO1R3?=
 =?iso-8859-1?Q?/zlHVlRZbQo+/Y/VAdx2C79RLrP7VEyWb1ODI0SZVz1Ef+opn2r15WdPoi?=
 =?iso-8859-1?Q?k7TPEXLThcV8JlyxE8zKa9yq7/Tha01sVZ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc4edd7-6da9-41d6-8508-08dcbb9abe97
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 13:20:47.6488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uGlciX/phdLy+ROOPpI3OlOq9XIx8Tx5u3JbFuRsPXhwxNgpplm23zC8LBHMXUCGBDA+MnKF3kUfnAzJKRV7UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_062102_271349_2F0DACBD 
X-CRM114-Status: GOOD (  18.95  )
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

Any thoughts on this, keen to at least replicate results that have been pos=
ted here

David


> -----Original Message-----
> From: ath12k <ath12k-bounces@lists.infradead.org> On Behalf Of david
> Atkins
> Sent: Tuesday, August 6, 2024 9:06 AM
> To: ath12k@lists.infradead.org
> Subject: wcn7850 issues
>=20
>=20
> Hi,
>=20
> I have updated the kernel we use for testing today to main from
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/, the base =
install
> is the ubuntu 24.04 desktop release
>=20
> Kernel reports as
>=20
>=20
> openwrt@wifi7-amd:~$ uname -a
> Linux wifi7-amd 6.11.0-rc2-wt-ath+ #2 SMP PREEMPT_DYNAMIC Mon Aug=A0 5
> 12:02:22 BST 2024 x86_64 x86_64 x86_64 GNU/Linux
>=20
> Ath12k from Dmesg
>=20
> mailto:openwrt@wifi7-amd:~/datkins/kalo/ath/.git$ sudo dmesg | grep
> ath12k [=A0=A0=A0 3.823988] ath12k_pci 0000:01:00.0: BAR 0 [mem 0xfc60000=
0-
> 0xfc7fffff 64bit]: assigned [=A0=A0=A0 3.824006] ath12k_pci 0000:01:00.0:=
 enabling
> device (0000 -> 0002) [=A0=A0=A0 3.824305] ath12k_pci 0000:01:00.0: MSI v=
ectors: 16
> [=A0=A0=A0 3.824310] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.=
0
> [=A0=A0=A0 4.372789] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4=
 board_id
> 0x10e soc_id 0x40170200 [=A0=A0=A0 4.372796] ath12k_pci 0000:01:00.0: fw_=
version
> 0x100301e1 fw_build_timestamp 2023-12-06 04:05 fw_build_id
> QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c5-00481-
> QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> [=A0=A0=A0 4.580233] ath12k_pci 0000:01:00.0 wlp1s0: renamed from wlan0
>=20
> Ip a shows
>=20
> 3: wlp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue
> state UP group default qlen 1000
> =A0=A0=A0 link/ether 00:03:7f:58:34:42 brd ff:ff:ff:ff:ff:ff
> =A0=A0=A0 inet 192.168.1.144/24 brd 192.168.1.255 scope global dynamic
> noprefixroute wlp1s0
> =A0=A0=A0=A0=A0=A0 valid_lft 82448sec preferred_lft 82448sec
> =A0=A0=A0 inet6 fd78:4c15:7f9d::2cf/128 scope global dynamic noprefixrout=
e
> =A0=A0=A0=A0=A0=A0 valid_lft 82450sec preferred_lft 39250sec
> =A0=A0=A0 inet6 fd78:4c15:7f9d:0:3f2d:65f7:eb00:3928/64 scope global temp=
orary
> dynamic
> =A0=A0=A0=A0=A0=A0 valid_lft 600850sec preferred_lft 82358sec
> =A0=A0=A0 inet6 fd78:4c15:7f9d:0:a184:9d87:7861:846b/64 scope global mngt=
mpaddr
> noprefixroute
> =A0=A0=A0=A0=A0=A0 valid_lft forever preferred_lft forever
> =A0=A0=A0 inet6 fe80::f662:5464:1669:4fab/64 scope link noprefixroute
> =A0=A0=A0=A0=A0=A0 valid_lft forever preferred_lft forever
>=20
> I have set region to GB
>=20
> sudo iw reg set GB
>=20
> so we get
>=20
> mailto:openwrt@wifi7-amd:~/datkins/kalo/ath/.git$ sudo iw reg get global
> country GB: DFS-ETSI
> =A0=A0=A0=A0=A0=A0=A0 (2400 - 2483 @ 40), (N/A, 20), (N/A)
> =A0=A0=A0=A0=A0=A0=A0 (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, A=
UTO-BW
> =A0=A0=A0=A0=A0=A0=A0 (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, =
DFS, AUTO-BW
> =A0=A0=A0=A0=A0=A0=A0 (5470 - 5730 @ 160), (N/A, 26), (0 ms), DFS
> =A0=A0=A0=A0=A0=A0=A0 (5725 - 5850 @ 80), (N/A, 23), (N/A), NO-OUTDOOR
> =A0=A0=A0=A0=A0=A0=A0 (5925 - 6425 @ 160), (N/A, 23), (N/A), NO-OUTDOOR
> =A0=A0=A0=A0=A0=A0=A0 (57000 - 71000 @ 2160), (N/A, 40), (N/A)
>=20
> phy#0 (self-managed)
> country na: DFS-UNSET
> =A0=A0=A0=A0=A0=A0=A0 (2402 - 2472 @ 40), (N/A, 20), (N/A)
> =A0=A0=A0=A0=A0=A0=A0 (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
> =A0=A0=A0=A0=A0=A0=A0 (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PAS=
SIVE-SCAN
> =A0=A0=A0=A0=A0=A0=A0 (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PAS=
SIVE-SCAN
> =A0=A0=A0=A0=A0=A0=A0 (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PAS=
SIVE-SCAN
> =A0=A0=A0=A0=A0=A0=A0 (5945 - 7125 @ 160), (N/A, 20), (N/A), AUTO-BW, PAS=
SIVE-SCAN
> =A0=A0=A0=A0=A0=A0=A0 (5945 - 7125 @ 320), (N/A, 30), (N/A), AUTO-BW, PAS=
SIVE-SCAN
>=20
> Station dump gives me
>=20
> mailto:openwrt@wifi7-amd:~/datkins/kalo/ath/.git$=A0 sudo iw dev wlp1s0
> station dump Station ac:91:9b:b7:05:b0 (on wlp1s0)
> =A0=A0=A0=A0=A0=A0=A0 inactive time:=A0 1126 ms
> =A0=A0=A0=A0=A0=A0=A0 rx bytes:=A0=A0=A0=A0=A0=A0 4832450328
> =A0=A0=A0=A0=A0=A0=A0 rx packets:=A0=A0=A0=A0 3281108
> =A0=A0=A0=A0=A0=A0=A0 tx bytes:=A0=A0=A0=A0=A0=A0 4592467521
> =A0=A0=A0=A0=A0=A0=A0 tx packets:=A0=A0=A0=A0 3152967
> =A0=A0=A0=A0=A0=A0=A0 tx retries:=A0=A0=A0=A0 38
> =A0=A0=A0=A0=A0=A0=A0 tx failed:=A0=A0=A0=A0=A0 0
> =A0=A0=A0=A0=A0=A0=A0 beacon loss:=A0=A0=A0 0
> =A0=A0=A0=A0=A0=A0=A0 beacon rx:=A0=A0=A0=A0=A0 3267
> =A0=A0=A0=A0=A0=A0=A0 rx drop misc:=A0=A0 1
> =A0=A0=A0=A0=A0=A0=A0 signal:=A0=A0=A0=A0=A0=A0=A0=A0 0 dBm
> =A0=A0=A0=A0=A0=A0=A0 beacon signal avg:=A0=A0=A0=A0=A0 -24 dBm
> =A0=A0=A0=A0=A0=A0=A0 tx duration:=A0=A0=A0 0 us
> =A0=A0=A0=A0=A0=A0=A0 rx bitrate:=A0=A0=A0=A0 3602.9 MBit/s 160MHz HE-MCS=
 11 HE-NSS 3 HE-GI 0 HE-
> DCM 0
> =A0=A0=A0=A0=A0=A0=A0 rx duration:=A0=A0=A0 0 us
> =A0=A0=A0=A0=A0=A0=A0 authorized:=A0=A0=A0=A0 yes
> =A0=A0=A0=A0=A0=A0=A0 authenticated:=A0 yes
> =A0=A0=A0=A0=A0=A0=A0 associated:=A0=A0=A0=A0 yes
> =A0=A0=A0=A0=A0=A0=A0 preamble:=A0=A0=A0=A0=A0=A0 long
> =A0=A0=A0=A0=A0=A0=A0 WMM/WME:=A0=A0=A0=A0=A0=A0=A0 yes
> =A0=A0=A0=A0=A0=A0=A0 MFP:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 yes
> =A0=A0=A0=A0=A0=A0=A0 TDLS peer:=A0=A0=A0=A0=A0 no
> =A0=A0=A0=A0=A0=A0=A0 DTIM period:=A0=A0=A0 2
> =A0=A0=A0=A0=A0=A0=A0 beacon interval:100
> =A0=A0=A0=A0=A0=A0=A0 short slot time:yes
> =A0=A0=A0=A0=A0=A0=A0 connected time: 4038 seconds
> =A0=A0=A0=A0=A0=A0=A0 associated at [boottime]:=A0=A0=A0=A0=A0=A0 13.805s
> =A0=A0=A0=A0=A0=A0=A0 associated at:=A0 1722856637791 ms
> =A0=A0=A0=A0=A0=A0=A0 current time:=A0=A0 1722860675019 ms
>=20
>=20
> and iw dev wlp1s0 link gives me
>=20
> Connected to ac:91:9b:b7:05:b0 (on wlp1s0)
> =A0=A0=A0=A0=A0=A0=A0 SSID: EE-CN589H
> =A0=A0=A0=A0=A0=A0=A0 freq: 6295.0
> =A0=A0=A0=A0=A0=A0=A0 RX: 537531156 bytes (3281227 packets)
> =A0=A0=A0=A0=A0=A0=A0 TX: 297500287 bytes (3152968 packets)
> =A0=A0=A0=A0=A0=A0=A0 signal: 0 dBm
> =A0=A0=A0=A0=A0=A0=A0 rx bitrate: 3602.9 MBit/s 160MHz HE-MCS 11 HE-NSS 3=
 HE-GI 0 HE-DCM 0
> =A0=A0=A0=A0=A0=A0=A0 bss flags: short-slot-time
> =A0=A0=A0=A0=A0=A0=A0 dtim period: 2
> =A0=A0=A0=A0=A0=A0=A0 beacon int: 100
>=20
> Concerned we have a report of =A0"HE-NSS 3", wifi 7 should be eht and we =
have
> a wcn7850 which has only 2 antenna ports.
>=20
> My understanding is that 160MHz HE-MCS 11 @ 160Mhz will give us 1200
> Mbit/s so the report of 3602 suggests its assuming it has 3 spatial strea=
ms
> which would be incorrect
>=20
> The signal level looks wrong
>=20
> =A0=A0=A0=A0=A0=A0=A0 signal:=A0=A0=A0=A0=A0=A0=A0=A0 0 dBm
> =A0=A0=A0=A0=A0=A0=A0 beacon signal avg:=A0=A0=A0=A0=A0 -24 dBm
>=20
> we would expect that to agree with the beacon level, we see the beacon
> change but the signal is always 0, I note from recent messages on the thr=
ead
> that this has been fixed, what branch should I use to check this?
>=20
> I have also seen this in dmesg during association with the AP,
>=20
> [=A0=A0 13.049675] wlp1s0: required MCSes not supported, disabling EHT
> [=A0=A0 13.304272] wlp1s0: authenticate with ac:91:9b:b7:05:b0 (local
> address=3D00:03:7f:58:34:42) [=A0=A0 13.304281] wlp1s0: send auth to
> ac:91:9b:b7:05:b0 (try 1/3) [=A0=A0 13.312345] wlp1s0: authenticate with
> ac:91:9b:b7:05:b0 (local address=3D00:03:7f:58:34:42) [=A0=A0 13.312352] =
wlp1s0:
> send auth to ac:91:9b:b7:05:b0 (try 1/3) [=A0=A0 13.314787] wlp1s0: authe=
nticated
> [=A0=A0 13.315249] wlp1s0: associate with ac:91:9b:b7:05:b0 (try 1/3)
> [=A0=A0 13.321883] wlp1s0: RX AssocResp from ac:91:9b:b7:05:b0 (capab=3D0=
x1111
> status=3D0 aid=3D6) [=A0=A0 13.334818] wlp1s0: associated
>=20
> Iw scan shows this for the AP in the 6Ghz band
>=20
> BSS ac:91:9b:b7:05:b0(on wlp1s0) -- associated
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 TSF: 56186843682 usec (0d, 15:36:=
26)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 freq: 6135.0
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 beacon interval: 100 TUs
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 capability: ESS Privacy SpectrumM=
gmt RadioMeasure (0x1111)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 signal: -28.00 dBm
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 last seen: 128 ms ago
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Information elements from Probe R=
esponse frame:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 SSID: EE-CN589H
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Supported rates: 6.0* 9.0 12.0* 1=
8.0 24.0* 36.0 48.0 54.0
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Country: GB=A0=A0=A0=A0=A0 Enviro=
nment: bogus
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 Extension ID: 201 Regulatory Class: 137 Coverage class: 0 (up
> to 0m)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Power constraint: 0 dB
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Extended supported rates: 61.5*
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 RSN:=A0=A0=A0=A0 * Version: 1
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * Group cipher: CCMP
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * Pairwise ciphers: CCMP
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * Authentication suites: SAE
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * Capabilities: 16-PTKSA-RC 1-GTKSA-RC MFP-required MFP-
> capable (0x00cc)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BSS Load:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * station count: 1
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * channel utilisation: 3/255
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * available admission capacity: 0 [*32us]
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 RM enabled capabilities:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 Capabilities: 0x72 0x00 0x00 0x00 0x00
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Neighbor Report
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Beacon Passive Measu=
rement
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Beacon Active Measur=
ement
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Beacon Table Measure=
ment
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 Nonoperating Channel Max Measurement Duration: 0
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 Measurement Pilot Capability: 0
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Supported operating classes:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * current operating class: 137
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Extended capabilities:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * Extended Channel Switching
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * BSS Transition
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * Multiple BSSID
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * SSID List
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * Interworking
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * WNM-Notification
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * Operating Mode Notification
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * TWT Responder Support
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * 80
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * 83
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 802.11u Interworking:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 Network Options: 0x0
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Network Type: 0 (Pri=
vate)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 802.11u Advertisement:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 Query Response Info: 0x7f
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Query Response Lengt=
h Limit: 127
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ANQP
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Transmit Power Envelope:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Transmit Power Envelope:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HE capabilities:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 HE MAC Capabilities (0x000d9a181840):
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 +HTC HE Supported
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 TWT Responder
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Dynamic BA Fragement=
ation Level: 1
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BSR
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Broadcast TWT
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OM Control
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Maximum A-MPDU Lengt=
h Exponent: 3
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 RX Control Frame to =
MultiBSS
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 A-MSDU in A-MPDU
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 UL 2x996-Tone RU
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OM Control UL MU Dat=
a Disable RX
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 HE PHY Capabilities: (0x0c634088fedb831c110c00):
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HE40/HE80/5GHz
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HE160/5GHz
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Punctured Preamble R=
X: 3
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LDPC Coding in Paylo=
ad
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HE SU PPDU with 1x H=
E-LTF and 0.8us GI
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Full Bandwidth UL MU=
-MIMO
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DCM Max Constellatio=
n Rx: 1
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 SU Beamformer
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 MU Beamformer
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Beamformee STS <=3D =
80Mhz: 7
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Beamformee STS > 80M=
hz: 7
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Sounding Dimensions =
<=3D 80Mhz: 3
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Sounding Dimensions =
> 80Mhz: 3
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Ng =3D 16 SU Feedbac=
k
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Ng =3D 16 MU Feedbac=
k
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Codebook Size SU Fee=
dback
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Codebook Size MU Fee=
dback
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 PPE Threshold Presen=
t
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HE SU PPDU & HE PPDU=
 4x HE-LTF 0.8us GI
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Max NC: 3
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HE ER SU PPDU 4x HE-=
LTF 0.8us GI
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HE ER SU PPDU 1x HE-=
LTF 0.8us GI
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 TX 1024-QAM
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 RX 1024-QAM
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 HE RX MCS and NSS set <=3D 80 MHz
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 5 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 6 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 7 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 HE TX MCS and NSS set <=3D 80 MHz
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 5 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 6 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 7 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 HE RX MCS and NSS set 160 MHz
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 5 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 6 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 7 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 HE TX MCS and NSS set 160 MHz
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4 streams: MCS 0-11
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 5 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 6 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 7 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8 streams: not suppo=
rted
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 PPE Threshold 0x7b 0x1c 0xc7 0x71 0x1c 0xc7 0x71 0x1c 0xc7
> 0x71 0x1c 0xc7 0x71
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 WMM:=A0 * Parameter version 1
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * u-APSD
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * BE: CW 15-1023, AIFSN 3
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * BK: CW 15-1023, AIFSN 7
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * VI: CW 7-15, AIFSN 2, TXOP 3008 usec
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 * VO: CW 3-7, AIFSN 2, TXOP 1504 usec
>=20
> No support for EHT and therefore no MSC 12 or 13 which fits with the dmes=
g
> warning about it not being supported, is this a card firmware issue rathe=
r
> than the driver?
>=20
> I carried out some iperf tests with a server with 2.5gb ethernet to the A=
P,
>=20
>=20
> If I run iperf against the access point with one antenna at H and one at =
V,
> approx. 1000mm from the access point I see similar performance on up and
> down stream sessions, with single and multiple parallel streams.
>=20
> The iperf server is connected by 2.5gb ethernet to the access point and t=
hat
> has been tested to an aggregate of 3.6bit on wifi 7 using other cards.
>=20
> openwrt@wifi7-amd:~$ iperf3 -c 192.168.1.168 -p 5002 Connecting to host
> 192.168.1.168, port 5002 [=A0 5] local 192.168.1.144 port 46802 connected=
 to
> 192.168.1.168 port 5002 [ ID] Interval=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Tran=
sfer=A0=A0=A0=A0 Bitrate=A0=A0=A0=A0=A0=A0=A0=A0 Retr=A0 Cwnd
> [=A0 5]=A0=A0 0.00-1.00=A0=A0 sec=A0=A0 142 MBytes=A0 1.19 Gbits/sec=A0=
=A0=A0 0=A0=A0 2.63 MBytes [=A0 5]=A0=A0 1.00-
> 2.00=A0=A0 sec=A0=A0 136 MBytes=A0 1.14 Gbits/sec=A0=A0=A0 0=A0=A0 2.63 M=
Bytes [=A0 5]=A0=A0 2.00-
> 3.00=A0=A0 sec=A0=A0 134 MBytes=A0 1.13 Gbits/sec=A0=A0=A0 0=A0=A0 2.63 M=
Bytes [=A0 5]=A0=A0 3.00-
> 4.00=A0=A0 sec=A0=A0 132 MBytes=A0 1.10 Gbits/sec=A0=A0=A0 0=A0=A0 2.63 M=
Bytes [=A0 5]=A0=A0 4.00-
> 5.00=A0=A0 sec=A0=A0 136 MBytes=A0 1.15 Gbits/sec=A0=A0=A0 0=A0=A0 2.63 M=
Bytes [=A0 5]=A0=A0 5.00-
> 6.00=A0=A0 sec=A0=A0 131 MBytes=A0 1.10 Gbits/sec=A0=A0=A0 0=A0=A0 2.63 M=
Bytes [=A0 5]=A0=A0 6.00-
> 7.00=A0=A0 sec=A0=A0 130 MBytes=A0 1.09 Gbits/sec=A0=A0=A0 0=A0=A0 2.63 M=
Bytes [=A0 5]=A0=A0 7.00-
> 8.00=A0=A0 sec=A0=A0 132 MBytes=A0 1.10 Gbits/sec=A0=A0=A0 0=A0=A0 2.63 M=
Bytes [=A0 5]=A0=A0 8.00-
> 9.00=A0=A0 sec=A0=A0 134 MBytes=A0 1.13 Gbits/sec=A0=A0=A0 0=A0=A0 2.63 M=
Bytes [=A0 5]=A0=A0 9.00-
> 10.00=A0 sec=A0=A0 132 MBytes=A0 1.11 Gbits/sec=A0=A0=A0 0=A0=A0 2.63 MBy=
tes
> - - - - - - - - - - - - - - - - - - - - - - - - - [ ID]
> Interval=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Transfer=A0=A0=A0=A0 Bitrate=A0=A0=
=A0=A0=A0=A0=A0=A0 Retr [=A0 5]=A0=A0 0.00-10.00=A0 sec=A0 1.31
> GBytes=A0 1.12 Gbits/sec=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s=
ender [=A0 5]=A0=A0 0.00-10.01=A0 sec=A0 1.31
> GBytes=A0 1.12 Gbits/sec=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 receiver
>=20
> Happy to run tests as needed to check but need input on what code to use
> etc.
>=20
> Should I try another branch, I note that results in this list do show sig=
nal levels
> so assume there may be a more advanced version.
>=20
> Can I access a more recent firmware build?
>=20
> Thanks in advance,
>=20
> David Atkins
>=20


