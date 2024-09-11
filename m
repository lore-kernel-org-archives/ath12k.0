Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A57EE49B7
	for <ath12k@archiver.kernel.org>; Wed, 11 Sep 2024 14:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0DOEdJlo0kxlZXLqgiMtR4GkLD0vmEhT4MOqrTlWDeg=; b=L2v839m25oyn3p
	1BiiCiyXLykoA8dS8SP4ti/woC4bNVCZFr7HlKz+uAXDaNxM7K/NnTEFhOxVGms2nzxTU3cpNm3np
	8mbBbiP9AaGLUQC8FfzhaHXyZOhon6yHo5LrSG7WiMxW8OT0cVE6SHOCF3GCDXNM78+mjEAzFx/KJ
	0choe5TeQ3P09uK/JvMRb+8miUEJKb9IPcrcs/BclPj/ma2MFu3t5Pm4WjITGx+7u8oOhKz92sDbW
	5dSIJxKucOe4RcG7B6aFoPQYtIeV2msyBtGmJHVmp6QrKNo4pCgXp7+0j4wSoMeMHK91wXf09lhqd
	dys811KH1m/PfXSaVg8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOHF-00000009tEl-3v2F
	for ath12k@archiver.kernel.org;
	Wed, 11 Sep 2024 14:25:01 +0000
Received: from mail-lo4gbr01on2072d.outbound.protection.outlook.com ([2a01:111:f403:261a::72d] helo=GBR01-LO4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soO1s-00000009qGc-0Qdo
	for ath12k@lists.infradead.org;
	Wed, 11 Sep 2024 14:09:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnaKbUZtmCJkWi77OXVikfTQf94yq9ui5AzdIgtt7BjPTj2T1fcbchS7bVhkS7j3fCLjBOrA5juX7XG7PO5F0JDSy5vQX+WW/sVhH4mPRjgM2MQK43aEV283wqXUeRVmCty0nmqP6rRAI1W3U1FzbXn9EXpJef9QWj+sHaIpMLxYNONjZdVbe/LkrdmnEriXufBsvTa3anGKGpP8rFzfMRihJiAxSrj1Aj4anT8U4ZPgYVYixWWrSpnweBNVIZ76kUM5DN+nD3qJ/IAzG/o3mcENzl8bxxvPMwrLQU2k743pFf6EenS1ao3X/11xwh6IlkyRTFVod0JNlDoUUaAz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DOEdJlo0kxlZXLqgiMtR4GkLD0vmEhT4MOqrTlWDeg=;
 b=tJWfeuG6pXwUvAzSUBTDQu7+cFUxRgtmnw/cdyx0+DBt077Y35lfUrHMS4XPf1Y3wEbKv4PfNoGt2g1RiXjV2HVB6lP5a+zpuNQcC46eqQgMa/WePEcmMgGMRh8DOzxyDx9CUXIs7uq+tXmVMM8sNKWHPjQ5N8DeOjkJodt2lwMj4BahrRD2wiXWjiIEUnCJ/d7ExxhFR4Sz9sdZQAA147LFVAeHmeYKfqnmzCUQDfK36UxD5CddMe1tAmwy0KcNjcsiGiEgQ8PAXtzMTkifJS3f7gJcIljNeIhEKtNLgb4CHq8YKB5Lngz8gVQ2WJv7w7e3GwjEQFsQj+DweZwsoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by LO4P123MB6802.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2f8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 14:09:01 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6%6]) with mapi id 15.20.7962.017; Wed, 11 Sep 2024
 14:09:01 +0000
