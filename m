Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0181BC3DA49
	for <ath12k@archiver.kernel.org>; Thu, 25 Jul 2024 07:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bb75L7MBjd3lEiOkXgP/9162GRBCkCkdMg7Zyxeg9Wo=; b=yWjOpH3Q8UlP54vbL+tEdUtD8v
	DYMZJGrgQRZn4Ek9lu47VjqTe50qrsqEfbFQDTzc4GY1wCd2K1p3pP+6lpkeanNT555ZbKjUwjSZn
	AEChEDOm8s3m2vIrnNBg4zkmBdbHq1hWYoBkiEej9k8yJU3Sg5KkwaU67bmEw+jEsQQWFcxPCQ+Zy
	S80GnnZ3ynOelBOM+a8iVC1oinPOIs0iEYMK00hIpgNiohuv0fZY/tEUo98ig5gM0hCe52Ch8aniv
	cy5j4zhVCX6niiQS6K5VJFn3IFMUkf1phAqGjVJSHx4oKP9xFyWkX9/k/5WwAlyUH+nkK7CpMuNok
	XhUjzm5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWsw0-00000000BHR-2mv1
	for ath12k@archiver.kernel.org;
	Thu, 25 Jul 2024 07:30:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWrxL-000000001kG-255K
	for ath12k@bombadil.infradead.org;
	Thu, 25 Jul 2024 06:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=Bb75L7MBjd3lEiOkXgP/9162GRBCkCkdMg7Zyxeg9Wo=; b=YWyw1Utnbb1Jb7oUECKQRDq3Sp
	HWT4Y08UfwCiTo05NEqK15sokQPi2j44C2kBhhU3lyuAPZINIzSBw70SCuVw5RHX5BIZnTyoxC3N2
	KjPAGvSOn2zQ33YWlch5HVJVWnZcA52xTvBDK1Br2vJFCIpop86nguMTRoB08oGoecr9xjvTVn3eh
	EBJffYzRxDfCxPMm8qYCCYFFXHqOTE7o6XmN9Y3lUS5ONlfxGysRWkve4UXIcM5/KPYR6GAQaKpzk
	6kFyPnoRwG3qCf+PS+PqIPPTLwabl8b3ONit9XgtPF6Jy7JRzipC74B6F7kkpCIXsko+qpBg56s0S
	pMwoo6JA==;
Received: from mail-lo4gbr01on20700.outbound.protection.outlook.com ([2a01:111:f403:261a::700] helo=GBR01-LO4-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWrxH-00000003xV7-3BXO
	for ath12k@lists.infradead.org;
	Thu, 25 Jul 2024 06:28:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKIYc+dScmUSylKcFdPOeyyrQvVu4JS5tRbifhoeuh1LHfl+2gYCw19h1PhcOE0Kcygo9S4fV6U7NDtXZxEzDKXNIvwsqUtDkP7IuN1hbpzDXoBL7LQMCrXJfuThzL57BEjl3x0sZhtaikBCabI4RlKnN5jCxjSaRTAb3hl7v6ciKX+9R8p6h4+Oy0J4LNaPWIMgCQzrZiMcQTBAdBNrhUAw+dM/IwAfHodBEtrqfnJNH5NvXGCzV1Wz7hmOGVLAqefblCroPvGvE+pdX+bAHAFZa7EWcUesTRpzRmbxOCORI4KAFWpY0UHa97zA5X7erz4vv37ChRVhCt5pAM2FRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bb75L7MBjd3lEiOkXgP/9162GRBCkCkdMg7Zyxeg9Wo=;
 b=StKJMLw32WHcfNI2Cf9xlDTDX+J9BmY+KGwX2ZpXYgMtFmsWheLiI3b5qC7remiEspIKhcw6/xjDw8szDj+Zh9O7h35wpps5D06lQUeSs9EYtYYpuMoU0PYClV4zio36YAREO9Ozqvn7alJ9ZoYfyIuvF+wFVkV0XR4+14cuHL/XlURQxGqSKbJGVjYdptq4ccE2getSftiJ9OUCHdcuvhKfsv20giVxkVlF3oa4Ll+ks8yCR1MUEAH0aAFJntwwU9mewly23KBU6X76Fijwlk0gQoUZJDsClXOjK710yE+UyWMzN0HwLE5GpD+NuC2OPwua8O8U+Jg5zxCgZkQG3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by LOYP123MB3296.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:e7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 06:27:48 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6%3]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 06:27:48 +0000
