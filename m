Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0725DC3DA64
	for <ath12k@archiver.kernel.org>; Tue,  6 Aug 2024 08:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJgNI6HnSvBr8hKl3Yl6VBiCWpW5gQN92Z40fXb3r+I=; b=DzOUhsAbqTPQUk1yoT3NkVKqQ1
	/WycIlqxb2rlmR/OeOoI/UlB4M5JtmogFzceDoXUdKGciM5qMbSvYcoC5DEpOw3cm6e27ugSFaq6C
	0JPrGXDRekZNWtpnUwZlgrFbwQqptzF2WupKZOK1W0GGOW1JxnCPkA8cpowAOaHsD11YJBWCox02d
	4YWmZqwLl55RnofEZ5VPoMjIEmTihIcNO/fFjv1WeJBCCeo1pVsFHLBESLvWr3A43G08onu/KFiKY
	UW64U96aVIoF6C7rtx2EJPuj37LlaKK8YwSts+VcoCLZBOujw4/hzTj+I3879HaXdruSQiU4f9YvY
	HJ5ZpAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbFDP-00000000siJ-322g
	for ath12k@archiver.kernel.org;
	Tue, 06 Aug 2024 08:06:43 +0000
Received: from mail-lo4gbr01on20701.outbound.protection.outlook.com ([2a01:111:f403:261a::701] helo=GBR01-LO4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbFD9-00000000sdp-24Uv
	for ath12k@lists.infradead.org;
	Tue, 06 Aug 2024 08:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMJAkgGZvMvlT/vC+VvfuldNtE7+bnaoeABFk+IN9AxyzxXckuvFqo56z91qhwbCYpjwtYyhVv2dnycM4c7tQNcu5RkO/WZwqi8qwQb8ZmdZMGSUI9eEfRve0BOi/oVNxKWgceJvdHeYRJ0iMiJVDzrDkxDsQon1dkqDnDdDd3qj4Eu/s3KNEZn/YtP4UEt6PTgcZCgYLGPyrjX9jH+awXZG8TcN1X+bhat+13+h+ijx82OIYI4WfUAOOAXjXYdAJvBbjKzSbWUstBeedlDTogyksn9arSBoczaAkQFxVx0xQL1hyoA1HZXcKmif8qcg3K5/BsKVKE7Aq0RRc7kKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJgNI6HnSvBr8hKl3Yl6VBiCWpW5gQN92Z40fXb3r+I=;
 b=QwKaIYUNDio0UCPJCUtEBUxXIJp+dJPZ9SI5ys8XywO/o2pGl7H77Xs5ikXncLN8vfoyxjGxRA0AJT2814KeyYmfzcpD0PKgdB0YUNquipOl3RaygKSBrFc/SM2LoiTC2KM9XwVNSmTqpjYCzm4VON7pJOsGuvjPkXUWMkkOIyKrXlUVpMU0NlCd7mI1Lafzo1vrjPJnSp3RGY4oTlVsUGUJfgeY8ochepxoLcRWr3fr71K//r9mus8YbJoaSk75cn8dMLX9UQDj+j9HhtRO6eBQNmJFBDkzUZZdAryJOJ+FeORnKUiI9342FnTXBeVmRXroXgZhZtPbtqwINoW6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by LO0P123MB4203.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:155::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.28; Tue, 6 Aug
 2024 08:06:21 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6%3]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 08:06:21 +0000
