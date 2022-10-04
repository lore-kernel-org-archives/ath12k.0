Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF95FC433FE
	for <ath12k@archiver.kernel.org>; Tue,  4 Oct 2022 11:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FB6sWiFah4o0Sk2oc+B0RBNMe/SaA46ShE7yxE9lMOk=; b=1hK7ieBYBXRsOz
	n1kGXsd74wXCqMw1JJcWkhAxDeVN6W87PrXGpzRUQdqUHuIcXbr6SZSknXe8YsPGC7Q7kEEHLHzlR
	c0nhHd53JiNBmP/v9zf/SBClFdlv9BFyiNKJh+2GkQ6Gpe3+4nFbVS1zWjqKso3HlIB6l0Q6FDjLl
	ccN3uGHcJ+pFBCQ8iGDJuecue0sq4TZCzSS3s44hcPiNRuq2IsWOyaR5ivmJPvoqlO5np7jmRyhtd
	Dd1hDDZHY+nkBaALjbW3jWZWWTruPFRJv/3DvZcZrqWg6Ek3FYxoel02E75ElfVITg/XO7E7nJ73X
	823fFwDhWf1j/4FVwRQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofg7x-009W9k-6x
	for ath12k@archiver.kernel.org; Tue, 04 Oct 2022 11:30:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofg7s-009W8l-PX
	for ath12k@lists.infradead.org; Tue, 04 Oct 2022 11:30:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294BQUlH023330;
	Tue, 4 Oct 2022 11:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=E6W+zLbjGVqTmUcIzMagB6mJN9t2K9z/eigePYImBxM=;
 b=e7aC+oaO85SC8xVkRgfqhDDF9fBTrXexH3OBRhR8D+VssgrWQ8g1Gpi4NbJIvzXSWcL8
 1lhEg76PtLemrYG4hkNa3S2VaTVn+c8u8NSkInmcIer6rTFk03Rb75bT56sY83grRnpL
 W23/Z0l7mYRXR8GhqCaw07bUnGT0XQCbc9xSO27Z8ztMzLjoU2YWECN2PssKbnOL/RK3
 BoYEGrWE5L81oicnFWi16dhvtuhUEloEmKrKT1vO5/Tpj+IEL9yLPsz97uQ7Dv/OciuR
 tGNau48g+FO1/wz1HB/Rxea5aF2tnOsvd2JAOctFvGZYJV1ExnoMGoBx8+kvgYmHnZFe /A== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jxawu60ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Oct 2022 11:30:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHLNJw5XBb4mAgdG4Y07GcWLftwibrypqdf6ysRBjugjzlhqtR7kBaNw5ci2CVb/c7LE7n3APnNW7LIuBjaq5xFuVQ0V1VbjuPGrU2sdRb1MSRGGIEe8C+gFwOfnC5NXs9hMMBv/1K+AutdKjcD0fYa9la+pCO8IQaygwfGRvHO42Ofnf2yJ5xyGDmwoAbDzS02eMZyPZ+1z7m2Q0+Y9VKW7skrS49FBIKw1bft/VEEE6+BvrLedcyS3XKuw78gDUUK0ib0CTTcEmaAAzvMIktXDyBOUEwIcjC7aIclPmQDKD1hM2Lswi2xhULbfVcceLMaYwAKQE7k4Df0E0LM65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6W+zLbjGVqTmUcIzMagB6mJN9t2K9z/eigePYImBxM=;
 b=kaX4/4Tm8PIf/6r9tM6UQCTW8eIQoOMz1JXvvKP8JWdN1JkB0qm1YJUUVWkEZAk4nW82tIVbrHbwTTxOhgsZilo6h0Xm0h/amb+OllqvCpRqoKPcjAWIHE8g0y/9MO37HCPiqok/ZJ70eyXOUPvxXjAMmltwsoDF9Rhnt1chDhSznUdRwIuc30A+vPqqtqhKLuf4Vj5tss96ovIe8lGOsenR3rCV7lt6X57Bw5gDLy6vTqHzVgrfPWiT8sASZxMX5i/KA/85f1kZ+94fsqJFnasRUpvrCw6tg+ykKNiflxwJZCUixyhx/zDbb83BGO3gjUOG0BPFUquxTM15vWI0SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from CH0PR02MB8212.namprd02.prod.outlook.com (2603:10b6:610:eb::20)
 by BY5PR02MB6882.namprd02.prod.outlook.com (2603:10b6:a03:23b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 11:30:11 +0000
Received: from CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::a2aa:7ce8:a34:fdb1]) by CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::a2aa:7ce8:a34:fdb1%6]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 11:30:11 +0000
From: "Karthikeyan Periyasamy (QUIC)" <quic_periyasa@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>,
        Kalle Valo
	<kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH 37/50] wifi: ath12k: add peer.c