From: david Atkins <david@3adesign.co.uk>
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: wcn7850 - dmesg errors
Thread-Topic: wcn7850 - dmesg errors
Thread-Index: AdsEU7J8dTaynRDkT5C+4tE741A5bA==
Date: Wed, 11 Sep 2024 14:09:01 +0000
Message-ID: <LO0P123MB4057448C8C2869965F7BCA44D69B2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=3adesign.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|LO4P123MB6802:EE_
x-ms-office365-filtering-correlation-id: 1ae39eb2-3853-4873-5329-08dcd26b4946
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?YqjH5aBn7hcjmrdE1FqfV1jJNtOGFFU581K603pjr8riH8WiJSkf7e25dD3L?=
 =?us-ascii?Q?IiKf+K3gmErAHQkC8bQmaMA7MiYM846ucOVVJKpw+hdP+H/Joh98JTTT8yDY?=
 =?us-ascii?Q?/e9pwNQQv/Ik27nntZ1MgKcJBl15I7hHGopJw4wnM1COstQ++vrU/ql6LYhq?=
 =?us-ascii?Q?DhOp/w3PWO3zBiF4QSW7QSdkOyVwgkJz9Z1ztI3WzErK2NQbeYvShxcBhrN0?=
 =?us-ascii?Q?dqkzj4OFIbvOmrG2YVkS2atCCCA8iv7hlqTMfeDMFY9DdQ/Qeo45iQ6uBe/3?=
 =?us-ascii?Q?V540V/dsp08BsQpQfVG3pXwjEX8AN8mzLz6cePfUcupwlvESDqitaZjj8u+P?=
 =?us-ascii?Q?Bm6c0kDyEtg5PHvl31f0GwOFxCauyA44J3XRh9vLcLw7EgOGQRP/Yi8l6in1?=
 =?us-ascii?Q?JApOWpo9wTn2Qawwvp/PoOmLYpXxB+157SxlSYTScmrMuUEZwDxQ3YBLOELc?=
 =?us-ascii?Q?J7vaj/Hj1uJH3rFgqoSvtNevRcvp/M40aHodU/sf/S62RkOET4xFMXIkV5RR?=
 =?us-ascii?Q?ZAT6ULK42pE2/ACJ9zSb+X+jboqJ1O6qD8T4947789cVrUaJy++PU7gfsu9k?=
 =?us-ascii?Q?TYqdgRGDWiOiIRGpZySTDMRO1SXKfffmLDo6ASahbA/XcpobSSpcFwa3Igl7?=
 =?us-ascii?Q?JJxc++yM3IJNKWtl20HDULgZVnmW+7WRiW9mH9Z/us32OZxPZmS6Y8pnhhqC?=
 =?us-ascii?Q?84PcB2HogrlYJTxU+Gl2WdAn/jEAhhiw2wS/cwR76qGqcvm496IGTPFZTFKf?=
 =?us-ascii?Q?nQsm509Sxx0B/YaYv/RqCtRQQozljAvKpJTbmUxT0B/M2U0VDjFfFoOJcmWr?=
 =?us-ascii?Q?VxggXnNPW8rHaQU3M2TIFUcJUaDLuZL4VZgvIb/V9n1KC1l5ahONSHzrQXtk?=
 =?us-ascii?Q?8nuzgkh6KWbvTFzC9uPiBTW1p//kpi2Bj0DDmlZMXbQ+ZKhkcLrKViefAWaJ?=
 =?us-ascii?Q?ToMpM79jIjVnaZotwWStKcFvFJxoMPaMMUy9pf1jUTR+lcna9VUppzaAEXdd?=
 =?us-ascii?Q?txcZIocLEnYfWuzDyViex7O9h5AzWfzQlNsY5v75v53TD+tN2V0fnl5tbVrt?=
 =?us-ascii?Q?kgmMdJC7LUZ1XwayeAFBpjYDT0x0pU4EPFLBqH+ZkZp6NNXvkZniy3H8t0DX?=
 =?us-ascii?Q?nWvfs0ZRqxwBjjXYgmcoKGlNRcFwn+B7p1LCcRMjceRlaDqEpRGyCoYhc2Uz?=
 =?us-ascii?Q?hDwQZJcJAzrNAulvRWcks+AQSXwlBRMe1YtdOm/eHfEHsYXqSPAtQEgQGDrL?=
 =?us-ascii?Q?EurMfiQL9IiyAWzaXMRwhMW8eOpaSuaPRNLSc02RLK7DCWm+t5n3nbD30F3S?=
 =?us-ascii?Q?ryB14dSz8ZF2ppNoTXqpW5m0MzKPwBlY5e0zG4DCi+d2MF48yfezJASptSMP?=
 =?us-ascii?Q?NqRUlU3qenC6oy9n+m2Ad6IzG5HE8fO3r4oK3EYjur6HVGSVgg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?36/5Bjx/BKcnbMd+HVOqG8TCbka2KQGQI7WBKgpOtxXpz+NMgLwMin2RNf2O?=
 =?us-ascii?Q?6C29a0r708nUWGKPsrevHIZyS/N7zL88E2qwYjgNktvrKye20aWUrC/FEM6d?=
 =?us-ascii?Q?qwaxzqkHYq4tKeR+u/bUs3KeINz7bCd9Vb7Nzdnh+U/U6yr3R+HSzBh1Ayxi?=
 =?us-ascii?Q?rf23v+10xNbYpZIj+1HkfWQ4lLmMSzGx8HSakcXrgX7CXSet+MD7FeL/giD4?=
 =?us-ascii?Q?/zi644nu0J0rY3+AV3bt8cBS5nUMAvV0NqfLxlbTfPJmarDWplT4alCB4hko?=
 =?us-ascii?Q?HzbKQQ+unRddKbechkmNrxsjEgPd1sQftAeyRIeyuHGW7L+x6exUPrAO6bt4?=
 =?us-ascii?Q?Y0umRzxuG4PpP7kObhYuXpe9mqNLW9qBorvv1x1+H7QpY7Tq2f0XmgNnFJ7y?=
 =?us-ascii?Q?bW7rI8438ArWfEmzEf3LMkwguKkB8erhQzvT/banV2lxkkAPbCMB+l0r4pZU?=
 =?us-ascii?Q?8S3uuUANBzTXHhb8nmcwr32umv6iSlCUglNGhlK0yY48Tar3WTlFJ0IZM2V0?=
 =?us-ascii?Q?a2cjwJCSCepwCj3cUKr65/XmoCyFDlAX8KKZAg/+S0PHENzudu3IYeZ62lKL?=
 =?us-ascii?Q?ld7q535POhIMI68bG8VgYpUnPB1Ixa6MJNZjdbCPSdUnzZiAtwqYVICSQ1Xg?=
 =?us-ascii?Q?DCyUMz2X6H/lk7qEvFcdlB2ALZjT+hpJGRGwNlPGg7b6QMzCVL1eFmaBGSja?=
 =?us-ascii?Q?filxQ43+03OxPZZ6LxPVeSTotoRgvXJ48ibAquhSk27m1SSZGMLFpt6I74+B?=
 =?us-ascii?Q?YcWWcbKJNPyA75aEXoYYYrejctKZxJXrzb047bABfY5bkjI7DiwVxzRh1fLz?=
 =?us-ascii?Q?syiEop5k7jWDhGOwmLPidcVht2VJgVG20GUYn63yuuAENK3OjYOisZVqA5tk?=
 =?us-ascii?Q?wQOPHQOmpm8nzU6/TneCve/gBYVDewVU8Gj/cm9mSqoboyigsCFKFkjLpPTI?=
 =?us-ascii?Q?KL/rDjEQE4n6jwptb0s4gT9WTkGZpdUfNXPAUT98fT+TZoK8Au8wKi+KNaMI?=
 =?us-ascii?Q?8xnhf8c9fk9M7H6y48zdCnfYTrXYNCP9V5r/4gGiMO5EAvf2eEUFukqXhBJo?=
 =?us-ascii?Q?iz4XcPhlkPC69ATLCkqbyJKTnRvcdt15MSObesHf4ecIvXKYwm9VwreOkFga?=
 =?us-ascii?Q?y8oqNS0pxrBTImQkefP5X6uw8u1fIjL9Bn5w72Xi6MyQKIi+vU1qjM2ssLL0?=
 =?us-ascii?Q?4coDYRGtUUj7AeVUecIisbGex0Ar/j4QayTZwixT63g1RHOoFhcrGJj0Q60H?=
 =?us-ascii?Q?YqC7nSAxrDatiwKjjKe6srdfZDYXxHl3UL+F1KLpNDzUlYu2dW5vmDfy6TxX?=
 =?us-ascii?Q?1lYXasP5gn7BbnCz49x7HSfbRbw8Zd7De8SOuvp55AZWwR9+GGXTkapf6Lwg?=
 =?us-ascii?Q?Ujl3EqfGdUPcvOQ6/SW4XNQqwB/KRFPfe/dCvwaAu7skeuIV6Smvvn2pzOCn?=
 =?us-ascii?Q?xNX0h3QqIbTmGRe0gFtfv9G7GL7ey9zOOEmtJa3gdTJ3tJ/0nvudYBqT8tPe?=
 =?us-ascii?Q?k1RZnrAMI8oRsrU+X5YMSplBPJZVPHr3XKvwDkBaqqrts9JLjOJhA/hZhqLF?=
 =?us-ascii?Q?YiPTb4sgypPYZl8uikExdElFv9he/O9CyRjVTEZ4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae39eb2-3853-4873-5329-08dcd26b4946
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 14:09:01.1880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jaI/rEhpL7exTRj5X2GFUD8+x+bx9TJdQaKVoIhrNxaD/NyQHqpfNWVi6+Vz781qlkP08tvOl1hhCjzbjtBLHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6802
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_070908_166276_708E9218 
X-CRM114-Status: UNSURE (   5.11  )
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

