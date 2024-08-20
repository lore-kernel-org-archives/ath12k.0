Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE29C3DA4A
	for <ath12k@archiver.kernel.org>; Tue, 20 Aug 2024 07:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuttJwpv8Jfo75xU4br5fjdy4HzRBRVmGFsjUvOCAUc=; b=e1i0C9LxKf6GW8CVCUCfeavYAC
	dTpqg5p2iyriFBneR6m2+4tMFbbCQCSVswUEoA/wh7ts9SwsJ+3Nw9KHRhIL9LxTmC1B1MpvqQMYC
	8BvGi/CeHNv4eFTbgwPZCVJHK43w7R8dXCA+JtCGloScshOsLnyaAdnH4qNAfDNdvAYXfa56KUx/W
	tYJCC6yxX9X3EDNiEMGUuNvaHBOy19lcDCTF0fYDtz/sCWQfylf1KH7GqxNDeO7FIfbB7SsED10Sy
	b2LedJpw4IJ1ebvHB2xEEOqa2UXGZXfTobIaHSlDDerligWaAAkEA+rJoQLEzI85aJADuPWqx0l4b
	iX2a+qNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgIrT-000000047J7-1Vok
	for ath12k@archiver.kernel.org;
	Tue, 20 Aug 2024 07:00:59 +0000
