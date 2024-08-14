Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26579C3DA4A
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 20:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9JydrdpSeQwrBrPELzp/AM/CnM4J7aBWoRC6uXM1xg=; b=3nbTkSMMZoWsvwMfsLkqziCFC+
	/DSV5vwKnkGbfYkOWKis9JGEl5OtX2oJI1FFklIH94/Cdy+hosC7dd5EUF7GiliP9Rn6AUaeteEUD
	2oR4Vm5CToCd//pdamwRIcOekVILTXuh1TrizKbQBacwE4Bu7pD0LRVQZcKCQ8AjHE+/uHCV+8KvW
	ACrHaGF8L9psIatk+tufU+brcIi47QPapLKEHCNM5hy65d6a4MlAcZc52t/9KEEweNJxrtFIFHhTW
	RLIJvkD/+WI7he4NOWW6Z3zNSEewW532HVkjMo7hfDy/fzwhFpiMKrJa+Dc9Obi1FSGu7PYMAYwVL
	BNl8uy5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seKl8-00000008C3h-3PC6
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 20:38:18 +0000
Received: from mail-lo4gbr01on20701.outbound.protection.outlook.com ([2a01:111:f403:261a::701] helo=GBR01-LO4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seKl5-00000008C3C-3ywv
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 20:38:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7wQoFsh5Xl3W29OQbXn9bVLRwQOzoba20TkX2ICbqIfDvLmn1maHnzwiWq7imE9xr0Kw/o5LGlCuKz5gioEN1/MlSm5ANAyqRKlgS4TrkNiKU6S8Ml6U1zCdekLYO4LLKB7vhe/V95/eX3xdMn3HyvH3UJK5f1MXscZrddmLqA2MCH6OJf48eCmHGB/VWyvZU7D235rxw8g9QDyr3S52hunG15wERsMXobh1u9acuHnPm7M9BrbAq3FmBuMmoPQN5Ku9jIXOGUEzsjEInnfqjnXHroMzxfEY578xwuD8n7uV1PixRzyWv0M6aWtmqzpQk650Wwbz2EcbOkEbNZdpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9JydrdpSeQwrBrPELzp/AM/CnM4J7aBWoRC6uXM1xg=;
 b=sdS80mwKBXNRN/lsFO4grlIahvR7gXbCVeR5wWDZXXNQWTGglb8WoNB1EUPxeELa4tKF4jguynuivs3ruLldtl7Nqh0Y/LsAdR+Et+grXBosF0D9LHoaTzIiHhasS7BDEULwy5INiMssBlICqzDO1JdVlaO2HCT6Bsr5sMwkoftxEJU3tt6RdKAmvherHAz/uH+Ll0D7x5s8qtTewaaRJg8vMD1QY0r5Vkj4G0zxyR+RY+zSJuNjGsBnSzRHPvk5dEyZSUQP7QPVn7d+muX6AD5yBBK6JUMWU+GTiuIDAwI4Ho8BzwjPvoHTlvkMWZxpGGJ3tj0qskreCSzJmBmPnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by CWXP123MB4293.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Wed, 14 Aug
 2024 20:38:04 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6%5]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 20:38:04 +0000