I'm seeing these messages in dmesg, not certain yet but suspect they coinci=
de with the loss of connectivity on an active session.

[432161.471863] ath12k_pci 0000:01:00.0: failed to send HAL_REO_CMD_FLUSH_C=
ACHE, tid 13 (-105)
[432161.471875] ath12k_pci 0000:01:00.0: failed to send HAL_REO_CMD_FLUSH_C=
ACHE, tid 13 (-105)
[432161.471890] ath12k_pci 0000:01:00.0: failed to send HAL_REO_CMD_FLUSH_C=
ACHE, tid 0 (-105)
[432161.471894] ath12k_pci 0000:01:00.0: failed to send HAL_REO_CMD_FLUSH_C=
ACHE, tid 0 (-105)
[432161.471905] ath12k_pci 0000:01:00.0: failed to send HAL_REO_CMD_FLUSH_C=
ACHE, tid 2 (-105)
[432161.471910] ath12k_pci 0000:01:00.0: failed to send HAL_REO_CMD_FLUSH_C=
ACHE, tid 2 (-105)
[432161.471917] ath12k_pci 0000:01:00.0: failed to send HAL_REO_CMD_FLUSH_C=
ACHE, tid 3 (-105)
[432161.471925] ath12k_pci 0000:01:00.0: failed to send HAL_REO_CMD_FLUSH_C=
ACHE, tid 4 (-105)
[432161.471929] ath12k_pci 0000:01:00.0: failed to send HAL_REO_CMD_FLUSH_C=
ACHE, tid 4 (-105)
[432161.471938] ath12k_pci 0000:01:00.0: failed to send HAL_REO_CMD_FLUSH_C=
ACHE, tid 5 (-105)
[432161.471954] ath12k_pci 0000:01:00.0: failed to send HAL_REO_CMD_FLUSH_C=
ACHE cmd, tid 7 (-105)
[432161.471979] ath12k_pci 0000:01:00.0: failed to send HAL_REO_CMD_FLUSH_C=
ACHE cmd, tid 10 (-105)
[432161.471996] ath12k_pci 0000:01:00.0: failed to send HAL_REO_CMD_FLUSH_C=
ACHE cmd, tid 12 (-105)
[432161.472007] ath12k_pci 0000:01:00.0: failed to send HAL_REO_CMD_FLUSH_C=
ACHE cmd, tid 13 (-105)
[432161.472023] ath12k_pci 0000:01:00.0: failed to send HAL_REO_CMD_FLUSH_C=
ACHE cmd, tid 15 (-105)

We often see the connection disappear, ( traffic dies, no pings etc) then a=
t some point it resumes.

Could this be related to the reporting that its a 3x3 when it's a 2x2?

David


David Atkins


