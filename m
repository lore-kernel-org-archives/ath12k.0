Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA34C433FE
	for <ath12k@archiver.kernel.org>; Tue,  4 Oct 2022 11:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6czdZ8R5YmkyHB3vIfpnfpnnCW2/zzAViKAeH+h2FQ=; b=00mNeUTVHU0gWy
	7jZyDkgE4a8fnfAgWqtQya1hH3SYYs2sNHgIjXqLKAU/xPZG76VbjkJqhbs3swtjYtseGhnMWYgpj
	qupn1M5XxEc9tLYN27wIsS/junvnhHEHTVFUhG+Mc65zLST4rK8SZf1k6F4dwt34ETauZP/0p7hSn
	dZrJI5LF9fV1/VAOimKcWitBiqhTBb7d+2o5vB1Qog2lOV2MxLElbhbCvoKyFEwfETrFMrQi2j5QR
	7m14p+5AM3bkEzJowv8hAWIMwUsJ9yhwLu3k73UYmyoq2Fno5/Vxv1Tx+1APyMWDNJ/UkUM1LkwUN
	VjBw6TV3A1d7qy2atB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offti-009UUC-20
	for ath12k@archiver.kernel.org; Tue, 04 Oct 2022 11:15:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offtf-009USl-B0
	for ath12k@lists.infradead.org; Tue, 04 Oct 2022 11:15:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294B7Cg9029939;
	Tue, 4 Oct 2022 11:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=8z7aOcD+f+6v75thUSQVOI4ZYr+4SEfuOQjarwXwOaw=;
 b=C3xWSA611hlLZst9KmMxp9SKBv4Nmwmb/5dSepOSbjPnVsoMgPI9nmSPpgbigkly0Fvn
 cVJKxu0WHZjCcoIP7B4iVtIbXo9K6TGIo1SCyzcR1O4jPD1QPvgh3AUNyQhF9lG+1t3c
 OpwNtj8RQAp6DjBRWARH9fJwv+JF26RaQPUa6vxkOnvRCSLwtYDl3iwSRG+zKdDywVEa
 NKX/ZJnwUGKb60pcrQgixvx7lVczKA8oskixfaW7wmZcJPyiYxq/ObGWUVQfTxLT/Eji
 EbbPCEY7WdW7GOplxEXqpdE4XGdM0xijwFb0ySj061zfD34q7anvjuwgKIniYiam0wy0 UQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k0hxpr66p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Oct 2022 11:15:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHO0mZvoN0WSx46PqXxT29YAAF24D6aVxBMFGyRQv0GHk2OfjlOl8Vfnggo34ZppRif+31J0W4+0P48if5xuVc+34rhNKxUy8+66R1oU9sBVBTBf1L/4W5gFCKiyCMTUTVyhv4bKvz0u20jCGIrFCIq5g3yF/4fQ1hyYPJ8Py46si1RRyTS/M4ueK0gk11ZpvHSjDjfChcyne62UAcSXSP8Ba3QmfIe03FJoOBYqetMl4Mb7/j/H+wF9fq/BXxBO306HN7W6WnMKPnyZWnEf2faVZHUEeiTbqHOJC5nS9hm7Pk5k8goqHlcQMACpTiKOeFqamBoNXxc6Rt043Re3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8z7aOcD+f+6v75thUSQVOI4ZYr+4SEfuOQjarwXwOaw=;
 b=BiaFJh6MRZbWqdKVK7jGIa6YmgxMfrrsOF4T8tHKO5QDro2i2s2TJoxRPXrlcqiN/DrDshWgccNi4j8VqZ3aeYfi753LU0Uc3fxxomyMvOq74Na+HOIWeG/mWcjOvEmmT8hFzd/Xu+Ue3S/c1N5Aj4ywQbUJ88h530PLHJqFdTiqtGjeODdlYzUYns5Mptdrqd1TdMD6B30KmaZtx4satN4jtODagKkk+s580PvLMKGBVIAfNklvmso5gLK8Q6TEpBH/1knRSg7Pzo0QpRdRl0tpapfhmH1QbFqx+qNr4EBNLxdFVbQgBixshLn6vwwDLaetwnOPK8R+oZqDkzwaNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from CH0PR02MB8212.namprd02.prod.outlook.com (2603:10b6:610:eb::20)
 by IA1PR02MB9207.namprd02.prod.outlook.com (2603:10b6:208:425::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Tue, 4 Oct
 2022 11:15:18 +0000
Received: from CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::a2aa:7ce8:a34:fdb1]) by CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::a2aa:7ce8:a34:fdb1%6]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 11:15:18 +0000
From: "Karthikeyan Periyasamy (QUIC)" <quic_periyasa@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>,
        Kalle Valo
	<kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH 23/50] wifi: ath12k: add hal_rx.h
