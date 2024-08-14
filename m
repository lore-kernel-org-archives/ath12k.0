Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8FAC3DA4A
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 17:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBw5/I1fQK4Uf/HjpMF315v50pMchu4C3KdWmmPQL1c=; b=itmW9gcOLGJlYNP0rpdkKjoTFI
	iRphNiuJmsKuS1Fw5KJcDZyPo8pBfrB23w+CNKULuSxncr4If03Acz/IhDv66RmYFGXzcv8AFaXcX
	Vvzr2ohjA9L44MeRlw/RdnlJxwCDWKdf5L0W9qqGmJ0fNwjVp0qVPnN+a4v2o5uUtdxKJO+OI0ydD
	qxFAkIQCBmihH5DYT6g1HoykyyBMjrw/gYwJdWAPUhQV1+jZDLnZSo3pjb/m8XoHFd4SildvA9BoA
	gdqaIyZtmhCHCBBqBPHZnWhTx7nuaVUGJ87gxtZYWeLblwrrilaHQ617wqKeYjg3HAZSYM7/N5Ewz
	adXYD+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seHMW-00000007l1T-3uDj
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 17:00:40 +0000
Received: from mail-cwxgbr01on20726.outbound.protection.outlook.com ([2a01:111:f403:261b::726] helo=GBR01-CWX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seHMU-00000007l14-1gtO
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 17:00:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSLL44O/OSlRV/tSx0vexkXQlq1VwW9pPQJ75xbLbyTD9tBNrJQRCst5hrSEY/CdkDr1ZinaDYx8Yd046/DRFdFLbVLewWqK2MG2gckiN4LFw5voruI05ez1ada9YJwmpB1JtI0ar3XLiL5UC+qnmGWS0xqdWzLQBbJpb5DoZT4dtdo6SIM8etsAbs72ZM6tEPTe0W+3cYADgB4bx1P+vFA0HG57ydPAPcrq1UyswsikG0pWYkdKQ1LCMJFm7Yc88HP9tw4ak8PRqPIpEx0jVmTDaApvraGX5l8FwicM9ctGKRXICXQIlHt09JSU1+W/BEGNMgrqu+aqByhNwb7n8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBw5/I1fQK4Uf/HjpMF315v50pMchu4C3KdWmmPQL1c=;
 b=IAdQTUsJpxffkbHnlWNVHOWlbz0AqWeAiYGlMlAXNShbuWZx4mCA2UsF+DfcnzbikeMjVM78u2VLS4G3Zs5Em8Csafl6I/agiDmnfmtUbWi2T7QVbMLc8febrzxoWx4gxk6Zg+wclyG6H9k5lh6XL+4qflyZkLMa1zQQMjucqZpKgOnSprDWQs3zL3r8Drs+pdtZ7gSuz4B4hJ4xKXy2I9Ha8QPQAmlTNEpm9pvqv+cTLIGp+KWDg8RhwDXMnYdkzXQkqIJ0KRngekKHGX+lBwk+mU8yRmkaO+BsNH1J4OFpy3iPs68kJk4MTqRJ4km/7WoMSDGXxcYLF36EBJPlTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by LOYP123MB3504.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:11b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Wed, 14 Aug
 2024 17:00:35 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6%5]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 17:00:35 +0000
