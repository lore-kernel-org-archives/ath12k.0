Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A13EC433F5
	for <ath12k@archiver.kernel.org>; Tue,  4 Oct 2022 11:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5zCJ5KyshnbpTKlrLvD0OO/YHRz2A6ssKvV4G7eSB1Y=; b=QNFq690gLsh06N
	P0+le/5xckQXX6/NqoJof3cEbAdmPD4eX6YdOPFE26/ESGusOOaNIp+TP8sTyqsAPAAJhjkGeE3ta
	iCoZmTczbupYXbidunDXeMRoklCufERMwxxHetI/kkzxh3gdya4UKY6XZpiF7vFvnmG/iTY81lBSi
	EdQS0UeZVWMmwvbAe5My9Zdm0eh1U02s4Tze52lBKa5wZfZf9oaS/y5Jhoxq9SG6+TduoAraV5dtc
	QoqAVylSgH0XpFvH7H+0y/Fae43qZuHdyVYsh37OssQ9Chd+94H4wxi2TZ04Ds7BVSBx5Lt1drdmQ
	A17GqotMkk1ObpLOkuWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofg1E-009VMw-Sl
	for ath12k@archiver.kernel.org; Tue, 04 Oct 2022 11:23:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofg1C-009VMO-Ic
	for ath12k@lists.infradead.org; Tue, 04 Oct 2022 11:23:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294BF04p016461;
	Tue, 4 Oct 2022 11:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=IwH81++/RQj7WgxuwrmBoLnzo5Ds4/BVpvicH4AkN5Q=;
 b=cv9HbDUko+NecRF/mEvG0XPMZ/cKBhmyLDNN9ZemOPGI1h3CAn1xdORmrGJ5XmH42Fjk
 zGCoOpQObs08ZMrW9hxWm36/Ze6rOLbwajmQd3jt8x00ghBbw5Ix45RxWGW/TO/4Zhyj
 u6d/MOuGkEjZ0pAghYUVpkZR/dLAObV4HWdBpb1MjMi9dkjgK1opANwVf4vs+lCP8ReC
 aR2/oqQcMtX1Z6hI/tByNpVhkGqXaFVxYt3xzZwr1fflBNdHPIp1MyTyDg0pD2Sz+Cb3
 4HjHgl8yz2gowo7FBJhRg4fDXBHTXcZ/gPtVW4zUHDsK24hL2HID2jPpLF7YYjwrhSJL DA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k0jtdg3qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Oct 2022 11:23:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z03onimYgkJyP4PKfpGndZ0Feurfj/vTR36mgqLXVLYTtofCalPX8kTT0iPZDBmDQj8D/vaVmjOkgE9Q4hUd2qfLMOPpVHgFiFtu0OisRsuDh7gI87MtatB32MxSz5mFMgbuM8KH9Saow0Mds9bqpFrzh9RYSHcTZi9OdVK5tRpQJNv2ovF47W3IG2HbjATs1U+yzHGy0z1sCJtPgQ3UmJTQ9YVgI3KhyvL9lJnQF2+jdQy1VWczIxOzLkr9WLCgKmhVAKMYlvcCQNL27ruPPTkXiH/TCAcjBpfUKvelguRifENW6YlMrV7zIrUTGTpFGeALK2L9dBmH6AkbBL5Egg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwH81++/RQj7WgxuwrmBoLnzo5Ds4/BVpvicH4AkN5Q=;
 b=fK29uzMBP+7j0qcAAGxznlYQDaro1GvaZQ7+3rQZ8LrfBRJLcvLNxCxHmi80ZO3gAd+Hsjw2h7yrarPpruJBazf+ue6NLwHngl5aRzn5Z+S2RRhUheirFzdnnoQRbfSCKYjwLvhoYzjRnGO0VBNw7q1v3C6WBAuPXTQ+IyGhlHFeEeE5bHw2e/E/ZmynSk4vqAUXDDN52fM7jZ5ZAkEMxH6B6iUXuzyU+U3vUfM8t+Lm4kd+k9LJp94Yo7FE8EvRSBhyzvusrvOD52cRNc7Ql8Ksjursg3IDN4970RpSara0b2FPn5Jt4LVBVCrnWWGkdQSxS4EDeuclqiy5TXlGKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from CH0PR02MB8212.namprd02.prod.outlook.com (2603:10b6:610:eb::20)
 by MN2PR02MB6927.namprd02.prod.outlook.com (2603:10b6:208:203::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 11:23:17 +0000
Received: from CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::a2aa:7ce8:a34:fdb1]) by CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::a2aa:7ce8:a34:fdb1%6]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 11:23:17 +0000
From: "Karthikeyan Periyasamy (QUIC)" <quic_periyasa@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>,
        Kalle Valo
	<kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH 27/50] wifi: ath12k: add htc.c