From: david Atkins <david@3adesign.co.uk>
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH] wifi: ath12k: Support Rx PDEV HTT stats
Thread-Topic: [PATCH] wifi: ath12k: Support Rx PDEV HTT stats
Thread-Index: AQHa3lV/4+XX458mPUS6pROCFHRjbLIG+H6g
Date: Thu, 25 Jul 2024 06:27:48 +0000
Message-ID: <LO0P123MB40573B6A94FB2775E73F0211D6AB2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
References: <20240725054227.986851-1-quic_rgnanase@quicinc.com>
In-Reply-To: <20240725054227.986851-1-quic_rgnanase@quicinc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=3adesign.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|LOYP123MB3296:EE_
x-ms-office365-filtering-correlation-id: 32d3922e-22a9-4c85-6a7f-08dcac72e736
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?XWF5Bxe2KIvewHCMbPvnb7+t/7S5/42S9yp3I39KwZER3M4+4VbKjEeac72m?=
 =?us-ascii?Q?RSUnftYPIg6ekzo/prJ13Vg0L2v61lvWy5EiBpUGyjka03e7L3dMBToseo5u?=
 =?us-ascii?Q?N8ue6ydjvWE/Ort5q5JiVnqyGlUpjwHg+ppxxaw7FMeOENj6tOjFAim/Ts3Z?=
 =?us-ascii?Q?WN9KHtqIsx/zQ30xMfvCX8XXIVuZY2NYExkxJ5cmRMMbzdPJVifAJk/uCHmD?=
 =?us-ascii?Q?m/0MjLtItc7YKq03gXHtwDsABrwR0rINcD+sVqjXSG1RlXgfxp8U1Ay7sn+J?=
 =?us-ascii?Q?GwkBw4fMQ2RGHBevzsIXjEuEbQwwLLg8oNCo9cqurgnc45aingnUPAhG+NeA?=
 =?us-ascii?Q?NjhZgKOMHx8lAzbjZ5FXKU8nYj8zYa4o2w1PfwN0bzyc2214vPB6Tio2tTau?=
 =?us-ascii?Q?ZgBWSsh+adLUg/pSeLGDAOEK2fjie8Zak67T5RDcL6/anEiJqtJzPr7cujnD?=
 =?us-ascii?Q?Tc9zfNV7gK2Isezshumo3gy0+DhScMXvJs9lboJIEQNXAhsaWVWUmJ/oLKvG?=
 =?us-ascii?Q?f3D8cqp1HjRJfzBrKiu9PMm/Q2gYs+wDo86LdawfIik7ycGjPxd09uly3cbr?=
 =?us-ascii?Q?rBoRSh4rvBFEJmt3VhUt5468ABLRpIDdfkidjnTQ4tSRKYfqsWwgMoq5WElg?=
 =?us-ascii?Q?Hz95fjbdqhzRTk37JH3cXxZZyy9wUH3bkfKNRBcVLYBFGMuJ3WgEYQoom615?=
 =?us-ascii?Q?6FTJf0604/S/I2XwjSoy2vuBMnF0s/XPTes0+eufoR2QYBsJeL/QXnWAYJ0E?=
 =?us-ascii?Q?pP+0kyIdKsRg3PzudNdqB4R0Lf5onwjtOziSJrvrHjnkXHk177O1kaiRUN2n?=
 =?us-ascii?Q?ddkX4JurzW7/CeVggn1E66nbv1bzsRoyo5jqMdZUmrrv0QWX2nTaD+KCLXdm?=
 =?us-ascii?Q?BJknzHF79RkU14BqIa7dbMbqo+GN1bLBBQFidz9aACi4hDP98eOgGQzd2tGT?=
 =?us-ascii?Q?PO40M2NlP29NPYo9mlgXpMwja10huv296NHwiQzPaOx3io44y4aZdgnhr+gv?=
 =?us-ascii?Q?xpMysh6dFvPn0QKDM9gwoY6nxOcJHZr6pRNzvgTf0PBhtOIoiJBLBCWAB2Ch?=
 =?us-ascii?Q?FKTovKv2CP1nHbxvpfYH6Qfo3iuOz+jYKsDoSUxplTjXjoCt4FqjLOKIqn6s?=
 =?us-ascii?Q?m3EgeK/qlLwV5o8pXiaQiJrw6COfVvpw17Y7euS0EcHKsL7g5w0IlE7N9EHg?=
 =?us-ascii?Q?0+gT8kqyal2MV4TeVbrEUf4tRB6FFdcCUCNehEuybsMPWgiqRL1l9b++dG7Q?=
 =?us-ascii?Q?eBZ3JJcxC3CjClkfCw2z2pLDP517GaFJJ2olEs1qq5w0MmesyVZqKSe/S99F?=
 =?us-ascii?Q?JgzkxC439Fwxp9FRq7G82dI+LtpBCST7k9TC5KhjhMp3Na01kPi7dQv9tslz?=
 =?us-ascii?Q?SINnVeBuVmS0axFYXn/r/lhAQuXoqEp7Bf61UIBmgP4Y7OV+LA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VjpmZCbuPFVOVRHSou76tG3mBY7q0QJ7+UZwwEq0zO4kxdYq/HWc+PM1D5l2?=
 =?us-ascii?Q?KKDbCgQq4/TabDvdgSoK9Cp3chD00p5IJNMAtDl3KMyVJHgOrLKCphKGLrhR?=
 =?us-ascii?Q?+9S8lueD8OGz7LA7IEss8NvLBu12VVN8HM7w0Syo0uZzL4e5YjMc1A9XCJlt?=
 =?us-ascii?Q?oEqKeT2m0Y/WLq1GhEhfQGT5qaoTXkohH+oB7asNrObc9mutz4pPmhNKycw4?=
 =?us-ascii?Q?hXWv9B4k/aRV4sZSd1St5AXpenBc2fdWCg8TlKeYVoIDMj6U/xhWvwbpN+0d?=
 =?us-ascii?Q?4kpSs5uZLa8D7xSe25S8+Z7jiXegGAw4IQ6pCNhn3rfUCRZUd8IPOhxWQU0o?=
 =?us-ascii?Q?Ny7+nCq91b5rq02ey52ih2GVebEeD94lMeyo+yGvUTRcPYPE9aIc+VDz0mRs?=
 =?us-ascii?Q?LVyWBz+rEsUXDzQ3djGRcR3JxOGLloe6gdib/rHoT4ef/DqYuWm3Jm2QZdG6?=
 =?us-ascii?Q?Cf3d1fxWL71TFu9WQQ65nWMZNZOBj6N1Zs8Yzw3jV6xWBGl6PQN7XWWFk6lM?=
 =?us-ascii?Q?r6ku+zcWso1ogkvUHbZQw3DboC/SCQnRrGxme7B1NgdZTVctKWWlgFXNmeL+?=
 =?us-ascii?Q?YLJuQrIvKa8LjCQKxMBgqpsR53sBjdHLPBdvPe5t44nQH+ObDIDO/CPbaPHt?=
 =?us-ascii?Q?eQkGanQRKLwDObfaDQTIYjb78TZPZHdixj5JGK8ZkA1dig6ZtSlVuxTg4Bom?=
 =?us-ascii?Q?tQdVZ7gnU5cb+PIiHnpnqQkrgnWx8IT5rFIoHPTGzWh6sg5vMbeK8c8NLrbt?=
 =?us-ascii?Q?kR/1BwzvIpOHv6591bu+UQgyf4IGXYUyY+IylY2h+YGXrBp4kRBKiEOKfO1j?=
 =?us-ascii?Q?an8ic173UfsTq6JPNMnSJ6f+heDI2ZaH7fUjhlNoGVvWkCbirCsOkvylZVbT?=
 =?us-ascii?Q?n9VmE5NyQYp7W8eTQJ7ULah+GZycQ0WGL9C+FtksAYih+sHeLsG2S/D6ZGsB?=
 =?us-ascii?Q?MNtGjVpkCX6j7fKNEfuOFQckT6zhjosdhZ3T3Yanh11B30J6AeC3gjfZw0SU?=
 =?us-ascii?Q?wtI+zGywsRE/QXh3qICO6q3PmjuvoVg36WJVF6WlLh35e9HSA3QDTFs2td9Q?=
 =?us-ascii?Q?jACNuXfyY9alvk0FqXtQPe541jYe24ITGaPLR98MrzsQuKmjzQPzT929IVO5?=
 =?us-ascii?Q?tdtkO7gCcFs+SpDqPJvMj2DG1WjfUVflcOyqqVWSwXDgTiIJDhkNneG8KHtP?=
 =?us-ascii?Q?5DqfabmGAov11tIw4Kpimz8Vadac374ugT1T8et9Ct7bec8/yjZsZlp5kz/n?=
 =?us-ascii?Q?sNYMBUfQC9pXy41AYRBW0mTAZEYviiRy+1U427jF6AjLPrikMfh5NAm3b0PP?=
 =?us-ascii?Q?11miSviDV6vLTiuA8gE0ekD3R1blhmAv2hZXm6PouLW6VYfuJ5ywnHVpgD07?=
 =?us-ascii?Q?hzzxkuWsnchvMHNOuoohtTkUSPY8DidmBh6D+H58atNMDkEmxp4vkfrfe/nQ?=
 =?us-ascii?Q?/TMPK2mDAyoAnMEPh9VPAyqbD8d/QKH+ED6scaZcCbtyoHUn2WCGFE5vWChx?=
 =?us-ascii?Q?15QdrwMeWK5KL5KTENQwoxNJ/rdJGWcKZM6dhtDBJVfZkj+snGcyRLr2wylq?=
 =?us-ascii?Q?QM4OXk4krJexALM85XMU4LCCZC+ByQRBJ5L9rQbE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d3922e-22a9-4c85-6a7f-08dcac72e736
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2024 06:27:48.4685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B7eOs6c+dttNX4oGo84MuGx+RoBiTsv30ZGhAtQodRnRDm5S/sUjNzGLoq/RjcShRltfiryIoL/o6pfk9htZlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB3296
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_072800_068466_68E542F2 
X-CRM114-Status: GOOD (  15.21  )
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