From: david Atkins <david@3adesign.co.uk>
To: Baochen Qiang <quic_bqiang@quicinc.com>, "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
Subject: RE: wcn7850 issues
Thread-Topic: wcn7850 issues
Thread-Index: AQHa7kGb/waLDsK5rUe0AflzG3bOpLIm+iFw
Date: Wed, 14 Aug 2024 17:00:35 +0000
Message-ID: <LO0P123MB40570A86EF5B8D91E9EBB3B7D6872@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <be53813c-3edc-4734-b59d-83f43f14ea91@quicinc.com>
In-Reply-To: <be53813c-3edc-4734-b59d-83f43f14ea91@quicinc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=3adesign.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|LOYP123MB3504:EE_
x-ms-office365-filtering-correlation-id: 6dc981c1-5015-47af-f47d-08dcbc829d5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WnNMbVdRSGpJSnRHNEtHR2pvQVdOWllMemRyY3ZlaGVyS29XU2pDRkNQc1ZS?=
 =?utf-8?B?aFpGcUN0QWIySnpDeEZQK1ZESE5TZmJaelJ1UzZkQnZQR2hNUHJybktSS3Qr?=
 =?utf-8?B?cnR1RHQrd1VBWTZyTkY5dkJ5QkdxWTZESDkrYzVaejZKQk1ERXdBL1pNUXVo?=
 =?utf-8?B?WUpuc25iVTY4dE5waXlNYzVXcjNxbW9TWGRrakhtS1E4M3Z6WVBaRVJadXJH?=
 =?utf-8?B?L2FpQmFyVGZGc0VGK1JlVmlvQjdPQ0JvRXg5VVhsS1dYMWptTlhQR0plNFgy?=
 =?utf-8?B?V0JzNkVuc2lKaVhHbWhPNm03YnluMmlRY3VYUDNCREZ3N2RmMldreWlqWktB?=
 =?utf-8?B?N3JrZGJYRGw1c3d6MWJma09tL1pLejVYWm5tcXZvT2ppT3ovVHhDeUZURmlC?=
 =?utf-8?B?ajg2RzVqdzZsZlIxVnNZQ3FNa010d2E5ZTNHQlR5MjV6NlhuREtoTU1nYVFw?=
 =?utf-8?B?ZDE5YTN2RTNRNzZ1STdsZkVVZGh0dUF3L1JRN3ZpVlpUbVVnVHVPaDdMR1JU?=
 =?utf-8?B?M0V1bll4c2NURjMwdWRJaTM0VUhQdjZjalMzcE1Ucy9xbEc3Mll5WU1uOWdt?=
 =?utf-8?B?dy9nYksrNXJlTVRvTlFUaThIOEt3Z296Tkl1MTFrbHA2YWlWWXJPY29HRnJQ?=
 =?utf-8?B?NXZ5djd3dWdqUW9aUEtYKzZmaHd2blYySnZhU0RuZzZKMkFVVHAxYzhlQmFC?=
 =?utf-8?B?RnAxbXhXNzZpUC9oMTE3dWJUV0FNVFhEVVNGZkpTSU5BUG53UklQbkx5bUp4?=
 =?utf-8?B?WnY0TjlMK0g5VGIrbFgxa2tnR3M5T0E0NFpmMlJoQ2FJcDdOeVFZOHZ4NXV5?=
 =?utf-8?B?bVRSa21qMTFBSHB4VmlDenJxWmhacGNkUW52RnhobVlES05VZVpOOFRnSWxm?=
 =?utf-8?B?cFpoWkhaNStIQzcwNTgxVFpwOE1sTmN1ZisvMUk1K20xaUYrZXN1MFJwVlFT?=
 =?utf-8?B?MVUwcU1RSGZKdDh0U1pwSHd3THczRHFsN2xpNHk4dEFtNUpaUXlZVlhEcWt4?=
 =?utf-8?B?d00rdEFtdzI5YkJ4b1lTQ0JOcGNhelVLZEtnOElVZ3ZZSzRDcTVLbHEzYmVE?=
 =?utf-8?B?amd0cWVZZlhYS2tNTWlHejBsZU02bkFXclFaOC9uMFhNOTllc3o0TWRNM2ZV?=
 =?utf-8?B?bWY1b2xzZlMvU3J3U2pqWitIUTlyWjhXeC81SXAyZnNMbWwzdFZ3b1pyMXZX?=
 =?utf-8?B?ZGZzZ3RnL1UwUE1NODdrc25DVUNOMTlwb29seDdYQ1ZXSkVDVFN5MTllclRG?=
 =?utf-8?B?MWNhNUFKTVFyVTNRR0U4NkJ0WERjUnZFeDJIWXByd0FiSHc2YWZWV3M3LzQr?=
 =?utf-8?B?T2ZEcmlWV0VCVXc2MEdqU2tIZmZFL0djd2FWVUlPOVJISTJHM3RLZmlUemJa?=
 =?utf-8?B?NjJHS2NvT01vNmtsSGJqU256OWs3cmVadWQ0ZGdNRTlBdy9PdThwVXZqWmlZ?=
 =?utf-8?B?R1h2ZDhpM2x3Z0hVdVB6T0NpUVZXK2FmdXVkWWdlRnBzNm9IUzUwU0t1U3Nu?=
 =?utf-8?B?blI2RTVaNHZiNFN0Wlljd1pxQ0xUcUNpS2pkTUp2QU9LbndqNFdOY0llYkxO?=
 =?utf-8?B?NEt1aXVORThYMmg2N2lMY0p6bm9FVGN0clFQWmlvNDdoZzRZSXQyT2NVV21z?=
 =?utf-8?B?WWxzQUJCMjRMdDBPTnViM2YrVEtPMERBYTNYU3kyekhWUjhuTmhLa0kySlBS?=
 =?utf-8?B?VTYyNytWaTV3L25GQ1Y3REQveWVTNGRZV2Ewbml6VFYxMkFqSnRrYnFVam00?=
 =?utf-8?B?aGxJZnlIVzNpVHVuOHoxV0xNYVp0U05YSjQ5U3NlODlVOWZ2Sks1b2swTGhM?=
 =?utf-8?B?UFNZcFpWc28zQTBvTjFZV044a2JVU3lGNVpzYit4NzdNK0R5ZkFiWDduNm9H?=
 =?utf-8?B?TGRVOVlpV3FVU2VzTjYwUVg4czhsT2xPVFVvMUlDWFhvSnc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGQrTmJ1Ylpqdjl0UVdwQXdDZjFkTVVmRUZjUUlmV2E4YThyVzRvZTE0NG9E?=
 =?utf-8?B?MjA5VWFld0JzRGVzTzVhSCtFUW5BU3FIY1ZwWUpuSDB5QW45cmk2UjMzMjJI?=
 =?utf-8?B?WHRUUm13OUw2cHVFOFphYUp5M0ZKWVdkaS9EZzM5blBnMnAyOE4veUdQSGdT?=
 =?utf-8?B?a3NjTjdwbVBpNkY0K0xIYmFxay85VFhMZ1o0YVgyalNvNCtZQVdjN0pvQVZw?=
 =?utf-8?B?Q3RUWW9mejNrdXpzakxncE5VNTdkaU00eFkzdFVKdzJNY1NTRWJZSHRFS0Qr?=
 =?utf-8?B?dzZDS1g1RUQ2OXJRRFhHaUNJSXV5N3BJUHlCOXEreXRWdmlzZTE5ODFyMVlQ?=
 =?utf-8?B?ZWR3RlVBRFhoMEtTV29kTWIrTnN3U3d4Q0ZBQkx5M1c3eWVDTHk0clVCS3ly?=
 =?utf-8?B?K0g3V0VnTkIvckxCWEVWRFNnbVl6NmtSQVFCWUhIR1FFRm1IdnFDc2ZiNzAv?=
 =?utf-8?B?cVc0cEtLMENqWUhGY3QrZHJIdEt6eU95VUR6L0tZQ3BQQ3YxNEVZWEFRMC9R?=
 =?utf-8?B?NTJFOXNMaXdaT04zckk0cFpyY2FLOU9ZMWNlOFd1RTE2cTZYdm1IRWYxdmJh?=
 =?utf-8?B?QkVkd3ppQnRhM251OSt2TTJzRUY2NjlVN0Noc0hzTDI2S3NhV1U5cDNqdFNZ?=
 =?utf-8?B?MTkxRUgwNHp1NVU4K1djRzNYdHVlNkZlcHNSM1U1S1dqZ2ttblpVWmZmb2RF?=
 =?utf-8?B?UzFQaXBlVWRDbGs0cHVmblhaTUgyZ0RYcU9DeHJadEtzbzQ0U2FwMXdrVmsv?=
 =?utf-8?B?OVBUWXVUMUxVZHdzR0dIZmM0MEp2VTNsQ2h0dTczM0RkZUhGL25LZ2M1VHov?=
 =?utf-8?B?ejhDZlVmOG50eHFDRkNzb0dKL1lTUTh1WjlOQXQ1M2tIbytXWU9seGh0cDFl?=
 =?utf-8?B?ODZkOTlOQ2cxbjJRSHJDQXIrRmxuSlN6OWF1VkhUNmpUM1dIcWhWTFJiSFJw?=
 =?utf-8?B?Z1d2RnF3RVMxVVNZNStIaHlBZkJXWVVQTldvUE9hdGNJN0hvRm5SWThqYkdB?=
 =?utf-8?B?Nks1bTBVeGRWdW9rdzN6WUs1WEpFUU9DRmRSNlI0L0ZrV2MwbnlSUWViNExs?=
 =?utf-8?B?MjFuZndONVlKSVYrU28wVGpPN3VGRHpSL3Fza0ZESW9yUGpIYnl4TCswTTV3?=
 =?utf-8?B?MVV1RVpnT2dXTnJqTXRwL21NL3dSQzJ2b3NrV0lJN1dHSnJrVVNLcUlNWk5D?=
 =?utf-8?B?UHErWmlNOG1oSS9kVFFDYTEwOGxpMms3TU1teERud1Y1VlVVM1JZS2JhQzZH?=
 =?utf-8?B?RjlqWXRRdFIyZmF6MmpVV1BGd0hoQ1pxWkNoNExDRkR3ZTJiMnYxcWpFQStS?=
 =?utf-8?B?N1UxZEY4UDBYMTBMSVlGbk9zK1h3QUVTbXZJdHROUTJOS3QrRS9OaTJLeVhM?=
 =?utf-8?B?bUNRUUxWMVJ1eGpVSitRTlJiTUpyV0F4dU9jVVBnKy9JKytOM0hTdUF0RkdU?=
 =?utf-8?B?MkpuSGFtL0ZwK1Vvc1BXYTBJYnlUdm5obFZ1VVpkdjUvUnZMb1hDODVGM2pD?=
 =?utf-8?B?L3pibGFpaWJpbGtlemQ5bjZ2NHFmbXFFSWhyLzk0UXBsQk9lbkUyNlZidGFm?=
 =?utf-8?B?cFZPczZPVitJWE5WOTUzUzRTaUN1UnI0elh2VDRDOXk1UlYxSWpYWmJZU3V0?=
 =?utf-8?B?cytaRGJZejFiN3UzVGZFcjVVVzhUSncrMlJaMkdwTG5TSWZZa2FiN3BRTkNh?=
 =?utf-8?B?RDF3bG9UMTJTYjdGKzJKU3Rwb1BnZ2tqOUs0TU56eW11YTFKaXUvWjh3Y3g0?=
 =?utf-8?B?NUg3ZVByUlo1ZjdGZ21sMWw5T1pvcjlQV3pjb0ZNWWpVSEFKdHhmSFo0a2tI?=
 =?utf-8?B?TFc1QWRXZjhSckRLWUFoL09ER1NuYXU1ZjYxWHYxTXAwSDdsMVphRU5MeCtV?=
 =?utf-8?B?b3VvN2tLd1F0REFhTWV5M3NLa3Z3RjJRbmduQ1ZCeG5HNkVrQ2pqaHdwT0Ns?=
 =?utf-8?B?QlhEa3BMRWs0blZUQkMxcEt4b2xESU9CQ2s0UURUd3NBKytkVnh1U1dNU2Qv?=
 =?utf-8?B?Vkxzc1VHV0dnam1RNVFWeHM3ZEtqNzlBZWVEUE5SRE92aWZQMnRGY0VuZXNR?=
 =?utf-8?B?aXo4ZVV2cXBuWlkyb0RCcmRUakwycW1aMUZDK01xMThnYjZ4Q1VnMDlEWGxT?=
 =?utf-8?Q?IsnpPgWgjZ8UKEJTFXvszuRjw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc981c1-5015-47af-f47d-08dcbc829d5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 17:00:35.1673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h0fBz7dvfK0S+kTxUH9XOahbPio9Fyvwb29z5vUZKkmVc6nQEKU8mYJjrOizY6N6vZP0tm+SMz6JAsSQnM3vlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB3504
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_100038_465484_A7E360CC 
X-CRM114-Status: GOOD (  12.71  )
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