Thread-Topic: [PATCH 37/50] wifi: ath12k: add peer.c
Thread-Index: AQHYrmYoGlPGh5U2kEqvzi4XYG2Jia21WUwAgEkS/7A=
Date: Tue, 4 Oct 2022 11:30:11 +0000
Message-ID:  <CH0PR02MB821262DF3ABBBA911E31B1CFF65A9@CH0PR02MB8212.namprd02.prod.outlook.com>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-38-kvalo@kernel.org>
 <c5a1b013-d53a-77b3-eaf8-05b5bbc23b0a@quicinc.com>
In-Reply-To: <c5a1b013-d53a-77b3-eaf8-05b5bbc23b0a@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR02MB8212:EE_|BY5PR02MB6882:EE_
x-ms-office365-filtering-correlation-id: 003ab370-0d86-41e4-a04e-08daa5fbcc72
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  eQvQgOzpS1sXeQSFmxWdPfcPGwKAyigffAeDSViJvq4HC+XYMStQkRErPC3loeXp3mdV3i8rpFu0oN70gEmyE3HDMpU9Lp8gcKZOGebtLLoKPHw9GUjrI9T75ZrxlOU0lKShazlvGKNxat0Yujbu/OutPTdnZ1RCYCKB6/1A0TRhvk4Mpfz7fL/na5krJX9LJFZIyLc10C0YUIFxICEt6pdsIEMKoZNRPjTAgKshV4TZ9j2F75x8Melum2La1OwuvWSc2X07tbrvhXlj6ZLHWkc+ZopF8sUEhKsObnF0DSLbD6AVVAZ6XHv8nBAEeinAN+UkQ0n+XAODpkXBY7AxxCTmVMr79c7s0czKfJu95LvFJojt6nRSP40cIP/rR7ZUsgZ8MUIHYFa5Q/VC4HuLrIcVDLjauvAUTIQ902YkJVpqlu4B1E/E9HZWIbcEZa1oMPbUOJpTkVgu4bA5nB7SXGgmwBnxR/QypNQoTBApjn8HDUnnMeTJkgO8ouv7VPYMwrH8QbWTB35Pk6dW+/FOvZpWxx2KFxeH3pC2b5byRwuak4neJu7lVNXfUK3Kkozghwjln40o9EIeVVatxJTpy7uEECIStoDXdSRshvlTVlnXO9ii/NElDAi6RGH6+MY54uCCx+lcfR+r0YU76xA4o8HnVgKAb9BWZoObmquhLxZiG0mtdttxhzDkRmJFMUCXyaDvA1W0EbnJMg64GeptLTaXMhiHEXkiRo/by+i0MevPZ5aRJCA7THNWW2Cp5VGsYho1mxMmXGhpIu4ji91Siw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR02MB8212.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199015)(6506007)(33656002)(7696005)(478600001)(53546011)(71200400001)(76116006)(66446008)(66946007)(66556008)(66476007)(8676002)(4326008)(316002)(110136005)(38100700002)(122000001)(64756008)(38070700005)(55016003)(186003)(9686003)(26005)(86362001)(83380400001)(41300700001)(5660300002)(2906002)(52536014)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dWJGNWQ1aGZKRTN5ZjRHeThZYlJSN0wvTE4rZlZoWDRlTW01bXVyOUZnVm95?=
 =?utf-8?B?cUVRQzdTZ20zZmZaNEJtTGVVTklDZFB1eklhcytmTVJTUkdaNFhkcUwxSFhV?=
 =?utf-8?B?NnB0NmNhN05GVWtEUkJOTUd3NDFRSjAzS0d4dzhJYjAyaGh0VmM2Rm1BQXV1?=
 =?utf-8?B?dk5lai9TTzJuWWtyQlhTU1BUOUhqR3JJekQ4M21nNUJvdjlmOWxTcDl2YzRp?=
 =?utf-8?B?MTZXN0g1MERzRVkxV0VWVittOUw2d2d5WmQrRE1DVWhYM3JxZ1RrYklNbEoz?=
 =?utf-8?B?UHBNNFVQSFBTSFlXTDVuVFNMeC8zcGliakc5MjlWZVQvMDRrbXVlTGI2UFRr?=
 =?utf-8?B?Yk5LTSt0bDVpQWRvSi9PeWhpdkFRbHNsM0d1ZnhRMWIxNWwzd1dUMUFwTlgr?=
 =?utf-8?B?QkZ1QWQycC8ybzFvSmtaUGVzUVJ0TVF0VGRDb1gzSDViNDRnNDFadFE1NExD?=
 =?utf-8?B?dDZwQnRCNjgyaVVUVDVkNDhvM1FZTHVDUE5MMVlqZ0tvQXIrWXpKYmVXMEsw?=
 =?utf-8?B?ZDE1cmlsQXgvSjJzd2d3QmFXTTBpbkxFYnZPYndOcGcwd2QrbERVVytNUS9R?=
 =?utf-8?B?TGhaZDNiRWxybmlLdUlnNGpkRzVweFYrNkNIeHpZMElNVWpENFhCZmU2dnox?=
 =?utf-8?B?K1ZiKzA3ZDFWWXpKVWtBbVZWQ1lrL0RscGd5Tk5TcEY1OGpEMytRcHUyaWUw?=
 =?utf-8?B?ZWhqL3liNEc3eXgyQUNlZzdxeEg4QWhKWTJ1RDRzUXVEaTBicHVsYlBWY1FE?=
 =?utf-8?B?OHFzUm1XYVZBam5Ob3BzNk4yeVJPTStxdXlPK0lEaHk1bWVWVDdRNS81OVY2?=
 =?utf-8?B?MHcrRzhZUE1Cd0tiekU4ODRzMld4SFlNUXhoNkZIZWpQQXd0OUhkMkxHbGtG?=
 =?utf-8?B?clE5T0pvb04yVU5IYWZrQ2tkQWtCNVFadjBDaTFHc0o3ZUsxQ2MxUGU1elR6?=
 =?utf-8?B?bm5tT2taMmErZEZLOG1QQWFVZHhNSHUzNVd1dWxndHV5QnRIRXRINDF2TmRj?=
 =?utf-8?B?eXg1TmRqVnMyZGlWbk1Yb1c4MkdJQ05mN1VuUkNZOEdJYUJQRUh2ZE1pNVM5?=
 =?utf-8?B?S2dsN2hXNUJoQ012L2NkSkNMNmRpRXZ0M1RjUnQ4QjgrRGpRSms0MTFlSGtP?=
 =?utf-8?B?WThMUm1Vanl0R2N6MzBRSmEvZ3pPaFQ0Z25PUjRvakFHT0lhaTFWN1ZGc1Jh?=
 =?utf-8?B?Zm52ZnBwb0hMSlhmV2wxSC9xUVhFMnlDMFhqamkxelhlbUlQNGNQSWVVQkdD?=
 =?utf-8?B?ckpneDU2elFBcHVUZHhjQ0VRbzBTMUVsellnM2txREl6ZGorUERsWVNMQlNO?=
 =?utf-8?B?STkwUytUUG1nUGxrZ2tITm8yamcyYlFOM0pCRjB3cW9oVDJLVkxFUWVvNmps?=
 =?utf-8?B?WTRFNWN0cUJ0WlV2ak0wanRnbVBrc1ozS3RRdHk4RzF5K3Erb1l0NmYrYUJz?=
 =?utf-8?B?N1l4UVB5SmhRNTZGNzZzRXc2Z3VaTldqQmpMOUZhdlBvY1VycURrNmd6b2lo?=
 =?utf-8?B?VXdjZTZ1TGhjWVBkdWpJRTRTeGNiMS95SWxXeDJqbmVHZTNPZ2RySXl1TXYz?=
 =?utf-8?B?TFZTWDIwdU1yMWV4SlVIcW1LelpEQWJKWE5QWlhaSjNUQ1ZQL3U0SGp3RVFD?=
 =?utf-8?B?Q1FsaFRuSVpjbFlmZkNzRm84ekZDS1hzNnM2d2pUSDdPZnZsZGR5VG55K0JN?=
 =?utf-8?B?N2RyYTM4bTYxaU5veFlZSTdYWDJwQ0RyYzByR3pod3JkaFlHVmdBZXYxV2Nx?=
 =?utf-8?B?c1ZvcStnNEFQMHhNbDlpMjFNaGxPM0srMVUyMEExaTZoVG45SUNMS3h5bFNQ?=
 =?utf-8?B?VTQxV09tM3psaXhQWHgzSDZkT1ZyR3hOU1hMRFNHSENDKzZGV2l2ZmhGK2hs?=
 =?utf-8?B?VXpXTnhNY2E1cWZRTVJWSlNhd1V1bU5ndFRPa1lNM3hvb0sxckVxQUlyQWRn?=
 =?utf-8?B?TkhVL1ZNaVByVTBvK2ZXeVo3TWRMVXR6R3hpckgxaXlTNWRHaXFDSnJCN3l4?=
 =?utf-8?B?RXZEZ290ZnQ1eSswZ0haVVBGT21LMFAxbnVZMWtWenYyZzVFNnBTYkZKM1RC?=
 =?utf-8?B?WTE1ekxUNUNVUC9uL280a25PbW1RV1gzamswMG9SSjFqYzZnVGFqMWF2THhU?=
 =?utf-8?Q?Q8H5Yd0KTaNODHF+JX7fvtmI1?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB8212.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 003ab370-0d86-41e4-a04e-08daa5fbcc72
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 11:30:11.1160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gw52v0rzAJ3VulYj8soGPFSnfxkRASQmw118eU+iiVoJWQdbR+uuHu31yK1iySrS2mpMsF7+3B+ZcEbbatZDmD64oUCCgXHKCrGm87/GCys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6882
X-Proofpoint-GUID: YyBNtilHjk6ibSPfZI2aCJv9Ba51zPx1
X-Proofpoint-ORIG-GUID: YyBNtilHjk6ibSPfZI2aCJv9Ba51zPx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=970 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210040074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_043016_972912_6C16470C 
X-CRM114-Status: GOOD (  36.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

> -----Original Message-----
> From: Jeff Johnson <quic_jjohnson@quicinc.com>
> Sent: Friday, August 19, 2022 5:04 AM
> To: Kalle Valo <kvalo@kernel.org>; linux-wireless@vger.kernel.org
> Cc: ath12k@lists.infradead.org
> Subject: Re: [PATCH 37/50] wifi: ath12k: add peer.c
> 
> WARNING: This email originated from outside of Qualcomm. Please be wary
> of any links or attachments, and do not enable macros.
> 
> On 8/12/2022 9:09 AM, Kalle Valo wrote:
> > From: Kalle Valo <quic_kvalo@quicinc.com>
> >
> > (Patches split into one patch per file for easier review, but the
> > final commit will be one big patch. See the cover letter for more
> > info.)
> >
> > Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> > ---
> >   drivers/net/wireless/ath/ath12k/peer.c | 343
> +++++++++++++++++++++++++++++++++
> >   1 file changed, 343 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath12k/peer.c
> > b/drivers/net/wireless/ath/ath12k/peer.c
> > new file mode 100644
> > index 000000000000..30ffdbbdcc7f
> > --- /dev/null
> > +++ b/drivers/net/wireless/ath/ath12k/peer.c
> > @@ -0,0 +1,343 @@
> > +// SPDX-License-Identifier: BSD-3-Clause-Clear
> > +/*
> > + * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights
> reserved.
> > + */
> > +
> > +#include "core.h"
> > +#include "peer.h"
> > +#include "debug.h"
> > +
> > +struct ath12k_peer *ath12k_peer_find(struct ath12k_base *ab, int
> vdev_id,
> > +                                  const u8 *addr) {
> > +     struct ath12k_peer *peer;
> > +
> > +     lockdep_assert_held(&ab->base_lock);
> > +
> > +     list_for_each_entry(peer, &ab->peers, list) {
> > +             if (peer->vdev_id != vdev_id)
> > +                     continue;
> > +             if (!ether_addr_equal(peer->addr, addr))
> > +                     continue;
> > +
> > +             return peer;
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +static struct ath12k_peer *ath12k_peer_find_by_pdev_idx(struct
> ath12k_base *ab,
> > +                                                     u8 pdev_idx,
> > +const u8 *addr) {
> > +     struct ath12k_peer *peer;
> > +
> > +     lockdep_assert_held(&ab->base_lock);
> > +
> > +     list_for_each_entry(peer, &ab->peers, list) {
> > +             if (peer->pdev_idx != pdev_idx)
> > +                     continue;
> > +             if (!ether_addr_equal(peer->addr, addr))
> > +                     continue;
> > +
> > +             return peer;
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +struct ath12k_peer *ath12k_peer_find_by_addr(struct ath12k_base *ab,
> > +                                          const u8 *addr) {
> > +     struct ath12k_peer *peer;
> > +
> > +     lockdep_assert_held(&ab->base_lock);
> > +
> > +     list_for_each_entry(peer, &ab->peers, list) {
> > +             if (!ether_addr_equal(peer->addr, addr))
> > +                     continue;
> > +
> > +             return peer;
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +struct ath12k_peer *ath12k_peer_find_by_id(struct ath12k_base *ab,
> > +                                        int peer_id) {
> > +     struct ath12k_peer *peer;
> > +
> > +     lockdep_assert_held(&ab->base_lock);
> > +
> > +     list_for_each_entry(peer, &ab->peers, list)
> > +             if (peer_id == peer->peer_id)
> > +                     return peer;
> > +
> > +     return NULL;
> > +}
> > +
> > +struct ath12k_peer *ath12k_peer_find_by_vdev_id(struct ath12k_base
> *ab,
> > +                                             int vdev_id) {
> > +     struct ath12k_peer *peer;
> > +
> > +     spin_lock_bh(&ab->base_lock);
> 
> the other ath12k_peer_find_*() functions expect the caller to take the lock,
> but in this one the function itself takes the lock. why the discrepancy? should
> these have a consistent interface? note that the returned peer won't be
> protected by the lock.
> 
> note i see this is only used in one place, and there it doesn't use the peer, it
> just checks if it exists.
> 
> perhaps rename this to bool ath12k_peer_exists_by_vdev() to justify the
> difference in locking?
> 

Sure will address this comment in the next version of the patch

> 
> > +
> > +     list_for_each_entry(peer, &ab->peers, list) {
> > +             if (vdev_id == peer->vdev_id) {
> > +                     spin_unlock_bh(&ab->base_lock);
> > +                     return peer;
> > +             }
> > +     }
> > +     spin_unlock_bh(&ab->base_lock);
> > +     return NULL;
> > +}
> 
> [...]

Thanks
Karthikeyan
-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