Just retested the WCN7850 on systems to see if its working on Wifi-7 for me=
.

Initial results promising but driver fails after a few minutes, do see 1 gi=
ga bit/s for a while with iperf3

Afte checking "iw scan" results I'm only seeing MCS 0-11 for the Wi-Fi 7 ac=
cess points and no eht entries
=20
Looking into the dmesg logs is see this (many lines cut to just ath12k rele=
vant)

[    0.000000] Linux version 6.10.0-rc7-wt-ath+ (root@wifi7-amd) (gcc (Ubun=
tu 13.2.0-23ubuntu4) 13.2.0, GNU ld (GNU Binutils for Ubuntu) 2.42) #1 SMP =
PREEMPT_DYNAMIC Mon Jul 22 15:00:18 BST 2024
[    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-6.10.0-rc7-wt-ath+ =
root=3DUUID=3D2bd2d7a8-7ae2-4ab9-8905-770c0ad4ba20 ro quiet splash vt.hando=
ff=3D7
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD

[    3.357900] ath12k_pci 0000:01:00.0: BAR 0 [mem 0xfc600000-0xfc7fffff 64=
bit]: assigned
[    3.357916] ath12k_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    3.358191] ath12k_pci 0000:01:00.0: MSI vectors: 16
[    3.358195] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
[    3.386444] NET: Registered PF_QIPCRTR protocol family
[    3.442566] mhi mhi0: Requested to power ON
[    3.442579] mhi mhi0: Power on setup success
[    3.533238] mhi mhi0: Wait for device to enter SBL or Mission mode

[    3.917435] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_i=
d 0x10e soc_id 0x40170200
[    3.917441] ath12k_pci 0000:01:00.0: fw_version 0x100301e1 fw_build_time=
stamp 2023-12-06 04:05 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c=
5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
[    4.116000] ath12k_pci 0000:01:00.0 wlp1s0: renamed from wlan0


[   13.049675] wlp1s0: required MCSes not supported, disabling EHT
[   13.304272] wlp1s0: authenticate with ac:91:9b:b7:05:b0 (local address=
=3D00:03:7f:58:34:42)
[   13.304281] wlp1s0: send auth to ac:91:9b:b7:05:b0 (try 1/3)
[   13.312345] wlp1s0: authenticate with ac:91:9b:b7:05:b0 (local address=
=3D00:03:7f:58:34:42)
[   13.312352] wlp1s0: send auth to ac:91:9b:b7:05:b0 (try 1/3)
[   13.314787] wlp1s0: authenticated
[   13.315249] wlp1s0: associate with ac:91:9b:b7:05:b0 (try 1/3)
[   13.321883] wlp1s0: RX AssocResp from ac:91:9b:b7:05:b0 (capab=3D0x1111 =
status=3D0 aid=3D6)
[   13.334818] wlp1s0: associated

Do I need to use different firmware, I have this.

openwrt@wifi7-amd:/usr/lib/firmware/ath12k/WCN7850/hw2.0$ ls -lt
total 2932
-rw-r--r-- 1 root root 2821564 May  6 09:17 amss.bin.zst
-rw-r--r-- 1 root root   21517 May  6 09:17 board-2.bin.zst
-rw-r--r-- 1 root root  139662 May  6 09:17 m3.bin.zst
-rw-r--r-- 1 root root   10699 May  6 09:17 Notice.txt.zst
openwrt@wifi7-amd:/usr/lib/firmware/ath12k/WCN7850/hw2.0$

David


> -----Original Message-----
> From: ath12k <ath12k-bounces@lists.infradead.org> On Behalf Of Ramya
> Gnanasekar
> Sent: Thursday, July 25, 2024 6:42 AM
> To: ath12k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org; Dinesh Karthikeyan
> <quic_dinek@quicinc.com>; Ramya Gnanasekar
> <quic_rgnanase@quicinc.com>
> Subject: [PATCH] wifi: ath12k: Support Rx PDEV HTT stats
>=20
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
>=20
> Add support to parse and dump the Rx PDEV related stats such as SOC stats=
,
> PHY error, MPDU error through htt stats type 2.
>=20
> Sample output:
> -------------
> echo 2 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
>=20
> HTT_RX_PDEV_FW_STATS_TLV:
> mac_id =3D 0
> ppdu_recvd =3D 215
> mpdu_cnt_fcs_ok =3D 215
> mpdu_cnt_fcs_err =3D 0
> tcp_msdu_cnt =3D 0
> tcp_ack_msdu_cnt =3D 0
> udp_msdu_cnt =3D 0
> other_msdu_cnt =3D 215
> fw_ring_mpdu_ind =3D 215
> fw_ring_mgmt_subtype =3D  0:0, 1:0, 2:0, 3:0, 4:21, 5:1, 6:0, 7:0, 8:193,=
 9:0, 10:0,
> 11:0, 12:0, 13:0, 14:0, 15:0 fw_ring_ctrl_subtype =3D  0:0, 1:0, 2:0, 3:0=
, 4:0, 5:0,
> 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0 fw_ring_mcast_data=
_msdu =3D
> 0 fw_ring_bcast_data_msdu =3D 0 fw_ring_ucast_data_msdu =3D 0
> fw_ring_null_data_msdu =3D 0 fw_ring_mpdu_drop =3D 0
> ofld_local_data_ind_cnt =3D 0 ofld_local_data_buf_recycle_cnt =3D 0
> drx_local_data_ind_cnt =3D 0 drx_local_data_buf_recycle_cnt =3D 0
> local_nondata_ind_cnt =3D 215 local_nondata_buf_recycle_cnt =3D 215
> fw_status_buf_ring_refill_cnt =3D 215 fw_status_buf_ring_empty_cnt =3D 0
> fw_pkt_buf_ring_refill_cnt =3D 215 fw_pkt_buf_ring_empty_cnt =3D 0
> fw_link_buf_ring_refill_cnt =3D 215 fw_link_buf_ring_empty_cnt =3D 0
> host_pkt_buf_ring_refill_cnt =3D 0 host_pkt_buf_ring_empty_cnt =3D 0
> mon_pkt_buf_ring_refill_cnt =3D 0 mon_pkt_buf_ring_empty_cnt =3D 0
> mon_status_buf_ring_refill_cnt =3D 0 mon_status_buf_ring_empty_cnt =3D 0
> mon_desc_buf_ring_refill_cnt =3D 0 mon_desc_buf_ring_empty_cnt =3D 0
> mon_dest_ring_update_cnt =3D 0 mon_dest_ring_full_cnt =3D 0 rx_suspend_cn=
t =3D
> 0 rx_resume_fail_cnt =3D 0 rx_ring_switch_cnt =3D 0 rx_ring_restore_cnt =
=3D 0
> rx_flush_cnt =3D 0 rx_recovery_reset_cnt =3D 0
>=20
> HTT_RX_PDEV_FW_RING_MPDU_ERR_TLV:
> fw_ring_mpdu_err =3D  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 1=
0:0, 11:0,
> 12:0, 13:0, 14:0, 15:0
>=20
> HTT_RX_PDEV_FW_MPDU_DROP_TLV:
> fw_mpdu_drop =3D  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0,=
 11:0, 12:0,