Thread-Topic: [PATCH 23/50] wifi: ath12k: add hal_rx.h
Thread-Index: AQHYrmYen13fOdS1qku2BWKhi8rn/q2z1DSAgEqT0oA=
Date: Tue, 4 Oct 2022 11:15:18 +0000
Message-ID:  <CH0PR02MB821240EB39EA61EA69767B60F65A9@CH0PR02MB8212.namprd02.prod.outlook.com>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-24-kvalo@kernel.org>
 <8a84fd8d-14db-97ec-0376-10b554aed257@quicinc.com>
In-Reply-To: <8a84fd8d-14db-97ec-0376-10b554aed257@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR02MB8212:EE_|IA1PR02MB9207:EE_
x-ms-office365-filtering-correlation-id: f9919681-ce47-4eab-500f-08daa5f9b875
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  nezGswhUDPHMApe39wIehQRq3RAo0eLD60GNj10AETkKNWL2vY2edwblTZ0kVEwrJBRqeSJT9LL49bFMqFKOQBZfQ36bxrF0cSPRg/LHOTzvCD0OvbDQ4RQvs90EzMB41VQMasI/IQFqRGxKpycjtt31dCLYMTqSs0S8/+OOXI7gIHvUCbksR3XB0uWM18S6AunKG4via6l3PoBvbFPZvHMQSrA/u0FH6x9lYJHMwPHz8Zsnfl/EutdFtsKqSx4liRrIMjfCNRVfM5EKutF8qAvFOiGIlnEhU6YDV0oFqzv9olKCHtkm7gQKjDWtMrdfrxzxr2SiZuXQ0AkC8kPp+E8BbOkRGxX7yhdPeHM0NxCyqsT5jzgYWzcffkFwWJCQSED/LWEhdZAYTv+6r2vgXwTfisQiOjlRDDFKoThi37/JUMZcSmsb0Mr1Cxwg50rcO43g/Dr0tIjkJgac0RV/jEPukHMFja1KlTbQU8xTZWkyjmvzBa7ig1pdcfNrAw7UYq4JoiovP6BbwXucYsrsirR+G7AASH8MUNYdhk0B0OMNdUKJw+d85hnfyt3OhSKefDKoenjjKU+5kECkiJlv9MFDsiyVwY/ZqBNKEwdKwLu2p4i3Sbi04zxxch/nQ9jjm9hL6l6W9nooyklzu/8DRvj0aRXRZMAnC6UzKiEjMx2v9EIh8g6Hmp03LYmkbtzJA4ByFrIXE1mQ8DK9yLnOY/FbALENQ+U8va1rw6yA9i+//s+AhIrueBcLfLIZucXw3E7UDTEuKllB0CYsETCl+g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR02MB8212.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199015)(38070700005)(33656002)(86362001)(122000001)(38100700002)(2906002)(52536014)(186003)(26005)(8936002)(53546011)(55016003)(6506007)(71200400001)(83380400001)(7696005)(478600001)(9686003)(110136005)(316002)(76116006)(66946007)(66556008)(64756008)(41300700001)(66446008)(8676002)(4326008)(5660300002)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?emdRTWE3dUI1WnM1Q1VRUHFSK3pXemMxL0pZOFRIbFFrM3o4aUFwVmc5bkN3?=
 =?utf-8?B?Tlo0MXRJeSthSklYNVgzVzhMZUwzZDk1NXZmNVBUelBUR2hYY243aDd6d24x?=
 =?utf-8?B?a0ZLQmpkN2o0NW1Tcm0ybWlnTHVPYWJoMTJrTUM2VU9DSitNQTNKTDdtNFhm?=
 =?utf-8?B?enRGZUVnMFVNcTlyQ09ESkhML2dPQTNuSEJZVHNsdXNOeURZQUljM2Nlc1R2?=
 =?utf-8?B?bFowOFJsSEY4OEN3TnJHTGlqc0p2bGt6dThjUE12dG85WkEzN0dNeEd5bW5h?=
 =?utf-8?B?VkZNNEY1d2lnZ0NIMkg1QVJLbDBSNWc2NzF3ZWhWM1cyQlZnMkM2UmJ4clY0?=
 =?utf-8?B?RFZLQi9Qd1RSK2ZNWHBBUXRtZ2J1NzViN01WRVRCTU9XRlFub01xNS81WUhr?=
 =?utf-8?B?blhidnpqUlpUclY1ckVJYXdXNE82dWhCTy9qNnZOcWVWdDZEQUs2MVprUVZK?=
 =?utf-8?B?MkxzbEl0dHdXSkNBcFQ4ejFkV3Q4ZVNacUZRTkZLMlFka1g4YVUvSjFWZEw2?=
 =?utf-8?B?cWZVWW9ldXdnaTFzTUM5Z2FXdXExdE04QU9XRGJMamF3OWxXYXd2M2toaWdZ?=
 =?utf-8?B?K2wvdVRSWU91QTN3R04xQmYyZ3kycU53bS9sVmJMeDNXNjl5SkpRSS92OFhZ?=
 =?utf-8?B?akROcjVZQ1l5MFE2bm5rM2RZbk9wblpQUlBURWdXOHZDeEJpUWZ0OGZoWXpm?=
 =?utf-8?B?cFgwSmdWd0VQZlE4Mml4NzltcGJ0a1ltSGVRL2ZubnR6enRjMnBpKzBCejRK?=
 =?utf-8?B?K253cTI3alpiMEpUNFVsWkE2cm41U0V4bEpGSVJadm5uS1IyQkNSTFREd3gv?=
 =?utf-8?B?WU5zMXQ2NkVjbnI2Tm5FUmhUcmYxd1dmaXRTcmFIMnA2cG1ubGhFZWdLT1V4?=
 =?utf-8?B?Ujd2WEdLQjBoS05lYnd0UTJJaUEySjR6UFRpQXJxMXMwVnJmbFh0VlBoZ25G?=
 =?utf-8?B?ckpkeStPQklWdnZpSEkwempOZzNBdU1LVVF1R0J2d0ZENG4waUVZc0VYa0Rj?=
 =?utf-8?B?ZEwyM1VDWThBQ1M1UjRIYWJZT2hDY001WmJRa0dVMVRHVVdpNUU0WCsrRC9Z?=
 =?utf-8?B?UURhRDhHZnFlZzFyTzdaL1VsZHF5eU5RRXJwa1M1ckFVSWRuMXpOaFhWeUcr?=
 =?utf-8?B?QzcyRDR5V3pnTnd3R05YWDZkZTFmTjlKTnJsbG9LNEpVNHBqcUt1dU5hd0Ja?=
 =?utf-8?B?WDkzK1IxS3RPckp2SzhLaHkxbmFBZlI2aFhydTExQS9XcnlWaGJ5bGNDZm51?=
 =?utf-8?B?NCtVaGJBN1MyMDJNRjk4a0NUZVIxZEJTSXlMSllrVG5odWVnKytkbXJPam9O?=
 =?utf-8?B?T3lEemhxVEpFdjRJcTNlNlBOMmd4MldaUVFpK2NCUzZ0U08vVzE0cUhLcHBh?=
 =?utf-8?B?UFFzb2MrSG9hWDgzMWZObEJTYkdPaEhGcXY2WndXR0ZubWJOMTVkWEc1RFhW?=
 =?utf-8?B?K245ZGRFMzdGZU5EODBsQWQ1U0ROOG0wMk5RWGpxY3FKSXEzcy91VnBKcUZC?=
 =?utf-8?B?NFQ1MWlZcjdUL3Y4ODlIczJPckVZTk1MeFRZL2MrU0tCSnB2RHFRSGluaEJ3?=
 =?utf-8?B?L2xVZ0dpVkI1VkVDdEE3ck9iTGJpZ0RJcUNKdjRzS2hMbVZJd2dTTlBwMmNV?=
 =?utf-8?B?Q0pZUEtmd2tMd2JneDJDNWQvc0V0c2ViNWIwK2czMmV3bmVxOG9IZUZrc0VW?=
 =?utf-8?B?RjRselFaenhHdUhhaXlyZ2VKd2Y4SVgwU3IzU1N4TTZYc0F6QytmaGFWMFZx?=
 =?utf-8?B?VUlCMHNCeTZtWTRWVjlYWGlVT0JzZXVqbEhtT2hEMDVrUktncVM2eEhweFFn?=
 =?utf-8?B?bmsyWW9HV3grWVRPOERUSVdyclhwZDBTdmhOeFZGQTJ1QytkQnI4ZXhab04v?=
 =?utf-8?B?VVJqQjVDbi9WcmRWY2xrTUdUL1AvL1M4WlAxMjVjV0VlS1lEMFpaSzBjZ3lP?=
 =?utf-8?B?T0hXdnVkTHp4dmJ5RlBVTTZoTWJQZFZqSmZzUm95NmZRNlU1clp4YUVxc3Rq?=
 =?utf-8?B?eCtuWFd2RGQ0czVJbThHMmJOWDliQjFpNmpicWUzbGwxczR1UnRXWlk3WWFV?=
 =?utf-8?B?UkhtS3Y0eVZqclRwa1VHNXZ5Y29TNDErd2xMME1SOW5sQ3htUkRmTUNTNkZa?=
 =?utf-8?Q?61ld4crHKYqSIAuzLq7uMorWn?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB8212.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9919681-ce47-4eab-500f-08daa5f9b875
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 11:15:18.6013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9YshT+GK/nx/iVqOKrT5k/b3HQIuGs3LYeli1vldAXbFR64KI8emXnT6L6V97q9w6XnrFVeuUYgteIB3NUSiD3yR2OxZ9BqlBCXk07wrfHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB9207
X-Proofpoint-GUID: N008PR6uaoO2R0FyvQUXyTU14DZroPOm
X-Proofpoint-ORIG-GUID: N008PR6uaoO2R0FyvQUXyTU14DZroPOm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 spamscore=0 mlxlogscore=652 lowpriorityscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_041535_406587_28FA8AC8 
X-CRM114-Status: GOOD (  29.45  )
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
> Sent: Thursday, August 18, 2022 5:52 AM
> To: Kalle Valo <kvalo@kernel.org>; linux-wireless@vger.kernel.org
> Cc: ath12k@lists.infradead.org
> Subject: Re: [PATCH 23/50] wifi: ath12k: add hal_rx.h
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
> >   drivers/net/wireless/ath/ath12k/hal_rx.h | 694
> +++++++++++++++++++++++++++++++
> >   1 file changed, 694 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h
> > b/drivers/net/wireless/ath/ath12k/hal_rx.h
> > new file mode 100644
> > index 000000000000..883ea1be2525
> > --- /dev/null
> > +++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
> 
> snip
> 
> > +static inline u32 ath12k_he_ru_tones_to_nl80211_he_ru_alloc(u16
> > +ru_tones)
> 
> why doesn't this function return enum nl80211_he_ru_alloc

