Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A543FCD13CF
	for <ath12k@archiver.kernel.org>; Mon,  2 Sep 2024 06:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XT2Ay92Pkd1pWc90sm5TRJbsNJRqOPH+ejz7CWDKsfQ=; b=l1WOzeeoUpGifL+7tdNWy/67MF
	2jCmV1JddJD9fucsiA5zmeL8pPwFwCCjZQclub0NP+84JVghmAjB1/YNKs8HazMDybwOlOBJc/SAG
	tB77B8I6HBTwQyA95yCBJd/gYY5ipY3kVK47Qk1t0V4Q5X5BltXDkqO8hEF3Hvk1MvWSHRhM9W/EU
	hbfbdtO4Ni+S3mQ8t7SyZI9OFRGfajfflP+NgADH+ItGDITYakUOlLmuanjuqnNM59wKRQnGkCGxX
	rLuWBo+ORRuUTilxtqWspxXBnM2g22G+3GYVjuMXB0N5HkcUSJTwEnVa9zVK7wJVbsWgGUJaMNfzr
	4+B2gchg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl0A2-0000000D5db-1UzP
	for ath12k@archiver.kernel.org;
	Mon, 02 Sep 2024 06:03:34 +0000
Received: from mail-cwxgbr01on2070c.outbound.protection.outlook.com ([2a01:111:f403:261b::70c] helo=GBR01-CWX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl0A0-0000000D5cW-02TI
	for ath12k@lists.infradead.org;
	Mon, 02 Sep 2024 06:03:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+47bdx4kjjG9tQexEn5XK6fjGsBxHe9B093FbTc6rsucnAoAVQfGoyBV4Q7RRCGJwXBhtdHt/Nqg4I05cNMFwfYIubAzpbznmqKBzbS15Zb6A55tKoSbI1rp+OZK0Xersp8OqcB3WFiL/y0vDKjiwOif/18aD7YCeS5mDkNhudlk8c185Auuw6LYe/j+odSgrP2jODcdPq2rk9I1wta0SfU7NnIHTDXmv3zzUo9hEPtuzGCgoWz4omoZifTgclAElxHPryoO/vWIYLHgH6HPW/sFJWYSSOFfRD7i2eceONvmX6CIzxxsG84QBvHLlEKWTX9EWOW0n59it/xpSYukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XT2Ay92Pkd1pWc90sm5TRJbsNJRqOPH+ejz7CWDKsfQ=;
 b=ryHBTxVHLTytFpCw3pngzgw2z2i2aBDQEwiqZQ5NsHiLeLo64kALYywf24iYx8gSS+G8bkKFfSPeUF/cLgZRFAI+Gc1w61lynXawZIxxJZzOA/+rbb6Oew0WnbeAg27UY3/FYrGEWGbo0GTHIxc2pMIWJbFKWv9zN2RvY3AIbeqYxjqqkQErXrkKzpKzSHWUZEgWTaTnmVY+uPpfmPOACYkyqC3uGliN1LYYzbs4dJV1M9tkJAYYuuSfASXw+ZPDLK0SkJ1Gi98sQCUx+L42xtibilOG0JwJhDDlf1+39WUbp0LWg8NijVDzozqvGA+YT1xAdI7DUMf5GSOKmTBg9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by LO9P123MB7996.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 06:03:26 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6%6]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 06:03:26 +0000