From: david Atkins <david@3adesign.co.uk>
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: wcn7850  issues 
Thread-Topic: wcn7850  issues 
Thread-Index: Adrny0FwHnce1PsLQ021YkDT6GU++wADCGTg
Date: Tue, 6 Aug 2024 08:06:21 +0000
Message-ID: <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
In-Reply-To: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=3adesign.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|LO0P123MB4203:EE_
x-ms-office365-filtering-correlation-id: 1727d1c8-0f36-4f72-5b40-08dcb5eea856
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?avgpv95JXtjG59B2TGVDIIktKcm0s21fvmjPVbfxXfavkd/R61QUNCK8im?=
 =?iso-8859-1?Q?xXsZ0UrSc+38PIHkFRJsVR0u4MTiX+xSY9GapUmvOVETTUvNMIJnzWy/g8?=
 =?iso-8859-1?Q?kbmFY1l/jfJSbKvc6E/1VMCBlMMCDqDICKMzFIGv6KAj8n+L0rwtYNZk8g?=
 =?iso-8859-1?Q?sHiR/Ik1GgolYIu1TjJWxZmhK2Xj0c2WCX7KHG9RuvFG4fessZo9NYIGFy?=
 =?iso-8859-1?Q?NHbyd3AnDlsjvwjo4JUTZZs+peMX4KB3Xl23+wuhGZ821uPoROdmCb6OeB?=
 =?iso-8859-1?Q?uibKo3aw+v09BCq4TFbcg68WS9994x4wkIQ14BFIBtQlBP+VzUHOQf+5lf?=
 =?iso-8859-1?Q?0NTn2opqC4O9t4+yUlIwHT88/WdodKdsaI3qYTZjYKTEuZ+RCm/jWFG46o?=
 =?iso-8859-1?Q?7+z+hYWa++43/pTdIB8XgHAM610JBfxBHfVERnv8fF8Vs0prIIcekGrGqo?=
 =?iso-8859-1?Q?DJqnT8JmCm/Q5WN8xaVzjUVZ6iHz0PLnym725ZmY2XewZU1GD+vwztCKwE?=
 =?iso-8859-1?Q?LPLQKQA/wrVm0HRHNIdcd1C5NM7fORduAqpb3a1lHr7g406eaSjaneBY0c?=
 =?iso-8859-1?Q?tI017DujfTa5XSxxDZz27IFqr/zYZ2ampVEP6sd7MTM9XWY75z4IXEoPMC?=
 =?iso-8859-1?Q?lNR6vlUdrtlxuMIvspry6JfY7U3BYmDYRA1U0Y6rukVPZZ2z3Layu/OT0E?=
 =?iso-8859-1?Q?WZn/cUS1fqArbaz+DEuPdKvEymXrjYU+zXy+kbYvZ6Qk5mEgtIHu/Kq62x?=
 =?iso-8859-1?Q?c8qn6bbbPWuQaLT9yIOpZ+DrmOyNDsLoiRQa75rxSx++RKAiOrs6Clv5CH?=
 =?iso-8859-1?Q?EVS5O6KxvL4AeCLufF0sL0niCH8VrMp1CjL4JLpN9epu3MRiUYvrEOxiwg?=
 =?iso-8859-1?Q?AvQ1bI+L87ggap5n5tOrByo0V6ieVgqoV2MvI4gm85BLrsClBQlEvsLD0g?=
 =?iso-8859-1?Q?HEECRtl4YBwl3GVgZXgEI1FgBKOWJ7wvkImxIRB1ThqLMp8TwIIwtoPS0R?=
 =?iso-8859-1?Q?3wzWbpkBRC7Uy2wB1bGPlnD467JW9MtXlvKG2jbLyAvp5YR+UF3SyM/XDA?=
 =?iso-8859-1?Q?nUNzSex54xEMiMmCUXwao6PEYxoPEc4k0p5stRFUR2awvDUAE2D5Whql/9?=
 =?iso-8859-1?Q?UlceAwP+LlEDTiC3GV7wzsvdCtD9gKyud0kEv0Lgh5AHu2bl+einb5Gfud?=
 =?iso-8859-1?Q?BI9PngljcKVKWeDmLo9q8AENAGtTdkWge2JjMnXf7VIjldsjgxjVd0y030?=
 =?iso-8859-1?Q?fwRnzwk86Nb1pfGKzAWYeETZLcg7qPlEjhXRUMyTk5pQLfsEP2gsPpy2Id?=
 =?iso-8859-1?Q?jjClCargWkPjFg+msvKfW9hgBr5OcEjFecqxVUv231xIzy3H0H6aMOwPKY?=
 =?iso-8859-1?Q?4tOYVUKWVyOrrB74WrIDD3d+n5EDMlU6SFJXRtxKn3MWb8KAHxsyxobiIN?=
 =?iso-8859-1?Q?UQkDrekzLROCvQmXbQGed0naWzkdy796G73CQg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bmFl4jWS8evZhPy+7VRiEvpxvxMk4OGU6oH2btWHGDCBushcDWYBgq8ekl?=
 =?iso-8859-1?Q?PsqtJ7QFyARwEw33/x7k7W5qj82HZk2gKHEA1I/YLVOX7XUOWXCdVK1+Cb?=
 =?iso-8859-1?Q?t9HQ34y1/KljAwC5rQt+lW/eKrPdoArluQsEWQ9FXhFkCHI3dTjP7a+Y++?=
 =?iso-8859-1?Q?JQd4gm0mHbGmZX4xC1JV2DoG79iokhs0KKLuxPyLTPvyWreBrUPmCIVOwM?=
 =?iso-8859-1?Q?GPAvIdj8/chTm0SYhoMHJVpjWAMpMRErb5Iojv9q5KDqP5k/4zwqHB9Xv6?=
 =?iso-8859-1?Q?1iDIxQc5HvMzT4jBvYqfcMYWRZ3+aE1nOGplBBaSdhDiSbuMhim0uEFrkc?=
 =?iso-8859-1?Q?TmdYd8NU7s1JiFAT9SNU1cTG0G5fLFMh3cFWzP+EDSb06CO5EyUQRQtO0Q?=
 =?iso-8859-1?Q?qYrQRaXjsYz3TKvvt/zmSW3uXgcC+VQmwaho3TEo9KkoXJtpv7I0GMPcyk?=
 =?iso-8859-1?Q?BtD7JpSlIUtqs3LYH729gwNGH6996aC2DOpGeKGJPbtopgp37PiewxDMRF?=
 =?iso-8859-1?Q?OVe4IuAhO03VsjQ/D96WCeEv+UtcFMGY7lgMe4U2PuvzbbPD0qdnP/tOFK?=
 =?iso-8859-1?Q?Xb87B62rGZ+14phqaDqYZs/St2djVs734j+mvXTf174Fc9nx9MjuIrSu6L?=
 =?iso-8859-1?Q?GdTqWDT9xHSL9d50bemHM5MEqhEXyNTZT9Ef59E6wQGTNKakBe0VymegLR?=
 =?iso-8859-1?Q?ZeqqXNcAv/MD2dEA/YdjTSR80QPmK3clV/er7GMrl7F9qnTpEI0J24Palq?=
 =?iso-8859-1?Q?g6COjfkxrG/LuUTjRyPQ59mGOd/y9FP95Wzj5LtGbOpPzYZQftxELoybV+?=
 =?iso-8859-1?Q?Sd82jOGV0ubqV8CrvGQtc1uY/gh1w6aP3zUQkeRStnbh0z1U/1rZ5BdA+j?=
 =?iso-8859-1?Q?Bl3zm0ojIJQwtnr0TTaJosJvOwKpx+jR/IYrnbV4RjK74m2d9CLMMs6v6T?=
 =?iso-8859-1?Q?PfKk48O9A/r3zKYWgxnMVWT8n5FXy7IdYrwLfoH8lyyvKGdmy3hiIR37JQ?=
 =?iso-8859-1?Q?Oy7Wdow1JI9fNXEwKr3V350oy79sb4WYVdJrfOCsdzzEwsw+gy69URVlYt?=
 =?iso-8859-1?Q?my2Yw9ZASL0YqTA9U4iAB2L9AgQ4AMA1CtzavgW6RMQIw76mHC6mt9/8Mi?=
 =?iso-8859-1?Q?MCMZ7ZwJLUNeC02it6mBvaFEiMseR0wner/iiLTcrYgYQd1GDeab02jpyK?=
 =?iso-8859-1?Q?eaecMOuDAjip/mCK8xhJ0h0keLO4pxmt9LtnwdAsNzzxBdB74zpQxZEvb/?=
 =?iso-8859-1?Q?psEEU5lMrG3xCyGkHWbpmJ3lODlB5aVBzfqrXb1P3cjjhgGbz+F+0OwFU6?=
 =?iso-8859-1?Q?vBJquk2T9TKIPUqCv+2G3aL3qyoxTyYIlVed01lNTtUhuTx1wFqsBPQ6KN?=
 =?iso-8859-1?Q?tZmh7pfDs7xpTA3+BxyJnvpf3C5f6j9IVAwwOq1pzZcvs9DejeXpTCl1/9?=
 =?iso-8859-1?Q?RbGlu0jZkhvkJ9jPF3TjEDg5Qtz6bivHMjSHCh+kKj1AXLY2LThKo7XZcJ?=
 =?iso-8859-1?Q?GWeoBX96yJXJIadOPb+a0mEUYnBhIbjGxwmHYcn+ze+2ZsqvPD8CdtM6DK?=
 =?iso-8859-1?Q?GnOxm2Qbh2ub20CxzHItFMrrKAlrYMA+Ai91guXH0KSIMIS15UGkQrhYyz?=
 =?iso-8859-1?Q?OLV+9p0sh5hY7LdDljMBPFw3fiWOposW9u?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1727d1c8-0f36-4f72-5b40-08dcb5eea856
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 08:06:21.0358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O9kDQjNmbpTLhA05ZNHPX2T6L5iHWwFhmafXvq8syrJqvVA7hjG9eE3GV7IktFzKBCuDK0/JyGVc4SiKDvILnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB4203
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_010627_727058_023CA418 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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