Received: from mail-lo4gbr01on2072f.outbound.protection.outlook.com ([2a01:111:f403:261a::72f] helo=GBR01-LO4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgIrQ-000000047Hw-0HuI
	for ath12k@lists.infradead.org;
	Tue, 20 Aug 2024 07:00:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGR+j3LcLyk62h86+FYvBzodOLRjadwSgLtO1CMwVuvnTLcHEkgK+7GCJKXIU2P99gf1JBu46p9YGu57HXPiIki3rYiYDPWZxvSu3KmOb+ciLLTSHVfYTncNk804Q1/Uk/KtGwi0ohaFIlktRNo6mUmvuVOziJcoQrrBbacM0Tc8KeOUjMK/1xzWKSnZU8Ljs+cTJAJbgLr3uSN/RRqmeL/ib1Kh+x8D9C+aWfN1fjN4g/QS89qMvdiCuA4GbnUbQcwTsyeF4bgmM3hsdg7CQ1/y1WQI4QLfqYSbJ86vCZ7Py0oyolY4kLZJ/HKVn4q0GYkDXD/6ML/CCtVF/AyfAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iuttJwpv8Jfo75xU4br5fjdy4HzRBRVmGFsjUvOCAUc=;
 b=ucnou4LcQVQkvLRYIzwi5N5H6/WEz3f8cztFRFJG4FGko3ux21YxMpiMKUaaJQXCt02kSzMJ9VqGLp3MXJCuYci0pBr/7MyGiqxSuFQwnaOJB6mGLMqokjHSfMZfDgif6kt013U7xDAEjubmzcsRS338JJqkMIMWbUCp2BwtNWRgnq/inq0O5mLYHcjcLAwd7KbV7ODWhtNya40pl5p9AAoX4exSmQuvGZ1Hp2d9/vw2Y1j9XXtpIms4GsJvs0tQXLl8pGSR+5cB4NLHBYvbx3cf0U/nWDNNLXGqLLZhvGrvcWAHcfwOfstj5FBOs3tDts/zoVfTN89X+5/jqXsRAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by CWLP123MB6980.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 06:44:04 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 06:44:03 +0000
From: david Atkins <david@3adesign.co.uk>
To: Kang Yang <quic_kangyang@quicinc.com>, Florian Schmidt
	<florian.schmidt@ellisys.com>, "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
Subject: RE: ath12k: WCN7851 and QCN9274 monitor mode not working
Thread-Topic: ath12k: WCN7851 and QCN9274 monitor mode not working
Thread-Index: AQHa8hhISLnBiQfgQUejsmA37i0cWbIvaMaAgABLg2A=
Date: Tue, 20 Aug 2024 06:44:03 +0000
Message-ID: <LO0P123MB4057DF53753AF14330DFBBC5D68D2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
References: <a92fb3ec6dabea4445a8a4d3fe136b1d@mail.infomaniak.com>
 <7d2761d9-3bb9-4e77-9292-b64a32a4c5a5@quicinc.com>
In-Reply-To: <7d2761d9-3bb9-4e77-9292-b64a32a4c5a5@quicinc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=3adesign.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|CWLP123MB6980:EE_
x-ms-office365-filtering-correlation-id: 9e5359c9-d745-4b70-035f-08dcc0e37b4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UTFwQ1h0a2xDUHdmb2xXUzVpbmZRL2ZZcTZDSmJmVFZhWTFRWjFEa3oyQTN2?=
 =?utf-8?B?aTdGMHBHdy9IcTZha0NVenpUVnhvNlNwZlFxTDN2dTA4b1gxRFgvd2JETDRo?=
 =?utf-8?B?cDh4MG91WDBXMUcvKy9QMnBSc0diMnBMVk14Zy85UnNrd25ZYWpFdFQ4U2Vz?=
 =?utf-8?B?NjJwR21nQWVvTUp5NkVzaWVROUpuazRDc1ZnRE9Rc2hNN3NOcDMyUGJYRXRv?=
 =?utf-8?B?d1h6eWZrTHM5MUgxN05UK0FoZTdEMy9kdTQyb0JvWS92TktBUVZxaUdBTHcw?=
 =?utf-8?B?OHdjMlVXMFRuWlRuSTM1RzgzaGt4U3FILy9xL05mMzZCQ25QeVFDZmJsL3R4?=
 =?utf-8?B?M0VXNzM4dUJ5NWw3UThmV2FYSVViVmhNL2E2eFJYMHB0Tm1Bd0VvTkNtQkw2?=
 =?utf-8?B?THd0ZVNlVXRVZGc3Yld0R3dyWFBhdlo4YlZwK0JEYzRFTkg4bnRzNXNKaXFJ?=
 =?utf-8?B?MjQyanF0dURnbmxXQ1RwQnRKbzh2QTNLMDRvNXJqNWRreUNuQmZ2ZjFrSmVL?=
 =?utf-8?B?enJ1Zk9nRmFKSTNkZmVadURWWWo1cjdGbXhNRnBvdEIzREhCVG1JUW5kSXZH?=
 =?utf-8?B?QStWVXA0bTNOM2F2dUhFS2l4cU9wK0dOQ3RDbVJ2Y1BhMFRSK25jRjJaSDNY?=
 =?utf-8?B?dCtTdlFjRVNPRTNTMXZRQVY5T09EU3BjRVR1aVJuQW5TNjZSTzFaWEpDRFpm?=
 =?utf-8?B?bk1UampKQXlFb05udEdyaEU5TEVlL05zT1prbGt2K1JTOWhKZkloUTJOYXox?=
 =?utf-8?B?RWptODRDWExCbGhWZlNSdUsxK1U1bGs3bVFZZE1pYmRzSWNRZHgySGVEajVN?=
 =?utf-8?B?OG5EQ1JlV0xSZmxiWnFac0VpS0tZNXFOUWhMVDgrRUxhMitUYyt0MXRaU1pa?=
 =?utf-8?B?dnlTbW9aRWFRMWU3Nk53MW5OWFBxQ1NMM3VZZjFjWHBOVWdHZVhURjZCZ2ds?=
 =?utf-8?B?MkVndjBtck84dS9lWWpwUUQzQUk1c25iRkhCdG5VVHcyc2NNVzFMOFBRNjhv?=
 =?utf-8?B?alFvV3NZTUFpMGhXUytFcUZIWWVITVNVblVoZm04R1ZlVTJDWGhyTFNvcFZy?=
 =?utf-8?B?eFpsclFhZnBRWU1sUTVtdjNtVHBoTmx0NUNxbXl0NFlZY3dCVkpxSllvd240?=
 =?utf-8?B?TmJaV0VGckhWdkd3LzlSTlNUM09GZ0Q2dU9KenBodDlHYkFvMTBvTGE4V0Nm?=
 =?utf-8?B?dUZCQWF4OHpOQ0tzVHN6WlY1MDUxTDBINndLR3pqM1JNcjVKOUpFNUJ1Uzhl?=
 =?utf-8?B?R29KTnJhRndmZlRmdGRxbEJYQXhBY21nNVRyRGRPTUcvNG5aeVAxWG9sM1dL?=
 =?utf-8?B?L1VwUDVNa1VVdTkrRGVRaGszTUVWUmsyZUJXemN3ZDNPS0MvMGduc1krTElx?=
 =?utf-8?B?UnNRang5eFdKZHNQalhRSXRGNWt3cU44dE1qbFJMRkRMcWIvNHdReFJmRkpI?=
 =?utf-8?B?aW1rUnh0V3hNK3FPODRZM3V4bks5d1Y2aEtYNlpGQkpOeGRPb3hXSVoxUzU3?=
 =?utf-8?B?NXhOZE9oeENLbzN3alV3dDEzcHRsRE5WUlpKZUtGQkFPNUZqbnNtSlhwWkND?=
 =?utf-8?B?cndWbnh0Q2U2a0NYKzRCaHFMOHozOTJDdFZpNEJPSHBaSGVyUjhDN0Z4S0lS?=
 =?utf-8?B?a1k1cHNXQnVlSFc1NFRHa2VqOUdUd1B6RU1LTFEvZkx3czNTNDY1L2Uyazh2?=
 =?utf-8?B?cmh0cWtyeXc2Yy9Uc2VyVHlCbnRwSGk3MzlBRGYrTTNHVGZ5ZzZYb21DOFVG?=
 =?utf-8?B?UURoczJDTXRFM0VHN3pLNDFadDZTUmhtcU5UWS9LYWd6RUxjaDQ5dExva0VR?=
 =?utf-8?B?OERYYjh1dXBBMG1lbTVZN0Q2bGR2d2J1bm80YWdDY0F5KzREaVAzeWxLWUph?=
 =?utf-8?B?VFNhN01mN2Y5N0JrMGNLSVdhUlkxUCs4QVh5OW43MjVHWXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0VkbmRKOGJNZVY5TGoyVHpZSmZ0dGxtWnVTVUpxdjdObWhGV0w4UE1UcmE4?=
 =?utf-8?B?cFNHSlhTdWIvdXFXWXd0ZjdHQmt3RndBWlI2UzdBbkZ4OVVtTjc4WnFmZEZm?=
 =?utf-8?B?Y3RRck45Q1A0N0dra0dwQVZPVTNBeGNBQWt1Mk9nb1RZQ2hEeXVNVmw0ay9p?=
 =?utf-8?B?UFlFNUhSOUlzRDZ5K0Y4czNpRW1UM0lEeWZYYkk3TWl5bTloR1BxSGZUYXpH?=
 =?utf-8?B?cmNYT3NkR0V2YkI5djdSV1pXaHdEN0ZvaFhTQkRUNE4vWmtUSFMycDhUWTh3?=
 =?utf-8?B?RlduZmhnYWY3SzBIdXZrcUtjM0VUN3ErbzI1cVoySWRNZSszTlZQWCtwSzJH?=
 =?utf-8?B?N2syTHc5Z1BsUVdLZG1zL28rclNSSFI1WlJDeWNHL095N1F4KzJ3MFRuVVRM?=
 =?utf-8?B?b0hPR3lPeVRhSUpzMmxKMytYTU5SeWEwTVFaY3VGMFdXQkQ0TWdsanYrTVZo?=
 =?utf-8?B?SXRubkw2dXZlMkcvb2hYNjFjdUVqN2taU0QxZTFuN3FqdTJWUXFuMkVRaTJv?=
 =?utf-8?B?b1RVck5JME56Y3FhdjJ4M3NjblVvREhENUF1YVdtQUtNLzJjRG5GU2dOZ291?=
 =?utf-8?B?emJLTzVaSk1nV3FQbW9oVXZVRzkvQ1J2M0pvYkxOcjdJMHQyUXYvbDJrMkNK?=
 =?utf-8?B?Uk15eWRSeExwcTMvMXRQZ0xnbXRBcXFXVDhzaWpPdmUxYmZQbnZkdTRaTytY?=
 =?utf-8?B?QVlYcHpuZUVlOWdXR2RsR2J6TEdvVGZtRGJqamFwVm9EUndkV05IWStaNVRn?=
 =?utf-8?B?dW9CQ2pkQmFTRXVncTA5YUpkVXQ5a3d1SU1GOGc5bytacm5iUHlKTlcwdUZ6?=
 =?utf-8?B?MXN5em9WdmIyb05sd0p3RGUzS2I0SWZVQmE2RjFUSU5iV01sd2JpbVZiRG1Y?=
 =?utf-8?B?bFM0dSs5VFUweEVIU2VmNkdFVHhYdjlYazVYU05rNnArNVp6ZXJYV09jM1hm?=
 =?utf-8?B?M2lEa2N4QWpBajA3eENybmR2TkRsWGJFQjJKSUVZSnMwakk3TDBnYXdvbVdH?=
 =?utf-8?B?MWduMTFFSmxURWRpWGk4S1B4MVB6VVpLWEdGbThoaE9DOHJuRWNYL0FyNDhH?=
 =?utf-8?B?MVR1Ym1KWHZhWGVWZDN1TDlwb0thc2NZQ1oxamt0M0d5NVE3R3pVZ0ZOMytm?=
 =?utf-8?B?VDU0YVRnUXBBalpiVTJ4N0lQOU9wVjJlV2lLNVFtdlNuZldGUXpYd0dzdFFo?=
 =?utf-8?B?K1o0OTVNNWJPY3JZOVgzYkdlUitYUkFHUzFUOStjQjJhZU92SnZNM1lrWWw3?=
 =?utf-8?B?S2dxeEJvWWZLcUJQbXZYRVIwMXlRZzQ4WUNRU1JwK3VLY2dJSnYwY29aYy83?=
 =?utf-8?B?QnNIUXNXaG1uaGVURXhyWGNac05YN1A3Y0syQXNTWUVzVGtJL3NZY2c3ekp6?=
 =?utf-8?B?M2lKUFkwamxMTDFFWVo0dGZFMmZ5MVZEeWV2Wjcrek1ic2k1QzF1eTRnZWpB?=
 =?utf-8?B?UklvZHhiR1haeXdMWFpPVi9sME9tV1NhYVpST2xQRnB1d1l1cWdxMVZ5cjRo?=
 =?utf-8?B?Nko0SHIvS2wyYkdPdkVMNjNRc0hzOG9hcGp4QnpOcEo1Ulk4bmdPejNoU3Nn?=
 =?utf-8?B?YXhWbERWV0NCcG5Ic1Rib0hUZW90VlpQL010VkVrKzFqdDc0NDBHQ2FxU3U2?=
 =?utf-8?B?WXFpK1VuVkprNnNXTzhTcEttR2kxamt5TjJYUVAwQlZrKzVZOWdhbjVlRGY3?=
 =?utf-8?B?TGIxcG9XMCtRS0VsZGJ5SDZwankrdFBLUDQrVlV3YWZ1Z2ZaUyt0YjEzT0Yr?=
 =?utf-8?B?cVFnclNqYktOaFR0ZDkzdmZUNDZlTGFTZkJ0WnRycjA3Q1RxbUZuZXg5Z0Jj?=
 =?utf-8?B?ZXdPdGpTNlVQSkpSZkJmbVFWa01sRE43OFhXV0d0QkoyQjhMcGNkRzdjSFc4?=
 =?utf-8?B?eS95bElNWmxFTFkzUFhBUTBjeklqSmUyZis3RmUwa3FqQi9UaE5jTFE5ZGFK?=
 =?utf-8?B?SHBTMzViTWNDWGg5NWxKZ1ZGYkZ5WDQreTBoUG9YNWFuRXdXUTZBWW9Ub084?=
 =?utf-8?B?Y3FWSG1hWHpIcEs1Uzd1RkRqOTVVNG5yTzNBdEd3TFZhbi9QWlRDZjVaUkMw?=
 =?utf-8?B?MlVtS3VqVTdSbUFVckE1aW1rSmFxWGJzMWY0bDdjNjBLeW5sU0JVR1VNM09z?=
 =?utf-8?Q?lO7i72Do+2/cTd/9btYep/4V7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5359c9-d745-4b70-035f-08dcc0e37b4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 06:44:03.7984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MJnsCkNQjpRvsoV27bJGF7MdcgMuyE8ZunyCL8wsZmTQa8zUuvYMeZGhFX6FrpBmrznDJYGvr+lDwuMYd4n92A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB6980
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_000056_119387_673DB7B0 
X-CRM114-Status: GOOD (  19.54  )
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

PiANCj4gT24gOC8xOS8yMDI0IDU6MTQgUE0sIEZsb3JpYW4gU2NobWlkdCB3cm90ZToNCj4gPiBI
aSwNCj4gPg0KPiA+IEkgYW0gdHJ5aW5nIHRvIHVzZSBhdGgxMmsgaW4gbW9uaXRvciBtb2RlIHdp
dGggY2FyZHMgV0NONzg1MSBhbmQNCj4gUUNOOTI3NCB3aXRob3V0IHN1Y2Nlc3MuDQo+ID4NCj4g
PiBXaGVuIHN3aXRjaGluZyB0aGUgaW50ZXJmYWNlIHRvIG1vbml0b3IsIGl3IGFsd2F5cyBmYWls
IHdpdGggdGhlIGZvbGxvd2luZw0KPiByZXNwb25zZToNCj4gPiBjb21tYW5kIGZhaWxlZDogT3Bl
cmF0aW9uIG5vdCBzdXBwb3J0ZWQgKC05NSkNCj4gPg0KPiA+IEJ1dCAnJ2l3IHBoeSBzaG934oCZ
4oCZIHJlcG9ydHMgdGhhdCB0aGUgaW50ZXJmYWNlIHN1cHBvcnQgbW9uaXRvciBtb2RlLg0KPiAN
Cj4gVGhpcyBmbGFnIGlzIHNldCBieSBtYWM4MDIxMSBpbiBpZWVlODAyMTFfcmVnaXN0ZXJfaHco
KToNCj4gDQo+IC8qIG1hYzgwMjExIGFsd2F5cyBzdXBwb3J0cyBtb25pdG9yICovDQo+IGh3LT53
aXBoeS0+aW50ZXJmYWNlX21vZGVzIHw9IEJJVChOTDgwMjExX0lGVFlQRV9NT05JVE9SKTsNCj4g
DQo+IE91ciB1cHN0cmVhbSBjb2RlIGN1cnJlbnRseSBkb2Vzbid0IHN1cHBvcnQgaXQgeWV0Lg0K
PiANCj4gPg0KPiA+IEkgdHJpZWQgd2l0aCBtYW55IGtlcm5lbHMsIHVzaW5nIHRvZGF5cyBmaXJt
d2FyZSBmcm9tIHRoZSBhdGgxMmstZmlybXdhcmUNCj4gcmVwb3NpdG9yeSwgdGhlIDYuMTAuNSBr
ZXJuZWwgYW5kIHRoZSBhdGgtcGVuZGluZyBrZXJuZWwgYW5kIGFsd2F5cyBnZXQgdGhlDQo+IHNh
bWUgcmVzdWx0Lg0KPiA+DQo+ID4gSXMgdGhlcmUgYW55IHdheSB0byBnZXQgbW9uaXRvciBtb2Rl
IHRvIHdvcmsgb24gUXVhbGNvbSBXaUZpIDcgY2hpcHM/DQo+IA0KPiBObywgd2UgaGF2ZW4ndCB1
cHN0cmVhbSByZWxhdGVkIHBhdGNoLXNldCB5ZXQuDQo+IA0KPiBJbmRlZWQgd2UgaGF2ZSBzb21l
IHBhdGNoLXNldHMgdW5kZXIgcmV2aWV3IG5vdy4NCj4gDQo+IE5vdCBzdXJlIHdoZW4gd2UgY2Fu
IHVwc3RyZWFtIGFsbCBvZiB0aGVtLg0KPiANCj4gDQo+ID4NCj4gPiBUaGFuayB5b3UuDQo+ID4N
Cj4gDQoNCg0KSXMgdGhlcmUgYW55d2F5IHdlIGNhbiBidWlsZCBmcm9tIHRoZXNlIHBhdGNoIHNl
dHMsIGFyZSB0aGV5IG9uIGEgYnJhbmNoIG9mIHJlcG8gd2UgY2FuIHB1bGwgZnJvbT8NCg0KRGF2
aWQNCg0K