From: david Atkins <david@3adesign.co.uk>
To: Baochen Qiang <quic_bqiang@quicinc.com>, "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
Subject: RE: wcn7850 issues
Thread-Topic: wcn7850 issues
Thread-Index: AQHa7kGb/waLDsK5rUe0AflzG3bOpLInNsxggABezQCAAjnlIIAEFF+AgACLnWCAEPZAAIAAFKQAgAMsa8CAATNCgIAARKCw
Date: Mon, 2 Sep 2024 06:03:25 +0000
Message-ID: <LO0P123MB4057266AFF389FA69FDC84B8D6922@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <be53813c-3edc-4734-b59d-83f43f14ea91@quicinc.com>
 <LO0P123MB4057C3085F445434F5E87B3AD6872@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <26bb8ec7-7170-4a09-ada3-c7c753c16e87@quicinc.com>
 <LO0P123MB40573F46A6D63145363C6B13D6812@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <cfe8e314-a28b-4ea3-85b2-9f5b4ac2db09@quicinc.com>
 <LO0P123MB405769E063E48B0F7AE18C5FD68C2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057E823BDB7B9ECCCD75840D6972@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <a6c609fc-150b-4779-b3f6-dddbd6ce93dc@quicinc.com>
 <LO0P123MB40578A6CEC43AEFE301F9ED8D6912@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <86bc1623-8845-43fa-9aad-a8a6066b1448@quicinc.com>