Hi,

I have updated the kernel we use for testing today to main from https://git=
.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/, the base install is th=
e ubuntu 24.04 desktop release=20

Kernel reports as=20


openwrt@wifi7-amd:~$ uname -a
Linux wifi7-amd 6.11.0-rc2-wt-ath+ #2 SMP PREEMPT_DYNAMIC Mon Aug=A0 5 12:0=
2:22 BST 2024 x86_64 x86_64 x86_64 GNU/Linux

Ath12k from Dmesg

mailto:openwrt@wifi7-amd:~/datkins/kalo/ath/.git$ sudo dmesg | grep ath12k
[=A0=A0=A0 3.823988] ath12k_pci 0000:01:00.0: BAR 0 [mem 0xfc600000-0xfc7ff=
fff 64bit]: assigned
[=A0=A0=A0 3.824006] ath12k_pci 0000:01:00.0: enabling device (0000 -> 0002=
)
[=A0=A0=A0 3.824305] ath12k_pci 0000:01:00.0: MSI vectors: 16
[=A0=A0=A0 3.824310] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
[=A0=A0=A0 4.372789] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 b=
oard_id 0x10e soc_id 0x40170200
[=A0=A0=A0 4.372796] ath12k_pci 0000:01:00.0: fw_version 0x100301e1 fw_buil=
d_timestamp 2023-12-06 04:05 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT=
.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
[=A0=A0=A0 4.580233] ath12k_pci 0000:01:00.0 wlp1s0: renamed from wlan0

