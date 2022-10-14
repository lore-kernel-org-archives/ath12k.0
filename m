Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500D2C433FE
	for <ath12k@archiver.kernel.org>; Fri, 14 Oct 2022 02:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifvSg692hGDPO/KvuH6zu3DJ4+ob9Obwxh1S8qHcfEA=; b=Kk24mUPYbnLXRh
	QmeakUh468xo3KJy2uUpTn4Dd86RGjQ0Z5Fer/80BbQ0V7JK/JrTVgtyZ83twLlYPfyeDe7dEsc0U
	cNiAHL2DRweUCy/0iknCxOYmbiwOSEKQaApT9nOoxweBQ7W3ibCndEf/rcAGNCFqSLs8MYbLCwimH
	WOb1dG8jWXKvq9+ptX9ZfPtruSUP62NsP3Y5GtubgE8zSqtRUroKBV4Ii4HLUZJA3wvDzUyGrp0/Q
	e8afltrg8W0A/01KuAkasi/ypOkoGGSA9snxqAgx/X/IvohWXyoJ+DvfxWC6hvDntngLSbrX7G3Mn
	zLUl1eknvCtesNNQoMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojAfu-00DR3C-JW
	for ath12k@archiver.kernel.org; Fri, 14 Oct 2022 02:43:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojAfq-00DR1h-Pe
	for ath12k@lists.infradead.org; Fri, 14 Oct 2022 02:43:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29E2e4w8006934;
	Fri, 14 Oct 2022 02:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=rSL3eH0Zm/9P8zd/lcQg01g/n9U0bIPWwbBIctfi97g=;
 b=mb8tOEZ62N3fc4YslLIVLzQLvKjzPnuo2V1GIUjf/9VbvVtvnEGsf5OM5zpvYUrKktoh
 WSaCv/74jZ0o5HRD80y0SuKzWjX2lCtOcrv7NWoYEdfkU/DKuxWYRcfQMsRlG6vhSZ8E
 7hFY0lP2vvDBpszxqJAfO/VgwPI8AaYTJ0piTlYmCrwTHIwXqUBqhdbAt52dEA1o1I0Y
 A6oLCLgtm1Huh3kFmOBIsMayaOnkeOiew5dC6jt5Lt5Yb7+jQ2imX2/FvoUNYvT0B2K2
 Rd/pFJ3zCzq5hlFWsgAXmjp2S7mculCDm49LjByg+omWyboW9V/VVDKSekz3KtltVoAK vg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k6fpst8r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Oct 2022 02:43:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDaP5Lb7iCRt4JxVB4Uq6PT2AiUTOuNLzWn8RjQOvvd6FyF6mgxM1y/Y8ISTZ8+uBY+/rVzsIokXP1k1qiVKbQlRvKa2is9Pm8rRTk8XtEoaoEXmjZRWjaB7+zGR3n134cW966bOFaTgLm/1MrHs33vPq9ZXpHyTxtl7DEqgBhWZ+nTyWU2SNhaxQsij8Y6krqZfTZWMv+pvWcRY0zVG8/RNS27M68RHazD+x1DOxFf6jXOMUBsPcNRAn+2mJRvgA619uGFEauoJVeSEZRakk+eueRbJJZEtCCTI+nDbUfLwbiSAmaT+s8cm6WgswdYLu627MqD+SC1pZvymw9gJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSL3eH0Zm/9P8zd/lcQg01g/n9U0bIPWwbBIctfi97g=;
 b=ZAP1bFHbUYNmdkD86FXphXrDPJvf13bENP/nh3s45p6UzmTZS8DCL7/17apUrJtauF+czF0VWONFCwIkO1z2erSQK6zLfMY9h3/QwcCgQDF8mNGgr5dvD170l/Rw8Et0+k4VFcTmswq5/EOmdTsuHXqS2W359S/uKnTdBfvuU3wHh1YXncyEgZgf/tOnbgO8dF96J7Ri5u7uO9vg1w+EdY6S8T68dsZjvLAG58K7G1REDhwQGw9VIMgXvGxctxJ0TlMEcJ3vevxjc+ToqZK0F5KvLkEdZAZ6AnS8ovfiQUhtzjITbgQnKAX9wSepIl339vCbc0+v+7nyJAfAeNM3FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4334.namprd02.prod.outlook.com (2603:10b6:805:ac::20)
 by PH0PR02MB7558.namprd02.prod.outlook.com (2603:10b6:510:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 02:43:33 +0000
Received: from SN6PR02MB4334.namprd02.prod.outlook.com
 ([fe80::8bd9:bdd5:901e:3afc]) by SN6PR02MB4334.namprd02.prod.outlook.com
 ([fe80::8bd9:bdd5:901e:3afc%2]) with mapi id 15.20.5709.021; Fri, 14 Oct 2022
 02:43:33 +0000
From: "Sriram R (QUIC)" <quic_srirrama@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>,
        "Sriram R (QUIC)"
	<quic_srirrama@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH 15/50] wifi: ath12k: add dp_rx.c