Thread-Topic: [PATCH 27/50] wifi: ath12k: add htc.c
Thread-Index: AQHYrmYePCUhRNcBHUGvjdEmmmOGUa21FeCAgElUBMA=
Date: Tue, 4 Oct 2022 11:23:17 +0000
Message-ID:  <CH0PR02MB821210E572752A69EF00FA59F65A9@CH0PR02MB8212.namprd02.prod.outlook.com>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-28-kvalo@kernel.org>
 <8ebc4b7e-6b65-8443-eac6-13b940337166@quicinc.com>
In-Reply-To: <8ebc4b7e-6b65-8443-eac6-13b940337166@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR02MB8212:EE_|MN2PR02MB6927:EE_
x-ms-office365-filtering-correlation-id: 265232f2-72a7-42ec-e842-08daa5fad5a9
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9qcnDWDgzICxeNoAaqCuN82N/CTrrRuaFRBoy8rsQfeUo2VVLA08vzbVsY9Yh54FcUuRGlX42jWKg+Dvrt/o+3VFguJb3y6ebAPOfuXztLlU48p6I0ukQycgbDMqVaKnX10DhBWeKw+IALOCuPpe9UFAmpzhfcAz1AnRjO3vTBIviN88Fq+F5jaGY2z72YRn/xyRfXC2CdaCNYX/p91X+TxcjGTNajNDjl/BFJ0qTGqOB1ZMQn8iy9eZ8saSijEbxDR6HxC/7L0qjTea+Ac0L8iIMqKfhcDBEWvU1rYN08gjQQ7zCpS/1mRxypErfL7955QLm/xRZ9/mWbX50UMZKXsElC4kax3jowbfdS6QFLelouTMBIzbmOS13qjLTRXoJtHQoKx8grYwzLbdd9+FEA4E4QxOFJ++SxT2LSLIv46mdnMZUW40jSGk3v3gLTqAE6NInf4vemm80D4DZnUJVRYlj1Hkz/y1hqYLm8wF4Ghld3/7DST7An1LIjgY+8KnQ6FhrTbEf2eEOl33ZFnKPKoV+CW7U20npTDczyFmERU93W43pbIIe75MVfwkbNtq6G2Xogn4dCeiOh3gyc4fP1pZL1VkwPgfV7LUpp1pnMujKbKr5dBS5CR8S8MGYphdS+P38aQl4GApt0NkBBhT10QI1Y2zYGoCXls9rQKOlqUs6rpMEeW0eMQP4QyvnQjCB/g5np7m3wHBpZjWVG5QNJIZxcRiTb0fVB97cDlBAE/rxOqG71ryO6VvF4AJGbTi0T7cFybnkeJD3cY7j3mXUA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR02MB8212.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199015)(52536014)(2906002)(6506007)(186003)(5660300002)(53546011)(55016003)(9686003)(7696005)(8936002)(26005)(478600001)(66946007)(86362001)(66556008)(8676002)(64756008)(76116006)(4326008)(66446008)(66476007)(83380400001)(38070700005)(33656002)(110136005)(316002)(71200400001)(41300700001)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dUxiM2IyUGhLUXp1U2duUzFVOU5jcnBwcFAxYThNWStvTFhpVUNVZElXY1Yy?=
 =?utf-8?B?VXNWd3dGbXQ4bzVhcUx2RC9wOUJNNVI5YVNBMkxEcUZqVnJwMituR3dNTWhI?=
 =?utf-8?B?RnVmOU8rOUxPcy9tWXJ5NGd6SjRTUHhDK1pxbkRFWFo3MXY1RE81cjAyc1da?=
 =?utf-8?B?QTVSNGlKajFGQW1ZWmh1Tkd3d3BKbnZtbnVkOVoxTG84WHpXdE5HWW5Cekpt?=
 =?utf-8?B?ZVpFb2g4bjYwUFJNVjBaMGpnZXpDTTJqa1pxOG82TWVWSDlRMTBLTzlDQXQv?=
 =?utf-8?B?ZVNGbXRxY0g4YnI4a3RUZWg0NlRJM0FnQ3hNRHF1aE5FSk16a3hCVVRMMHo2?=
 =?utf-8?B?TklTUFNnZ2pzbzVVNGdOektJdUhCZzlSc3F1ZUZaTTE2RzhNTXdqL1M4VEd6?=
 =?utf-8?B?NmRHdEJJY0luRDVRKzdpUHJDTUtYM1ZTZVUwYnoxc3UrWktJcy9yUHVER1Z2?=
 =?utf-8?B?Q3NOZUVxYjUrTXdFT01XNDZ0YWZwZnJjOGpiSlBBZjVUVWl3bTVCa2wvcUgv?=
 =?utf-8?B?OEdYbngrc29UZ1JQTENUUDNIVVBiRTZXUXlIdWp5WTJ1dG85Vlo0Sm9XeTI3?=
 =?utf-8?B?T3pLcXdvdjdjYkgyVzByTXBaNnNLaU95QjV3RHRiTlA0R1lrclJpSEdYdWV6?=
 =?utf-8?B?ckJ4Y1l4by9QUjZlZElxTUtEaVU3Y3JNZjFaWU43R1lvVXYyRFEzVFFHR0N1?=
 =?utf-8?B?bUo1WTIyKzhXRGppWHF0OWhTSHJ0YmZxNWV4a0dBTXczSlBuMjhLN1piZzBY?=
 =?utf-8?B?VmtOaWdVdktTRlpCczJjV3M0NmVhSUVPL0JmenR3dmsyeVRGa3NTM0VJZUJ4?=
 =?utf-8?B?YWNsWnVUMm1iR2pwSWtReGxQb0FEa3RuUG5nemZCZ1RVcnQydEwvTUhpRlNI?=
 =?utf-8?B?dVhhOG03Y29Bc3A1VzlYUDBmMVZhTjZENk11KzZ5SFNJSEYrOEFoeTg1cGo4?=
 =?utf-8?B?TDFyMG53M09yWnpoQkx2K1FtQWNDTG5BdHMvQTNrY3FLTVJmWHhIZzI2UEll?=
 =?utf-8?B?YzA4Y2ovS2ExTWZxRHVtWGJMRnNwblF4dVRNQ014ZGhOUWFCQXpib0dpeStK?=
 =?utf-8?B?UUdxd090ck1JcFUvdG1mc1VUMWo5aFBtb2FYRURTSW9mak9oVWU4RWhNV3Nr?=
 =?utf-8?B?ZExqZ1RYMjliZVNJZ2J3N3J1ajY1aDhoTHBIeTN5Qi9FZjNOa3h5Q0VneitZ?=
 =?utf-8?B?K1MzUDFpYmh6MDNDRnBvNVZXdWw5amR4TmlLNmNkY0U3V3dEck5KL1JOZ1o3?=
 =?utf-8?B?eHozVVVvd3FqejB0WWd1dmUzZFFVWU5WSHd6bHFoZ21FT2FGYUwrbXdkZnZX?=
 =?utf-8?B?N3M0U3pvOTRzOU5jWVVldUxRTmxLYjUxSmlqUmZLVlNnQ0w3T3BCSTVhQkJQ?=
 =?utf-8?B?ZEdUUFBoNnJsTkdpRUFQcDd2UjRmMWw3M2RnMTJVcG1IT0hiUXJhcHVqSVBD?=
 =?utf-8?B?SDgyQkNSUzNPM0tqb3l5a2ptVmVTdjdQM3ZmK3RVeHZ3ZDlLT2NWT3R6UXla?=
 =?utf-8?B?RG9YM2xKQ1hySlcyYUQ5cUxUaFpKQitZQ3p0TFBsUXNXL2hmVlhYa3RSOGlS?=
 =?utf-8?B?NkdnQWVKOVE5SldDVDQwa2tXTHVhWFlHdjVxWTc4TEZKM281cmhnZ3BKdTFS?=
 =?utf-8?B?eG1tYy9kbUdENE1zcEFPUWpkREdTVUQzM0lhMGUybkFMU2E1MXR3V0wwL1Fa?=
 =?utf-8?B?a1J4NXMxRjM3WTB3M085R0NsWHhDT01TMVdCSHVMUnFCSHRzait3Z1kyZVR0?=
 =?utf-8?B?RDQzUzU1SWhWeUtjQXhOT082czA2WEloZWd2aWhVd2pxc1cxYnNwbzZTSm5F?=
 =?utf-8?B?ZG1LSWI1MjEzQ2c1dmo2YnhUUktFdlgwNWFleTVKZ3NUdjRBeno5TUUvam1Y?=
 =?utf-8?B?UVF3QTU4T05lc3J4dDkraEZsNGkzUjhsQUVXOUFJbmNJbDMveG1kcWtRSHlT?=
 =?utf-8?B?MlZva3JINUlMcUI2TUY1bmFiTE14NFIvNDRoNDBaWWxaU1FSNFEwYS8yYjBM?=
 =?utf-8?B?MHppMkwzMG8vaG13WFJSUitBRDkrbGRjK3ZOTUtYRHBHOVk4dFdBT2Z5elN4?=
 =?utf-8?B?QTVzc1prcmdRWko0VHZsWUlmWkJmUVpkWkF2ZHlmM1NEMkhBRXhDc21IcVdF?=
 =?utf-8?Q?gDggFYASpzmIvaNoSv1QXLSnw?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB8212.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 265232f2-72a7-42ec-e842-08daa5fad5a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 11:23:17.0586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rcu+LrsBDpyIt405pG+67D6YqtdYqRnsEhkLqxPOKm5U3fVnKnn7qDoTrlb/n41+3bJOrHtsvdwojYrkq4r0iCd5ovt+DwAVfQR5dpEkgV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6927
