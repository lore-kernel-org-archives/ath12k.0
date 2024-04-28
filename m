Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01B9C4345F
	for <ath12k@archiver.kernel.org>; Sun, 28 Apr 2024 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugo00kUe/pS/uW/6/kINghIUOcyWxqlRjgqBWTd+fNY=; b=WrM7jeazuo7EhoHX2yJs6qyVrD
	AWDohf/3kJiKGUAeIgvez0VehM9iW6dee8xnUk1xDG3W2BcAvESIXVY7lYtbWnMP/L4oCaBU6E94j
	f4+YFOfn00VETeGjQsiA6bmPlsJO9EIKDIYT4sd7Ei6tFFyK1iHy2TRwpb1aqxoRYxksR2661Qfy4
	scQ0idCyRoywynGwyd+mfutfz7ZfwJ0hsqtJ2AQn8jchOmV0SU3rO5S+Y4v8l3XX0Q4Odbej0bmsq
	raHKtQvQcDE2E/J9Fp/UV/imA1OJf0osCmjxftqQX2I2zqZ7LE0Oa+ZbHFXWClt/qt6hlV1kMbB0X
	EF0UJ8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s13zF-0000000HYug-0jeE
	for ath12k@archiver.kernel.org;
	Sun, 28 Apr 2024 12:50:33 +0000
Received: from mail-cwxgbr01on20701.outbound.protection.outlook.com ([2a01:111:f403:261b::701] helo=GBR01-CWX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s13zB-0000000HYtz-18wc
	for ath12k@lists.infradead.org;
	Sun, 28 Apr 2024 12:50:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBdomrkhKEjTUBZ1W1QUFlgdCM8bIKJSUosEm0Zr+EoyGr0LQz2Y36l2HjbXJ70jhjDNhUEX+oB5ToA8V5+Vcm4ddx8gcWW6vXYGknR+vsG7GKxZvRQOij8N+cTrkcjJKtvnyvVGgY8cB1rpPAJ56ElhiJPGwIsvT0TUaNxOdfXwFQdAjztqpv5FCRu95zGa1pzg/KO7rKNZi7NuPSuOqXr4/PeGFMK1lWG1wG567VrUYskaOxqi2ef4z4Xn0TfyVpSFPj+yJwGnr2lBFnYcpMtNJ26miv/pHRYkZ/4hoZEZpxmy8QHK8VcYVKfAKmFoTHKAPfVnLvVx5phxmD/IYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugo00kUe/pS/uW/6/kINghIUOcyWxqlRjgqBWTd+fNY=;
 b=CfMRZ5kEXTYxtY+84uCVTUu909DLZKeKo6vu2+Qi2Mkm0VqSLSrfJCEya/SVb4S58X4kKVOTwg1ZASEyqVMdxH9+/nEPu/pv+mfLm9pKY3KpEIYQnMfJ/pmZqwLdbToyD1QPi3+wHK1975++dXlWNAxFBeuJLHjDA+wu2hQnL4E9teeJaS9BSYg65D/Kd/bYE1A1L/Cp3dg/9zQzry0JO8GGGTjSlOszU0qSBmJm4Cjiw65vVEloKWbcAOmrGaM+F0w72cOdRyu7kDX2qO1uGov2A98hFl/FMsv0XGLEmIbGq3ISZ/lHPhH3Y8Axu4Zg6TTd8dnBzx4KqIoS4GdhtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by LO0P123MB6281.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:262::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sun, 28 Apr
 2024 12:50:19 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6%6]) with mapi id 15.20.7519.031; Sun, 28 Apr 2024
 12:50:19 +0000
From: david Atkins <david@3adesign.co.uk>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
Subject: RE: QCN9274 - x64 - AMD or Intel
Thread-Topic: QCN9274 - x64 - AMD or Intel
Thread-Index: AdqJgm7oK+VC6oatRu6N2BZpo//o1QB09+twAAR5jwAABFlrAAN8K9Tw
Date: Sun, 28 Apr 2024 12:50:19 +0000
Message-ID: <LO0P123MB4057F761D1A618B21AD236EBD6142@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
References: <LO0P123MB4057B28CB310E5A1CEEF92F0D6002@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB40575CCD8D6A3AB863596DE2D6062@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <3ff953f9-d6ce-4e96-9d16-401ddb9ad1d6@quicinc.com>
 <e39dc9fd-b4fb-4db1-bdcc-e2119b967c64@quicinc.com>