In-Reply-To: <86bc1623-8845-43fa-9aad-a8a6066b1448@quicinc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=3adesign.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|LO9P123MB7996:EE_
x-ms-office365-filtering-correlation-id: 4fca4607-2c0a-434c-5d74-08dccb14f5a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZUVDTFUyN0VjOGFuSXRqVzd0RUR5YVF6K0ZmVG1sWUVCMmRWZmpKd1M2aWRP?=
 =?utf-8?B?RFU3UjdYVVJ6M3VRK1JrZWlwZGs3cDU3d20xeGlrYzB0K1ZrWGNSbE5abjdh?=
 =?utf-8?B?UUxFRWxRelMwMUN4RE14ZGozSFlmQTZidXNvcWJOdHdxbFlVRjNSa3piQUd2?=
 =?utf-8?B?K1BVRVlXaVpxaHc1WlZTWXExc1pwZ2Z0L1hicHhDTlM1TnovSUlPRi95UW9W?=
 =?utf-8?B?Q1BOWXE2SUxEeXF0T1VKazRBQUtIOEprNmdSOFp2bXRwNEY3V0xMV3h3MktN?=
 =?utf-8?B?WWVSdzRqSW93ZCtuZjdjU1pCVzBNenNwMndQVWNIMkp3VHNEZEVBRTNST1JU?=
 =?utf-8?B?TXk1emFkS0luWUdqT2VjYWl6Z2RnYkRjSkpmVXNBNGpLbjY2cGpMOURqdnBo?=
 =?utf-8?B?d0pORGZHWUduMkNRaTJIK3lYT1VYSGJ4dGhwWDhKemtzMUFVd2wwRUR0STU0?=
 =?utf-8?B?K3lGUmtES2ZXbGRyWW1wUFNDRTh3bHMxWEhDZ05qRXhIODdSZnp4YW1tcjJM?=
 =?utf-8?B?Y2NEaWZCVEtvMm1Qc2dLa2xoYUhKbDdrTzRQbDFjejFQSlBzWWNiRGJhamlG?=
 =?utf-8?B?U2ZKTkxiOWg4ZUxqdUhiK1JNdG9ETmsrS2llYjArS2JVWDFYRFNNeU5VS1Zx?=
 =?utf-8?B?RTBpWnZkVkg1S2dpSXVNYTc3UjlTMzBLbnJ5ZmxiK1ErYnpvSVJUbjllNnRL?=
 =?utf-8?B?MlhaQmNyVTdIUmk3RWRiQmowcVo2WTN6OFRUYzc5TDBOVXNYeUlJdHQyd0p6?=
 =?utf-8?B?ZzBvZDY5bmVqR3FvODdjWDJ4bmJrT0dJWDVMam1QU2lTc0hwcnM4WWlMaHNm?=
 =?utf-8?B?K1VydHJJTjBudTJvR1NwQlZsbEJlbmZJT09iZ0hvbnRDSDc4aWdDN1lkcW0v?=
 =?utf-8?B?eXNpL2wxbVVNTS9ybHZoa0p4WXlxMlBDM3FpRkdnSUJiRDZvOHdhZnlxWlpC?=
 =?utf-8?B?eXdEd0RVYS9XckJqcWVnYktEcE5QYjY0NEZyaWRaeVRwSENTaFdBeHpGdGdh?=
 =?utf-8?B?Mkt4dUlQWjdMalQzajFYUDBFMHUxMWRwTG0xT0ZxaEd3R2RpMFZ1c010Zzgy?=
 =?utf-8?B?Nlg0TGJYOVgzODU3eGZkMmxBako5STBINzBzQUdPNWRZNUZjZGhZaW5nVWFE?=
 =?utf-8?B?aUVpcDBQU0JTQk02cVBCQ1h0MFA0R01sTGkwaHR6VGVDbXVjaU1xcEdUSFg5?=
 =?utf-8?B?TmhwWXdxSGE3WE1QVElZS3Y5RDFxN3JaeThCL1RUSHd6RnFFcmptUnRRQTdh?=
 =?utf-8?B?WGVUa0VZb0JISDhiNUxkd2Yxb0VCc3h1MU5hdlpha2RRNDQyYUNEa2wzOU9W?=
 =?utf-8?B?TWNMbjZYVDdUUVBGa3hXZXdGMEs4VHdvbGVxNThiMVhEclRhWXMyV00xUDJW?=
 =?utf-8?B?dHM5QS9wM3RScHNPMStHaTdtcWMraVVuREgzUjMrMDlQSGdLcGwxN1hvNVNK?=
 =?utf-8?B?eWFOM0tNUWx5dVFCendMODdFdE15cEpLeFBCbGNzTGRmRzRRcGo3dDdDSm4z?=
 =?utf-8?B?VUx2cHpYVnVPbXJkNWxOVFNJNGRqTG8zVEM3SXRnQk9SWG55Ry85cHY2YXRa?=
 =?utf-8?B?ZTd0UVh6RWEwWTRRSDIwS1BMTnQ0YXlWWG4rR1pISVFxdE5ZWjdhTUZOUXZh?=
 =?utf-8?B?UWhlcXN5b3pZd1M1Sk1WOTVYRGdBR0t4OFp6VTdqb2FkWUh3UmtZNFB1UllM?=
 =?utf-8?B?NGFaK3FPT0Jjd29aV0wxaklnZGNYVkswaUdCdWc1bkVYK0tBWVlPQWZvald3?=
 =?utf-8?B?V2JwdG4xTU1mRGJhZmJUUWFiWEx6UGVvdDRXRWt0KzN5RVd3dW5xWjNwN0R5?=
 =?utf-8?B?d1Rjb0xCVUg5WlEyRVNwemE0TzJVMzJYdHhMS3pTbEVPTVlCREJ6aEtVaXhG?=
 =?utf-8?B?UFFCTlhQMFd5YkE0bXp0ZnhnK2VUWXJ5UHB2ekx1QTRUTHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SW4zOGxoYkJwNE9ER2doWmNmZ0hvWnFFZk9XUUFwOTNHbjBZc1ZYWmx6RElS?=
 =?utf-8?B?WFBYRTcvdXVrQjZSWUhWSDNEd2ljaFdFV0kydjZzY0pGNDBhM1YyTGRWUy9y?=
 =?utf-8?B?RkVMRFJoVWxleU5QTksxY1FJbjNtWm1aOGdnajF3a3kyYWhXUjRpeG1SSHhF?=
 =?utf-8?B?VURXRmVLQzlPL2E5THU5d0tTTFAyT1pMUmp4Nk5YTkNHVkhNN1pBb0tZOTVG?=
 =?utf-8?B?dDV6NzRSQ09Sa3UxRkt4VnNGNjVucEN1cGEwQUNnK1VyOUFMU1dPd2ZjcjN6?=
 =?utf-8?B?ZFA2TUVyeUxrTHcwbnBGWSs1RS9rdWV3UmpKMG9xZ2UyTWtMbGVGeFRjUDc5?=
 =?utf-8?B?RkdYQVcyL1hGK1JwQXRKd1Q1aVFOUk1ua0Z1QXNQbXZHaVIxSUU3SkROSkJF?=
 =?utf-8?B?eExLbS91aWFFb2ZSemFpVENHeHF2cVhRVHo4dGc2bkl3STkxMWZicXJvNER1?=
 =?utf-8?B?SkVWbHlYbTZ3WWU3Skd3cjRqeTltMVlCc3JZd2NiZFZmSC9rVlZ5T05ZRDVC?=
 =?utf-8?B?ZkppZGwzUnRyYjkxS00xa25lT2N2dy95Z3hvWVo4WmVkM0o3VHVPcGF5bzl5?=
 =?utf-8?B?OVdsU3AyUkNzcTZhRk1tNGxRcTNhQStzVEhmV2V3akFMZ1pVTWlhVVVCZTFz?=
 =?utf-8?B?b1JaKzZBYlhuRDA2ZVd0YmNSOWsybDYvay8zaGpLNWp1ZXJaVmNRL3UrK2FQ?=
 =?utf-8?B?RXkweUhMaWNXNUpqYmh2U3ZtVjVlOEYxNVovUyt0ZzAyOVZERzlPV0lpK1hz?=
 =?utf-8?B?S0hDa0gzL1hUN3dwdWhUY293V2VvMURqcFB2S1ZoUjdZMWhnUHBkWVcvYzZZ?=
 =?utf-8?B?WW02S3dUUmhTOStYM0dPOEY0OWtJdDNSV3NHdWFCMjFpNTVPS1dOSE13RmR4?=
 =?utf-8?B?b1pCZDViaFpiK2R2aEp6Zjh5RGJtS0tWWkxZYTB0cWNFUlVmTGgyWFpEc3Bs?=
 =?utf-8?B?MTJDKzNNN0twN3N0b0V0Y1NEVGhhOHcwQnJEQVNodmI4WGExU2xnYyt5T0hp?=
 =?utf-8?B?d3gwdnAyL1hBaFFtUGNMMmlIMFgrM201aUprTHQvcWZGUjNuYloza1pYM092?=
 =?utf-8?B?UVR6elNxclJqa2RVWTVPK3NaRFc0YUZNdzZVNnJoRnIrckxlK0JCY2NJOFpR?=
 =?utf-8?B?Zm5MZmRjZTlLUVljUXlHREdLVlVRb3pFNUJnazVxTjcrOU15djhGSW43cTlp?=
 =?utf-8?B?NTVOT3U1Tk9ORmVTSU1IekhNUEI0UE4xakJtSVYxellZQWJ4aG1QUUVSc2NI?=
 =?utf-8?B?aFNEWFdTYTIwQnhvYVBzcldQUTV1ZS9ISDRyYmhKTzRRWmZLdENGK215bkt0?=
 =?utf-8?B?NENpeXMvSUthK2JEaWtJMlRQZkhyKzNkZGdzYzZoYlR2Ynovck1sRXZRL09i?=
 =?utf-8?B?dVA4VUJVeDRmN3ZnTkJQUHNPR0hLRE9kRm9ZUHlYTWxvZmR1bTVjbzZEWU5R?=
 =?utf-8?B?T1ZDcFcvR0pyYkhHVkpsazhka1VGVzBoK3IvYnNLL2R6ZUNXOFp3UXpJRExz?=
 =?utf-8?B?WUU1OHBmdUlGbDdBQ09ZLzVBZ3Y3aGFuQWdZb010R0dGc2ZYbzdjTDNJaFN4?=
 =?utf-8?B?VTlkTHVSdHZUYXR0aTRGcWtiLys4cjRHSE1qUjQwcmM0YnhpaGRaVVpERGFW?=
 =?utf-8?B?TkcyYmpSbjNCbElFVzJNTGdndXJva2ZDU2kybVdrdmZkZDhTR3dvck44Szl6?=
 =?utf-8?B?NGhscXJMWmlJVmRtZTU2ZkhoQXB6aVNBTmRiNW82WHB6c1JLR2lzV29TZjZw?=
 =?utf-8?B?ZGxYazY2UmVML1g2L1Mrek5UUHc3dGYzS2pSRWd5ZkptaVZ0SmpxcTBGNlF5?=
 =?utf-8?B?aWNwRVV3NzZEbnEwbnhZNWd5eFBGVHo2MUdPdXI2aitBdlNoT21DQ3ZUQ2NO?=
 =?utf-8?B?OXhjLzlBdGl4MzdEMFgyb2c0ZjR5c0t4eVVCZm9jMWNPanBSSHZVVy9EelRB?=
 =?utf-8?B?MFdXYi9zSkdydmpkNHdSY0VFVWhSY0dreW5rbVFjWUZ3R3htTnZGYXQxZlJN?=
 =?utf-8?B?TXhzRzVOcC9IaVRmVlNNd1JjZGRCb1BsV1VJb1NzUGFYL2dYMHY2YjliM0hO?=
 =?utf-8?B?cTlNNm1XUGNzbExkbGpXODMvSk9PbTdxOC9TcDR4VXh1UEozdStQK3ZFQkhx?=
 =?utf-8?Q?oSHtTz/bM28GzcyOrFCtmVuSa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fca4607-2c0a-434c-5d74-08dccb14f5a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 06:03:26.0449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oiMOPBYWazAW76l7wprXnzYK7f6dHcKB0TRHg8YsS0p2jUrERJ4c0Pin14n5mB+8iM3ChqdFl+adQ3711o5rXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P123MB7996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_230332_079520_FDAE4407 