From: david Atkins <david@3adesign.co.uk>
To: Baochen Qiang <quic_bqiang@quicinc.com>, "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
Subject: RE: wcn7850 issues
Thread-Topic: wcn7850 issues
Thread-Index: AQHa7kGb/waLDsK5rUe0AflzG3bOpLInNsxg
Date: Wed, 14 Aug 2024 20:38:04 +0000
Message-ID: <LO0P123MB4057C3085F445434F5E87B3AD6872@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
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
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|CWXP123MB4293:EE_
x-ms-office365-filtering-correlation-id: 0295a133-6bc0-423c-8d5c-08dcbca0ff4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b1d4dG5TNVBHMGhTWmNOSHAvMWl5Ri8zV0RMRGJaQ29wU1B2cXJ4dWVtR2d5?=
 =?utf-8?B?N1hPZXBSLzl1cnhFQkllZWRxWEd1VDZobGliSU9vSm5lZFBYYTBJeTIxWGhB?=
 =?utf-8?B?WWt2M0U3a0dBNEhUWW1SYTdJY2pqaXc2aGtnaGpSUWtidTArNXZqSS9tOVNG?=
 =?utf-8?B?V1QxWnEraStrSUR1UmhzeXhXT1E2TEtEQ2xuTEhQVkxTK281czVLMGhOVndW?=
 =?utf-8?B?V1I0WjNSSk1GVGZCZE05NTZQUTh0ZCtGRHVtVy9kODF1NHV5Uy9pNXR2WXFN?=
 =?utf-8?B?Y1R4YW1henZaYWFsZGx5aU5PdFdMa0NWN0pQY3dZT042QVJOWG5OMkN2Qmxh?=
 =?utf-8?B?WnpuaWVHMXVPN2svTlRzOVhFc3ZLNUQ1VGZsaWthMjZrMG9QaHJOeDNhaHd4?=
 =?utf-8?B?bGx0emxHVmpWWmdobW1lMlUrVkJOK0tSbFM4UjVhQWpVaFFzMDNYTjYwamxn?=
 =?utf-8?B?Um1Zb21PZTJuWmhLVzN2MFRQbkVpR1I0OVJ0UEdONG1PcFJUS1pzU0ZyeGtq?=
 =?utf-8?B?OFUxRU8vYXBzNnlIQWdCOHB4RGh3TWRZbGJ3Q215b1dtV0tDVjB5Y3lkNGRX?=
 =?utf-8?B?bE9LNTFIc1hBWXRqVlhmbys3ZnBzUGxJNDZLcnNQbzVaVElLUzErNWE0a0tL?=
 =?utf-8?B?bCtpS0EyU2hyM0Y5eENaWlJaYTlPUmR2ODZwNHY2ZUVoTEhRM0FSM25CTlNC?=
 =?utf-8?B?bXVKL1RkZmp5cGk4eGZzSjZlUUk5WTRsQ0hmQmRuVFB6V3VFR1ZhbGtQdEtV?=
 =?utf-8?B?UGx1eFU1b2JKNytOZXdVUGFOeG9mZXBUQTNWRDQ1YWU1OTBwL1dDN0RJc090?=
 =?utf-8?B?MGdPMXowbCtWT3laMTlJeFoyQ01KcnhLaG9CU0JRVXZkTldjd1JxcWdCK2kw?=
 =?utf-8?B?YzJoekpoWkIrbVd1UmtRekxWQnRHZDhpTjV4djdDdVY1eWNUSk1VM2R2RE5k?=
 =?utf-8?B?ZEdzR2dNOFc4cnA1UGllbk4xaDJTbVVFdWsxT09yMjl5S3ptanFubHZxM2JG?=
 =?utf-8?B?T1NpWGEvTDJicE01VDdMZU9LcUY5dU1mZ2tBWjBvV3c4UE1HZ05DdThEazBi?=
 =?utf-8?B?L2lJamlMRlF2eWZyd0o5aHVUN1hEdmZPSjRxU0RFNWFHNzQzNVhEYmtVZDhI?=
 =?utf-8?B?VXZpZm50Z0J6dVRCWFJYcWZpaFUxaWJJcVlMeE01bzMwYWhtdjJLaE5MRC9V?=
 =?utf-8?B?MzMybGxhT0YwUlB2NkZBSVBvdFZVZC9ibTBRb1F4M0FiNTRRQlBUaEhER29X?=
 =?utf-8?B?dzlicmdydzJJQUFhSkFyTlFZMHkvcWNaVFpCeS8yYW9ycnNOQXZhL3lIYW1X?=
 =?utf-8?B?NGZaWGtjbnFndlRTeGlLQTcwWVNrd1JMV0JQZGhvUWJLUWtoQmJsOTkrUUFr?=
 =?utf-8?B?NEF1LzRxWmZYaTJkZkhSSzdqRW5NREVaY0tHKzZhUFE1Y2ZTWko1SzBOc25V?=
 =?utf-8?B?dXJLeGk5cWcxeHpQbW9TeXpqUDEzanhFTWcrb2JkZm5DT0NHR3d3RFBxWTNN?=
 =?utf-8?B?V1p5cG04NmdwMFFCWVJpNE43NjlvV01vUVk4dkxNcU53d2Fqa2twSHNUYlpI?=
 =?utf-8?B?eVBOTG1QS0lJajFtMXZhSXFNNFpVTDRUU3RUckpuNlVTT0N0eDJWazgrYTFU?=
 =?utf-8?B?cktIMkR1cnU5VUs3ajZ5OUQ0cXVjaE5wcTFoYzA3UWtTYkh2Slhudk5wcTgz?=
 =?utf-8?B?ZlAwUVNTckN6TnZiZnkvcUN2L2sxTFJGWEYyN3JiMDlhYUEwKzIybXVEcXRS?=
 =?utf-8?B?WjEwcjFoVXBWQVQyeVgvWDdGRWx6YTFKejZOQzZKald6OU1hYXpTWTFuT0RE?=
 =?utf-8?B?aGkrQVk2YitiYjdwaUNENzdWalVGdi9IWENRekIyUFhhM2dyQ1UyNFdJTS8z?=
 =?utf-8?B?N3VzOVFPTlpHUXJUeWRLN1k0M3h2bk9HMzVXTFFIaW5rS3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTFXUmhEYVJEd1IrU291NktzLzZZOUhsRXNDSVZ4S0EyT1dYczI2dmNUc0VI?=
 =?utf-8?B?UXBsdzJZa1laSllsR0N2TGRxYXRuQk9ZUXlWcFJPWTBITWpDTEtzaVZ1Q3lF?=
 =?utf-8?B?R3dNS2JpTUQ3cjNoWXFOMG1MSTd2R1k5RXVkdFN3dGRvK1BCcS9QaWVld0h1?=
 =?utf-8?B?bEpveXdqOGJTeGZMYldwMGZKRDlqU0FmQm9QQi9JYXNzbTUzM1pkVGZrOUFC?=
 =?utf-8?B?TVNtdlhpeHltVGpScklpWEhlMUsrQ1piaExvNWUrd3Q4VktsalE1V3AwbWZY?=
 =?utf-8?B?UUdQbExIUExzOUJ3YjVwdExqem1hSHE4WDREKzFPSHAyZndiRms4SGtXSFBo?=
 =?utf-8?B?TE9ibGZ1WldOc1dvVnlsdzFCQzk1K3pabzdmY2tDNURRbkJNbVJVU3cvSmVQ?=
 =?utf-8?B?WGJIemNYaitwQXlsYXhvUjJpdTJ0eFpRVU12cWVzK0pIRW5zallCM3dDb29z?=
 =?utf-8?B?VDZiT09uL0tneThDaUZDclFCRjJVcnMvK090d1JLRHJZci9qSUhyVGx5Z3Ex?=
 =?utf-8?B?dEplL09wQkxocC80WUx6QUFPc1ZmY2lrZU1mc2RzejZ0U1h5Y1EwZzFOT1ly?=
 =?utf-8?B?TWU0Z3d5cUx6anR5MTZjUW1aalFvQWhvbUhzSk9tVnhDZWxiR2RpalVSWHZj?=
 =?utf-8?B?dWk0a1pxNWw1VHI4SkF2M3pPY1YrMzBqak9sd1BMaWhiMXNCbkM5dURRMU85?=
 =?utf-8?B?REpNVVNSL2taOXJzSHdJRy9pbkNsYTIzUmlZOXprMnhoUWIwOFU2b092WEhh?=
 =?utf-8?B?S2xvZVd0OWdYTjlQZmVZYm9NK0xuWDI3NUllWFVPWEJHeVI5WHU1MkdWdGI5?=
 =?utf-8?B?Zkc4K2tqbVVGNTk2cGhhWS9xRmNtakZBRGw4bWo0WllQbDhlVUd4b0V4SXUw?=
 =?utf-8?B?VXZueDFnekZ4a01xbkgxcU1RbElqajBENWc4cVdWTS92L1gvUEJkWGViR2sr?=
 =?utf-8?B?dFhLQitxU3o5UU5JRG5uT0kvTmcreERRUTFKNU15V3JSZXdDUzJVc0pKQmhR?=
 =?utf-8?B?dnArUnRSMDlucTl6VjhZNWJWbnA1YkNmd3ZTK2h2cEd2OHlDdFBHWTkvTDBt?=
 =?utf-8?B?dGcxVHlCU3YvVGJYdG1raXRWekljeDVlYWxMVlR6akdqdE5IWkxETENvZGNE?=
 =?utf-8?B?Vzk3bEVpc0gyVmVrYjVWQXBXMWtLeTBqaDFGK0FpUFJTajVVNHhIVTFUekRn?=
 =?utf-8?B?OFAzY1F5VVFaUHR3VW9tWmVpMWRmVmV5ZHJyekQ2aS9VZmZvVE9jMXFyeU5j?=
 =?utf-8?B?R3pOSGtnY2RDMFBUK1dMSHdGZ1VTdVhMUHZCWGhzY21TZ3FHekR4WXhXOWVL?=
 =?utf-8?B?akRWMnFFVEVScmJHMDM4Zll3Lzl1L2R4b3Z1dnlQNFkwdDU2dzhyY0FxTVVz?=
 =?utf-8?B?Y3N3ZmVURHo1VzcrZ3BtN0QxOVY4dUU1VjRFUkludURQMnp4cDNIMXZMc0pv?=
 =?utf-8?B?SEpTdUR1U1p5ZzR3aFJnK29xbHB6dndRbTZremdzZkJXcjhuNGVQcmVCZEJS?=
 =?utf-8?B?aG5Va0FkSk93VXJjS04rb1JBelRBNVpGVFp0N01NM3J6N05TSHhyM3dmSklj?=
 =?utf-8?B?ZmJaRzVsZmI2QS8zK3gwRnlYanBPMndFRy8xeXphS3FoVXE1N29MTzE4Q3pz?=
 =?utf-8?B?UWV1M0U1TFp1L3lXSU80QkdXYlIrSEFNSUVNdEY0ZTFXVVlpMDVVZVhnYkh2?=
 =?utf-8?B?Znh4ckZhanUvT3hhSXkzZVpWWnpQSFczN0ZDZFFaVmZEMnp6UHRDeVJncFMw?=
 =?utf-8?B?MVVvdGpHQ3FkUytCUmRCdFpNRzZDeGJvVWRyRDNYYUprQVUzTnpHbm1VWEll?=
 =?utf-8?B?STRmYWxOSDZZbU5tNk1jTDhuOHRZV0Y0UFg2dEJpNGM0TkJjUGhML1dZNktO?=
 =?utf-8?B?RnA3UmpuMU03UTVDWk1YZDFjMTdMZ0NwekwzbWptUXVxTkxiYWcwZ01pWW5p?=
 =?utf-8?B?bEowYjVFQjA4cmIycEJrSDVZaTNkY01YK2o4UFVUQWFRVWxrT1FvQU5IaU9j?=
 =?utf-8?B?eDhSTVdRdzZVZjZVYzVoZ3dpYlMwaDlHNGE2c2YwNlhOVy8yUTkzSXhBbzhO?=
 =?utf-8?B?TFF1T1dIMEFmZ081RjErVDF2VmFTc1g1UzlDVUxwNytXekpYaS9XV01BQlN0?=
 =?utf-8?Q?kyeW7gpjww09YeP/uGfQEAEgm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0295a133-6bc0-423c-8d5c-08dcbca0ff4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 20:38:04.3516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YaEMjnMaK3hOgMq73zvzjodtnZXD3/3OMDJKjSYNMr3OPNfQRCwZZuVKCRMAze2RYbzBoU8J+T/sGJDlyokdvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_133816_009001_70841E78 