> 13:0, 14:0, 15:0
>=20
> HTT_RX_SOC_FW_STATS_TLV:
> fw_reo_ring_data_msdu =3D 0
> fw_to_host_data_msdu_bcmc =3D 0
> fw_to_host_data_msdu_uc =3D 0
> ofld_remote_data_buf_recycle_cnt =3D 0
> ofld_remote_free_buf_indication_cnt =3D 0
> ofld_buf_to_host_data_msdu_uc =3D 0
> reo_fw_ring_to_host_data_msdu_uc =3D 0
> wbm_sw_ring_reap =3D 0
> wbm_forward_to_host_cnt =3D 0
> wbm_target_recycle_cnt =3D 0
> target_refill_ring_recycle_cnt =3D 0
>=20
> HTT_RX_SOC_FW_REFILL_RING_EMPTY_TLV:
> refill_ring_empty_cnt =3D  0:0, 1:0, 2:0, 3:0
>=20
> HTT_RX_SOC_FW_REFILL_RING_NUM_REFILL_TLV:
> refill_ring_num_refill =3D  0:0, 1:0, 2:0, 3:0
>=20
> HTT_RX_SOC_FW_REFILL_RING_NUM_RXDMA_ERR_TLV:
> rxdma_err =3D  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11=
:0, 12:0, 13:0,
> 14:0, 15:0
>=20
> HTT_RX_SOC_FW_REFILL_RING_NUM_REO_ERR_TLV:
> reo_err =3D  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0=
, 12:0, 13:0,
> 14:0, 15:0
>=20
> HTT_RX_PDEV_FW_STATS_PHY_ERR_TLV:
> mac_id_word =3D 0
> total_phy_err_nct =3D 0
> phy_errs =3D  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:=
0, 12:0, 13:0,
> 14:0, 15:0, 16:0, 17:0, 18:0, 19:0, 20:0, 21:0, 22:0, 23:0, 24:0, 25:0, 2=
6:0, 27:0,
> 28:0, 29:0, 30:0, 31:0, 32:0, 33:0, 34:0, 35:0, 36:0, 37:0, 38:0, 39:0, 4=
0:0, 41:0,
> 42:0
>=20
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-
> QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-
> QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>=20
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/debugfs.h     |   2 +
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 342 ++++++++++++++++++
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   | 138 +++++++
>  3 files changed, 482 insertions(+)
>=20
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.h
> b/drivers/net/wireless/ath/ath12k/debugfs.h
> index 8d64ba03aa9a..00b34e00cdf2 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.h
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.h
> @@ -7,6 +7,8 @@
>  #ifndef _ATH12K_DEBUGFS_H_
>  #define _ATH12K_DEBUGFS_H_
>=20
> +#define IEEE80211_MGMT_FRAME_SUBTYPE_MAX	16
> +
>  #ifdef CONFIG_ATH12K_DEBUGFS
>  void ath12k_debugfs_soc_create(struct ath12k_base *ab);  void
> ath12k_debugfs_soc_destroy(struct ath12k_base *ab); diff --git
> a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index f1b7e74aefe4..c2b0bb134c11 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -1447,6 +1447,320 @@ ath12k_htt_print_tx_de_compl_stats_tlv(const
> void *tag_buf, u16 tag_len,
>  	stats_req->buf_len =3D len;
>  }
>=20
> +static void htt_print_rx_pdev_fw_stats_tlv(const void *tag_buf, u16 tag_=
len,
> +					   struct debug_htt_stats_req
> *stats_req) {
> +	const struct ath12k_htt_rx_pdev_fw_stats_tlv *htt_stats_buf =3D
> tag_buf;
> +	u8 *buf =3D stats_req->buf;
> +	u32 len =3D stats_req->buf_len;
> +	u32 buf_len =3D ATH12K_HTT_STATS_BUF_SIZE;
> +	u32 mac_id_word;
> +
> +	if (tag_len < sizeof(*htt_stats_buf))
> +		return;
> +
> +	mac_id_word =3D  __le32_to_cpu(htt_stats_buf->mac_id_word);
> +
> +	len +=3D scnprintf(buf + len, buf_len - len,
> "HTT_RX_PDEV_FW_STATS_TLV:\n");
> +	len +=3D scnprintf(buf + len, buf_len - len, "mac_id =3D %d\n",
> +			 u32_get_bits(mac_id_word,
> ATH12K_HTT_STATS_MAC_ID));
> +	len +=3D scnprintf(buf + len, buf_len - len, "ppdu_recvd =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf->ppdu_recvd));
> +	len +=3D scnprintf(buf + len, buf_len - len, "mpdu_cnt_fcs_ok =3D %u\n"=
,
> +			 le32_to_cpu(htt_stats_buf->mpdu_cnt_fcs_ok));
> +	len +=3D scnprintf(buf + len, buf_len - len, "mpdu_cnt_fcs_err =3D %u\n=
",
> +			 le32_to_cpu(htt_stats_buf->mpdu_cnt_fcs_err));
> +	len +=3D scnprintf(buf + len, buf_len - len, "tcp_msdu_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf->tcp_msdu_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "tcp_ack_msdu_cnt =3D %u\n=
",
> +			 le32_to_cpu(htt_stats_buf->tcp_ack_msdu_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "udp_msdu_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf->udp_msdu_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "other_msdu_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf->other_msdu_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "fw_ring_mpdu_ind =3D %u\n=
",
> +			 le32_to_cpu(htt_stats_buf->fw_ring_mpdu_ind));
> +
> +	len +=3D print_array_to_buf(buf, len, "fw_ring_mgmt_subtype",
> +				  htt_stats_buf->fw_ring_mgmt_subtype,
> +				  IEEE80211_MGMT_FRAME_SUBTYPE_MAX,
> "\n");
> +
> +	len +=3D print_array_to_buf(buf, len, "fw_ring_ctrl_subtype",
> +				  htt_stats_buf->fw_ring_ctrl_subtype,
> +				  IEEE80211_MGMT_FRAME_SUBTYPE_MAX,
> "\n");
> +
> +	len +=3D scnprintf(buf + len, buf_len - len, "fw_ring_mcast_data_msdu =
=3D
> %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >fw_ring_mcast_data_msdu));
> +	len +=3D scnprintf(buf + len, buf_len - len, "fw_ring_bcast_data_msdu =
=3D
> %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >fw_ring_bcast_data_msdu));
> +	len +=3D scnprintf(buf + len, buf_len - len, "fw_ring_ucast_data_msdu =
=3D
> %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >fw_ring_ucast_data_msdu));
> +	len +=3D scnprintf(buf + len, buf_len - len, "fw_ring_null_data_msdu =
=3D
> %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >fw_ring_null_data_msdu));
> +	len +=3D scnprintf(buf + len, buf_len - len, "fw_ring_mpdu_drop =3D
> %u\n",
> +			 le32_to_cpu(htt_stats_buf->fw_ring_mpdu_drop));
> +	len +=3D scnprintf(buf + len, buf_len - len, "ofld_local_data_ind_cnt =
=3D
> %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >ofld_local_data_ind_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> +			 "ofld_local_data_buf_recycle_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >ofld_local_data_buf_recycle_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "drx_local_data_ind_cnt =
=3D
> %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >drx_local_data_ind_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> +			 "drx_local_data_buf_recycle_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >drx_local_data_buf_recycle_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "local_nondata_ind_cnt =3D
> %u\n",
> +			 le32_to_cpu(htt_stats_buf->local_nondata_ind_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> "local_nondata_buf_recycle_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >local_nondata_buf_recycle_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> "fw_status_buf_ring_refill_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >fw_status_buf_ring_refill_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> "fw_status_buf_ring_empty_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >fw_status_buf_ring_empty_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "fw_pkt_buf_ring_refill_cn=
t =3D
> %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >fw_pkt_buf_ring_refill_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "fw_pkt_buf_ring_empty_cnt
> =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >fw_pkt_buf_ring_empty_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "fw_link_buf_ring_refill_c=
nt =3D
> %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >fw_link_buf_ring_refill_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "fw_link_buf_ring_empty_cn=
t
> =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >fw_link_buf_ring_empty_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "host_pkt_buf_ring_refill_=
cnt
> =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >host_pkt_buf_ring_refill_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> "host_pkt_buf_ring_empty_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >host_pkt_buf_ring_empty_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "mon_pkt_buf_ring_refill_c=
nt
> =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >mon_pkt_buf_ring_refill_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> "mon_pkt_buf_ring_empty_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >mon_pkt_buf_ring_empty_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> +			 "mon_status_buf_ring_refill_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >mon_status_buf_ring_refill_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> "mon_status_buf_ring_empty_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >mon_status_buf_ring_empty_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> "mon_desc_buf_ring_refill_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >mon_desc_buf_ring_refill_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> "mon_desc_buf_ring_empty_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >mon_desc_buf_ring_empty_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "mon_dest_ring_update_cnt
> =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >mon_dest_ring_update_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "mon_dest_ring_full_cnt =
=3D
> %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >mon_dest_ring_full_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "rx_suspend_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf->rx_suspend_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "rx_resume_fail_cnt =3D %u=
\n",
> +			 le32_to_cpu(htt_stats_buf->rx_resume_fail_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "rx_ring_switch_cnt =3D %u=
\n",
> +			 le32_to_cpu(htt_stats_buf->rx_ring_switch_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "rx_ring_restore_cnt =3D %=
u\n",
> +			 le32_to_cpu(htt_stats_buf->rx_ring_restore_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "rx_flush_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf->rx_flush_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "rx_recovery_reset_cnt =3D
> %u\n\n",
> +			 le32_to_cpu(htt_stats_buf->rx_recovery_reset_cnt));
> +
> +	stats_req->buf_len =3D len;
> +}
> +
> +static void
> +htt_print_rx_pdev_fw_ring_mpdu_err_tlv(const void *tag_buf, u16 tag_len,
> +				       struct debug_htt_stats_req *stats_req) {
> +	const struct ath12k_htt_rx_pdev_fw_ring_mpdu_err_tlv
> *htt_stats_buf =3D tag_buf;
> +	u8 *buf =3D stats_req->buf;
> +	u32 len =3D stats_req->buf_len;
> +	u32 buf_len =3D ATH12K_HTT_STATS_BUF_SIZE;
> +	u16 num_elems =3D min_t(u16, (tag_len >> 2),
> +			      ATH12K_HTT_RX_STATS_RXDMA_MAX_ERR);
> +
> +	len +=3D scnprintf(buf + len, buf_len - len,
> +			 "HTT_RX_PDEV_FW_RING_MPDU_ERR_TLV:\n");
> +
> +	len +=3D print_array_to_buf(buf, len, "fw_ring_mpdu_err",
> +				  htt_stats_buf->fw_ring_mpdu_err,
> +				  num_elems, "\n\n");
> +	stats_req->buf_len =3D len;
> +}
> +
> +static void
> +htt_print_rx_pdev_fw_mpdu_drop_tlv(const void *tag_buf,
> +				   u16 tag_len,
> +				   struct debug_htt_stats_req *stats_req) {
> +	const struct ath12k_htt_rx_pdev_fw_mpdu_drop_tlv *htt_stats_buf =3D
> tag_buf;
> +	u8 *buf =3D stats_req->buf;
> +	u32 len =3D stats_req->buf_len;
> +	u32 buf_len =3D ATH12K_HTT_STATS_BUF_SIZE;
> +	u16 num_elems =3D min_t(u16, (tag_len >> 2),
> +
> ATH12K_HTT_RX_STATS_FW_DROP_REASON_MAX);
> +
> +	len +=3D scnprintf(buf + len, buf_len - len,
> +"HTT_RX_PDEV_FW_MPDU_DROP_TLV:\n");
> +
> +	len +=3D print_array_to_buf(buf, len, "fw_mpdu_drop",
> +				  htt_stats_buf->fw_mpdu_drop,
> +				  num_elems, "\n\n");
> +	stats_req->buf_len =3D len;
> +}
> +
> +static void
> +htt_print_rx_soc_fw_stats_tlv(const void *tag_buf, u16 tag_len,
> +			      struct debug_htt_stats_req *stats_req) {
> +	const struct ath12k_htt_rx_soc_fw_stats_tlv *htt_stats_buf =3D tag_buf;
> +	u8 *buf =3D stats_req->buf;
> +	u32 len =3D stats_req->buf_len;
> +	u32 buf_len =3D ATH12K_HTT_STATS_BUF_SIZE;
> +
> +	if (tag_len < sizeof(*htt_stats_buf))
> +		return;
> +
> +	len +=3D scnprintf(buf + len, buf_len - len,
> "HTT_RX_SOC_FW_STATS_TLV:\n");
> +	len +=3D scnprintf(buf + len, buf_len - len, "fw_reo_ring_data_msdu =3D
> %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >fw_reo_ring_data_msdu));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> "fw_to_host_data_msdu_bcmc =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >fw_to_host_data_msdu_bcmc));
> +	len +=3D scnprintf(buf + len, buf_len - len, "fw_to_host_data_msdu_uc
> =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >fw_to_host_data_msdu_uc));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> +			 "ofld_remote_data_buf_recycle_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >ofld_remote_data_buf_recycle_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> +			 "ofld_remote_free_buf_indication_cnt =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >ofld_remote_free_buf_indication_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> +			 "ofld_buf_to_host_data_msdu_uc =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >ofld_buf_to_host_data_msdu_uc));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> +			 "reo_fw_ring_to_host_data_msdu_uc =3D %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >reo_fw_ring_to_host_data_msdu_uc));
> +	len +=3D scnprintf(buf + len, buf_len - len, "wbm_sw_ring_reap =3D %u\n=
",
> +			 le32_to_cpu(htt_stats_buf->wbm_sw_ring_reap));
> +	len +=3D scnprintf(buf + len, buf_len - len, "wbm_forward_to_host_cnt =
=3D
> %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >wbm_forward_to_host_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len, "wbm_target_recycle_cnt =
=3D
> %u\n",
> +			 le32_to_cpu(htt_stats_buf-
> >wbm_target_recycle_cnt));
> +	len +=3D scnprintf(buf + len, buf_len - len,
> +			 "target_refill_ring_recycle_cnt =3D %u\n\n",
> +			 le32_to_cpu(htt_stats_buf-
> >target_refill_ring_recycle_cnt));
> +
> +	stats_req->buf_len =3D len;
> +}
> +
> +static void
> +htt_print_rx_soc_fw_refill_ring_empty_tlv(const void *tag_buf,
> +					  u16 tag_len,
> +					  struct debug_htt_stats_req
> *stats_req) {
> +	const struct ath12k_htt_rx_soc_fw_refill_ring_empty_tlv
> *htt_stats_buf =3D tag_buf;
> +	u8 *buf =3D stats_req->buf;
> +	u32 len =3D stats_req->buf_len;
> +	u32 buf_len =3D ATH12K_HTT_STATS_BUF_SIZE;
> +	u16 num_elems =3D min_t(u16, (tag_len >> 2),
> +			      ATH12K_HTT_RX_STATS_REFILL_MAX_RING);
> +
> +	len +=3D scnprintf(buf + len, buf_len - len,
> +			 "HTT_RX_SOC_FW_REFILL_RING_EMPTY_TLV:\n");
> +
> +	len +=3D print_array_to_buf(buf, len, "refill_ring_empty_cnt",
> +				  htt_stats_buf->refill_ring_empty_cnt,
> +				  num_elems, "\n\n");
> +
> +	stats_req->buf_len =3D len;
> +}
> +
> +static void
> +htt_print_rx_soc_fw_refill_ring_num_refill_tlv(const void *tag_buf,
> +					       u16 tag_len,
> +					       struct debug_htt_stats_req
> *stats_req) {
> +	const struct ath12k_htt_rx_soc_fw_refill_ring_num_refill_tlv
> *htt_stats_buf =3D
> +
> 	tag_buf;
> +	u8 *buf =3D stats_req->buf;
> +	u32 len =3D stats_req->buf_len;
> +	u32 buf_len =3D ATH12K_HTT_STATS_BUF_SIZE;
> +	u16 num_elems =3D min_t(u16, (tag_len >> 2),
> +
> ATH12K_HTT_RX_STATS_REFILL_MAX_RING);
> +
> +	len +=3D scnprintf(buf + len, buf_len - len,
> +
> "HTT_RX_SOC_FW_REFILL_RING_NUM_REFILL_TLV:\n");
> +
> +	len +=3D print_array_to_buf(buf, len, "refill_ring_num_refill",
> +			   htt_stats_buf->refill_ring_num_refill,
> +			   num_elems, "\n\n");
> +
> +	stats_req->buf_len =3D len;
> +}
> +
> +static void
> +htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv(const void *tag_buf,
> +						  u16 tag_len,
> +						  struct debug_htt_stats_req
> *stats_req) {
> +	const struct ath12k_htt_rx_soc_fw_refill_ring_num_rxdma_err_tlv
> *htt_stats_buf =3D
> +		tag_buf;
> +	u8 *buf =3D stats_req->buf;
> +	u32 len =3D stats_req->buf_len;
> +	u32 buf_len =3D ATH12K_HTT_STATS_BUF_SIZE;
> +	u16 num_elems =3D min_t(u16, (tag_len >> 2),
> +ATH12K_HTT_RX_RXDMA_MAX_ERR_CODE);
> +
> +	len +=3D scnprintf(buf + len, buf_len - len,
> +
> "HTT_RX_SOC_FW_REFILL_RING_NUM_RXDMA_ERR_TLV:\n");
> +
> +	len +=3D print_array_to_buf(buf, len, "rxdma_err", htt_stats_buf-
> >rxdma_err,
> +				  num_elems, "\n\n");
> +
> +	stats_req->buf_len =3D len;
> +}
> +
> +static void
> +htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv(const void *tag_buf,
> +						u16 tag_len,
> +						struct debug_htt_stats_req
> *stats_req) {
> +	const struct ath12k_htt_rx_soc_fw_refill_ring_num_reo_err_tlv
> *htt_stats_buf =3D
> +
> 	tag_buf;
> +	u8 *buf =3D stats_req->buf;
> +	u32 len =3D stats_req->buf_len;
> +	u32 buf_len =3D ATH12K_HTT_STATS_BUF_SIZE;
> +	u16 num_elems =3D min_t(u16, (tag_len >> 2),
> +ATH12K_HTT_RX_REO_MAX_ERR_CODE);
> +
> +	len +=3D scnprintf(buf + len, buf_len - len,
> +
> "HTT_RX_SOC_FW_REFILL_RING_NUM_REO_ERR_TLV:\n");
> +
> +	len +=3D print_array_to_buf(buf, len, "reo_err", htt_stats_buf->reo_err=
,
> +				  num_elems, "\n\n");
> +
> +	stats_req->buf_len =3D len;
> +}
> +
> +static void
> +htt_print_rx_pdev_fw_stats_phy_err_tlv(const void *tag_buf, u16 tag_len,
> +				       struct debug_htt_stats_req *stats_req) {
> +	const struct ath12k_htt_rx_pdev_fw_stats_phy_err_tlv *htt_stats_buf
> =3D tag_buf;
> +	u8 *buf =3D stats_req->buf;
> +	u32 len =3D stats_req->buf_len;
> +	u32 buf_len =3D ATH12K_HTT_STATS_BUF_SIZE;
> +	u32 mac_id_word;
> +
> +	if (tag_len < sizeof(*htt_stats_buf))
> +		return;
> +
> +	mac_id_word =3D __le32_to_cpu(htt_stats_buf->mac_id__word);
> +
> +	len +=3D scnprintf(buf + len, buf_len - len,
> +			 "HTT_RX_PDEV_FW_STATS_PHY_ERR_TLV:\n");
> +	len +=3D scnprintf(buf + len, buf_len - len, "mac_id_word =3D %u\n",
> +			 u32_get_bits(mac_id_word,
> ATH12K_HTT_STATS_MAC_ID));
> +	len +=3D scnprintf(buf + len, buf_len - len, "total_phy_err_nct =3D %u\=
n",
> +			 le32_to_cpu(htt_stats_buf->total_phy_err_cnt));
> +
> +	len +=3D print_array_to_buf(buf, len, "phy_errs", htt_stats_buf-
> >phy_err,
> +				  ATH12K_HTT_STATS_PHY_ERR_MAX, "\n\n");
> +
> +	stats_req->buf_len =3D len;
> +}
> +
>  static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
>  					  u16 tag, u16 len, const void
> *tag_buf,
>  					  void *user_data)
> @@ -1552,6 +1866,34 @@ static int ath12k_dbg_htt_ext_stats_parse(struct
> ath12k_base *ab,
>  	case HTT_STATS_TX_DE_COMPL_STATS_TAG:
>  		ath12k_htt_print_tx_de_compl_stats_tlv(tag_buf, len,
> stats_req);
>  		break;
> +	case HTT_STATS_RX_REFILL_RXDMA_ERR_TAG:
> +		htt_print_rx_soc_fw_refill_ring_num_rxdma_err_tlv(tag_buf,
> len,
> +								  stats_req);
> +		break;
> +	case HTT_STATS_RX_REFILL_REO_ERR_TAG:
> +		htt_print_rx_soc_fw_refill_ring_num_reo_err_tlv(tag_buf,
> len, stats_req);
> +		break;
> +	case HTT_STATS_RX_PDEV_FW_STATS_PHY_ERR_TAG:
> +		htt_print_rx_pdev_fw_stats_phy_err_tlv(tag_buf, len,
> stats_req);
> +		break;
> +	case HTT_STATS_RX_PDEV_FW_STATS_TAG:
> +		htt_print_rx_pdev_fw_stats_tlv(tag_buf, len, stats_req);
> +		break;
> +	case HTT_STATS_RX_PDEV_FW_RING_MPDU_ERR_TAG:
> +		htt_print_rx_pdev_fw_ring_mpdu_err_tlv(tag_buf, len,
> stats_req);
> +		break;
> +	case HTT_STATS_RX_PDEV_FW_MPDU_DROP_TAG:
> +		htt_print_rx_pdev_fw_mpdu_drop_tlv(tag_buf, len,
> stats_req);
> +		break;
> +	case HTT_STATS_RX_SOC_FW_STATS_TAG:
> +		htt_print_rx_soc_fw_stats_tlv(tag_buf, len, stats_req);
> +		break;
> +	case HTT_STATS_RX_SOC_FW_REFILL_RING_EMPTY_TAG:
> +		htt_print_rx_soc_fw_refill_ring_empty_tlv(tag_buf, len,
> stats_req);
> +		break;
> +	case HTT_STATS_RX_SOC_FW_REFILL_RING_NUM_REFILL_TAG:
> +		htt_print_rx_soc_fw_refill_ring_num_refill_tlv(tag_buf, len,
> stats_req);
> +		break;
>  	default:
>  		break;
>  	}
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> index d52b26b23e65..c411e7da4e09 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> @@ -7,6 +7,8 @@
>  #ifndef DEBUG_HTT_STATS_H
>  #define DEBUG_HTT_STATS_H
>=20
> +#include "debugfs.h"
> +
>  #define ATH12K_HTT_STATS_BUF_SIZE		(1024 * 512)
>  #define ATH12K_HTT_STATS_COOKIE_LSB		GENMASK_ULL(31, 0)
>  #define ATH12K_HTT_STATS_COOKIE_MSB		GENMASK_ULL(63,
> 32)
> @@ -125,6 +127,7 @@ struct ath12k_htt_extd_stats_msg {  enum
> ath12k_dbg_htt_ext_stats_type {
>  	ATH12K_DBG_HTT_EXT_STATS_RESET		=3D 0,
>  	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX	=3D 1,
> +	ATH12K_DBG_HTT_EXT_STATS_PDEV_RX	=3D 2,
>  	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_SCHED	=3D 4,
>  	ATH12K_DBG_HTT_EXT_STATS_PDEV_ERROR	=3D 5,
>  	ATH12K_DBG_HTT_EXT_STATS_PDEV_TQM	=3D 6,
> @@ -151,6 +154,12 @@ enum ath12k_dbg_htt_tlv_tag {
>  	HTT_STATS_TX_DE_ENQUEUE_PACKETS_TAG		=3D 21,
>  	HTT_STATS_TX_DE_ENQUEUE_DISCARD_TAG		=3D 22,
>  	HTT_STATS_TX_DE_CMN_TAG				=3D 23,
> +	HTT_STATS_RX_PDEV_FW_STATS_TAG			=3D 28,
> +	HTT_STATS_RX_PDEV_FW_RING_MPDU_ERR_TAG		=3D 29,
> +	HTT_STATS_RX_PDEV_FW_MPDU_DROP_TAG		=3D 30,
> +	HTT_STATS_RX_SOC_FW_STATS_TAG			=3D 31,
> +	HTT_STATS_RX_SOC_FW_REFILL_RING_EMPTY_TAG	=3D 32,
> +	HTT_STATS_RX_SOC_FW_REFILL_RING_NUM_REFILL_TAG	=3D 33,
>  	HTT_STATS_TX_PDEV_SCHEDULER_TXQ_STATS_TAG	=3D 36,
>  	HTT_STATS_TX_SCHED_CMN_TAG			=3D 37,
>  	HTT_STATS_SCHED_TXQ_CMD_POSTED_TAG		=3D 39,
> @@ -161,6 +170,9 @@ enum ath12k_dbg_htt_tlv_tag {
>  	HTT_STATS_TX_DE_COMPL_STATS_TAG			=3D 65,
>  	HTT_STATS_WHAL_TX_TAG				=3D 66,
>  	HTT_STATS_TX_PDEV_SIFS_HIST_TAG			=3D 67,
> +	HTT_STATS_RX_PDEV_FW_STATS_PHY_ERR_TAG          =3D 68,
> +	HTT_STATS_RX_REFILL_RXDMA_ERR_TAG               =3D 77,
> +	HTT_STATS_RX_REFILL_REO_ERR_TAG                 =3D 78,
>  	HTT_STATS_SCHED_TXQ_SCHED_ORDER_SU_TAG		=3D 86,
>  	HTT_STATS_SCHED_TXQ_SCHED_INELIGIBILITY_TAG	=3D 87,
>  	HTT_STATS_HW_WAR_TAG				=3D 89,
> @@ -690,4 +702,130 @@ struct ath12k_htt_tx_de_compl_stats_tlv {
>  	__le32 tqm_bypass_frame;
>  } __packed;
>=20
> +struct ath12k_htt_rx_pdev_fw_stats_tlv {
> +	__le32 mac_id_word;
> +	__le32 ppdu_recvd;
> +	__le32 mpdu_cnt_fcs_ok;
> +	__le32 mpdu_cnt_fcs_err;
> +	__le32 tcp_msdu_cnt;
> +	__le32 tcp_ack_msdu_cnt;
> +	__le32 udp_msdu_cnt;
> +	__le32 other_msdu_cnt;
> +	__le32 fw_ring_mpdu_ind;
> +	__le32
> fw_ring_mgmt_subtype[IEEE80211_MGMT_FRAME_SUBTYPE_MAX];
> +	__le32
> fw_ring_ctrl_subtype[IEEE80211_MGMT_FRAME_SUBTYPE_MAX];
> +	__le32 fw_ring_mcast_data_msdu;
> +	__le32 fw_ring_bcast_data_msdu;
> +	__le32 fw_ring_ucast_data_msdu;
> +	__le32 fw_ring_null_data_msdu;
> +	__le32 fw_ring_mpdu_drop;
> +	__le32 ofld_local_data_ind_cnt;
> +	__le32 ofld_local_data_buf_recycle_cnt;
> +	__le32 drx_local_data_ind_cnt;
> +	__le32 drx_local_data_buf_recycle_cnt;
> +	__le32 local_nondata_ind_cnt;
> +	__le32 local_nondata_buf_recycle_cnt;
> +
> +	__le32 fw_status_buf_ring_refill_cnt;
> +	__le32 fw_status_buf_ring_empty_cnt;
> +	__le32 fw_pkt_buf_ring_refill_cnt;
> +	__le32 fw_pkt_buf_ring_empty_cnt;
> +	__le32 fw_link_buf_ring_refill_cnt;
> +	__le32 fw_link_buf_ring_empty_cnt;
> +	__le32 host_pkt_buf_ring_refill_cnt;
> +	__le32 host_pkt_buf_ring_empty_cnt;
> +	__le32 mon_pkt_buf_ring_refill_cnt;
> +	__le32 mon_pkt_buf_ring_empty_cnt;
> +	__le32 mon_status_buf_ring_refill_cnt;
> +	__le32 mon_status_buf_ring_empty_cnt;
> +	__le32 mon_desc_buf_ring_refill_cnt;
> +	__le32 mon_desc_buf_ring_empty_cnt;
> +	__le32 mon_dest_ring_update_cnt;
> +	__le32 mon_dest_ring_full_cnt;
> +
> +	__le32 rx_suspend_cnt;
> +	__le32 rx_suspend_fail_cnt;
> +	__le32 rx_resume_cnt;
> +	__le32 rx_resume_fail_cnt;
> +	__le32 rx_ring_switch_cnt;
> +	__le32 rx_ring_restore_cnt;
> +	__le32 rx_flush_cnt;
> +	__le32 rx_recovery_reset_cnt;
> +} __packed;
> +
> +#define ATH12K_HTT_RX_STATS_RXDMA_MAX_ERR	16
> +
> +struct ath12k_htt_rx_pdev_fw_ring_mpdu_err_tlv {
> +	DECLARE_FLEX_ARRAY(__le32, fw_ring_mpdu_err); } __packed;
> +
> +#define ATH12K_HTT_RX_STATS_FW_DROP_REASON_MAX	16
> +struct ath12k_htt_rx_pdev_fw_mpdu_drop_tlv {
> +	DECLARE_FLEX_ARRAY(__le32, fw_mpdu_drop); };
> +
> +struct ath12k_htt_rx_soc_fw_stats_tlv {
> +	__le32 fw_reo_ring_data_msdu;
> +	__le32 fw_to_host_data_msdu_bcmc;
> +	__le32 fw_to_host_data_msdu_uc;
> +	__le32 ofld_remote_data_buf_recycle_cnt;
> +	__le32 ofld_remote_free_buf_indication_cnt;
> +	__le32 ofld_buf_to_host_data_msdu_uc;
> +	__le32 reo_fw_ring_to_host_data_msdu_uc;
> +	__le32 wbm_sw_ring_reap;
> +	__le32 wbm_forward_to_host_cnt;
> +	__le32 wbm_target_recycle_cnt;
> +	__le32 target_refill_ring_recycle_cnt; } __packed;
> +
> +#define ATH12K_HTT_RX_STATS_REFILL_MAX_RING	4
> +
> +struct ath12k_htt_rx_soc_fw_refill_ring_num_refill_tlv {
> +	DECLARE_FLEX_ARRAY(__le32, refill_ring_num_refill); } __packed;
> +
> +struct ath12k_htt_rx_soc_fw_refill_ring_empty_tlv {
> +	DECLARE_FLEX_ARRAY(__le32, refill_ring_empty_cnt); } __packed;
> +
> +#define ATH12K_HTT_RX_RXDMA_MAX_ERR_CODE	16
> +struct ath12k_htt_rx_soc_fw_refill_ring_num_rxdma_err_tlv {
> +	DECLARE_FLEX_ARRAY(__le32, rxdma_err); } __packed;
> +
> +enum ath12k_htt_rx_reo_error_code_enum {
> +	HTT_RX_REO_QUEUE_DESC_ADDR_ZERO		=3D 0,
> +	HTT_RX_REO_QUEUE_DESC_NOT_VALID		=3D 1,
> +	HTT_RX_AMPDU_IN_NON_BA			=3D 2,
> +	HTT_RX_NON_BA_DUPLICATE			=3D 3,
> +	HTT_RX_BA_DUPLICATE			=3D 4,
> +	HTT_RX_REGULAR_FRAME_2K_JUMP		=3D 5,
> +	HTT_RX_BAR_FRAME_2K_JUMP		=3D 6,
> +	HTT_RX_REGULAR_FRAME_OOR		=3D 7,
> +	HTT_RX_BAR_FRAME_OOR			=3D 8,
> +	HTT_RX_BAR_FRAME_NO_BA_SESSION		=3D 9,
> +	HTT_RX_BAR_FRAME_SN_EQUALS_SSN		=3D 10,
> +	HTT_RX_PN_CHECK_FAILED			=3D 11,
> +	HTT_RX_2K_ERROR_HANDLING_FLAG_SET	=3D 12,
> +	HTT_RX_PN_ERROR_HANDLING_FLAG_SET	=3D 13,
> +	HTT_RX_QUEUE_DESCRIPTOR_BLOCKED_SET	=3D 14,
> +	HTT_RX_REO_ERR_CODE_RVSD		=3D 15,
> +
> +	HTT_RX_REO_MAX_ERR_CODE
> +};
> +
> +#define ATH12K_HTT_RX_REO_MAX_ERR_CODE
> 	HTT_RX_REO_MAX_ERR_CODE
> +
> +struct ath12k_htt_rx_soc_fw_refill_ring_num_reo_err_tlv {
> +	DECLARE_FLEX_ARRAY(__le32, reo_err);
> +} __packed;
> +
> +#define ATH12K_HTT_STATS_PHY_ERR_MAX		43
> +
> +struct ath12k_htt_rx_pdev_fw_stats_phy_err_tlv {
> +	__le32 mac_id__word;
> +	__le32 total_phy_err_cnt;
> +	__le32 phy_err[ATH12K_HTT_STATS_PHY_ERR_MAX];
> +} __packed;
> +
>  #endif
> --
> 2.17.1
>=20