In-Reply-To: <e39dc9fd-b4fb-4db1-bdcc-e2119b967c64@quicinc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=3adesign.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|LO0P123MB6281:EE_
x-ms-office365-filtering-correlation-id: 84ee4bce-e94c-417e-fdd2-08dc6781c2b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?UXZOMFV0QVBUcWNrd05SU3N3d1NRZWlod2ZEeVNZYlhpYWoxQmJqY0lob0dE?=
 =?utf-8?B?SUpMSVVKU3o1QVFveTN1MHR2WnIrMWFGVStMS05DNHpvc3NxWHFKQTVReDZt?=
 =?utf-8?B?VjdEaDVtWGZhVWVhSk8zOS9HWFRTQk05eTBQblJac3BQQzFIN3pwWmZ5MnNY?=
 =?utf-8?B?OXJzM1k5T3IwWDVPS0Zza09sOHpuU3V5blY5Y3FYdEJYUkZLWlFZSStudW9x?=
 =?utf-8?B?VUcxY25tTFpvZVJZQnNoOVFsa0hlcHZNakVIS2pFb2xVNXV5WC9Ld0cwQkll?=
 =?utf-8?B?R09wMzJqbTRBT2tqU2dHTGtzZUVtV0JNL0kwdjJrNXVJS0lUd0d0cXlrQjhU?=
 =?utf-8?B?RnczaFNLSVBFUFlwQ2EySEZNamlhREtjK3dQeUZEbzFFZ1dwbkxxOUR4Y3Y4?=
 =?utf-8?B?TUNUU3dadVZhb3VPbGpWRGIxMlV3TEQ2NDJmY1l6ZnF0bjE4a0IwS21WVFY1?=
 =?utf-8?B?cGpwOUNRWnB6U0VGMm1FSTYvc0lyaGtTRGkweGFZMnJTYlp4eDk5ajhqQmlM?=
 =?utf-8?B?UFkrRkNvOTNuK21vb3l4cXJmdEJ2WXgrbjU4RnhpTW5VTmxIOE5xMWVpazZy?=
 =?utf-8?B?KzdOaUd4UXNpRTBrbXZiMkRsMk5BOHMwM1QzNVdDVndvcXpTdi9QY3hPZjJJ?=
 =?utf-8?B?R0ZST3lXOUZybEtRWjdjU1hRRklOUEVBQ3Q5MnorZlFDWE85WUxZMnpXeEFU?=
 =?utf-8?B?VE5FbXVRampzTFZXbTF6ZDdEbXRyQTNYYTdRWlovN2pUL2VSb1QrM3g1U1Vv?=
 =?utf-8?B?bGFJc0FIdU9NSGs1a0VWRlhxaGI0S1ByZkNxSkRpMmlNRzVUWEhQMW5NRHpj?=
 =?utf-8?B?WVVMRERpREhRbWxYQWMyT25mUWxIejFyQTZQVmsveDBVSG5qSHo0QUY2eS9u?=
 =?utf-8?B?SndPMWRVL1VxUFpqQ1NKTHJuMTJkbEJLNmJXZlczL0xjelRRWDZDOHl5b3BX?=
 =?utf-8?B?czRRNU9nL2JoaVRoQUhySWVXUTRya1NPN0psSnJFZG5kUFlqSTJDeUM5QXJh?=
 =?utf-8?B?QktCbmRqL1JaVEFwZjdMcExsUmlYK1ZWRzdxdk1kaHJJWFRORTFKYVp6Y0RY?=
 =?utf-8?B?QjdJcGhCSnNTWmhiNklGUHFxYUtIVlJtc3MrSlhDOTFLVEVWNWNnQisvSGJQ?=
 =?utf-8?B?MkJtVHBrZmlhS3ZYTkRnNjBGOTFuS050SFl3Ykl4TzZkbTVMQndMekU4QUxR?=
 =?utf-8?B?Wkl4NXY1NXBxdSsrTGZMbllSdVI4SVhBQ2dmWlZoNmxQS2pOSm41Ry95elp5?=
 =?utf-8?B?S2ZkOFVtRU16ZE96OWtXZC9BdkRXc29NTThMd1krV3JtY29LMEV1SnRpVitp?=
 =?utf-8?B?Rys0VTgrNTBES0tPOTJDSVJGU2lxckgzWmpGdisrMTB0Rmh4VnE5M1cvem1D?=
 =?utf-8?B?TllsZUNsdWtZY2dub1NmVU1kWnJ0Sm5iSjMrY1h2TFlSYmxxSFcyUnI2S29P?=
 =?utf-8?B?RVYvT05FMzZVeExIdkJkVjdOQTh6eTg1TlhtNllpVEsxa29pRE1WYWhZNzlB?=
 =?utf-8?B?aXhKWVl6azNvYVlTS3V0ZnBGNXhxUE5HRnVYUE5vaE9GODV4UElMN09ET2RC?=
 =?utf-8?B?VGl5L1JlYVlsYnV6bGRUekU0VEJGZHZ3Q1hMbVdqR2ZEZWtMeW9TcFVxTzlo?=
 =?utf-8?B?QTFIMFdqTFRxa1JyNGp1VzhKTSs3UXZRNFlQSzVYT2RBdG5IbVpwVmpKUzFC?=
 =?utf-8?B?QXdXWCtOZ29HY29RYnBCc0dMam9odzl0WlZjQVg1bG9VU1pYeGVzQU9MUWZh?=
 =?utf-8?B?ODBTaExQTzJaMjdmSkRtVHhCOFlNNEpZQzIrUmhlVFRGcEJjdjVSeVJFK1JK?=
 =?utf-8?B?b1Jza3ZBeDB6dkxjUDBkQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWFuSmxxRlc1UlBiNktqeVhycDRFZkQ4TUpVaHAycjlteEFkdTYyZEtOSUtR?=
 =?utf-8?B?Z0tjeFBGN1R1aUpkK0xwODE2U20wblNYSTdaeXlsQVkwNjBkazFIZmxiMkpa?=
 =?utf-8?B?OXFUU1A4cUNwb3o4RzdZVUg0UFRyNW5SS1BOMzF6cXl6VFNPa3krREl5bmx4?=
 =?utf-8?B?bWFZNXhWeVA3SlF4bnNsZWtham9JRVY1eDBOcHpac05Ub1g0clQ0ZUpSWith?=
 =?utf-8?B?TmVXNllTYklSSnN2RGVtZmQ5TVkvZnR3YjlzUHEySFBZQnEwWUlDNDNNaDZD?=
 =?utf-8?B?S2ZvT3hpWjZVUUE4UllZVVB3UktJbUdZdGtpQTVOZ24wdGp6K2hIcFV2a2N6?=
 =?utf-8?B?VFBZUkRWQmdMaHl2dmRPQXgySGpqUTBUc2VoTDRzUlpGbHdsb3BPSWNEUVZI?=
 =?utf-8?B?WkRFSVZYVEptWlF0azRvaW5VbithakRCenBSLytvUVFRVnE4dGJ1N1pBNWRQ?=
 =?utf-8?B?MkVZTCtxcTlXNVRRbmpIbnFvaDBLSU5sNVNqRG1PTE1zZWZTRWk1YXN3MkF2?=
 =?utf-8?B?MkxDNkoySFJnZUZqRjJZR0VtV2hMSUVqVVRKcW50bW9QM2Z2bjBFVWlEMHF6?=
 =?utf-8?B?SmxvQ2txZGoycWdjaGp5YlBWcUZpRXpTbDRTcVhDeFp3SHJ5NUlkZzZ6M1Bo?=
 =?utf-8?B?TUp1REo5Y1piSGpoZDR6UnpMRDRLVWt3dzlDUHc2VlcrdmdYRW1QRVdqbTVi?=
 =?utf-8?B?cVZYNXJpNGVYRk5sNTZYbVlPOFNDQWRvZzNIN2kvZG9WYzBnNktVMkRkZXVF?=
 =?utf-8?B?VzhyZ3d3NmVTUHE2K0ZxUEJLK3JmeHVLZG0xZXNQUWx3bGE1ZGpUcGRtNk5y?=
 =?utf-8?B?K2FzemNZUGlJN0p1dmFPR1FhZFZxRzZWZ2ZJR3dUZWNlZGhlNUROelE0WElK?=
 =?utf-8?B?ZVlad3h0Q2FJaWUyd21ma3JtZURONXJiRXl3SEM2Z0FWR1ZQcmdyMGdLUGtp?=
 =?utf-8?B?TlNGb0RhbkRMY1BKREtydDl0RmlNNVZyZ3p5Q3JkaGd2RkQzbDRZVlRWbzRv?=
 =?utf-8?B?ck4xMk1Vc0lJSWRjM0V4MktkalNpM3hHNUM5UG1rdkRCcTdSa3ZpbVVONytJ?=
 =?utf-8?B?Y3RkWkxHMFVTcmpIRTNCS0ovSGUrY0twQ3Ara1lKd2tLeTZOK3FadHk0WlpU?=
 =?utf-8?B?YzN6ZDZ3Vys5cEVFdGNjeVk5ZTJDbExvTUZhcHVXeEtMT1RCUHBESys1Yk50?=
 =?utf-8?B?STVnR2J0ZlYvNythSmdZTHhPK1JUaFNnbTNxRUJEY2p6RWxkQkhzYXBNbVNa?=
 =?utf-8?B?TVNsaDAvQVZKS050bTVBNUpqV1VWMFhKVWNCaW1xeXVWM0VUU2wxQ3Zya1Fq?=
 =?utf-8?B?MmVLWlorYWdLS0s1U2R4L1B2RXc3WEIrb1hRaWgxWEdaSHluY2o5MW5hM241?=
 =?utf-8?B?MUVJL2FBVGhjNDRvdVlUaXJNUzdJbjdTRnUyaEFyWkNPUjZvNVIrcXplY215?=
 =?utf-8?B?ZnRuSHdTZnphMWRWNUtOKzhidjkyTnRGS05zeXp1aUFLU2huVThaUHo5d2NN?=
 =?utf-8?B?U2dSZWdhN1pQcGRRVC9ncTRjMkRGYkdld2xnYVFPRXNPRktMUHM5cUJnSjVD?=
 =?utf-8?B?bVZqVGozaUoxWFUyYU5JNFJieUpsNVVVMVVGekhzcnc5a1UxaDdmN2dwZGVF?=
 =?utf-8?B?eXlhUWI2UjBza2VoVVErd0trUWg3K1dhZ003dDZaVExwRVlaT3VuaEcxY3hh?=
 =?utf-8?B?ZVpYQ0x0Q0JHejJJNlNNY0Zma052Q1h6ckIwc285OXZGVEhGNGdOanExU3cx?=
 =?utf-8?B?dSs4U2c5alNGaHJhd1NhaGE0QURSb1JLcFc2bVo2K1pGcXF3U0ZjRkEwdFM0?=
 =?utf-8?B?dVFpaFMrWStVY3RxeWh4QzZ5a2poQXRaaDQ4YmY3d2Q1MXJBU3dWeGpoNTdX?=
 =?utf-8?B?RFBCOTBqMEJBZFNpUTRSVmE5Vk5Da1Fob3VUQW9UUGRGeHBYWi80bUtmYjhH?=
 =?utf-8?B?SUZDMnJuOWt4TWZCb2w1WnRXTFpJRlNYSlpoRnhEMFBLcG5lRXZGSlI4RjVw?=
 =?utf-8?B?dVFsNVcwMXdoL1Z5S3ZoTnBXcS9Gd3FmN0tqYW5XZ1Ntb2tsNWVVTTdKc2ly?=
 =?utf-8?B?WWRPTkh2eG81MVl6MEprYW5jWlpCSFY4cm9kakZDVDkvK1VOSVVzb3FSUFFM?=
 =?utf-8?Q?lgr8BRD8eAjYNZGKsbc1/zD1k?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ee4bce-e94c-417e-fdd2-08dc6781c2b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2024 12:50:19.4061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ewcLvcUBDS2ErYvhrSKU3ANx6ii3wWuvLJfv0PZ0j5n0kv/s8qsD8lP5VEeagF1bvXt2F8bsYm6Qo9NT5kw9lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB6281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_055029_499656_A2977FE9 