X-CRM114-Status: UNSURE (   9.60  )
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

PiANCj4gT24gOC82LzIwMjQgNDowNiBQTSwgZGF2aWQgQXRraW5zIHdyb3RlOg0KPiA+IE5vIHN1
cHBvcnQgZm9yIEVIVCBhbmQgdGhlcmVmb3JlIG5vIE1TQyAxMiBvciAxMyB3aGljaCBmaXRzIHdp
dGggdGhlDQo+ID4gZG1lc2cgd2FybmluZyBhYm91dCBpdCBub3QgYmVpbmcgc3VwcG9ydGVkLA0K
PiBkaWQgbm90IG5vdGVkIHRoaXMgLi4uIFNvIGlmIEFQIGRvZXMgbm90IHN1cHBvcnQgRUhULCBh
Ym92ZSB3YXJuaW5ncyBtYWtlcw0KPiBzZW5zZSwgbGlrZSB5b3Ugc2FpZC4NCj4gDQoNCkFuc2Vy
ZXMgaW5saW5lLCBBUCBzdXBwb3J0cyBFSFQNCg0KPiBpcyB0aGlzIGEgY2FyZCBmaXJtd2FyZQ0K
PiA+IGlzc3VlIHJhdGhlciB0aGFuIHRoZSBkcml2ZXI/DQo+IGRpZCBub3QgZm9sbG93IHlvdSBo
ZXJlLCB3aHkgaXMgaXQgYW4gaXNzdWU/DQo+IA0KDQpJcyB0aGUgZmlybXdhcmUgdGhhdOKAmXMg
dXBsb2FkZWQgdG8gdGhlIGNhcmQgbm90IHN1cHBvcnRpbmcgRUhUPw0KDQpEYXZpZA0KDQo=