X-CRM114-Status: GOOD (  16.86  )
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

PiBPbiA5LzEvMjAyNCAzOjM5IFBNLCBkYXZpZCBBdGtpbnMgd3JvdGU6DQo+ID4+IE9uIDgvMzAv
MjAyNCAxOjU1IFBNLCBkYXZpZCBBdGtpbnMgd3JvdGU6DQo+ID4+PiBBbnkgdXBkYXRlcyBvbiB0
aGlzPyBXZSBzdGlsbCBjYW5ub3QgcmVnaXN0ZXIgYSBIYW1pbHRvbiBjYXJkIHdpdGgNCj4gPj4+
IGF0aDEyayBkcml2ZXIgd2l0aCBhIDR4NCBBUA0KPiA+Pg0KPiA+PiBUaGUgJ0Jhc2ljIEVIVC1N
Q1MgQW5kIE5zcyBTZXQnIGluZGljYXRlIHRoZSBtaW5pbWFsIHJlcXVpcmVtZW50LCBub3QNCj4g
Pj4gdGhlIG1heCwgc2VlIHNwZWM6DQo+ID4+DQo+ID4+IDM1LjE1IEVIVCBCU1Mgb3BlcmF0aW9u
DQo+ID4+IDM1LjE1LjEgQmFzaWMgRUhUIEJTUyBvcGVyYXRpb24NCj4gPj4NCj4gPj4gQW4gRUhU
IFNUQSBoYXMgZG90MTFFSFRPcHRpb25JbXBsZW1lbnRlZCBlcXVhbCB0byB0cnVlLg0KPiA+PiBU
aGUgYmFzaWMgRUhULU1DUyBhbmQgTlNTIHNldCBpcyB0aGUgc2V0IG9mIDxFSFQtTUNTLCBOU1M+
IHR1cGxlcw0KPiA+PiB0aGF0IGFyZSBzdXBwb3J0ZWQgYnkgYWxsIEVIVCBTVEFzIHRoYXQgYXJl
IG1lbWJlcnMgb2YgYW4gRUhUIEJTUy4gLi4uDQo+ID4+DQo+ID4+IEFuIEVIVCBTVEEgc2hhbGwg
bm90IGF0dGVtcHQgdG8gam9pbiAoTUxNRS1KT0lOLnJlcXVlc3QgcHJpbWl0aXZlKSBhDQo+ID4+
IEJTUyB1bmxlc3MgaXQgc3VwcG9ydHMgKGkuZS4sIGlzIGFibGUgdG8gYm90aCB0cmFuc21pdCBh
bmQgcmVjZWl2ZQ0KPiA+PiB1c2luZykgYWxsIG9mIHRoZSA8RUhULU1DUywgTlNTPiB0dXBsZXMg
aW4gdGhlIGJhc2ljIEVIVC1NQ1MgYW5kIE5TUyBzZXQuDQo+ID4NCj4gPiBJJ20gdW5zdXJlIHdo
YXQncyBtaXNzaW5nIGhlcmUsIHRoaXMgaXMgdGhlIGJlYWNvbiBkYXRhIHJlbGF0aW5nIHRvDQo+
ID4gRUhUIE1DUy9OU1MNCj4gPg0KPiA+ICAgICAgICAgICAgIFN1cHBvcnRlZCBFSFQtTUNTIGFu
ZCBOU1MgU2V0DQo+ID4gICAgICAgICAgICAgICAgIEVIVC1NQ1MgTWFwIChCVyA8PSA4ME1Ieik6
IDB4NDQ0NDQ0DQo+ID4gICAgICAgICAgICAgICAgICAgICAuLi4uIC4uLi4gLi4uLiAuLi4uIC4u
Li4gMDEwMCA9IFJ4IE1heCBOc3MgVGhhdCBTdXBwb3J0cyBFSFQtTUNTIDAtOToNCj4gNA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgLi4uLiAuLi4uIC4uLi4gLi4uLiAwMTAwIC4uLi4gPSBUeCBN
YXggTnNzIFRoYXQgU3VwcG9ydHMgRUhULU1DUyAwLTk6IDQNCj4gPiAgICAgICAgICAgICAgICAg
ICAgIC4uLi4gLi4uLiAuLi4uIDAxMDAgLi4uLiAuLi4uID0gUnggTWF4IE5zcyBUaGF0IFN1cHBv
cnRzIEVIVC1NQ1MgMTAtDQo+IDExOiA0DQo+ID4gICAgICAgICAgICAgICAgICAgICAuLi4uIC4u
Li4gMDEwMCAuLi4uIC4uLi4gLi4uLiA9IFR4IE1heCBOc3MgVGhhdCBTdXBwb3J0cyBFSFQtTUNT
IDEwLQ0KPiAxMTogNA0KPiA+ICAgICAgICAgICAgICAgICAgICAgLi4uLiAwMTAwIC4uLi4gLi4u
LiAuLi4uIC4uLi4gPSBSeCBNYXggTnNzIFRoYXQgU3VwcG9ydHMgRUhULU1DUyAxMi0NCj4gMTM6
IDQNCj4gPiAgICAgICAgICAgICAgICAgICAgIDAxMDAgLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4u
ID0gVHggTWF4IE5zcyBUaGF0IFN1cHBvcnRzIEVIVC1NQ1MgMTItDQo+IDEzOiA0DQo+ID4gICAg
ICAgICBFeHQgVGFnOiBFSFQgT3BlcmF0aW9uICg4MDIuMTFiZSBEMy4wKQ0KPiA+ICAgICAgICAg
ICAgIEV4dCBUYWcgbGVuZ3RoOiA4IChUYWcgbGVuOiA5KQ0KPiA+ICAgICAgICAgICAgIEV4dCBU
YWcgTnVtYmVyOiBFSFQgT3BlcmF0aW9uICg4MDIuMTFiZSBEMy4wKSAoMTA2KQ0KPiA+ICAgICAg
ICAgICAgIEVIVCBPcGVyYXRpb24gUGFyYW1ldGVyczogMHgwMSwgRUhUIE9wZXJhdGlvbiBJbmZv
cm1hdGlvbiBQcmVzZW50DQo+ID4gICAgICAgICAgICAgICAgIC4uLi4gLi4uMSA9IEVIVCBPcGVy
YXRpb24gSW5mb3JtYXRpb24gUHJlc2VudDogVHJ1ZQ0KPiA+ICAgICAgICAgICAgICAgICAuLi4u
IC4uMC4gPSBEaXNhYmxlZCBTdWJjaGFubmVsIEJpdG1hcCBQcmVzZW50OiBGYWxzZQ0KPiA+ICAg
ICAgICAgICAgICAgICAuLi4uIC4wLi4gPSBFSFQgRGVmYXVsdCBQRSBEdXJhdGlvbjogRmFsc2UN
Cj4gPiAgICAgICAgICAgICAgICAgLi4uLiAwLi4uID0gR3JvdXAgQWRkcmVzc2VkIEJVIEluZGlj
YXRpb24gTGltaXQ6IEZhbHNlDQo+ID4gICAgICAgICAgICAgICAgIC4uMDAgLi4uLiA9IEdyb3Vw
IEFkZHJlc3NlZCBCVSBJbmRpY2F0aW9uIEV4cG9uZW50OiAwDQo+ID4gICAgICAgICAgICAgICAg
IDAwLi4gLi4uLiA9IFJlc2VydmVkOiAweDANCj4gPiAgICAgICAgICAgICBCYXNpYyBFSFQtTUNT
IEFuZCBOc3MgU2V0OiAweDQ0NDQ0NDQ0DQo+ID4gICAgICAgICAgICAgQ29udHJvbDogMHgwMiwg
Q2hhbm5lbCBXaWR0aDogODAgTUh6IEVIVCBCU1MgYmFuZHdpZHRoDQo+ID4gICAgICAgICAgICAg
ICAgIC4uLi4gLjAxMCA9IENoYW5uZWwgV2lkdGg6IDgwIE1IeiBFSFQgQlNTIGJhbmR3aWR0aCAo
MikNCj4gPiAgICAgICAgICAgICAgICAgMDAwMCAwLi4uID0gUmVzZXJ2ZWQ6IDB4MDANCj4gPg0K
PiA+IEFyZSB5b3Ugc2F5aW5nIHRoZSBhdGgxMmsgZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQgdGhl
c2UgZmVhdHVyZXM/IElmIG5vdCBjYW4NCj4geW91IGNsYXJpZnkgdGhlIGlzc3VlIHNvIEkgY2Fu
IHJhaXNlIHdpdGggdGhlIEFQIHRlYW0uDQo+ID4NCj4gYXRoMTJrL1dDTjc4NTAgc3VwcG9ydHMg
RUhULCBidXQgd2l0aCBOU1Mgb25seSAyLiBIZXJlIHRoZSBBUCByZXF1aXJlcyBOU1MNCj4gdG8g
YmUgbm8gbGVzcyB0aGFuIDQsIHRoYXQgaXMgd2h5IEVIVCBjb25uZWN0aW9uIHdhcyBkaXNhYmxl
ZC4NCg0KV2hpY2ggZmllbGQgaXMgcmVxdWlyaW5nIE5TUyBvZiA0LCBJJ20gb25seSBzZWVpbmcg
YSBtYXhpbXVtIG9mIDQsIHRoZSBRdWFsY29tbSB3aW5kb3dzIGRyaXZlciB3aWxsIGNvbm5lY3Qg
dG8gdGhlIHNhbWUgQVAsIHdlIGhhZCBhc3N1bWVkIHRoYXQgdGhhdCBhdGgxMmsgd291bGQgZG8g
dGhlIHNhbWUuDQoNCg0KDQoNCg==