X-CRM114-Status: GOOD (  23.38  )
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKZWZmIEpvaG5zb24gPHF1aWNf
ampvaG5zb25AcXVpY2luYy5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMTAsIDIwMjQg
ODowMiBQTQ0KPiBUbzogZGF2aWQgQXRraW5zIDxkYXZpZEAzYWRlc2lnbi5jby51az47IGF0aDEy
a0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+IFN1YmplY3Q6IFJlOiBRQ045Mjc0IC0geDY0IC0gQU1E
IG9yIEludGVsDQo+IA0KPiBPbiA0LzEwLzIwMjQgOTo1NyBBTSwgSmVmZiBKb2huc29uIHdyb3Rl
Og0KPiA+IE9uIDQvMTAvMjAyNCA3OjUyIEFNLCBkYXZpZCBBdGtpbnMgd3JvdGU6DQo+ID4+DQo+
ID4+IEkganVzdCBidWlsdCB0aGUgYXRoLW5leHQgYnJhbmNoIGZvciBteSBBTUQgUnl6ZW4gMyA0
MzAwVSBzeXN0ZW0gd2l0aA0KPiA+PiBhbiA4ZGV2aWNlcyBRQ045Mjc0IG1vZHVsZSwgaXQgYXBw
ZWFycyB0byBoYXZlIGEgbmV3IG1lc3NhZ2UNCj4gPj4NCj4gPj4gbWVtb3J5IHR5cGUgMTAgbm90
IHN1cHBvcnRlZA0KPiA+Pg0KPiA+PiBpbiB0aGUgZG1lc2cgbG9ncw0KPiA+Pg0KPiA+PiBbwqDC
oMKgIDIuNzA1NjU2XSBhdGgxMmtfcGNpIDAwMDA6MDM6MDAuMDogQkFSIDAgW21lbQ0KPiA+PiAw
eGZlMjAwMDAwLTB4ZmUzZmZmZmYgNjRiaXRdOiBhc3NpZ25lZCBbwqDCoMKgIDIuNzA1NjcyXSBh
dGgxMmtfcGNpDQo+ID4+IDAwMDA6MDM6MDAuMDogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+IDAw
MDIpIFvCoMKgwqAgMi43MDU4ODVdDQo+ID4+IGF0aDEya19wY2kgMDAwMDowMzowMC4wOiBNU0kg
dmVjdG9yczogMTYgW8KgwqDCoCAyLjcwNTg4OV0gYXRoMTJrX3BjaQ0KPiA+PiAwMDAwOjAzOjAw
LjA6IEhhcmR3YXJlIG5hbWU6IHFjbjkyNzQgaHcyLjAgW8KgwqDCoCAzLjQwNTMyOF0gYXRoMTJr
X3BjaQ0KPiA+PiAwMDAwOjAzOjAwLjA6IG1lbW9yeSB0eXBlIDEwIG5vdCBzdXBwb3J0ZWQgW8Kg
wqDCoCAzLjQxMDc5Nl0gYXRoMTJrX3BjaQ0KPiA+PiAwMDAwOjAzOjAwLjA6IGNoaXBfaWQgMHgw
IGNoaXBfZmFtaWx5IDB4YiBib2FyZF9pZCAweGMgc29jX2lkDQo+ID4+IDB4NDAxYTIyMDAgW8Kg
wqDCoCAzLjQxMDgwNF0gYXRoMTJrX3BjaSAwMDAwOjAzOjAwLjA6IGZ3X3ZlcnNpb24NCj4gPj4g
MHgxMDExMDAxZCBmd19idWlsZF90aW1lc3RhbXAgMjAyMi0xMi0wMiAwMToxNiBmd19idWlsZF9p
ZA0KPiA+PiBRQ19JTUFHRV9WRVJTSU9OX1NUUklORz1XTEFOLldCRS4xLjAuMS0wMDAyOS0NCj4g
UUNBSEtTV1BMX1NJTElDT05aLTENCj4gPj4gW8KgwqDCoCAzLjQzMTM0N10gYXRoMTJrX3BjaSAw
MDAwOjAzOjAwLjA6IGZhaWxlZCB0byBmZXRjaCBib2FyZCBkYXRhDQo+ID4+IGZvciBidXM9cGNp
LHFtaS1jaGlwLWlkPTAscW1pLWJvYXJkLWlkPTEyIGZyb20NCj4gPj4gYXRoMTJrL1FDTjkyNzQv
aHcyLjAvYm9hcmQtMi5iaW4gW8KgwqDCoCAzLjQzMTM3NV0gYXRoMTJrX3BjaQ0KPiAwMDAwOjAz
OjAwLjA6IGZhaWxlZCB0byBmZXRjaCBib2FyZC5iaW4gZnJvbSBRQ045Mjc0L2h3Mi4wIFvCoMKg
wqAgMy40MzEzODZdDQo+IGF0aDEya19wY2kgMDAwMDowMzowMC4wOiBxbWkgZmFpbGVkIHRvIGxv
YWQgYmRmOg0KPiA+PiBbwqDCoMKgIDMuNDMxMzg3XSBhdGgxMmtfcGNpIDAwMDA6MDM6MDAuMDog
cW1pIGZhaWxlZCB0byBsb2FkIGJvYXJkIGRhdGENCj4gPj4gZmlsZTotMg0KPiA+Pg0KPiA+PiBJ
J2xsIHRyeSBvbiBteSBvdGhlciB0ZXN0IGJlZCBzeXN0ZW1zLCBidXQgaXMgaXQgZXhwZWN0ZWQg
dGhhdCB0aGlzIHdpbGwgZ2V0DQo+IGZ1cnRoZXIgdGhhbiB0aGlzID8NCj4gPg0KPiA+IEkgYmVs
aWV2ZSB0aGUgbWVtb3J5IHR5cGUgMTAgbWVzc2FnZSBjYW4gYmUgaWdub3JlZCAoSSd2ZSByZWNl
aXZlZA0KPiA+IGNvbmZsaWN0aW5nIGluZm9ybWF0aW9uIG9uIHRoYXQpDQo+ID4NCj4gPiBZb3Ug
bmVlZCB0byBnZXQgdGhlIGJvYXJkIGZpbGUgaW4gcGxhY2UuIFBsZWFzZSBncmFiIHRoZSBvbmUg
YXQ6DQo+ID4gaHR0cHM6Ly9naXQuY29kZWxpbmFyby5vcmcvY2xvL2F0aC1maXJtd2FyZS9hdGgx
MmstZmlybXdhcmUvLS9ibG9iL21haQ0KPiA+IG4vUUNOOTI3NC9odzIuMC9ib2FyZC0yLmJpbg0K
PiA+DQo+ID4gQW5kIHBsYWNlIGl0IGluIDxmaXJtd2FyZT4vYXRoMTJrL1FDTjkyNzQvaHcyLjAv
DQo+IA0KPiBCYXNlZCB1cG9uIGZ1cnRoZXIgaW5mb3JtYXRpb24gaXQgc2VlbXMgeW91ciBjYXJk
IGlzIGFkdmVydGlzaW5nIGEgYm9hcmRfaWQNCj4gdGhhdCBvdXIgZGVmYXVsdCBib2FyZCBmaWxl
IG1heSBub3Qgc3VwcG9ydCwgc28geW91IHNob3VsZCBjb250YWN0IDhkZXZpY2VzIHRvDQo+IHNl
ZSBpZiB0aGV5IGhhdmUgYSBjdXN0b21pemVkIGJvYXJkIGZpbGUgZm9yIHRoYXQgZGV2aWNlLg0K
PiANCj4gL2plZmYNCg0KR290IHVwZGF0ZWQgZmlybXdhcmUgZnJvbSA4ZGV2aWNlcywgaXQgaXMg
bm90IHdvcmtpbmcgYnV0IGRvZXMgbm93IHNob3cgdXAgYXMgYSB3bHAgZGV2aWNlDQoNCiQgc3Vk
byBkbWVzZyB8IGdyZXAgYXRoMTINClsgICAgMi42MjA5MDFdIGF0aDEya19wY2kgMDAwMDowMzow
MC4wOiBCQVIgMCBbbWVtIDB4ZmUyMDAwMDAtMHhmZTNmZmZmZiA2NGJpdF06IGFzc2lnbmVkDQpb
ICAgIDIuNjIwOTE4XSBhdGgxMmtfcGNpIDAwMDA6MDM6MDAuMDogZW5hYmxpbmcgZGV2aWNlICgw
MDAwIC0+IDAwMDIpDQpbICAgIDIuNjIxMTM5XSBhdGgxMmtfcGNpIDAwMDA6MDM6MDAuMDogTVNJ
IHZlY3RvcnM6IDE2DQpbICAgIDIuNjIxMTQyXSBhdGgxMmtfcGNpIDAwMDA6MDM6MDAuMDogSGFy
ZHdhcmUgbmFtZTogcWNuOTI3NCBodzIuMA0KWyAgICAzLjM4NzY0NV0gYXRoMTJrX3BjaSAwMDAw
OjAzOjAwLjA6IG1lbW9yeSB0eXBlIDEwIG5vdCBzdXBwb3J0ZWQNClsgICAgMy4zOTIyNTRdIGF0
aDEya19wY2kgMDAwMDowMzowMC4wOiBjaGlwX2lkIDB4MCBjaGlwX2ZhbWlseSAweGIgYm9hcmRf
aWQgMHhjIHNvY19pZCAweDQwMWEyMjAwDQpbICAgIDMuMzkyMjYwXSBhdGgxMmtfcGNpIDAwMDA6
MDM6MDAuMDogZndfdmVyc2lvbiAweDExMDEwY2Y5IGZ3X2J1aWxkX3RpbWVzdGFtcCAyMDI0LTAy
LTAyIDA3OjQzIGZ3X2J1aWxkX2lkIFFDX0lNQUdFX1ZFUlNJT05fU1RSSU5HPVdMQU4uV0JFLjEu
MS0wMzMyMS1RQ0FIS1NXUExfU0lMSUNPTlotMQ0KWyAgICA2LjE2NDIwM10gYXRoMTJrX3BjaSAw
MDAwOjAzOjAwLjA6IEhUQyBTZXJ2aWNlIFdNSSBNQUMxIGNvbm5lY3QgcmVxdWVzdCBmYWlsZWQ6
IDB4MSkNClsgICAgNi4xNjQyMjddIGF0aDEya19wY2kgMDAwMDowMzowMC4wOiBmYWlsZWQgdG8g
Y29ubmVjdCB0byBXTUkgQ09OVFJPTCBzZXJ2aWNlIHN0YXR1czogLTcxDQpbICAgIDYuMTY0NzQ4
XSBhdGgxMmtfcGNpIDAwMDA6MDM6MDAuMDogSW52YWxpZCBtb2R1bGUgaWQgMg0KWyAgICA2LjE2
NDc1M10gYXRoMTJrX3BjaSAwMDAwOjAzOjAwLjA6IGZhaWxlZCB0byBwYXJzZSB0bHYgLTIyDQpb
ICAgIDYuNDcyNTY3XSBhdGgxMmtfcGNpIDAwMDA6MDM6MDAuMCB3bHAzczA6IHJlbmFtZWQgZnJv
bSB3bGFuMA0KWyAgICA4LjU4NDQwOV0gYXRoMTJrX3BjaSAwMDAwOjAzOjAwLjA6IGZpcm13YXJl
IGNyYXNoZWQ6IE1ISV9DQl9TWVNfRVJST1INClsgICAxOC4zOTUxNzddIGF0aDEya19wY2kgMDAw
MDowMzowMC4wOiBmYWlsZWQgdG8gc2VuZCBXTUlfU1RPUF9TQ0FOX0NNRElEDQpbICAgMTguMzk1
MTg1XSBhdGgxMmtfcGNpIDAwMDA6MDM6MDAuMDogZmFpbGVkIHRvIHN0b3Agd21pIHNjYW46IC0x
MDgNClsgICAxOC4zOTUxOTRdIGF0aDEya19wY2kgMDAwMDowMzowMC4wOiBmYWlsZWQgdG8gYWJv
cnQgc2NhbjogLTEwOA0KWyAgIDE4LjYxOTA1OV0gYXRoMTJrX3BjaSAwMDAwOjAzOjAwLjA6IGZh
aWxlZCB0byBzZW5kIFdNSV9TVEFSVF9TQ0FOX0NNRElEDQpbICAgMTguNjE5MDcwXSBhdGgxMmtf
cGNpIDAwMDA6MDM6MDAuMDogZmFpbGVkIHRvIHN0YXJ0IGh3IHNjYW46IC0xMDgNClsgICAyMy4w
MDE5MjNdIGF0aDEya19wY2kgMDAwMDowMzowMC4wOiBmYWlsZWQgdG8gc2VuZCBXTUlfU1RBUlRf
U0NBTl9DTURJRA0KWyAgIDIzLjAwMTkzNF0gYXRoMTJrX3BjaSAwMDAwOjAzOjAwLjA6IGZhaWxl
ZCB0byBzdGFydCBodyBzY2FuOiAtMTA4DQpbICAgMzAuMDAyOTQzXSBhdGgxMmtfcGNpIDAwMDA6
MDM6MDAuMDogZmFpbGVkIHRvIHNlbmQgV01JX1NUQVJUX1NDQU5fQ01ESUQNClsgICAzMC4wMDI5
NTRdIGF0aDEya19wY2kgMDAwMDowMzowMC4wOiBmYWlsZWQgdG8gc3RhcnQgaHcgc2NhbjogLTEw
OA0KWyAgIDQwLjAwMzM0Ml0gYXRoMTJrX3BjaSAwMDAwOjAzOjAwLjA6IGZhaWxlZCB0byBzZW5k
IFdNSV9TVEFSVF9TQ0FOX0NNRElEDQpbICAgNDAuMDAzMzU0XSBhdGgxMmtfcGNpIDAwMDA6MDM6
MDAuMDogZmFpbGVkIHRvIHN0YXJ0IGh3IHNjYW46IC0xMDgNClsgICA1NC4wMDI5MjJdIGF0aDEy
a19wY2kgMDAwMDowMzowMC4wOiBmYWlsZWQgdG8gc2VuZCBXTUlfU1RBUlRfU0NBTl9DTURJRA0K
WyAgIDU0LjAwMjkzMl0gYXRoMTJrX3BjaSAwMDAwOjAzOjAwLjA6IGZhaWxlZCB0byBzdGFydCBo
dyBzY2FuOiAtMTA4DQpbICAgNzQuMDAyMDg2XSBhdGgxMmtfcGNpIDAwMDA6MDM6MDAuMDogZmFp
bGVkIHRvIHNlbmQgV01JX1NUQVJUX1NDQU5fQ01ESUQNCg0KSXAgYSByZXN1bHRzDQoNCjQ6IHds
cDNzMDogPE5PLUNBUlJJRVIsQlJPQURDQVNULE1VTFRJQ0FTVCxVUD4gbXR1IDE1MDAgcWRpc2Mg
bm9xdWV1ZSBzdGF0ZSBET1dOIGdyb3VwIGRlZmF1bHQgcWxlbiAxMDAwDQogICAgbGluay9ldGhl
ciBjNDo5MzowMDo0YzpjZDoxNCBicmQgZmY6ZmY6ZmY6ZmY6ZmY6ZmYNCg0Kbm1jbGkNCg0KDQp3
bHAzczA6IGRpc2Nvbm5lY3RlZA0KICAgICAgICAiUXVhbGNvbW0gUmVub2lyL0NlemFubmUgR1BQ
IEJyaWRnZSINCiAgICAgICAgd2lmaSAoYXRoMTJrX3BjaSksIEM0OjkzOjAwOjRDOkNEOjE0LCBo
dywgbXR1IDE1MDANCg0KZGF2aWQNCg0KDQo=