Ip a shows

3: wlp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state U=
P group default qlen 1000
=A0=A0=A0 link/ether 00:03:7f:58:34:42 brd ff:ff:ff:ff:ff:ff
=A0=A0=A0 inet 192.168.1.144/24 brd 192.168.1.255 scope global dynamic nopr=
efixroute wlp1s0
=A0=A0=A0=A0=A0=A0 valid_lft 82448sec preferred_lft 82448sec
=A0=A0=A0 inet6 fd78:4c15:7f9d::2cf/128 scope global dynamic noprefixroute
=A0=A0=A0=A0=A0=A0 valid_lft 82450sec preferred_lft 39250sec
=A0=A0=A0 inet6 fd78:4c15:7f9d:0:3f2d:65f7:eb00:3928/64 scope global tempor=
ary dynamic
=A0=A0=A0=A0=A0=A0 valid_lft 600850sec preferred_lft 82358sec
=A0=A0=A0 inet6 fd78:4c15:7f9d:0:a184:9d87:7861:846b/64 scope global mngtmp=
addr noprefixroute
=A0=A0=A0=A0=A0=A0 valid_lft forever preferred_lft forever
=A0=A0=A0 inet6 fe80::f662:5464:1669:4fab/64 scope link noprefixroute
=A0=A0=A0=A0=A0=A0 valid_lft forever preferred_lft forever

I have set region to GB

sudo iw reg set GB

so we get=20