Sure will address this comment in the next version of the patch

> 
> > +{
> > +     u32 ret = 0;
> 
> shouldn't this be initialized to a enum nl80211_he_ru_alloc enumerator?
> (0 is NL80211_RATE_INFO_HE_RU_ALLOC_26)
> 
> or perhaps remove the initializer and add a default:?

Sure will address this comment in the next version of the patch

> 
> > +
> > +     switch (ru_tones) {
> > +     case RU_26:
> 
> add default: here?

Sure will address this comment in the next version of the patch

> 
> > +             ret = NL80211_RATE_INFO_HE_RU_ALLOC_26;
> > +             break;
> > +     case RU_52:
> > +             ret = NL80211_RATE_INFO_HE_RU_ALLOC_52;
> > +             break;
> > +     case RU_106:
> > +             ret = NL80211_RATE_INFO_HE_RU_ALLOC_106;
> > +             break;
> > +     case RU_242:
> > +             ret = NL80211_RATE_INFO_HE_RU_ALLOC_242;
> > +             break;
> > +     case RU_484:
> > +             ret = NL80211_RATE_INFO_HE_RU_ALLOC_484;
> > +             break;
> > +     case RU_996:
> > +             ret = NL80211_RATE_INFO_HE_RU_ALLOC_996;
> > +             break;
> > +     }
> > +     return ret;
> 
> snip

Thanks
Karthikeyan
-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