X-Proofpoint-GUID: Ff5-L2RgCORtjf2gspao502oa4VAT510
X-Proofpoint-ORIG-GUID: Ff5-L2RgCORtjf2gspao502oa4VAT510
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_042322_640843_8851E751 
X-CRM114-Status: GOOD (  32.56  )
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
> Sent: Friday, August 19, 2022 1:03 AM
> To: Kalle Valo <kvalo@kernel.org>; linux-wireless@vger.kernel.org
> Cc: ath12k@lists.infradead.org
> Subject: Re: [PATCH 27/50] wifi: ath12k: add htc.c
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
> >   drivers/net/wireless/ath/ath12k/htc.c | 789
> ++++++++++++++++++++++++++++++++++
> >   1 file changed, 789 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath12k/htc.c
> > b/drivers/net/wireless/ath/ath12k/htc.c
> 
> snip
> 
> > +static struct sk_buff *ath12k_htc_build_tx_ctrl_skb(void *ab)
> 
> why void * instead of struct ath12k_base *?

Sure will address this comment in the next version of the patch

> 
> > +{
> > +     struct sk_buff *skb;
> > +     struct ath12k_skb_cb *skb_cb;
> > +
> > +     skb = dev_alloc_skb(ATH12K_HTC_CONTROL_BUFFER_SIZE);
> > +     if (!skb)
> > +             return NULL;
> > +
> > +     skb_reserve(skb, sizeof(struct ath12k_htc_hdr));
> > +     WARN_ON_ONCE(!IS_ALIGNED((unsigned long)skb->data, 4));
> > +
> > +     skb_cb = ATH12K_SKB_CB(skb);
> > +     memset(skb_cb, 0, sizeof(*skb_cb));
> > +
> > +     ath12k_dbg(ab, ATH12K_DBG_HTC, "%s: skb %pK\n", __func__, skb);
> 
> does this log really serve any useful purpose?

Sure will address this comment in the next version of the patch

> 
> > +     return skb;
> > +}
> > +
> 
> snip
> 
> > +static u8 ath12k_htc_get_credit_allocation(struct ath12k_htc *htc,
> > +                                        u16 service_id) {
> > +     u8 i, allocation = 0;
> > +
> > +     for (i = 0; i < ATH12K_HTC_MAX_SERVICE_ALLOC_ENTRIES; i++) {
> > +             if (htc->service_alloc_table[i].service_id == service_id) {
> > +                     allocation =
> > +
> > + htc->service_alloc_table[i].credit_allocation;
> 
> should you break from the loop here, or can there be more/bigger
> allocations for the same service id?
> 

Sure will address this comment in the next version of the patch

> > +             }
> > +     }
> > +
> > +     return allocation;
> > +}
> > +
> > +static int ath12k_htc_setup_target_buffer_assignments(struct
> > +ath12k_htc *htc) {
> > +     struct ath12k_htc_svc_tx_credits *serv_entry;
> > +     u32 svc_id[] = {
> 
> static const?
> 
> > +             ATH12K_HTC_SVC_ID_WMI_CONTROL,
> > +             ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC1,
> > +             ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC2,
> > +     };
> > +     int i, credits;
> > +
> > +     credits = htc->total_transmit_credits;
> > +     serv_entry = htc->service_alloc_table;
> > +
> > +     if ((htc->wmi_ep_count == 0) ||
> > +         (htc->wmi_ep_count > ARRAY_SIZE(svc_id)))
> > +             return -EINVAL;
> > +
> > +     /* Divide credits among number of endpoints for WMI */
> > +     credits = credits / htc->wmi_ep_count;
> > +     for (i = 0; i < htc->wmi_ep_count; i++) {
> > +             serv_entry[i].service_id = svc_id[i];
> > +             serv_entry[i].credit_allocation = credits;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> 
> snip
> 
> > +int ath12k_htc_start(struct ath12k_htc *htc) {
> > +     struct sk_buff *skb;
> > +     int status = 0;
> 
> nit: initializer always overwritten by ath12k_htc_send()?
> 

Sure will address this comment in the next version of the patch

> > +     struct ath12k_base *ab = htc->ab;
> > +     struct ath12k_htc_setup_complete_extended *msg;
> > +
> > +     skb = ath12k_htc_build_tx_ctrl_skb(htc->ab);
> > +     if (!skb)
> > +             return -ENOMEM;
> > +
> > +     skb_put(skb, sizeof(*msg));
> > +     memset(skb->data, 0, skb->len);
> > +
> > +     msg = (struct ath12k_htc_setup_complete_extended *)skb->data;
> > +     msg->msg_id =
> le32_encode_bits(ATH12K_HTC_MSG_SETUP_COMPLETE_EX_ID,
> > +                                    HTC_MSG_MESSAGEID);
> > +
> > +     ath12k_dbg(ab, ATH12K_DBG_HTC, "HTC is using TX credit flow
> > + control\n");
> > +
> > +     status = ath12k_htc_send(htc, ATH12K_HTC_EP_0, skb);
> > +     if (status) {
> > +             kfree_skb(skb);
> > +             return status;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +int ath12k_htc_init(struct ath12k_base *ab) {
> > +     struct ath12k_htc *htc = &ab->htc;
> > +     struct ath12k_htc_svc_conn_req conn_req;
> > +     struct ath12k_htc_svc_conn_resp conn_resp;
> > +     int ret;
> > +
> > +     spin_lock_init(&htc->tx_lock);
> > +
> > +     ath12k_htc_reset_endpoint_states(htc);
> > +
> > +     htc->ab = ab;
> > +
> > +     switch (ab->wmi_ab.preferred_hw_mode) {
> > +     case WMI_HOST_HW_MODE_SINGLE:
> > +             htc->wmi_ep_count = 1;
> > +             break;
> > +     case WMI_HOST_HW_MODE_DBS:
> > +     case WMI_HOST_HW_MODE_DBS_OR_SBS:
> > +             htc->wmi_ep_count = 2;
> > +             break;
> > +     case WMI_HOST_HW_MODE_DBS_SBS:
> > +             htc->wmi_ep_count = 3;
> > +             break;
> > +     default:
> > +             htc->wmi_ep_count = ab->hw_params->max_radios;
> > +             break;
> > +     }
> > +
> > +     /* setup our pseudo HTC control endpoint connection */
> > +     memset(&conn_req, 0, sizeof(conn_req));
> > +     memset(&conn_resp, 0, sizeof(conn_resp));
> 
> is this better than having = {} initializers?
> 
> > +     conn_req.ep_ops.ep_tx_complete =
> ath12k_htc_control_tx_complete;
> > +     conn_req.ep_ops.ep_rx_complete =
> ath12k_htc_control_rx_complete;
> > +     conn_req.max_send_queue_depth =
> ATH12K_NUM_CONTROL_TX_BUFFERS;
> > +     conn_req.service_id = ATH12K_HTC_SVC_ID_RSVD_CTRL;
> > +
> > +     /* connect fake service */
> > +     ret = ath12k_htc_connect_service(htc, &conn_req, &conn_resp);
> > +     if (ret) {
> > +             ath12k_err(ab, "could not connect to htc service (%d)\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     init_completion(&htc->ctl_resp);
> > +
> > +     return 0;
> > +}
> >

Thanks
Karthikeyan
-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
