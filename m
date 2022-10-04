Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3269EC433FE
	for <ath12k@archiver.kernel.org>; Tue,  4 Oct 2022 11:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PYi5jRKu5Uvf8/AeftbstmH+k1xz1svHdMPjUlD1v3s=; b=t0GvHYZEn9EiuW
	431veGewfCkEmEbspLqMZdIsyovw8RsiMpmbYvOX0etH6z3gseJxlnwIysHxPH5TCVCM2N3TIZ5p+
	iGpDID0EHQC/oT1jHTwAqmDyI1vKxJ9Nc6EryPecwDf/VUUA4h9ih5JAgA3vb9F73J3iYyWKeyp5e
	wkslKWthIDsun0qJSU2/8S4LhWnDngSjjHSY2N+lFmfdQrRZhDrrJmTGqKRQQ/tHnBMND5Cn3BM4D
	5cLx3ggir4/esZgKJzrga8MAW15+lB064DboUbkIstGPjun/xjmkgmUkKEdJeLiwujfG1KVUP1NVC
	2fFQYuynMQg+foh1CZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofg6m-009VyX-LM
	for ath12k@archiver.kernel.org; Tue, 04 Oct 2022 11:29:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofg6j-009Vxa-Sv
	for ath12k@lists.infradead.org; Tue, 04 Oct 2022 11:29:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294BT3Ph023937;
	Tue, 4 Oct 2022 11:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=OQAn96IdVgKmm5OvJq2IYXeJj3pX4GMGPASlD4Tgl7E=;
 b=AqBbd1IMLRcZdHPBnCb0G4UE2sru0MsJ5HNf0lR0bEQzsvg1ppTPDoly7TGBfDAcfRNM
 btArujRiKT4sWacQr4sxI5bz4EsoRj7503i8yoSRUfXYVZBlHodFO55Vv8oDJCV/El66
 3osNifoazgfSq0NRQjAGtlTuT1fM4R6oF0qrIlcLLDLLNC5y7viRl8uXP7nyPXlpnVGf
 SfQloKc+65Vt14Gq/2N983ayqBldHJXCmVV6LH2YEtFsuBpExdUEGo6+00eIjhElTnuM
 YipJ8mukrUDE3pvcL+QyEw8hdDSlB1Vx7IishcB3kHVey+dNK13+0XtD2zKNy8LXFcnt pw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k0jtdg406-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Oct 2022 11:29:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loNI3sPwATx6vENaM9+pBiZQv8O0Q/ja9FHv7+t6+hoBt5K1S6a0gKvBCMVjk/AEXW+9xpFVTgc7JG6hS8Z62tNbCLwatF2bLu32v1Zl4IavVUMQTAXhgTJ2NGDGB/0T6KouFm4aU+aUiTry9cV8vpG9HTHeh4lPKOkrwL93dfGE2ta/GOqvE/n9pNB2uN3bV0kiKgUR0BlIWoSt0o3PyGQjTv67Di9tbm+mYSpfHKjoS1G8WZ7HJ6t6DaapJr/LYsWHDTynnfFsnRbqqt6oOXOYgjMy+5rJSAK/uPFu1U1t9y/OL6sRpL36dN2qWCfqKwlM1ciffOs4mObcb9c8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQAn96IdVgKmm5OvJq2IYXeJj3pX4GMGPASlD4Tgl7E=;
 b=hHgjkv9NLzrOITGiH/IctzBJ2GOBTaAi4DS21mdTEvgVrmLhiEzUdXDbJlpKIR/REIsR9ef3k2FPuGccnqwgeQ2uPvIM6XhtbsdrXeNbN8sU/d4jqA5x0TLAto0ssEP5Sac4qwjc36AVcv1uwzFPI2/9+xDjEa0peVCYdm1kQw2s6VXGpcZRlbdWfSyVXBd5uMEea0VAAzAabbvXdT1xpnnHv6cNyfaVQf0KM6sXBCMOls3MbUEeUQuMNYqKRNA1Jz1L3q9qRAU5oBjKGfnAy368Ch9xty/bKNgOMMq5ZXE2tUri8TZkLC18Y2Ht8Nc4tlLB3yRqoMfSAtD/mJMZyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from CH0PR02MB8212.namprd02.prod.outlook.com (2603:10b6:610:eb::20)
 by BY5PR02MB6882.namprd02.prod.outlook.com (2603:10b6:a03:23b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 11:28:59 +0000
Received: from CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::a2aa:7ce8:a34:fdb1]) by CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::a2aa:7ce8:a34:fdb1%6]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 11:28:59 +0000
From: "Karthikeyan Periyasamy (QUIC)" <quic_periyasa@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>,
        Kalle Valo
	<kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH 29/50] wifi: ath12k: add hw.c
