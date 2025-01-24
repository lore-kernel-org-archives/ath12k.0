Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C2DC02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-ID:Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LCWU4Nm8y4yGuI8d2acczcRqD4viBFnpsUo1/kmH88=; b=JLVyF4/8e0Hn5pfwNrgbWluBnP
	xL1gZD2Zv2B17g87+hw/R+8pRaRIyP2PH29PcolE8SVwUyU0nK4B7mcBeqtOj5q+PNoMZUm5mROzi
	6JLOp+R6k6C5Jaowc/gqt0DqfiZMqXvVcgKqJiqe+SuR3JRHRrO5RgJi5lH6pRvZzsrS3TILO+Rc9
	Vr74sqsSNvgY4Fu5P5eeayWY94D+EWM2Fz45JaaOhj8cDK+Bf48Lga+PnutBYOsOyF+cObz7imRuj
	BbenxgHCKxEiLgZ2wzOSBOWS6R6WssxuUpC7zJKCynvFY875uah8x2NtWaXTqRwtH56fAyNUbBGSx
	uS2d0A2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGXz-0000000EQOG-3yMr
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 10:04:19 +0000
Received: from de-smtp-delivery-113.mimecast.com ([194.104.109.113])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGXw-0000000EQNS-1KIJ
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 10:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1737713052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5LCWU4Nm8y4yGuI8d2acczcRqD4viBFnpsUo1/kmH88=;
	b=nQX2od+E/fnJav0LinlI0b5tHwkXRv7mIsEHZ9wZ2Ug5B0Mb4DoqXkwpFOxXYCiW7NqZdT
	/7bqM4SwnsqM/KiPR2uSEV7QOH1sh2ow445GryEZdmntoyVI2XUKJg+Y9dbclR7NgPsQcJ
	wM9ZsaAgFTiggeexAEJlzQ6roOSZV3E=
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazlp17010005.outbound.protection.outlook.com
 [40.93.86.5]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-66-T35b7u6MM12ESgDlOYIVNQ-1; Fri, 24 Jan 2025 11:02:56 +0100
X-MC-Unique: T35b7u6MM12ESgDlOYIVNQ-1
X-Mimecast-MFC-AGG-ID: T35b7u6MM12ESgDlOYIVNQ
Received: from ZR3P278MB1339.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:70::11)
 by GVAP278MB0024.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:22::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 10:02:55 +0000