QVAgc3VwcG9ydHMgRUhULCBoYXMgYmVlbiBjb25maXJtZWQgSSdtIHRvbGQgd2l0aCBIYW1pbHRv
biBOSUMgYnkgUXVhbGNvbW0gd2l0aCB0aGUgcHJvcHJpZXRhcnkgZHJpdmVyLg0KDQpEYXZpZA0K
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYXRoMTJrIDxhdGgxMmst
Ym91bmNlc0BsaXN0cy5pbmZyYWRlYWQub3JnPiBPbiBCZWhhbGYgT2YgQmFvY2hlbg0KPiBRaWFu
Zw0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAxNCwgMjAyNCAxMTo0MiBBTQ0KPiBUbzogYXRo
MTJrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDogUmU6IHdjbjc4NTAgaXNzdWVzDQo+
IA0KPiANCj4gDQo+IE9uIDgvNi8yMDI0IDQ6MDYgUE0sIGRhdmlkIEF0a2lucyB3cm90ZToNCj4g
PiBObyBzdXBwb3J0IGZvciBFSFQgYW5kIHRoZXJlZm9yZSBubyBNU0MgMTIgb3IgMTMgd2hpY2gg
Zml0cyB3aXRoIHRoZQ0KPiA+IGRtZXNnIHdhcm5pbmcgYWJvdXQgaXQgbm90IGJlaW5nIHN1cHBv
cnRlZCwNCj4gZGlkIG5vdCBub3RlZCB0aGlzIC4uLiBTbyBpZiBBUCBkb2VzIG5vdCBzdXBwb3J0
IEVIVCwgYWJvdmUgd2FybmluZ3MgbWFrZXMNCj4gc2Vuc2UsIGxpa2UgeW91IHNhaWQuDQo+IA0K
PiBpcyB0aGlzIGEgY2FyZCBmaXJtd2FyZQ0KPiA+IGlzc3VlIHJhdGhlciB0aGFuIHRoZSBkcml2
ZXI/DQo+IGRpZCBub3QgZm9sbG93IHlvdSBoZXJlLCB3aHkgaXMgaXQgYW4gaXNzdWU/DQo+IA0K
DQo=