Thread-Topic: [PATCH 29/50] wifi: ath12k: add hw.c
Thread-Index: AQHYrmYmcy/ZUffLkkCFYty3gCEjeK21NuSAgEk1AzA=
Date: Tue, 4 Oct 2022 11:28:58 +0000
Message-ID:  <CH0PR02MB8212240385F6783B06951B43F65A9@CH0PR02MB8212.namprd02.prod.outlook.com>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-30-kvalo@kernel.org>
 <5babeb15-801d-b280-b8fc-c87ba980c9ff@quicinc.com>
In-Reply-To: <5babeb15-801d-b280-b8fc-c87ba980c9ff@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR02MB8212:EE_|BY5PR02MB6882:EE_
x-ms-office365-filtering-correlation-id: a4f47148-b7fa-46ea-6fa1-08daa5fba166
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9SLLYSGVVQ53QiDOJM4JyBx1NthIFDyngsBeJh1WnpZPfIztj7YdZ3gY/r5j8Jaqlpgcek600t/yow7wm18qHPLf+4nEi74XibR/7liGayrhhxkSP6ASTW8HX4U/iLqUdtPMYDfV5Wx8oD/TXwsJJR6ZbGvlozIjO01F4qVLsANULUxbsuHRttki5KHXZm+Ev9GuRz9pOvWsqVdaxqKtltaDYJPk/B6ULNin3YcU3ODvPkmJK882tVzW06gzpn4pDBekRK5ZkdqKq8R/Xx84h2RTTTqwuLYAprMcU6vTr0wAE6uEYnw3EOHHdCwKn/enjPj/EtO8ZEkKy1ztbMfT/jrMIHNzYdTLpXJZv0dyBT0uXpeB40ct/SOvP5XUvEI9qh95JxaaM6G9lSoW52VAthdK2+FOMkte4/GqgY8zJd9vSbsaXBG+Kq8/DHn9gQq6SnXwmFVCvzwoU72kZxTlAZNVXA5Kwyw85FKQ634yYewbayYw4Ru3g3XRkr3bGdEU6nghrD1ssimXOAMrFtdojZLP4qFHqbG+GVI02h4SApcm25peB7QWo3CWwCh84Y4n8a43ZbJsA+qJbobqO6tVDLosIIb0csWj2JvK/8UkbFGD0vXnfGclwSHSXWO1kCSvT9bRVFHa8IIo1bwIuAzvA+onT2/05y0Hsc/Bot7P+CrliOuEkzBhj0R209iheS3TwzlyJMXiqcHD0zLSQ2CoV1tWP5r3AO/HcKUTEOp0LSVlk9TLpP6VTpJkv0MZYVpxFLoxpxfVZUpdzL8tmKsMuQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR02MB8212.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199015)(6506007)(33656002)(7696005)(478600001)(53546011)(71200400001)(76116006)(66446008)(66946007)(66556008)(66476007)(8676002)(4326008)(316002)(110136005)(38100700002)(122000001)(64756008)(38070700005)(55016003)(186003)(9686003)(26005)(86362001)(83380400001)(41300700001)(5660300002)(2906002)(52536014)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZU9iT1Q3U2NCSDRqTUtMbGFnSCtoNnJoUHp3QnBRYlVYTjNnT0JVVkQ3S0NS?=
 =?utf-8?B?RE9WUzdUN003RlpKOHg5SHJYRjdlQ0ZCNmlmRk1iSXNQTFNPQUY0YjN2MktF?=
 =?utf-8?B?TlExWWJZYVNyaDJ0YVdjUitPTDdjeHBBMzVwMStjU0ptY0dXZ3RtM1hDcTQw?=
 =?utf-8?B?VTJYdkd6dlZCVFBWL2N2akQrRVczSnhuUjMyQkVwNllYNGg2dExFR0QvaVhX?=
 =?utf-8?B?WTZ6b1pDSzhBekx1a0ZKalEwMWlCZUFKMFFhUUpicUxNYUhQanprVmdrNk45?=
 =?utf-8?B?ZUV0a0xKNUdSbjBhNTg0TTBXUGZZZVRtWk1vVWc5RDVCazdwMXNuZ0tZdFds?=
 =?utf-8?B?RmZaTitFUzF3dytSRDduU1VQUVpmQ1FjVmIvRHQxU3FyRitLOFUxSEJvV2x3?=
 =?utf-8?B?enhYa3ZlWnRIaFBXaWdVVzF3V0k3NUNLZmpDdzJNNjNKOFNjbUdMZHJEaVNY?=
 =?utf-8?B?Q2Z0M2l0bGJqenZweTRmdGtPZ0ZsWHp1TXk4OW9sQlVWNHhHZjZwRWFzblRT?=
 =?utf-8?B?ZWRGRUZFVnorU3VoVVRuMk1xdUpTTDYvakkweDc0c0pxaklZTUNFTmpHcVZh?=
 =?utf-8?B?R0llQ1JHbVN2MzdNL3JMdHRSYncwTUZ5OElZVkx1RWhtMTk0dlNmL0xRL0Fk?=
 =?utf-8?B?YnpPVkV0b3pma2Q1OGhHMUgvc0kxTTNXL1RTV0E5VFRZNlE1MHdGSllGZVFw?=
 =?utf-8?B?STlOekhHMjhoQkovdE5wVDlZbmgwanEwbkhHRDF1MWNWdEdGZnVUbVk0MTdD?=
 =?utf-8?B?aFpuMm9VR0dnSjZTbjlHczQ4c0RzZW9tc1hnY2RPTHVwSjRkL1lRK2svWFlJ?=
 =?utf-8?B?d2NlY1k3MGJ6enVlYm5aL0ZXRHY0OWdaZGI3R2xGUjV6bld0NHhLTkZqSVZN?=
 =?utf-8?B?Mm1qV0tRS1BxTzFWRTZGU3hmTGlJQnpCdGlzR2xLTHJSRURLYkQ3WWpsWHhP?=
 =?utf-8?B?aWQxVEFpSDBZYkZYVUwwcmhFa0xOZjB2NjhrSUt1bkgwTkJkQ0N0aGlnTVZ3?=
 =?utf-8?B?Rmg5Mm9jZ3RVTy84d09xcjZzN0x6bTNZcFJ3T1pDMUcyb2JJellIUG1MaUQw?=
 =?utf-8?B?WUlwanAwMjZZaExVYzQvaEd5MDVuc0J0OCsyaWhqZHBLcGNZa0J0NHpGVnp1?=
 =?utf-8?B?d0hUbmU3bW9oZDVSYzMvNWNiQzNxSnN5bkNCUlI1Vk5EYXNDTmdRVGFVb0c2?=
 =?utf-8?B?RVc5TGZSdXFISWJGUTBmdXB2eDE2WEJYeHRUeW5FdGNFaktRSzNYdWhQOGdI?=
 =?utf-8?B?YlFvRUpmWnc4NXpXNmxNVnBHMU1MQ09wNlp6WXUrWmUrNjQ3dGdSZXJnOHdK?=
 =?utf-8?B?WHREdmhFajFDNkN3NlU2cmx0c05uM3c0M3IvcXpvN0lHTjVlRkRBUWRlV2Rm?=
 =?utf-8?B?Vm1jTzdMZnkxYkJPZ2xxYXpmK3FyVzlqZTkzZTN3MWs4dWRSSXA4ZmRnVVA5?=
 =?utf-8?B?SnNQSVNIbmQvTUYrUGZqUU0xejh2U0RKZGZ4STRQSDh5Z3pmUVdVWkdKbmpE?=
 =?utf-8?B?YTJUemxMNmlIckc2aDR4UzJQbG1hSGlFVXVpWktiamY3Tml0aDhQVk85TTJV?=
 =?utf-8?B?cDVoLzFaNG9rWEt0ckllL2ZxNUhsanVpUXFHYnZQZjB1eWVnTGkwTUtQd1JN?=
 =?utf-8?B?elJCUDNlZVpZYUNQcENCYmIwM0tVNWxFblBCcldlRjYwYUZlVHJmYjJmamx6?=
 =?utf-8?B?ZndKdEdreG5DQU1keERsWFRlQm4rYndRT0xxSkNPYWRMd3BadVJPb1crSHBt?=
 =?utf-8?B?aUxGVElReXZkMlZveng0dDhJWFkyZFFNYnZtbTRoSjl0MXMyaDZzdHU3bHhQ?=
 =?utf-8?B?bUxFamZhNWlndTBQQ1FGYzRkck5TQURHRlM0UzY2SXdhNFU3T0hpM0thU2Np?=
 =?utf-8?B?Zk4vbnNhNHVkVTA2NDIyOGlqcnN4U2puU3l3WTlvV3lQVkJ5WkFpWTZXRHRn?=
 =?utf-8?B?NGU4Q0VwckVjQlhveUkxU242OG1LS004ZE5FemZtTHJMZWdwOFBSRHYxclBK?=
 =?utf-8?B?NWxXK0ZqRkFQeno2RU5XbmtDRU94TW8vMEI3b3BFRHRTUHZzRDlqWldLM0FP?=
 =?utf-8?B?QTZvdW1zV1d3L1NBc3RNZnU1UHpZL3dEaG9GVWk3bVRNZjJsMmtwSXlLWE9R?=
 =?utf-8?Q?rJAe3CdAHTM/TlPWVUqwTIJgf?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB8212.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f47148-b7fa-46ea-6fa1-08daa5fba166
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 11:28:58.9253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IwZYzr7JcPpXY6N0t+ioIksUdNmYca2TIRZgeqlJnrRTK+QdjiG9uc5occ5dIDDr/KG9lXk9ilD56H26HzeoS04+Xyk+2j/eLogQSza2M5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6882
X-Proofpoint-GUID: KXIxtMFLrxmwmzEg0wNv9LdLpseY39k0
X-Proofpoint-ORIG-GUID: KXIxtMFLrxmwmzEg0wNv9LdLpseY39k0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_042905_962373_CD2B8046 
X-CRM114-Status: GOOD (  25.11  )
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
> Sent: Friday, August 19, 2022 3:01 AM
> To: Kalle Valo <kvalo@kernel.org>; linux-wireless@vger.kernel.org
> Cc: ath12k@lists.infradead.org
> Subject: Re: [PATCH 29/50] wifi: ath12k: add hw.c
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
> >   drivers/net/wireless/ath/ath12k/hw.c | 961
> +++++++++++++++++++++++++++++++++++
> >   1 file changed, 961 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath12k/hw.c
> > b/drivers/net/wireless/ath/ath12k/hw.c
> 
> snip
> 
> > +static const struct ath12k_hw_ring_mask ath12k_hw_ring_mask_qcn9274
> = {
> > +     .tx  = {
> > +             ATH12K_TX_RING_MASK_0,
> > +             ATH12K_TX_RING_MASK_1,
> > +             ATH12K_TX_RING_MASK_2,
> > +             ATH12K_TX_RING_MASK_3,
> > +     },
> > +     .rx_mon_dest = {
> > +             0, 0, 0,
> > +             ATH12K_RX_MON_RING_MASK_0,
> > +             ATH12K_RX_MON_RING_MASK_1,
> > +             ATH12K_RX_MON_RING_MASK_2,
> > +     },
> > +     .rx = {
> > +             0, 0, 0, 0,
> > +             ATH12K_RX_RING_MASK_0,
> > +             ATH12K_RX_RING_MASK_1,
> > +             ATH12K_RX_RING_MASK_2,
> > +             ATH12K_RX_RING_MASK_3,
> > +     },
> > +     .rx_err = {
> > +             0, 0, 0,
> > +             ATH12K_RX_ERR_RING_MASK_0,
> > +     },
> > +     .rx_wbm_rel = {
> > +             0, 0, 0,
> > +             ATH12K_RX_WBM_REL_RING_MASK_0,
> > +     },
> > +     .reo_status = {
> > +             0, 0, 0,
> > +             ATH12K_REO_STATUS_RING_MASK_0,
> > +     },
> > +     .host2rxdma = {
> > +             0, 0, 0,
> > +             ATH12K_HOST2RXDMA_RING_MASK_0,
> > +     },
> > +     .tx_mon_dest = {
> > +             ATH12K_TX_MON_RING_MASK_0,
> > +             ATH12K_TX_MON_RING_MASK_1,
> > +             0, 0, 0, 0, 0, 0
> 
> nit: trailing 0s do not need to be specified (none of the other initializers have
> them)
> 

Sure will address this comment in the next version of the patch

> 
> > +     },
> > +};
> > +
> > +static const struct ath12k_hw_ring_mask ath12k_hw_ring_mask_wcn7850
> = {
> > +     .tx  = {
> > +             ATH12K_TX_RING_MASK_0,
> > +             ATH12K_TX_RING_MASK_2,
> > +             ATH12K_TX_RING_MASK_4,
> > +     },
> > +
> > +     .rx = {
> > +             0, 0, 0,
> > +             ATH12K_RX_RING_MASK_0,
> > +             ATH12K_RX_RING_MASK_1,
> > +             ATH12K_RX_RING_MASK_2,
> > +             ATH12K_RX_RING_MASK_3,
> > +     },
> > +     .rx_err = {
> > +             ATH12K_RX_ERR_RING_MASK_0,
> > +     },
> > +     .rx_wbm_rel = {
> > +             ATH12K_RX_WBM_REL_RING_MASK_0,
> > +     },
> > +     .reo_status = {
> > +             ATH12K_REO_STATUS_RING_MASK_0,
> > +     },
> > +
> > +     .host2rxdma = {
> > +     },
> 
> nit: add empty .rx_mon_dest & .tx_mon_dest initializers?

Sure will address this comment in the next version of the patch

> 
> > +};
> > +
> 
> snip

Thanks
Karthikeyan
-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