Received: from ZR3P278MB1339.CHEP278.PROD.OUTLOOK.COM
 ([fe80::a8dc:34fd:b218:9355]) by ZR3P278MB1339.CHEP278.PROD.OUTLOOK.COM
 ([fe80::a8dc:34fd:b218:9355%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 10:02:54 +0000
From: Parth Pancholi <parth.pancholi@toradex.com>
To: "quic_bqiang@quicinc.com" <quic_bqiang@quicinc.com>,
	"ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Re: wifi: ath12k: start-up crash with WCN7850 hw2.0 on TI AM69-SK
 board
Thread-Topic: wifi: ath12k: start-up crash with WCN7850 hw2.0 on TI AM69-SK
 board
Thread-Index: AQHbbkcjFuanBnIvhkapCFeLZ4Flsg==
Date: Fri, 24 Jan 2025 10:02:54 +0000
Message-ID: <c710004338102c19e5c05fb03d3256ccbdabd5f7.camel@toradex.com>
References: <86899b2235a59c9134603beebe08f2bb0b244ea0.camel@gmail.com>
	 <a15a1557-e5fb-404c-9031-21efbaa7e679@quicinc.com>
In-Reply-To: <a15a1557-e5fb-404c-9031-21efbaa7e679@quicinc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR3P278MB1339:EE_|GVAP278MB0024:EE_
x-ms-office365-filtering-correlation-id: 40b502f5-e9b4-480a-35ad-08dd3c5e459c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018
x-microsoft-antispam-message-info: =?utf-8?B?YXNKVVMwVGRrWXcwcGN1K2RNS21LRzlWZHBITU96a0dYSFZmUHJTQjljNDRp?=
 =?utf-8?B?eE9xdkJtOGRCQ0pwS0t2TGhkOGdjUlFGZFdpVFVmSHVmcEdacmhlbkg5NGhn?=
 =?utf-8?B?ZlVCWUFENHZLUzNPUGJNL0pCL1dzdGVCMThQaDNNN1lvMTBPMVFtWm1qRkxN?=
 =?utf-8?B?TFNBY3grYllILzBUcFBtSEpSMC8vbmIzdzhvK1JMQVl3RHVvanBheVRzVnF3?=
 =?utf-8?B?YTFOMDQ0R3FNN1pxQlhtTVl1V1JtdDVXbFM4cUt3cXkwZTgvcXNtSzFsTm5W?=
 =?utf-8?B?cGVJQ1FucXBOcTlVZFhMV2hybWZMQjRqd0N5OVU2MXlnbE81L0tOR25WYW40?=
 =?utf-8?B?UG5GVEpRejhnaXE5UHNqVXE4NnNSc3dSeGhWK2NMek1aVUJ6QUI5RGl6TURa?=
 =?utf-8?B?S0dqd2d3NkRLSmQvdFZLQWdYK0VFUHBlRlVBUnpSN0tpOUJVcnVmZDc4eUFm?=
 =?utf-8?B?L21oYzVNcWlYaUdBSG50Q0tyQ2hlZlQ1eVFMM2ZOQ2xlWkxJazlJc2FPUVZC?=
 =?utf-8?B?MDFWY1MveFZGMllIeWc3RkdMeUJLVEhGVm1CZnRBK3hFVlRGYStESGE2U1Ba?=
 =?utf-8?B?b1A0VEhBait3dTR5ZUl0bVBoU1hiZCtuMGFZL09NT2FhYXVlV0ZBQm1iWGtp?=
 =?utf-8?B?Z2lGSVFZSk9laVNwQzZ5cS8wRW5EbEZBZUVDTjU3RzZydVhEQkRDTjNnNy9U?=
 =?utf-8?B?dUJPcHdRVzdjeTEydGJsSWk4ci8vSGplK2tnU0V3RmdGakZjWE42S09kQ3cw?=
 =?utf-8?B?cDV6RWFFYmtJakw3a2plV015WkJaZjlzTStUMDRzZW5pbWRCMnVKOWRUTlZw?=
 =?utf-8?B?QzUzSlZaaVJmZisyMUcrYkVwNHU4OXBxWTIxYnJ1dFRLdCtJWks2eDR5ejZL?=
 =?utf-8?B?cDUzeW1tY092K2dsRXZONnB0ZFdHMnNWUkhmUGF1VzZMNFc3amh5M3F5YkRE?=
 =?utf-8?B?dk80ekdybElCa2JTbEcwMVJrU0Y1MUNVbDdCUEl3MSt3WW83NzJwY3F3NENp?=
 =?utf-8?B?SmNua1dhTzBsWTFjWXVSNHFEdlU4NldvNW5hbmJvRlpwK25aYjd2Kzc2amxF?=
 =?utf-8?B?eWEyeXZGZ01ZcjRuOFRXdldtWmZCaU5sOVY2NVJjR25VOHdBT1Y0Q3ZFTk0r?=
 =?utf-8?B?SjlLTkt4T1o5RmRJMFZGdS83cFpweG44TlNRU2Iva0VBRTRTei95ZUpOcXdi?=
 =?utf-8?B?c1hjUGhVTUk1UldUZHRRZDRMWEd4cWwwLzNyYnJra3FmdVV6Q1Z4bXVrc04y?=
 =?utf-8?B?VkZiOHluUk5jcTNaRXhJSnYxemY1b0huWm5RYWUwQUVRak1zRmxabC9FYU8w?=
 =?utf-8?B?Y1BkeXRaZGZVbENxZWw0WDFEZW5kVmtvOVdzeTE4SFF0cW1BR3FJVzExcG5U?=
 =?utf-8?B?TCt0cC83WThlQjBkNnlWY09YSkJNTk5Hc3drb3dOQVRjL1gwbHZxUXI3UjRF?=
 =?utf-8?B?UjhmeXZSeVdWd1Y2Uld5VEhaWUdrd3AxQ1Bma01jRUY0d3ZUQkZ5bzR3NkJ0?=
 =?utf-8?B?VlZjaUFtVFFVRExuZm5ORWJ0REc2OVZ0emxQZVl2MnBOK2lMMldxV3dab0Fz?=
 =?utf-8?B?c1BOdUJFWGVFczk1REJSYlIxYlpEMmZQd1ZmM0pUSmdGM0IybGpJU1NicGMr?=
 =?utf-8?B?WmpMNC9hN3krL1F1M3VjcStZeVdRandpc1dRZzlzRWRYMHlUUDhTMEpzb1Uz?=
 =?utf-8?B?djJLWnJ6dzVEcFh0YWFESzVoTHBrUnVVVGZXNVpPdDFUT1dxWmQrdU5wa1FR?=
 =?utf-8?B?MC95VjIyZXhjd1NqVFFWOFlCaUFYNE9kY3JZaTBkWmxSK2ZPWWNIVEttNFJr?=
 =?utf-8?B?L0RKZWhtMHF6Z05KZHkvbjhwQTNpZjYzT0JYRUI3allNcVBoKzFyR3g4Uzdv?=
 =?utf-8?Q?IFPnRsS7iIcYW?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR3P278MB1339.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZzdpaDluYjhCNUhuQVU5QlViUEFrWEVhVXAzTE9nVG82UGUydThZQ1d1RFlE?=
 =?utf-8?B?cmFLc0RGQVNvVS9wSk1Vb25LQ3lTVTNKNXhoQTRSUi9VZWMzeEIrcXVWRkMx?=
 =?utf-8?B?UE4zR0xCNU5sb3hzcTZCTnJHK3J1TWlDQlZ3N015VEhvQUpCUFBKM0I3NitN?=
 =?utf-8?B?K040WWErZ3NvdUkveGdkbmljd2ZXVkUwbzFTcW9LODRvTGpXN1ltSGZxTkVQ?=
 =?utf-8?B?MEVNaHN6a0hyOE1QSGhBK2ZmeUNMbHV5ZTNxYlFBT2h0c0ZDK3ZNc3ErWWVG?=
 =?utf-8?B?UFVnQ3dLdzk2MWwvMHRoU01OQm11eVNHOE0vTmNQNmxrZHJrWkd3akV0Zklv?=
 =?utf-8?B?S1BudGlSTk9uK3BBZ0MrVnZsODNKT3JKUUhQMDZCWVJNSlo4a2lkRmxNNTk4?=
 =?utf-8?B?TjRPZThIZURUN2tqSFVwWmhXUmgveVFtdzVUQ0RoT3B0R2k4UXBicWRiZUhX?=
 =?utf-8?B?cDNBYm5kcTF3Z1Z5Vmp3b29zaTI2Rmt2ZWZsWmZPd0I1MXhocmdkVVpRaVpk?=
 =?utf-8?B?MmJPcFZ3cGo0Z0wzZjRFaTd4ZGh1Q2RUYnhwdURzblFVYmc2S2xwN3lrWmg5?=
 =?utf-8?B?S2k4ZVZLdHlzcVdQZStra3A1SW1NSnJJakNpSTBGR3pVTzROdTBNcDljOGZ4?=
 =?utf-8?B?WGJ3QVNqSU00bjlhNEFIby9SMFVZbk1BdExKY094MEQ2ajEyVXB5SFZVeDFC?=
 =?utf-8?B?ZXFQK1AvMTAzMHl2ZmJ5WlRoL1hCc3hwR3BGc1dJT3pNSzVIVHE3b3AvcDUw?=
 =?utf-8?B?Yk5VU1BJM2dLM3hrZ0V3aWNQUzR3MUJBbExwREMycThNQlZNZEpuMkdWTytU?=
 =?utf-8?B?cE81cUdMalgxV0pFT05aNzVVTXJ5My9Za0Q5TmNja21NREZLQjQ3ZHZ4ejdt?=
 =?utf-8?B?WHJHWlFmSnBEK0xQWEkvZGxKVmRmTDBhS2VPK2t2WWV4T0ZKQzlldXdnTFpB?=
 =?utf-8?B?eTRaTURSZ2FkS05ONHpsdHJhdUVBeXBITGhObGZ3a2Jsd3hDS01Ja2RMVE4x?=
 =?utf-8?B?Wmh6RFd2MDIvRUt5U0dUamNCZHI3M29WbDJGcG5NcERaK0hzcTVsbzM5UFFU?=
 =?utf-8?B?ZWs5MXlQdVpvWkFTVnFhcmIzTGttdnFWeXRUWVZDSG4rTENuUHNBSlVidEcr?=
 =?utf-8?B?U2tiZjdLWmRrcGhSV2VmNUNwanhqNnhyb2QyVVZCU0hZZmNadElGUUhaSjRG?=
 =?utf-8?B?WEczQnFMdHd4NllNb0p3aE5JaXhZSGpKTW16R1RnMUhHbEl5QWJjaE5aZkx2?=
 =?utf-8?B?UHFqWkczVmJ3YVRUV0lqSDFOL0kxRjJhOVpjYW9BYlFUQUFtdzFtYS9SRklX?=
 =?utf-8?B?SllEOWNwbExGUXJEYnpXdGhLNmd2Nk1KNlpmVUpWOStNUk9GUElSbitGQ21n?=
 =?utf-8?B?L0NFSDRrL0lEeTJDZVFNVFZrQnh1bDUrYTV4VW5oWTg3cDJUbjY4cllqdWZw?=
 =?utf-8?B?VHZqKzZYRlhqeTV6RDNXQ2JhZ0N6MGVqQk5oRW5FUksxNlpCam80NHVFQzRE?=
 =?utf-8?B?STFrVUpwdUxCWkRvN1NXMlBWZWxMcE1YUFIvU2JvRTBJSTQ3ZTNJNFYrMm1G?=
 =?utf-8?B?alQ4TVBGTVVxNytCclE5clNDaHQrUTRQT2NIWllzeFVUb3VITjlKdHJ0UWlx?=
 =?utf-8?B?NXMyakxlcHNmSzF5SDRJRnpGeFYxWDd0YitmQkt3ZU1jd2JtOGhXdDFJMzcv?=
 =?utf-8?B?ZlNMbmVHTHdiRFo1RnRNb21Hbm5HUDhoK3huemtFbHVndU84a1k3MjdNUVlR?=
 =?utf-8?B?OWRqSW5GeFpjUFJCOG9wSDNoMHRuTjVsR2xTMlBUSUhBMHZOcHNWdTZXdGdR?=
 =?utf-8?B?MGZCYXFOSTZhU2VRZUxhNUxvcjRYS3ZGMVVSRVhiZ2pzRWhBcnZxZzd2UFpT?=
 =?utf-8?B?QzVSblh4TlBlQWlKVFExb1g2MCtUanBoQmRoTDNXemx2cWhQZTNSNXJJRzZF?=
 =?utf-8?B?R2FPLzFLR2xTQlBtUlQ4SGZaZGJNb3BIZGtJNS9LbHFyRWlGYTFDdzRaMWhT?=
 =?utf-8?B?bWx4WFkvTWdqd05BbmR1eHFESVZaS0pCb1N5UjViNmFYUUZwd3BmakZ6S1JQ?=
 =?utf-8?B?ay9KYjF6anBBQ0V2aXlzemhHWmJaWFRIRXJ2TitOMXcvSE1VU3NTM1REMGtR?=
 =?utf-8?B?NVhDM2tSdDdPZForWTdDU0x4eWFqRE05UVljWTF1UFFucXRNOFRWTzRoWlI3?=
 =?utf-8?B?Ymc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR3P278MB1339.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b502f5-e9b4-480a-35ad-08dd3c5e459c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 10:02:54.8839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H/0hR0y8jj8yPGXw7KHc6V14PQS5jztbCJroa7n5AQpkaf9LtCJksdYRjXcfR7MBX7eYq2G/1kozWYS7XiQ3je2pt6M7MXu11TA659ViQvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0024
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z1gNwZQ-WRyc5YM34nY6qMJWtHabbNuSKQKYkzH2fHs_1737712976
X-Mimecast-Originator: toradex.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-ID: <7040AEEEBA65B0468F28E91BBD28AD78@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_020416_642122_590494B2 
X-CRM114-Status: GOOD (  22.39  )
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

SSBhcHByZWNpYXRlIHlvdXIgcmVzcG9uc2UsIEJhb2NoZW4uDQoNCkkgaGF2ZSBiZWVuIHdvcmtp
bmcgb24gZW5hYmxpbmcgbWFpbmxpbmUga2VybmVsIHN1cHBvcnQgb24gbXkgVEkgQU02OS0NClNL
IGJvYXJkIHRvIHRlc3QgdGhlIG1haW5saW5lIGF0aDEyayBkcml2ZXIgb24gbXkgc3lzdGVtLg0K
DQpVc2luZyB0aGUgbWFpbmxpbmUga2VybmVsIHJlcG9zaXRvcnkgZm9yIHRoZSBhdGggZHJpdmVy
cyBbMV0sIEkgbWFkZQ0KdGhlIGZvbGxvd2luZyBvYnNlcnZhdGlvbjrCoA0KV2hpbGUgdGhlIGV4
YWN0IGNyYXNoIG9ic2VydmVkIGVhcmxpZXIgaXMgbm8gbG9uZ2VyIHByZXNlbnQsIHRoZSBzeXN0
ZW0NCmhhbmdzIHVwb24gbG9hZGluZyB0aGUgYXRoMTJrIG1haW5saW5lIGRyaXZlciwgZGlzcGxh
eWluZyB0aGUgbWVzc2FnZXMNCmJlbG93Lg0KDQpyb290QGFtNjktc2s6fiMgbW9kcHJvYmUgYXRo
MTJrIGRlYnVnX21hc2s9MHhmZmZmZmZmZg0KWyAxMTIxLjk5NjU1NF0gYXRoMTJrX3BjaSAwMDAw
OjAxOjAwLjA6IEJBUiAwIFttZW0gMHg0NDEwMjAwMDAwLQ0KMHg0NDEwM2ZmZmZmIDY0Yml0XTog
YXNzaWduZWQNClsgMTEyMi4wMDQ4ODRdIGF0aDEya19wY2kgMDAwMDowMTowMC4wOiBlbmFibGlu
ZyBkZXZpY2UgKDAwMDAgLT4gMDAwMikNClsgMTEyMi4wMTE4MThdIGF0aDEya19wY2kgMDAwMDow
MTowMC4wOiBNU0kgdmVjdG9yczogMTYNClsgMTEyMi4wMTY3OThdIGF0aDEya19wY2kgMDAwMDow
MTowMC4wOiBIYXJkd2FyZSBuYW1lOiB3Y243ODUwIGh3Mi4wDQpbIDExMjIuMDQwMTgzXSBORVQ6
IFJlZ2lzdGVyZWQgUEZfUUlQQ1JUUiBwcm90b2NvbCBmYW1pbHkNCg0Kcm9vdEBhbTY5LXNrOn4j
IHVuYW1lIC1hDQpMaW51eCBhbTY5LXNrIDYuMTMuMC1yYzctd3QtYXRoLWdlN2VmOTQ0YjNlMmMt
ZGlydHkgIzIgU01QIFBSRUVNUFQgV2VkDQpKYW4gMjIgMTY6NTU6MTcgQ0VUIDIwMjUgYWFyY2g2
NCBHTlUvTGludXgNCg0Kcm9vdEBhbTY5LXNrOn4jIGxzcGNpDQowMDAwOjAwOjAwLjAgUENJIGJy
aWRnZTogVGV4YXMgSW5zdHJ1bWVudHMgRGV2aWNlIGIwMTINCjAwMDA6MDE6MDAuMCBOZXR3b3Jr
IGNvbnRyb2xsZXI6IFF1YWxjb21tIFRlY2hub2xvZ2llcywgSW5jIFdDTjc4NXggV2ktDQpGaSA3
KDgwMi4xMWJlKSAzMjBNSHogMngyIFtGYXN0Q29ubmVjdCA3ODAwXSAocmV2IDAxKQ0KMDAwMTow
MDowMC4wIFBDSSBicmlkZ2U6IFRleGFzIEluc3RydW1lbnRzIERldmljZSBiMDEyDQowMDAyOjAw
OjAwLjAgUENJIGJyaWRnZTogVGV4YXMgSW5zdHJ1bWVudHMgRGV2aWNlIGIwMTINCg0KRG8geW91
IGhhdmUgYW55IGluc2lnaHRzIGludG8gd2hhdCBtaWdodCBzdGlsbCBiZSBtaXNzaW5nIG9yIGlu
Y29ycmVjdA0KaW4gbXkgc2V0dXA/DQoNClJlZ2FyZHMsDQpQYXJ0aCBQDQoNCk9uIFdlZCwgMjAy
NS0wMS0yMiBhdCAxNToyMCArMDgwMCwgQmFvY2hlbiBRaWFuZyB3cm90ZToNCj4gDQo+IA0KPiBP
biAxLzIxLzIwMjUgMTA6MTkgUE0sIFBhcnRoIFBhbmNob2lsIHdyb3RlOg0KPiA+IEhpIEFsbCwN
Cj4gPiANCj4gPiBJIGFtIHBlcmZvcm1pbmcgdGVzdHMgb24gdGhlIFNYLVBDRUJFIFdpLUZpIG1v
ZHVsZSwgd2hpY2ggdXRpbGl6ZXMNCj4gPiB0aGUNCj4gPiBBVEgxMmsgZHJpdmVyLCBvbiB0aGUg
VGV4YXMgSW5zdHJ1bWVudHMgQU02OS1TSyBib2FyZC4NCj4gPiBUaGUgYm9hcmQgaXMgcnVubmlu
ZyB0aGUgVEkgTGludXggS2VybmVsIGZyb20gdGhlIHRpLWxpbnV4LTYuNi55DQo+IA0KPiA2LjYg
aXMgdG9vIG9sZCwgYW5kIGJlc2lkZXMgd2UgZG9uO3Qgc3VwcG9ydCBjdXN0b21lciBrZXJuZWwu
DQo+IA0KPiBDb3VsZCB5b3UgdHJ5IGxhdGVzdCBhdGggdHJlZSBbMV0gb3IgdGhlIG1haW5saW5l
IHRyZWUgWzJdPw0KPiANCj4gWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L2F0aC9hdGguZ2l0Lw0KPiBbMl0NCj4gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0Lw0KPiANCj4gSWYg
dGhlIGlzc3VlIGlzIHN0aWxsIHNlZW4sIHBsZWFzZSBlbmFibGUgdmVyYm9zZSBhdGgxMmsgbG9n
IHVzaW5nDQo+IGJlbG93IGNvbW1hbmQgYW5kIGhlbHANCj4gY29sbGVjdCBkbWVzZyBsb2dzOg0K
PiANCj4gwqDCoMKgwqDCoMKgwqDCoHN1ZG8gbW9kcHJvYmUgYXRoMTJrIGRlYnVnX21hc2s9MHhm
ZmZmZmZmZg0KPiANCj4gT25lIG1vcmUgdGhpbmcsIHRoZSBvcGVuLVdSVCBwYXRjaCBpcyBvdmVy
a2lsbCwgY2FuIHlvdSBuYXJyb3cgZG93bg0KPiB0byBmaW5kIHdoaWNoIGxpbmUgb2YNCj4gY29k
ZSBpbiBhdGgxMmtfcGNpX2VuYWJsZV9sdHNzbSgpIGlzIGNhdXNpbmcgdGhpcyBpc3N1ZT8NCj4g
DQo+IA0KPiA+IGJyYW5jaC4gRHVyaW5nIHRlc3RpbmcsIEkgb2JzZXJ2ZWQgYSBrZXJuZWwgY3Jh
c2ggZnJvbSB0aGUgQVRIMTJrDQo+ID4gZHJpdmVyIGFzIHNvb24gYXMgdGhlIHByb2JlIGlzIGNh
bGxlZC4gVGhlIGNyYXNoIGxvZyBpcyBhcyBmb2xsb3dzOg0KPiA+IA0KPiA+IFvCoMKgwqAgOS40
OTI2MzFdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBBc3luY2hyb25vdXMgU0Vycm9yDQo+
ID4gSW50ZXJydXB0DQo+ID4gW8KgwqDCoCA5LjQ5MjYzNF0gQ1BVOiA3IFBJRDogMjIyIENvbW06
ICh1ZGV2LXdvcmtlcikgTm90IHRhaW50ZWQNCj4gPiA2LjYuNTgtDQo+ID4gMDE0OTctZ2E3NzU4
ZGExN2MyOC1kaXJ0eSAjMQ0KPiA+IFvCoMKgwqAgOS40OTI2MzhdIEhhcmR3YXJlIG5hbWU6IFRl
eGFzIEluc3RydW1lbnRzIEFNNjkgU0sgKERUKQ0KPiA+IFvCoMKgwqAgOS40OTI2NDBdIENhbGwg
dHJhY2U6DQo+ID4gW8KgwqDCoCA5LjQ5MjY0Ml3CoCBkdW1wX2JhY2t0cmFjZSsweDk0LzB4ZWMN
Cj4gPiBbwqDCoMKgIDkuNDkyNjU4XcKgIHNob3dfc3RhY2srMHgxOC8weDI0DQo+ID4gW8KgwqDC
oCA5LjQ5MjY2Ml3CoCBkdW1wX3N0YWNrX2x2bCsweDQ4LzB4NjANCj4gPiBbwqDCoMKgIDkuNDky
NjY5XcKgIGR1bXBfc3RhY2srMHgxOC8weDI0DQo+ID4gW8KgwqDCoCA5LjQ5MjY3Ml3CoCBwYW5p
YysweDMyMC8weDM3OA0KPiA+IFvCoMKgwqAgOS40OTI2NzddwqAgbm1pX3BhbmljKzB4OGMvMHg5
MA0KPiA+IFvCoMKgwqAgOS40OTI2ODFdwqAgYXJtNjRfc2Vycm9yX3BhbmljKzB4NmMvMHg3OA0K
PiA+IFvCoMKgwqAgOS40OTI2ODZdwqAgZG9fc2Vycm9yKzB4M2MvMHg3OA0KPiA+IFvCoMKgwqAg
OS40OTI2OTJdwqAgZWwxaF82NF9lcnJvcl9oYW5kbGVyKzB4MzQvMHg0Yw0KPiA+IFvCoMKgwqAg
OS40OTI2OTddwqAgZWwxaF82NF9lcnJvcisweDY0LzB4NjgNCj4gPiBbwqDCoMKgIDkuNDkyNzAw
XcKgIGF0aDEya19wY2lfcmVhZDMyKzB4MWJjLzB4MWU4IFthdGgxMmtdDQo+ID4gW8KgwqDCoCA5
LjQ5MjcyNV3CoCBhdGgxMmtfcGNpX3Bvd2VyX3VwKzB4ZGMvMHgzNDAgW2F0aDEya10NCj4gPiBb
wqDCoMKgIDkuNDkyNzQ3XcKgIGF0aDEya19jb3JlX2luaXQrMHgyYy8weGE4IFthdGgxMmtdDQo+
ID4gW8KgwqDCoCA5LjQ5Mjc2OV3CoCBhdGgxMmtfcGNpX3Byb2JlKzB4Njk4LzB4OTA4IFthdGgx
MmtdDQo+ID4gW8KgwqDCoCA5LjQ5Mjc5MV3CoCBwY2lfZGV2aWNlX3Byb2JlKzB4YTgvMHgxNmMN
Cj4gPiBbwqDCoMKgIDkuNDkyODAwXcKgIHJlYWxseV9wcm9iZSsweDExMC8weDI3Yw0KPiA+IFvC
oMKgwqAgOS40OTI4MDVdwqAgX19kcml2ZXJfcHJvYmVfZGV2aWNlKzB4NzgvMHgxMmMNCj4gPiBb
wqDCoMKgIDkuNDkyODA4XcKgIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHgzYy8weDExOA0KPiA+IFvC
oMKgwqAgOS40OTI4MTBdwqAgX19kcml2ZXJfYXR0YWNoKzB4NzQvMHgxMjQNCj4gPiBbwqDCoMKg
IDkuNDkyODEzXcKgIGJ1c19mb3JfZWFjaF9kZXYrMHg3OC8weGQ4DQo+ID4gW8KgwqDCoCA5LjQ5
MjgxOV3CoCBkcml2ZXJfYXR0YWNoKzB4MjQvMHgzMA0KPiA+IFvCoMKgwqAgOS40OTI4MjRdwqAg
YnVzX2FkZF9kcml2ZXIrMHhlNC8weDIwOA0KPiA+IFvCoMKgwqAgOS40OTI4MjhdwqAgZHJpdmVy
X3JlZ2lzdGVyKzB4NjAvMHgxMjgNCj4gPiBbwqDCoMKgIDkuNDkyODMxXcKgIF9fcGNpX3JlZ2lz
dGVyX2RyaXZlcisweDQ0LzB4NTANCj4gPiBbwqDCoMKgIDkuNDkyODM1XcKgIGF0aDEya19wY2lf
aW5pdCsweDJjLzB4NmMgW2F0aDEya10NCj4gPiBbwqDCoMKgIDkuNDkyODU4XcKgIGRvX29uZV9p
bml0Y2FsbCsweDcwLzB4MWI0DQo+ID4gW8KgwqDCoCA5LjQ5Mjg2MV3CoCBkb19pbml0X21vZHVs
ZSsweDU4LzB4MWU0DQo+ID4gW8KgwqDCoCA5LjQ5Mjg2N13CoCBsb2FkX21vZHVsZSsweDE5YmMv
MHgxYThjDQo+ID4gW8KgwqDCoCA5LjQ5Mjg2OV3CoCBpbml0X21vZHVsZV9mcm9tX2ZpbGUrMHg4
OC8weGM0DQo+ID4gW8KgwqDCoCA5LjQ5Mjg3M13CoCBfX2FybTY0X3N5c19maW5pdF9tb2R1bGUr
MHgxYzAvMHgyYWMNCj4gPiBbwqDCoMKgIDkuNDkyODc3XcKgIGludm9rZV9zeXNjYWxsKzB4NDQv
MHgxMDgNCj4gPiBbwqDCoMKgIDkuNDkyODgyXcKgIGVsMF9zdmNfY29tbW9uLmNvbnN0cHJvcC4w
KzB4YzAvMHhlMA0KPiA+IFvCoMKgwqAgOS40OTI4ODVdwqAgZG9fZWwwX3N2YysweDFjLzB4MjgN
Cj4gPiBbwqDCoMKgIDkuNDkyODg5XcKgIGVsMF9zdmMrMHgyYy8weDg0DQo+ID4gW8KgwqDCoCA5
LjQ5Mjg5Ml3CoCBlbDB0XzY0X3N5bmNfaGFuZGxlcisweGMwLzB4YzQNCj4gPiBbwqDCoMKgIDku
NDkyODk1XcKgIGVsMHRfNjRfc3luYysweDE5MC8weDE5NA0KPiA+IFvCoMKgwqAgOS40OTI4OTld
IFNNUDogc3RvcHBpbmcgc2Vjb25kYXJ5IENQVXMNCj4gPiBbwqDCoMKgIDkuNDkyOTA4XSBLZXJu
ZWwgT2Zmc2V0OiBkaXNhYmxlZA0KPiA+IFvCoMKgwqAgOS40OTI5MDldIENQVSBmZWF0dXJlczog
MHgwLDgwMDAwMjAwLDI4MDIwMDAwLDEwMDA0MjBiDQo+ID4gW8KgwqDCoCA5LjQ5MjkxM10gTWVt
b3J5IExpbWl0OiBub25lDQo+ID4gDQo+ID4gVXBvbiBzZWFyY2hpbmcgb25saW5lLCBJIGZvdW5k
IHRoZSBPcGVuV1JUIHBhdGNoIHRoYXQgYXBwZWFycyB0bw0KPiA+IGFkZHJlc3MgYSBzaW1pbGFy
IGlzc3VlOiBPcGVuV1JUIFBhdGNoOiBQcmV2ZW50IExUU1NNIFN0YXJ0dXANCj4gPiBDcmFzaC4N
Cj4gPiBodHRwczovL2dpdC5vcGVud3J0Lm9yZy8/cD1vcGVud3J0L29wZW53cnQuZ2l0O2E9Ymxv
YjtmPXBhY2thZ2Uva2VybmVsL21hYzgwMjExL3BhdGNoZXMvYXRoMTJrLzEwMC1hdGgxMmstcHJl
dmVudC1sdHNzbS1zdGFydHVwLWNyYXNoLnBhdGNoO2g9Y2Q4NWEwZjZhYTI2NTJkNjJiZmJlYTA0
ZTliY2NhM2JjZjgzMWI3ZjtoYj05MzViMmI3ZGNlZjYxYjI4OTNlZDVkZmYzMDdkZDhmOGExMTU2
ODk5DQo+ID4gV2l0aCB0aGUgYWJvdmUgcGF0Y2ggYXBwbGllZCwgSSBkbyBub3Qgc2VlIHRoZSBj
cmFzaCBhbnltb3JlLg0KPiA+IA0KPiA+IENvdWxkIGFueW9uZSBjb25maXJtIGlmIHRoaXMgaXNz
dWUgaGFzIGJlZW4gcmVwb3J0ZWQgYmVmb3JlL2tub3duDQo+ID4gYnVnDQo+ID4gb3IgcHJvdmlk
ZSBhbnkgaW5zaWdodHM/IA0KPiA+IEFueSBhZGRpdGlvbmFsIGluZm9ybWF0aW9uIG9yIHN1Z2dl
c3Rpb25zIHdvdWxkIGJlIGdyZWF0bHkNCj4gPiBhcHByZWNpYXRlZC4NCj4gPiANCj4gPiBEZXRh
aWxzIGFib3V0IHRoZSB0ZXN0IHNldHVwLA0KPiA+IFRJLUFNNjktU0sgYm9hcmQ6DQo+ID4gaHR0
cHM6Ly93d3cudGkuY29tL3Rvb2wvU0stQU02OT9rZXlNYXRjaD1hbTY5JTIwc2smdGlzZWFyY2g9
dW5pdmVyc2FsX3NlYXJjaA0KPiA+IFNpbGV4IFdpRmkgY2FyZCBTWC1QQ0VCRToNCj4gPiBodHRw
czovL3d3dy5zaWxleHRlY2hub2xvZ3kuY29tL2Nvbm5lY3Rpdml0eS1zb2x1dGlvbnMvZW1iZWRk
ZWQtd2lyZWxlc3Mvc3gtcGNlYmUNCj4gPiBUSSBMaW51eCBSZXBvOg0KPiA+IGh0dHBzOi8vZ2l0
LnRpLmNvbS9jZ2l0L3RpLWxpbnV4LWtlcm5lbC90aS1saW51eC1rZXJuZWwvP2g9dGktbGludXgt
Ni42LnkNCj4gPiANCj4gPiBUaGFuayB5b3UuDQo+ID4gDQo+ID4gUmVnYXJkcywNCj4gPiBQYXJ0
aCBQDQo+ID4gDQo+IA0KPiANCg0KDQo=