Thread-Topic: [PATCH 15/50] wifi: ath12k: add dp_rx.c
Thread-Index: AQHYrmYbHK9N0DA8vkGURLObKZSNEa2yRiIAgFmBm/CAAHsxAIABTZhQ
Date: Fri, 14 Oct 2022 02:43:33 +0000
Message-ID:  <SN6PR02MB43347B7046715E5DFA83652AF7249@SN6PR02MB4334.namprd02.prod.outlook.com>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-16-kvalo@kernel.org>
 <576a0720-fe45-36bd-abd1-b772dbe380b0@quicinc.com>
 <SN6PR02MB43342E0EDCE5420D93DD1EC7F7229@SN6PR02MB4334.namprd02.prod.outlook.com>
 <92ad1bee-d9c6-9244-f8bf-5fce8ddf4a55@quicinc.com>
In-Reply-To: <92ad1bee-d9c6-9244-f8bf-5fce8ddf4a55@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4334:EE_|PH0PR02MB7558:EE_
x-ms-office365-filtering-correlation-id: 1c1bd203-7109-4de0-f010-08daad8de2d7
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  tK6a0klIJXgrkD3NR6wLL+RObSB0NDadtqV2kPqhQ7dxnfzo7MxeUQ8YeMGpcrM+j3JXEg6C0juPGjisJIz3vsJBQ/KdXQAf8Z7aAKPxq7NersH3trjLkdMroeCJnhNYkS0MM6RCb82n/KugrEGnz/0RNmVYuVOhdHIefv3ZCya6PnxkfbSq4xzr6/cZHZ4XtnTUNGW7rfabds6LuqFVvlumspnlcPoWSNVVkdKmcMb2m2hKIoXlLwfs09/gH+kvz1D77du1vMVXnIqns41SaHWvGTJ+Tzy2WRJo6XbBryWQUXT5UKucTHEkmde74/ih3y8QERA67EQs5HBjW27tHyGdzDeU+v+OOJFjcWW3H0DHb1cD29oBj9u1o8vZ4bCNQYa6DBBsf7lddunIUX0NETwDGOmFb9+sjO/gY5saCSbPM3Yxm78HOrXrYO+y5he9NRPu2FQbGWzlQEJbiBr1mzNTkeYtyLmsChDQT25f4MoczyfjXm8Pa/On1U3cwLG7UGDzct7RCaygVDILND5T2vmzWzcZnbVH+kgP6Ky/Jzk6tJwt3f/9Klgp2sreXNVC84ONeikKO/3iSGVu4pxCvt+tVIbUSSrrOSPSinpP6HwAeoNkYlVGm9lvZXjULidbd+1sr4kYCGHSQKD61gRqhA2S1vCOeut+X+vEIHF8iwV74OHgUTpRkWBRFy+FiAnmw/Dgp3WgBrrHOJSWuaQs1cJai8aIWZa5jPpoCud76MJ4r1IhMdrdZVQe4Es59e1k8OLH19Glucw6njoG6/A5EQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4334.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199015)(5660300002)(7696005)(2906002)(4744005)(186003)(6506007)(41300700001)(9686003)(52536014)(26005)(8936002)(33656002)(38100700002)(38070700005)(86362001)(55016003)(122000001)(83380400001)(316002)(110136005)(76116006)(478600001)(66556008)(66476007)(64756008)(8676002)(4326008)(66446008)(71200400001)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TkRSSDhSNGtrWGcxS0kzTzEyNDBwL21pNmlGMmpDN21Rems2TnNoZ0VNZUhn?=
 =?utf-8?B?b1UzaHJBTG0weHAzWm43TnZ2OTYydFFZUTVJSU1wTWEwbEk0WnNxWmRJN3BN?=
 =?utf-8?B?Q2pvSFVRNjRqaHNiOEFrSVJSaU5xTjNzSDNIclA1WmI3TVN2N0dqOXVUdE9V?=
 =?utf-8?B?aGRWblZuYlExUDYwMjZwRFh5dEtkdjY1bjlrNGFrTUIrUnE5TEZsMCtDM3JG?=
 =?utf-8?B?dVRkN3J3aEFOMUdWYThPNGx1czRNamRmak8xc2VXYkwyOHR6TFI4SVM0Nit1?=
 =?utf-8?B?Y29aYk8rZHNLUndZLzhqMnZxd1BZTlh2VEYrSE1KcVdXVE13THBWa2pESjk1?=
 =?utf-8?B?dVA1MDc5aDZ4MGZNQXAxdWJtUW10SEZMZUhIVWkwR3QrU2RoNUZwaHNZOVNy?=
 =?utf-8?B?UWg2b3pzUzFweFUxbjRtUDN5dUNtM091WW1kczAxWDhOV2VvTWpFcWFseTFP?=
 =?utf-8?B?cmxTbUhkUmdqdUpaWUhPL01zK2gwdngrdnYwSU15dExCa0ZsRzNVNi9WNE9B?=
 =?utf-8?B?NTJ1cEpmN0pUUXRSL0tZUVZnM2NHTVBYWVZFTThYMExlcXh2Lzc5TnMza3Q0?=
 =?utf-8?B?M0FQRFpNSnZQcmtNN2MrNzY0TkFzWExOemI2UmwzblgxVU5vMVFENGtwMVFy?=
 =?utf-8?B?QzlPOU5kNFBXNHljTUl2alYzOC9LUWp2TEs2Y1hYT2VxRDJKenBqUndBR29U?=
 =?utf-8?B?dy82bFlULyt2L0ZhMnNTRUZ1cXZWTFhpUllrN09IRExkd2IyemxienZwU3hB?=
 =?utf-8?B?WUpTWXBwaUx0Z0NWQnpkZldzL2pvTktJNTh6Nk1ETmJyNDRsTTYwdG1iOG9V?=
 =?utf-8?B?ajdhZ2tjS3pNaVJxbUNoeEtjVEpXQUlsTEtTSlRTWDZ0eFpibTk3bG9JZ3ZQ?=
 =?utf-8?B?UWtYWGpsWWVnd2JWL2FIaGxKMkJJaGw5eUZPNzRxTDREV0tEVEpIZmFnVVpL?=
 =?utf-8?B?K2Fka1g1RWRLemsrcmIzMFAyWkx4anRjU1JCRmZjUVBBU3d5dnI2T3gycUNZ?=
 =?utf-8?B?Z2x2SERNb1Zrc0Z3dXVIQTAySHRndDVobnNYakg0c0pOY1pZRHVtSm8vd3c1?=
 =?utf-8?B?QW5MaXBwUWlDTG05YVhibEJpNHRlcGlBY2VJL3plelh0Szc2eW5aeWQrOGU2?=
 =?utf-8?B?Kzk1VHp6UDVEUWxTNHZ6Z1pwaHhHOG14VWloN010Y1k2NGxPMGtoTzlZc2E3?=
 =?utf-8?B?d1REcCtyUElxMHp3ZHNXWHNDWEd3TXBWWXlDNG12SzNmbEU5V1ViTWFJdUU1?=
 =?utf-8?B?b0JFY04yOHpKbU9SWHZlSVc4RjAvOWNVRnFHdUlJcm8xdVQyWm40RlNnRmcw?=
 =?utf-8?B?WXd0cUh2RzQ3ZjZYOVdoS3h1eC9hMDhjb1RZZnBTWTVuVW9YaEMrQXc4RXV6?=
 =?utf-8?B?NGkyRng0Z1UxWmhGdENWQkRxdXl2Q3lGdjVNVjF0bkl6WmFsZkJxT1gyWUwv?=
 =?utf-8?B?eWpjVHJyaEZIYWp0Zmh4WlJpb05zYjZYdVRhaG0wOWNaWkp2R2VaNURqTkhX?=
 =?utf-8?B?SEdKVGJjZjF1bVJsQmN3VkR4SHJxeERPcngzaHcwNjZUQ1dtQnRKNk1hT2R2?=
 =?utf-8?B?K0RZR3l3cHRiNnFZUmlOWmplbjJpVzg2cGovTFhHSWxSTGp3bWVPTUpjdWVT?=
 =?utf-8?B?SlZydU4zbjdQMTRGM2VabmZ4TGxobWhnd0l3TC9uZTJ0eWUycklCdlQ5SDQr?=
 =?utf-8?B?bWlmRXRaa3RMU3gvUi9SVXVEanVndnRHQlFSVlFMR1BsRzk1bEt1d2xlTmcw?=
 =?utf-8?B?T2gyWkozMXFTWWVkK0VES3R0ZXJjWkFidURPcGpIT2kxWWtHNUQ2MVo2NUhh?=
 =?utf-8?B?V3d5Y1BUL2ZwRysrdU5sVDJQeDBETCt0S0ZiRHRpNUJKMFhNbDV4dVRKWFBr?=
 =?utf-8?B?YUhtdVVkcXdJSkJiMy9Rc2x1RzN4azhYUExBOVgxTkVROFFWSjJWZ2xrYS9U?=
 =?utf-8?B?a01mZjlxa2pDZEdrYkowT056dy9Pak9OYmNrUERxRzBJc1Z0dGdLcXpva3Ni?=
 =?utf-8?B?T3lMamhGWE96czZIRWs0TElENWk2Sms0ays1YW1FZFBmR2Z1OXpmbWFVTk1T?=
 =?utf-8?B?WnJoMkJ5WmMvU0lHQlFkcVRmTkhNd3ZSOVFpZ09YYTA3T2lYeDFGSEV0ckxO?=
 =?utf-8?Q?UY9FECZgjNvmnHslodoaysg1/?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4334.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1bd203-7109-4de0-f010-08daad8de2d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 02:43:33.3518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZPg2D0kwxcQ5A6LOE9Q6whDExYm4VP/9yCDmqLkIxau3SEiY/f+78xiET5eS0LzEc2pUMuGKYh5XFM0iGUaEZGOkZllXkOPsJrIlOfHsi4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7558