mailto:openwrt@wifi7-amd:~/datkins/kalo/ath/.git$ sudo iw reg get
global
country GB: DFS-ETSI
=A0=A0=A0=A0=A0=A0=A0 (2400 - 2483 @ 40), (N/A, 20), (N/A)
=A0=A0=A0=A0=A0=A0=A0 (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUT=
O-BW
=A0=A0=A0=A0=A0=A0=A0 (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DF=
S, AUTO-BW
=A0=A0=A0=A0=A0=A0=A0 (5470 - 5730 @ 160), (N/A, 26), (0 ms), DFS
=A0=A0=A0=A0=A0=A0=A0 (5725 - 5850 @ 80), (N/A, 23), (N/A), NO-OUTDOOR
=A0=A0=A0=A0=A0=A0=A0 (5925 - 6425 @ 160), (N/A, 23), (N/A), NO-OUTDOOR
=A0=A0=A0=A0=A0=A0=A0 (57000 - 71000 @ 2160), (N/A, 40), (N/A)

phy#0 (self-managed)
country na: DFS-UNSET
=A0=A0=A0=A0=A0=A0=A0 (2402 - 2472 @ 40), (N/A, 20), (N/A)
=A0=A0=A0=A0=A0=A0=A0 (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
=A0=A0=A0=A0=A0=A0=A0 (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSI=
VE-SCAN
=A0=A0=A0=A0=A0=A0=A0 (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSI=
VE-SCAN
=A0=A0=A0=A0=A0=A0=A0 (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSI=
VE-SCAN
=A0=A0=A0=A0=A0=A0=A0 (5945 - 7125 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSI=
VE-SCAN
=A0=A0=A0=A0=A0=A0=A0 (5945 - 7125 @ 320), (N/A, 30), (N/A), AUTO-BW, PASSI=
VE-SCAN

Station dump gives me

mailto:openwrt@wifi7-amd:~/datkins/kalo/ath/.git$=A0 sudo iw dev wlp1s0 sta=
tion dump
Station ac:91:9b:b7:05:b0 (on wlp1s0)
=A0=A0=A0=A0=A0=A0=A0 inactive time:=A0 1126 ms
=A0=A0=A0=A0=A0=A0=A0 rx bytes:=A0=A0=A0=A0=A0=A0 4832450328
=A0=A0=A0=A0=A0=A0=A0 rx packets:=A0=A0=A0=A0 3281108
=A0=A0=A0=A0=A0=A0=A0 tx bytes:=A0=A0=A0=A0=A0=A0 4592467521
=A0=A0=A0=A0=A0=A0=A0 tx packets:=A0=A0=A0=A0 3152967
=A0=A0=A0=A0=A0=A0=A0 tx retries:=A0=A0=A0=A0 38
=A0=A0=A0=A0=A0=A0=A0 tx failed:=A0=A0=A0=A0=A0 0
=A0=A0=A0=A0=A0=A0=A0 beacon loss:=A0=A0=A0 0
=A0=A0=A0=A0=A0=A0=A0 beacon rx:=A0=A0=A0=A0=A0 3267
=A0=A0=A0=A0=A0=A0=A0 rx drop misc:=A0=A0 1
=A0=A0=A0=A0=A0=A0=A0 signal:=A0=A0=A0=A0=A0=A0=A0=A0 0 dBm
=A0=A0=A0=A0=A0=A0=A0 beacon signal avg:=A0=A0=A0=A0=A0 -24 dBm
=A0=A0=A0=A0=A0=A0=A0 tx duration:=A0=A0=A0 0 us
=A0=A0=A0=A0=A0=A0=A0 rx bitrate:=A0=A0=A0=A0 3602.9 MBit/s 160MHz HE-MCS 1=
1 HE-NSS 3 HE-GI 0 HE-DCM 0
=A0=A0=A0=A0=A0=A0=A0 rx duration:=A0=A0=A0 0 us
=A0=A0=A0=A0=A0=A0=A0 authorized:=A0=A0=A0=A0 yes
=A0=A0=A0=A0=A0=A0=A0 authenticated:=A0 yes
=A0=A0=A0=A0=A0=A0=A0 associated:=A0=A0=A0=A0 yes
=A0=A0=A0=A0=A0=A0=A0 preamble:=A0=A0=A0=A0=A0=A0 long
=A0=A0=A0=A0=A0=A0=A0 WMM/WME:=A0=A0=A0=A0=A0=A0=A0 yes
=A0=A0=A0=A0=A0=A0=A0 MFP:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 yes
=A0=A0=A0=A0=A0=A0=A0 TDLS peer:=A0=A0=A0=A0=A0 no
=A0=A0=A0=A0=A0=A0=A0 DTIM period:=A0=A0=A0 2
=A0=A0=A0=A0=A0=A0=A0 beacon interval:100
=A0=A0=A0=A0=A0=A0=A0 short slot time:yes
=A0=A0=A0=A0=A0=A0=A0 connected time: 4038 seconds
=A0=A0=A0=A0=A0=A0=A0 associated at [boottime]:=A0=A0=A0=A0=A0=A0 13.805s
=A0=A0=A0=A0=A0=A0=A0 associated at:=A0 1722856637791 ms
=A0=A0=A0=A0=A0=A0=A0 current time:=A0=A0 1722860675019 ms


and iw dev wlp1s0 link gives me

Connected to ac:91:9b:b7:05:b0 (on wlp1s0)
=A0=A0=A0=A0=A0=A0=A0 SSID: EE-CN589H
=A0=A0=A0=A0=A0=A0=A0 freq: 6295.0
=A0=A0=A0=A0=A0=A0=A0 RX: 537531156 bytes (3281227 packets)
=A0=A0=A0=A0=A0=A0=A0 TX: 297500287 bytes (3152968 packets)
=A0=A0=A0=A0=A0=A0=A0 signal: 0 dBm
=A0=A0=A0=A0=A0=A0=A0 rx bitrate: 3602.9 MBit/s 160MHz HE-MCS 11 HE-NSS 3 H=
E-GI 0 HE-DCM 0
=A0=A0=A0=A0=A0=A0=A0 bss flags: short-slot-time
=A0=A0=A0=A0=A0=A0=A0 dtim period: 2
=A0=A0=A0=A0=A0=A0=A0 beacon int: 100

Concerned we have a report of =A0"HE-NSS 3", wifi 7 should be eht and we ha=
ve a wcn7850 which has only 2 antenna ports.

My understanding is that 160MHz HE-MCS 11 @ 160Mhz will give us 1200 Mbit/s=
 so the report of 3602 suggests its assuming it has 3 spatial streams which=
 would be incorrect

The signal level looks wrong

=A0=A0=A0=A0=A0=A0=A0 signal:=A0=A0=A0=A0=A0=A0=A0=A0 0 dBm
=A0=A0=A0=A0=A0=A0=A0 beacon signal avg:=A0=A0=A0=A0=A0 -24 dBm

we would expect that to agree with the beacon level, we see the beacon chan=
ge but the signal is always 0, I note from recent messages on the thread th=
at this has been fixed, what branch should I use to check this?

I have also seen this in dmesg during association with the AP,=20

[=A0=A0 13.049675] wlp1s0: required MCSes not supported, disabling EHT
[=A0=A0 13.304272] wlp1s0: authenticate with ac:91:9b:b7:05:b0 (local addre=
ss=3D00:03:7f:58:34:42)
[=A0=A0 13.304281] wlp1s0: send auth to ac:91:9b:b7:05:b0 (try 1/3)
[=A0=A0 13.312345] wlp1s0: authenticate with ac:91:9b:b7:05:b0 (local addre=
ss=3D00:03:7f:58:34:42)
[=A0=A0 13.312352] wlp1s0: send auth to ac:91:9b:b7:05:b0 (try 1/3)
[=A0=A0 13.314787] wlp1s0: authenticated
[=A0=A0 13.315249] wlp1s0: associate with ac:91:9b:b7:05:b0 (try 1/3)
[=A0=A0 13.321883] wlp1s0: RX AssocResp from ac:91:9b:b7:05:b0 (capab=3D0x1=
111 status=3D0 aid=3D6)
[=A0=A0 13.334818] wlp1s0: associated

Iw scan shows this for the AP in the 6Ghz band

BSS ac:91:9b:b7:05:b0(on wlp1s0) -- associated
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 TSF: 56186843682 usec (0d, 15:36:26=
)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 freq: 6135.0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 beacon interval: 100 TUs
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 capability: ESS Privacy SpectrumMgm=
t RadioMeasure (0x1111)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 signal: -28.00 dBm
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 last seen: 128 ms ago
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Information elements from Probe Res=
ponse frame:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 SSID: EE-CN589H
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Supported rates: 6.0* 9.0 12.0* 18.=
0 24.0* 36.0 48.0 54.0=20
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Country: GB=A0=A0=A0=A0=A0 Environm=
ent: bogus
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Extension ID: 201 Regulatory Class: 137 Coverage class: 0 (up to =
0m)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Power constraint: 0 dB
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Extended supported rates: 61.5*=20
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 RSN:=A0=A0=A0=A0 * Version: 1
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * Group cipher: CCMP
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * Pairwise ciphers: CCMP
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * Authentication suites: SAE
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * Capabilities: 16-PTKSA-RC 1-GTKSA-RC MFP-required MFP-capable (=
0x00cc)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BSS Load:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * station count: 1
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * channel utilisation: 3/255
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * available admission capacity: 0 [*32us]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 RM enabled capabilities:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Capabilities: 0x72 0x00 0x00 0x00 0x00
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Neighbor Report
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Beacon Passive Measurem=
ent
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Beacon Active Measureme=
nt
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Beacon Table Measuremen=
t
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Nonoperating Channel Max Measurement Duration: 0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Measurement Pilot Capability: 0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Supported operating classes:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * current operating class: 137
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Extended capabilities:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * Extended Channel Switching
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * BSS Transition
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * Multiple BSSID
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * SSID List
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * Interworking
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * WNM-Notification
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * Operating Mode Notification
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * TWT Responder Support
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * 80
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * 83
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 802.11u Interworking:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Network Options: 0x0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Network Type: 0 (Privat=
e)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 802.11u Advertisement:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 Query Response Info: 0x7f
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Query Response Length L=
imit: 127
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ANQP
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Transmit Power Envelope:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Transmit Power Envelope:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HE capabilities:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 HE MAC Capabilities (0x000d9a181840):
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 +HTC HE Supported
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 TWT Responder
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Dynamic BA Fragementati=
on Level: 1
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BSR
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Broadcast TWT
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OM Control
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Maximum A-MPDU Length E=
xponent: 3
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 RX Control Frame to Mul=
tiBSS
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 A-MSDU in A-MPDU
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 UL 2x996-Tone RU
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OM Control UL MU Data D=
isable RX
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 HE PHY Capabilities: (0x0c634088fedb831c110c00):
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HE40/HE80/5GHz
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HE160/5GHz
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Punctured Preamble RX: =
3
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LDPC Coding in Payload
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HE SU PPDU with 1x HE-L=
TF and 0.8us GI
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Full Bandwidth UL MU-MI=
MO
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DCM Max Constellation R=
x: 1
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 SU Beamformer
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 MU Beamformer
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Beamformee STS <=3D 80M=
hz: 7
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Beamformee STS > 80Mhz:=
 7
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Sounding Dimensions <=
=3D 80Mhz: 3
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Sounding Dimensions > 8=
0Mhz: 3
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Ng =3D 16 SU Feedback
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Ng =3D 16 MU Feedback
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Codebook Size SU Feedba=
ck
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Codebook Size MU Feedba=
ck
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 PPE Threshold Present
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HE SU PPDU & HE PPDU 4x=
 HE-LTF 0.8us GI
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Max NC: 3
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HE ER SU PPDU 4x HE-LTF=
 0.8us GI
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HE ER SU PPDU 1x HE-LTF=
 0.8us GI
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 TX 1024-QAM
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 RX 1024-QAM
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 HE RX MCS and NSS set <=3D 80 MHz
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 5 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 6 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 7 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 HE TX MCS and NSS set <=3D 80 MHz
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 5 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 6 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 7 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 HE RX MCS and NSS set 160 MHz
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 5 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 6 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 7 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 HE TX MCS and NSS set 160 MHz
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4 streams: MCS 0-11
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 5 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 6 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 7 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8 streams: not supporte=
d
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 PPE Threshold 0x7b 0x1c 0xc7 0x71 0x1c 0xc7 0x71 0x1c 0xc7 0x71 0=
x1c 0xc7 0x71=20
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 WMM:=A0 * Parameter version 1
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * u-APSD
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * BE: CW 15-1023, AIFSN 3
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * BK: CW 15-1023, AIFSN 7
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * VI: CW 7-15, AIFSN 2, TXOP 3008 usec
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 * VO: CW 3-7, AIFSN 2, TXOP 1504 usec

No support for EHT and therefore no MSC 12 or 13 which fits with the dmesg =
warning about it not being supported, is this a card firmware issue rather =
than the driver?

I carried out some iperf tests with a server with 2.5gb ethernet to the AP,=
=20


If I run iperf against the access point with one antenna at H and one at V,=
 approx. 1000mm from the access point I see similar performance on up and d=
own stream sessions, with single and multiple parallel streams.

The iperf server is connected by 2.5gb ethernet to the access point and tha=
t has been tested to an aggregate of 3.6bit on wifi 7 using other cards.

openwrt@wifi7-amd:~$ iperf3 -c 192.168.1.168 -p 5002
Connecting to host 192.168.1.168, port 5002
[=A0 5] local 192.168.1.144 port 46802 connected to 192.168.1.168 port 5002
[ ID] Interval=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Transfer=A0=A0=A0=A0 Bitrate=
=A0=A0=A0=A0=A0=A0=A0=A0 Retr=A0 Cwnd
[=A0 5]=A0=A0 0.00-1.00=A0=A0 sec=A0=A0 142 MBytes=A0 1.19 Gbits/sec=A0=A0=
=A0 0=A0=A0 2.63 MBytes
[=A0 5]=A0=A0 1.00-2.00=A0=A0 sec=A0=A0 136 MBytes=A0 1.14 Gbits/sec=A0=A0=
=A0 0=A0=A0 2.63 MBytes
[=A0 5]=A0=A0 2.00-3.00=A0=A0 sec=A0=A0 134 MBytes=A0 1.13 Gbits/sec=A0=A0=
=A0 0=A0=A0 2.63 MBytes
[=A0 5]=A0=A0 3.00-4.00=A0=A0 sec=A0=A0 132 MBytes=A0 1.10 Gbits/sec=A0=A0=
=A0 0=A0=A0 2.63 MBytes
[=A0 5]=A0=A0 4.00-5.00=A0=A0 sec=A0=A0 136 MBytes=A0 1.15 Gbits/sec=A0=A0=
=A0 0=A0=A0 2.63 MBytes
[=A0 5]=A0=A0 5.00-6.00=A0=A0 sec=A0=A0 131 MBytes=A0 1.10 Gbits/sec=A0=A0=
=A0 0=A0=A0 2.63 MBytes
[=A0 5]=A0=A0 6.00-7.00=A0=A0 sec=A0=A0 130 MBytes=A0 1.09 Gbits/sec=A0=A0=
=A0 0=A0=A0 2.63 MBytes
[=A0 5]=A0=A0 7.00-8.00=A0=A0 sec=A0=A0 132 MBytes=A0 1.10 Gbits/sec=A0=A0=
=A0 0=A0=A0 2.63 MBytes
[=A0 5]=A0=A0 8.00-9.00=A0=A0 sec=A0=A0 134 MBytes=A0 1.13 Gbits/sec=A0=A0=
=A0 0=A0=A0 2.63 MBytes
[=A0 5]=A0=A0 9.00-10.00=A0 sec=A0=A0 132 MBytes=A0 1.11 Gbits/sec=A0=A0=A0=
 0=A0=A0 2.63 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Transfer=A0=A0=A0=A0 Bitrate=
=A0=A0=A0=A0=A0=A0=A0=A0 Retr
[=A0 5]=A0=A0 0.00-10.00=A0 sec=A0 1.31 GBytes=A0 1.12 Gbits/sec=A0=A0=A0 0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sender
[=A0 5]=A0=A0 0.00-10.01=A0 sec=A0 1.31 GBytes=A0 1.12 Gbits/sec=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 receiver

Happy to run tests as needed to check but need input on what code to use et=
c.

Should I try another branch, I note that results in this list do show signa=
l levels so assume there may be a more advanced version.

Can I access a more recent firmware build?

Thanks in advance,

David Atkins


