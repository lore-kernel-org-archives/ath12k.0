Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419B6C0219B
	for <ath12k@archiver.kernel.org>; Tue, 11 Feb 2025 10:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExXXzKNM0i2vf005ltxkn1m7zVGsXSKkl+sY6fBLxsE=; b=toos7yUDndCKJqmWR44t0RkT/z
	HBMVEPv6rQpDBa3T4kHDyVQoOvFbBC5jm2MHGuOCfphGywEExUSLviU4IDl28Qsly7CtdSHYkU1gF
	PJNfhY0OWdAA1oPl03vy6Wnk6cGsSlKu7V4WukNMaqQloDUXkFFQk9HPC0qf1RoI80ZZtfB8E/2PQ
	gUd2/Mlh1SvwAarDzNNm2KvItGhBUnDhDsGxzZvsu7pmPiZ995xn5ddVptrttZ5FhYGPyyF6vUheL
	BhQBmcHAgT2L1dec1aJ2ckEHDZJ5PwrRLL93QpESYRBtnBWMvBSBn4sHoarMlZzccu69r6uMExZag
	YbUZ3NIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnSm-00000003LVb-3KKQ
	for ath12k@archiver.kernel.org;
	Tue, 11 Feb 2025 10:25:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmM4-000000038K2-2gyF
	for ath12k@bombadil.infradead.org;
	Tue, 11 Feb 2025 09:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=ExXXzKNM0i2vf005ltxkn1m7zVGsXSKkl+sY6fBLxsE=; b=dVjF/Zwa5z2axNAGDAA5ivygHU
	lnSEwb9u0+fJjIOgI5UWqEbnO4xll4fQ5gE5zBaferdqIjkILyiMxgPlJ8OWQQoLVEviuXfrNRbME
	YLwAulTsdcohWF2xpq4V2hEPO8CmRxL6LGcSX6qmlVAvedSVY6af28CrC2xieMqSvqZTRonD/kEYU
	CIJ7Nd0x6KSnjMJjXOP2OllwDUVtoNsHoRelBuCO1yVD0upMT0csyr3QLJUaB2OAKzVEmg3do0eHA
	+h06DtpvJMWUXmS5XN2dx44xbFPUUCDxylQm6va56p/Fd8X68vCUHPI51ED4sgVfq8lPpGHXchLKd
	bdS3ST1g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmM1-00000000XPJ-0LmJ
	for ath12k@lists.infradead.org;
	Tue, 11 Feb 2025 09:14:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B3GE4L030278
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 09:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExXXzKNM0i2vf005ltxkn1m7zVGsXSKkl+sY6fBLxsE=; b=aZ7BdCPkW7wvPkp5
	Y9x5gFp19RgajW95BoGv/DcjtajYGGACelckFACmTAVUG9h2Q2BKHy6jwLHI6Kuj
	fzbaPMo5V3zrIBJZKYl5A7t5n30mN0Dtly3paP67WOwCm6ywx3mN3nClsvcZOdHW
	Pm3YD7Kv38vjLK+5WSS1iluknNSmKMgOrTDBrLvCJtLPTVWGobE2HvG1oUVsp+tU
	VtX71g8aTAuRoOoP0WhRwjCt036159e6Met3dbNeTG8Q+nHDlnq3SJYfEK/mG1yp
	i5v+z/LWGj0XB5fMfqrattH0oatDaAsYq0KTUs0CN5MJS8RVOUUYpvgkyhH1hbD1
	IOz9Tg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azlp17010021.outbound.protection.outlook.com [40.93.12.21])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxg9gt35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 09:14:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHim64FgKbIjzkGZLb7Wefl3H3fYDTpyN9FL1i9MjWOsj8SefxvYmueTmKHX/vTkl9ykK7/LlK2+vpbFJhtubJYUgjIN01UpKAvN4J6ROMo15DJ8Fr0WNIl5HxCxGkYGjmh0CUSTzCvxrSVGnuntirfsETd6pxLkujBG8Wl0wRikq/Rv/j8tp70Zyj5ltctW3jPmmKTcyGb1gu8W2rqfP6mFX5GOWrh+FKtQeF19+29VFoidh0NWWnLEwjtx9/A7Bn2Xcw0RT2qDoVYklV2eOO3duQ/QJ30+M7TyEyMf1JzfQAwyDNTwaencyDUXm///0kPKFB5qmzxlYjr4ttjsbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExXXzKNM0i2vf005ltxkn1m7zVGsXSKkl+sY6fBLxsE=;
 b=pcMNLKZN1yHCv9qkW7yRaX8+ePXa3W8cIl5oL6QgoUTdY+n2bAkSJUP/PrL+itQkLyzcoPL5nNgTnhXextkMeJYC25ieeA4fZYQctpS7qRXdhRyQp/mmFY7azi2eKHMzcRHf3LU7f9QJnXcBpb5qbFZMUMp/erLoTDXHpCnQ9FV1QkHpj/S3oJzzvfqwBGa7ucv1wKlY+C42+q/fG6LZbSsfQAPBeKvnCa7uKuZUsEcsgCA9Fj8KVgpHJq9852WXpDFZIYhWGkyQm6oUqTYcclvQm9j4+bMpiECGpVBSmNpk1KZXwiaRGF5m6FA8tQKv6B8Te0/HQexX3OPADKjs2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BL3PR02MB8163.namprd02.prod.outlook.com (2603:10b6:208:35e::13)
 by SJ0PR02MB8354.namprd02.prod.outlook.com (2603:10b6:a03:3e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 09:14:45 +0000
Received: from BL3PR02MB8163.namprd02.prod.outlook.com
 ([fe80::d217:1a93:30d1:416a]) by BL3PR02MB8163.namprd02.prod.outlook.com
 ([fe80::d217:1a93:30d1:416a%6]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 09:14:45 +0000
From: "Tamizh Chelvam Raja (QUIC)" <quic_tamizhr@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>,
        "Tamizh Chelvam Raja
 (QUIC)" <quic_tamizhr@quicinc.com>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
Subject: RE: [PATCH] wifi: ath12k: Fix invalid data access in
 ath12k_dp_rx_h_undecap_nwifi
Thread-Topic: [PATCH] wifi: ath12k: Fix invalid data access in
 ath12k_dp_rx_h_undecap_nwifi
Thread-Index: AQHbPQYOSnqbMplX5k674DAQ1pfDWbLDyvMAgEzktACAMZ4mQA==
Date: Tue, 11 Feb 2025 09:14:45 +0000
Message-ID: <BL3PR02MB816370AACF5D4C316C5E176083FD2@BL3PR02MB8163.namprd02.prod.outlook.com>
References: <20241122174252.2067375-1-quic_tamizhr@quicinc.com>
 <75c641d9-26f5-4d42-bd48-14b1606ba4d9@quicinc.com>
 <320dcf5a-3506-4fcb-a7a4-71ba4e972158@quicinc.com>
In-Reply-To: <320dcf5a-3506-4fcb-a7a4-71ba4e972158@quicinc.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB8163:EE_|SJ0PR02MB8354:EE_
x-ms-office365-filtering-correlation-id: 38348781-6ac1-4871-bb31-08dd4a7c86b3
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eTFQK2lXaEo5bGY4YTF2VEZ0L2ZONHdHN05tYUZWWWh2ZW15S0ROTnlkcjhv?=
 =?utf-8?B?M2o5enNhS2xrU09rVmp4S0JlUkcwWnZHeDhocjd0aFVpUnZJcUVaMUdpVmFE?=
 =?utf-8?B?SEErazljWTkvNVZaTFVmeStIMzdwREV3VFNWZm5PWEord2J2WmVXWTZXc1pn?=
 =?utf-8?B?SHhiVFZUNVk5NEVKN3RBNWpJREQzeS8reE5CbHV1L0FhV21DZ29FOGpKN24y?=
 =?utf-8?B?Z3lFSGpVdGNMNVpsakRaNzRRb0hocEFBS2xxdFFaZzV6ZGYyV1RzN2d4M3hn?=
 =?utf-8?B?UWV3M0hGd3p5bnczSUdRRW4wRnd4c2NNYmZSNnd4S3J1UUZhQzhkTzQ1V3lZ?=
 =?utf-8?B?WkdTS1RKcVhEMGZIemV2UEE4YmNjQ1U0UmtYSTBodDdNS2NldTlYS244NWxm?=
 =?utf-8?B?d0p3TGlwbm1JNi94MGhnU1luOHY0RlVuajVucGR4QTZ0QnJEN0pZREtFRVRv?=
 =?utf-8?B?U21sTXB1Z0d0am5rZmNqeG81RXpwaTdsd1hRTlQwQVVLRE9QalZkazZNMm4w?=
 =?utf-8?B?djgxMjVjTVQ0V3c3ZDRHSkhCRDh3M0lYVVBZV04xbjBvbWJ6THZoNkJ2cGUx?=
 =?utf-8?B?SmljdDU5Z1dEM0g5K0krQmNITnlSaFQ2eHdrQTkwRDNvS0dNU0krVjV3Q09I?=
 =?utf-8?B?Q25HVFdHZ1JoRnFOd0RObUxTOFlYQy9oMThpY1BxRnpab3d0dU11dWFDeVNV?=
 =?utf-8?B?S0hKUUU4WU4xb0NLYklnZGZUdU1tMEFySlYyZXM5Q2FFTG9SUnJCVEVXQ3BG?=
 =?utf-8?B?Tjl2cFowSmJtcmVSRXdhc1ZXZklIWDlDYlhndFhLempteitKQktIR1JZSkdL?=
 =?utf-8?B?RFhTWjFLUmFSN3pNdVo5UTBIOFBFZGFYdGpSemhBSFVsdXduSDFUWWlONmtM?=
 =?utf-8?B?emNwMlk1VDlrUjB3eHk0dU0zQmZkeVNoc3Q2V1VsRzAwbTUvUlJ4T0UyaTd2?=
 =?utf-8?B?ZDdwYlA0MEU4MWkyWW14czhqcExVMGJWYmg5aGY1V1psQjM0b1FqMmVQUnBH?=
 =?utf-8?B?eVJPazRrb0VzTHFmQVhzLzE2RzhhUmpoTDJGUlRoRFZ0V294YVI3YktXREUy?=
 =?utf-8?B?UjkrN25VczJrZFRNODl4VHFqbFhzSGl2RjArL0gycDJ2cGdTN2RtNUV3YjQ3?=
 =?utf-8?B?SE8wQkNCRk1vN2JtdXZZTWR3cGI1ODZuYkpXbTZ4WmtzTzFUNU1TeXhlalho?=
 =?utf-8?B?Y09EdWlhL0Rib2tjQi9jekxGZDU2Njg1N0NTSDk5VW91T1hqVG5xMHR0dTV5?=
 =?utf-8?B?eWJIbEt1dkExU0l5V1dJMjdTOTY4N0JwVW1pWjVZOUZlZmpYbUM0QXJ5c1k3?=
 =?utf-8?B?N0R5TnhvcGlJdktqdUpINS9vayt0bGdqQk80dlR2eWNOUzRSTkplbFZ5Z0sx?=
 =?utf-8?B?SDR6OHZvMU94Y0hNVysvQTRIRXBZMnZNYStCdFJJbS9zN1RMcHN3Vk9SWlNR?=
 =?utf-8?B?d0lyTzBzeURUWFdmWGIwNW5vMk5CZmwzdldQZy8vd1BpdzRHS25HTFhmV3VV?=
 =?utf-8?B?VE9wS3ZZSE9CTlRiTWFLQTRJQTNsRlptRUV3WUJ6QStHUmIwYWE5Q0VGUGNO?=
 =?utf-8?B?V0VMdGxyZ0F2NmRJT3E4cHMvUTdEU043S0RoU0thTWIrR1h4c2RqbCtNQ1dI?=
 =?utf-8?B?NjZZaDVaY0ZlbFBONTNaS3RZVjBXcnJkVzcwdDZEVGJ2QWh3TGVjMm1uYzZ5?=
 =?utf-8?B?MmNvazh5aVhYY1AwMEtIaThDNEF6T3VxWXE0WFphVGl5aHJQVE4yVXludm8x?=
 =?utf-8?B?YlEzTDVQai9TVzRIUUlUM1JKMTNKbFFZL05FaHRRY3ZjWUNSWWswbUFGOXJN?=
 =?utf-8?B?bjFJQWtUUFA0UXZBYVhmUlpNeEo4UHloVUh4OTM0OEVVMHFVRzBSM3pocVRl?=
 =?utf-8?B?aFVBMHZYODcvSzdFK2RPbkppOC9BUmNabURpWGZOMzEwc0pJbTNpS3VLVmlz?=
 =?utf-8?Q?DlQmaKUU7JBNKH2bu+I/HL6o+gisr4gC?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR02MB8163.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmF1N084cmQ0eDVUWHB5YnZZQkV4ZkNHZG85VDNzelNZZmZaR2EzQUtEUG14?=
 =?utf-8?B?ZEVydDJLSERNZnU2bTFZeE1UT09wa0U3R2g0K1c4RzJQelpBMGdPYjBqT0x0?=
 =?utf-8?B?UlArclZ2UWpjbWJlTXBkSFM2L01aQ08xSU5qM21LS3gwODZPQzAwRDVXcHlD?=
 =?utf-8?B?NmVWQlRWVE8rTjlyWkxLZDhobnJrc3VWQ0xZT0FWYTFYL2pZV0hmZmhiYjll?=
 =?utf-8?B?WFJFR1EvYnp3cGhTQjlWZERPSTVjS2ZjeTRBb2ZpUjR4UFIzZ0RxQjUrYWk1?=
 =?utf-8?B?Q3lFZkQwbnQwSFJQQ2hXTEE4QkhsdENMQWNWOVR4V0pCMmcyMUVGZFBFZWRt?=
 =?utf-8?B?OS9ZWjU2aWo5NkV0WEJnTmpUQThQWXZuUUpRdTAyQ0FyVDVNQVROK0NBZVF3?=
 =?utf-8?B?a0J3RzJIM3Byb01sVTJNQ2Vwd0M4Wnp4QlZ0REhXVHZoT2F4NmhyTDJieWsr?=
 =?utf-8?B?V1VaWjJrT1c0cW9mZkVxZEREeEdlU2t4WUxBNFFyUjk1ZHZRbi90Um1IajQv?=
 =?utf-8?B?TlZhQkZWMTY4bTRwWEdGMUFNV2FLSlYzaHU2bFJjRG1yUGx3ajFidUZ3U1Vt?=
 =?utf-8?B?SVM2dEJWazByRkx4YjU0UkFRZnAyWTEwVnBZb1hJcHYzL09DWGlVck81SGdH?=
 =?utf-8?B?YThtcXJuS3I4OHAvbUVMTkpLNjhrYWlHSVNRVndCcFZSaFhWVThlU0N6b1ZE?=
 =?utf-8?B?ektOcFRvcUFlc2ZRLzVSVnc1VjZHTVkzZ2tVVVB2UERuR1FPNElXTzNaZllG?=
 =?utf-8?B?OHcvQXZqV2hiNWkvcjBYM0N0WFpxU2NKRGJwNWM1bTh5QkVVMXVDekZkM3dK?=
 =?utf-8?B?Sm9ERVJLbkk2cWdYbzdVVUdIU0dNZGxBeXZON1MyUzhJZVR3UEduV2NEMksv?=
 =?utf-8?B?bzMzWEhYdXpneGxmM2NVeGVlWFJvOGMrUHFjU2szemFpRkdMR1U1bi93Q2xn?=
 =?utf-8?B?cUQzajVYNmFSMmdoaXVzTmhPQjJLMjhzRlNZQUlpeStTSlRJV1BYbGoxWktR?=
 =?utf-8?B?d3Z0RXZVRWlTM1k3OVV4Z1d6Sjk1c05Idy9KbjhtNHlzc0JLdFdFZkFSRlRD?=
 =?utf-8?B?ajJIK1pnWHZwL1I0aFpUT0xLR25sZ2JTY2dMWFI3Mjh0VWY4QnpTMzlxbU1R?=
 =?utf-8?B?a2pzU20ybWd6d2t4S2FiaDF4enpIMHhqREtSak04VHUrS1NsUUJkWE13Mm1S?=
 =?utf-8?B?b0MzS2oySGEvcEd6QXRqOE02dGluR05wek5kT2JBV1FXZHg2ektSSnJYbjFF?=
 =?utf-8?B?UnBhMW1DRXdGVHFENUkvVzZhZU9wVUJKenZKY3hyLzNad2Myd2t1alg5bFdx?=
 =?utf-8?B?aS9DMUQ2U2RpdWJtMVg5ZTJseWhSQlBtdldzQTBTTHk0OEQ5dDNweEJ2RjdY?=
 =?utf-8?B?V3FLZ3RpY3haZWlNbkhVWUlNTFFweW8wQnFJYWxSRVhRMW5DMUN3aVcyRHN2?=
 =?utf-8?B?SndmRnJLQmg2anF4cUJjcXdVQU9mbmdsNTZuN2RXbFJONzYwNmVwMlZQeWdO?=
 =?utf-8?B?WGR5dk9hbGxrTEZ1bkQxUzVyL3Zya2l4SXNJc2NZcitPQkxaUDBZVC9XeDF1?=
 =?utf-8?B?ejMrUitQL01RZnlNcXB5Z3VRczA1LzNVczdCRGlTUjBKeXBRTDMyeTVyWmFJ?=
 =?utf-8?B?Nlk0SkRjRDhQM0hYRE8yMi9BM3lUZ2MzV3hsR1FKem0wTXdFWWxyeldKNllU?=
 =?utf-8?B?a2JEeTIxcEs0K1J1UWRPYkczRXNwYlR3bW45Y2Y5NUE0UWZtWlRwVm1GM1Rm?=
 =?utf-8?B?N3JVcllENmZNb2NWRktZT1ZhelNtdUlXNThWYi9SWGFPejFnWnZLTXMxd29s?=
 =?utf-8?B?blQ5Ky94Ti9mMmF4a0poQkJNd21QWjQvRDhNNnl0Ry9jaDNsemx6emRqbXRn?=
 =?utf-8?B?VU80dFVCakVMdDhveHZLZU9xVTAxaktEZ1VEaWZERzFPVm1LNU03c0s4cGQv?=
 =?utf-8?B?MHF3U0duTnViNWE1eVhFV1hDa3hyWXNoeTNzd1RqWGorWjNyeXFFQnhJbnh5?=
 =?utf-8?B?SHZIUm94dXM5MlM3dHpDTFNqL2lLbVg4R2cvcDZnRFVpUzc4VCtLdm0vdm9M?=
 =?utf-8?B?U3VweFJ2RzB2QW5jNWJTdWlzL1JvQ1lrc1dxNzNRSnZVNFluMHh4SGdrMmR2?=
 =?utf-8?Q?Zqynbn9/xS4jqRwSlvGzFmMgM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ktdlr0knkzNv4dcYo4FXmy+dcKdtbMHfPF4GjnBdxNJ5yxmqBJwLY1Hku+ZK9Q4XpUTN+AiQGsAAqyx4SZVTTFKtM8nUtPXQ9m9+v27s96DZ96E68Dusj9jtdjG4NaMICZpVBrcyBAAiytM8vRXH2+AAfaAirFcrgV51t8t0M3VIm8F/OGM8eRCFtkjCiga+sNnzStQmfm4OxuyKFHlJoxjVtAICmwtANHxgKibIQkxH7CI4/hoSJFuPXxVRGduHEbqFIt75wi4wYqqiNlm6fQaZZdz9O4FzmGSmfHUm3b/Ean2lbQfHUnaTJDrqINVysJHn33J/B6mS0BpDIj0tHzeyScHs36BMBqO9IPuEqtOAPInmK/r4tQKhPTyPlTqvs4FjzyRsCk/X2Cysw9/fCKSZ6xLZiWP6Pd2Zo5uL6CHywEGChTG0iKZwwvVxekGDLEcZ7Ka3H9E44xssAKXaHOp65rDdGHTLNgEQZTvTZWIeXbyWmIr1wDG7B6r4C8AEZ1IecHETFHy+jspOYV58a7hOmSwBrs4+K17wfyjjkg123MJ9iisGaoUApde2KCVhpP147PFJ7VQAbS0VIYxBtG1BxxcV4+STXyp2NrPoOFIdxX45KH9zRp3CSrK9hVQn
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB8163.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38348781-6ac1-4871-bb31-08dd4a7c86b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 09:14:45.2746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1H+9Cx3Pq6NJ4MD8c/vlQ+p/nFXbpganFYFbbkpR+th/lW6W84h3L3itva+uv213iontYVqjzLRtg1uPP/IY5oBz9KA3JGpmxW/1bMniFJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8354
X-Proofpoint-ORIG-GUID: w_Z-vrPkR8mJ_VJ3WIwt65-7KTkU1nY5
X-Proofpoint-GUID: w_Z-vrPkR8mJ_VJ3WIwt65-7KTkU1nY5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_091453_582839_FB7CD5F1 
X-CRM114-Status: GOOD (  13.96  )
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

Pk9uIDExLzIyLzIwMjQgMTowNyBQTSwgSmVmZiBKb2huc29uIHdyb3RlOg0KPj4gT24gMTEvMjIv
MjAyNCA5OjQyIEFNLCBUYW1pemggQ2hlbHZhbSBSYWphIHdyb3RlOg0KPj4+IEZyb206IE1hbmlz
aCBEaGFyYW5lbnRoaXJhbiA8cXVpY19tZGhhcmFuZUBxdWljaW5jLmNvbT4NCj4+Pg0KPj4+IElu
IGNlcnRhaW4gY2FzZXMsIGhhcmR3YXJlIG1pZ2h0IHByb3ZpZGUgcGFja2V0cyB3aXRoIGEgbGVu
Z3RoDQo+Pj4gZ3JlYXRlciB0aGFuIHRoZSBtYXhpbXVtIG5hdGl2ZSBXaS1GaSBoZWFkZXIgbGVu
Z3RoLg0KPj4+IFRoaXMgY2FuIGxlYWQgdG8gYWNjZXNzaW5nIGFuZCBtb2RpZnlpbmcgZmllbGRz
IGluIHRoZSBoZWFkZXIgd2l0aGluDQo+Pj4gdGhlIGF0aDEya19kcF9yeF9oX3VuZGVjYXBfbndp
ZmkgZnVuY3Rpb24gZm9yDQo+Pj4gRFBfUlhfREVDQVBfVFlQRV9OQVRJVkVfV0lGSSBkZWNhcCB0
eXBlIGFuZCBwb3RlbnRpYWxseSByZXN1bHRpbmcgaW4NCj4+PiBpbnZhbGlkIGRhdGEgYWNjZXNz
IGFuZCBtZW1vcnkgY29ycnVwdGlvbi4NCj4+Pg0KPj4+IEFkZCBhIHNhbml0eSBjaGVjayBiZWZv
cmUgcHJvY2Vzc2luZyB0aGUgU0tCIHRvIHByZXZlbnQgaW52YWxpZCBkYXRhDQo+Pj4gYWNjZXNz
IGluIHRoZSB1bmRlY2FwIG5hdGl2ZSBXaS1GaSBmdW5jdGlvbiBmb3IgdGhlDQo+Pj4gRFBfUlhf
REVDQVBfVFlQRV9OQVRJVkVfV0lGSSBkZWNhcCB0eXBlLg0KPj4+DQo+Pj4gVGVzdGVkLW9uOiBR
Q045Mjc0IGh3Mi4wIFBDSQ0KPj4+IFdMQU4uV0JFLjEuMy4xLTAwMTczLVFDQUhLU1dQTF9TSUxJ
Q09OWi0xDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBNYW5pc2ggRGhhcmFuZW50aGlyYW4gPHF1
aWNfbWRoYXJhbmVAcXVpY2luYy5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogVGFtaXpoIENoZWx2
YW0gUmFqYSA8cXVpY190YW1pemhyQHF1aWNpbmMuY29tPg0KPj4NCj4+IEFja2VkLWJ5OiBKZWZm
IEpvaG5zb24gPHF1aWNfampvaG5zb25AcXVpY2luYy5jb20+DQo+Pg0KPj4gT25lIG5pdC4uLg0K
Pj4NCj4+PiAtLS0NCj4+PiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9kcF9yeC5j
IHwgNDINCj4+PiArKysrKysrKysrKysrKysrKysrKysrKy0tDQo+Pj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0MCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMmsvZHBfcnguYw0KPj4+IGIvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9kcF9yeC5jDQo+Pj4gaW5kZXggMGZiMzljMTc0NDc1Li4y
NmZmOWEzNDZkY2EgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDEyay9kcF9yeC5jDQo+Pj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9k
cF9yeC5jDQo+Pj4gQEAgLTI0NzQsNiArMjQ3NCwyOSBAQCBzdGF0aWMgdm9pZCBhdGgxMmtfZHBf
cnhfZGVsaXZlcl9tc2R1KHN0cnVjdA0KPmF0aDEyayAqYXIsIHN0cnVjdCBuYXBpX3N0cnVjdCAq
bmFwDQo+Pj4gIAlpZWVlODAyMTFfcnhfbmFwaShhdGgxMmtfYXJfdG9faHcoYXIpLCBwdWJzdGEs
IG1zZHUsIG5hcGkpOyAgfQ0KPj4+DQo+Pj4gK3N0YXRpYyBib29sIGF0aDEya19kcF9yeF9jaGVj
a19ud2lmaV9oZHJfbGVuX3ZhbGlkKHN0cnVjdCBhdGgxMmtfYmFzZQ0KPiphYiwNCj4+PiArCQkJ
CQkJICAgc3RydWN0IGhhbF9yeF9kZXNjICpyeF9kZXNjLA0KPj4+ICsJCQkJCQkgICBzdHJ1Y3Qg
c2tfYnVmZiAqbXNkdSkNCj4+PiArew0KPj4+ICsJdTggZGVjYXBfdHlwZTsNCj4+PiArCXN0cnVj
dCBpZWVlODAyMTFfaGRyICpoZHI7DQo+Pj4gKwl1MzIgaGRyX2xlbjsNCj4+DQo+PiB0cnkgdG8g
a2VlcCByZXZlcnNlIHhtYXMgdHJlZSBmb3JtYXQNCj4NCj53aWxsIHlvdSBiZSBwb3N0aW5nIGEg
djI/DQo+DQpQb3N0ZWQgdjIgYnkgZml4aW5nIHRoaXMuDQoNCi1UYW1pemguDQo=