X-Proofpoint-ORIG-GUID: yGeJgl5gvUCev16OC6i-NQD8DpzHFxcZ
X-Proofpoint-GUID: yGeJgl5gvUCev16OC6i-NQD8DpzHFxcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_10,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=533 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_194347_029803_25942383 
X-CRM114-Status: GOOD (  14.30  )
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

>-----Original Message-----
>From: Jeff Johnson (QUIC) <quic_jjohnson@quicinc.com>
>Sent: Thursday, October 13, 2022 12:19 PM
>To: Sriram R (QUIC) <quic_srirrama@quicinc.com>; Kalle Valo
><kvalo@kernel.org>; linux-wireless@vger.kernel.org
>Cc: ath12k@lists.infradead.org
>Subject: Re: [PATCH 15/50] wifi: ath12k: add dp_rx.c
>
>On 10/12/2022 4:29 PM, Sriram R (QUIC) wrote:
>>>> +static u16 ath12k_dp_rx_h_frag_no(struct ath12k_base *ab,
>>>> +                               struct sk_buff *skb) {
>>>> +     struct ieee80211_hdr *hdr;
>>>> +
>>>> +     hdr = (struct ieee80211_hdr *)(skb->data + ab->hw_params-
>>>> hal_desc_sz);
>>>> +     return le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_FRAG;
>>>
>>> should there be an ieee80211.h function for this? we already have:
>>> ieee80211_is_first_frag()
>>> ieee80211_is_frag()
>> Yeah, but we needed the frag no in this case.
>
>understand. so create an ieee80211_frag_number() function in ieee80211.h
Right. That could be added and used here,

Thanks,
Sriram.R

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
