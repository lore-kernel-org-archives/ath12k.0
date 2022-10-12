Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D77C433FE
	for <ath12k@archiver.kernel.org>; Wed, 12 Oct 2022 23:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EP2VuiKFvqMLeFr0wC2FOfexJZHO76mP304YIZmQLQU=; b=mvUvkXcD3dz4Ux
	/F4eJDcHCkoW+lO5VF3vJWk4Sc4WB7cjFaf7v88fkLi1AAbvtRsFPEjMSTzXMut9oPbMhkx9Wlgat
	MnxnsKFhmBDSSBjLPRqKX5hu+7eFVUh+DMBHLKLIygu9ZaqhZ9Nxi+C7gXevDctd/DGSb7pvLvLxp
	7m29n4yEfai006OFnEm0pb8kavOCCXwTZFfWg/hVSQqUz78yPkqsctmqB+Sgdh5T3/CDUj4JCD9mc
	zgZumdsfr4+Pf6DxuhaUm3X+a95L4igEBuX3UC562ZsxHCj19oNlyeIEaLKQ2u0Kl3hEViTm8GwLg
	2vn9MZ3hGsGNUxb1mzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oikud-009fqZ-0E
	for ath12k@archiver.kernel.org; Wed, 12 Oct 2022 23:13:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oikuZ-009fph-Qc
	for ath12k@lists.infradead.org; Wed, 12 Oct 2022 23:13:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CLbULj032079;
	Wed, 12 Oct 2022 23:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=BO9mQixa+vvYYebJbULf87kjRqI99nfs6YGrQB4QIyo=;
 b=njH+uKZ+ycCZKz3ZLhzhBJGbzwdyl4FDnWTCqB4YeeXcpwHeVZG+N5xzgvu8Q6nqF5Sd
 PoO4YnGNGn06nQu3D06/YRLU1P7Ksl7lyxJxBKR2hvBuD/dvLfyslBA8rvNb2eBID5tP
 DvItPV1UkKVhfJwZG/uB2i2Rn5jXAPfUfusjMmcbt8m+R0Fg0Y457zhgyVu1ILvshY4q
 w9xRwn0lnGgpidnlDNkWFPQUaROyfe3tSHf6DBY/3mdJJEB9IHRL0qdYmQzzfAGdJstB
 6R1YOFd+FssuUIn/vaqLCmAUo4AQL8Y8f2HlYWoXXeor/NKvUqlGWfDtcYsg4VhLqI5k Bg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k5t05hx15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 23:13:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOSL/Kp6/XUyzCiU9R9GcbLtO2QcdPeff8oV6U1sA8y6++5bkd7YgIBIdRHj81jhgvNII/zj5tzNd89+5qhoBzPE6yFO5BauWdP3prOEwf9JUIkRngXECPshrkyhc1ZNjFt6YYQpnrVIs04CO38DXz0mGrZBDtc8AdwsASnd+vT9iIv5tJaR8rSpVmTVyZSFCJcY612eHWldKblaxEgPk5uQvcCzMS2oTVaSlIzZwDGstvIHKyHxdJutj7aLlhJMK2KdCsayjwOqBh6o80aPg8EVYtBZFxgTuyrhF/wRIO3q9XsttnW0jyl9k2redjER/cfNVt2+resCckyFQWusIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BO9mQixa+vvYYebJbULf87kjRqI99nfs6YGrQB4QIyo=;
 b=L1tjpg5Yb3Uk6sIyXxdECWjOWuMuXbCYfhx20r5jignyEYDJNeDIXhlSG3sgqlRrV9wz0GE0AiTG59KAZ//Fglw3O2eC8fGyK5Eq6fM6P0sARiNmoujYlrrjbeXXBl/kYKh0+5GOEDVvZxPpUvOU37OsOM6mWWLYfcfxPSVvZMG0HRMZGuvD0+xB72hH0ZOr61q0sly9Z5CEzfG/lxeKW6I6Ss6XnexAH21xKdOju0mau7JExgCl7RysdAcGWk/wYHGBc1370ZUEVAKCiy9+D13Q3Cki9unOGwlcBraVQwDkliYhe5ruSzE250ba733WhG7gqC78toClzKpXt1ouEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4334.namprd02.prod.outlook.com (2603:10b6:805:ac::20)
 by MN2PR02MB6781.namprd02.prod.outlook.com (2603:10b6:208:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.18; Wed, 12 Oct
 2022 23:13:10 +0000
Received: from SN6PR02MB4334.namprd02.prod.outlook.com
 ([fe80::8bd9:bdd5:901e:3afc]) by SN6PR02MB4334.namprd02.prod.outlook.com
 ([fe80::8bd9:bdd5:901e:3afc%2]) with mapi id 15.20.5709.021; Wed, 12 Oct 2022
 23:13:10 +0000
From: "Sriram R (QUIC)" <quic_srirrama@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>,
        Kalle Valo
	<kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH 38/50] wifi: ath12k: add peer.h
Thread-Topic: [PATCH 38/50] wifi: ath12k: add peer.h
Thread-Index: AQHYrmYmTd6pJHUS90e/FC5Eit/9Yq2zgWeAgFhCAxA=
Date: Wed, 12 Oct 2022 23:13:10 +0000
Message-ID:  <SN6PR02MB4334D304627589F8857DDC3FF7229@SN6PR02MB4334.namprd02.prod.outlook.com>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-39-kvalo@kernel.org>
 <4b5421a2-f111-b7f2-4eeb-6404e8f390d6@quicinc.com>
In-Reply-To: <4b5421a2-f111-b7f2-4eeb-6404e8f390d6@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4334:EE_|MN2PR02MB6781:EE_
x-ms-office365-filtering-correlation-id: e3b6d142-ff2d-4526-77be-08daaca75482
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  xdemSBAMwiAbnO+jqXUAY9EiX5fVuZpm2iiZcc0yxiMzZ+PkJQ6X+srL1oBGQw0A/TsikyNf5HSDswIsGZNvSkjBtPuiP7u5OPWRzPIaollrB2cbiwOIUFHK9+qFxlbFgRcqreyZaZpGEPGMNxtyhD2l2S9AaeiluZ/xlHsWPYkaCeICJdPY0kbIwBaSdWXEWdOvA6b5z6f+Zb9TNmIz+Rth902nyXg8kBK8krWg/ggl2uzmQlK/40QwTz/WhjJK4BD+Ng5ZT5/t2zXDqFcaZu1sPMXNI/0e7OAWVV91sdaPnPdWlEidbmNC7686xz/Qq0A7jccxpu6ByhkR5RnCkZxrxz0C21dfY2Q1MWm4GGNp3EgQTweJUKV23lVtrbngv1RJ3G4AZsR+4DRf57oQLPVLDqARzJwFNhBzn6Bz7/LmKeRKS2rHwzbg4ITVSA6I0SisypzNeJ8XWqg1FwmsnvKFhfdNRJlsrVldS2D17q16q6+Uaf6BSWpyyaZnuXIw/lg2eOHTKoynYagTd6Q6y4W3WP22ZB7FFR5O/5KwXHVcsF39HxouSY86aRG5mQb3Ge2WXVP1/E4BCyI/W++qsrs961vGIDOw6waC9KR93Ub/XkPt/Ykkm1sch5Qnql2BkkkRdOzcTcR0G7mQjhBqatqXi2BmjUzL4wMb5WoPDpGIf+vWKC2AT0i1E0NwE8recQUKL6Q5WPPK+14a9xMAXMJ8q/yHG6kVAykHI3E+2N3An5/fcRJ+CD/lcx4kZX1jvqqaNj5Eew/cgfsOXLWojA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4334.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199015)(66446008)(38100700002)(7696005)(8676002)(4326008)(38070700005)(55016003)(41300700001)(86362001)(64756008)(6506007)(33656002)(52536014)(76116006)(8936002)(66946007)(5660300002)(9686003)(110136005)(478600001)(186003)(71200400001)(66556008)(316002)(26005)(122000001)(66476007)(2906002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Mk1UdENnQ3hoSitQZXZLZXpaWERxWlliQk5oamxRUDFUZkRSWEZ0NThIeWpP?=
 =?utf-8?B?TE9OY1YzTWFXWmNja2VrRWR6U1JaR2U3ajNJaEdHWVNMOU1YeGhIUVNOandV?=
 =?utf-8?B?SVZoc25TL1RPN1JnS0JNU0VQakxkbklSQkc4OHcwem5QZFY3U1Z1bUhDR3Za?=
 =?utf-8?B?VnFqdmx2dHJJWWRjTkxENVhkS29mYnVjOG5SU2duK3hVaVlNNlFGMFVqUUpt?=
 =?utf-8?B?VzFQZHZLSm1SZkJlVG9jd2tCNXRtdlRBajI5S0hTVXBUWDFGcldDcHprUGN3?=
 =?utf-8?B?YUJwUExHK3FzeG03cGtSNDZ3amVSNTJWcUdEeUxEV2lDMkcweTdJNjhrSFVO?=
 =?utf-8?B?SDBsZUVvUHZEendpVk5WRnVvZjFOODg5M2l3SU5Qei9SallyOWZFZ29MTWE3?=
 =?utf-8?B?dnpkRE1HTGJYZUNjYjZtSHZCSC9QUy9EQ0U3SGQ0MXI4ZVJBeVhKdm1lZWRw?=
 =?utf-8?B?bHFvMERVYUNJTWxqVmtKTFIrM0lMZDBUV3Y2OTZOdTVJbnk2aE8yUnlLYlVv?=
 =?utf-8?B?Y3Z1K0gycHU0N2ZaZWZCNWdlQWxSZ0t3ZmN0TkFXa1o3c3lUdnpiVnNHak96?=
 =?utf-8?B?NlRna2pOa2pVcVF3YWVFYTJaSE5LR0t4THJCSnc0czF3c21DNkJpczZaVEF1?=
 =?utf-8?B?Yk9qc09kSXE2NElpVFV1L0UyQ3gwNE9JYndOZzR6NitCaytucVFTSnErMEhT?=
 =?utf-8?B?V09nYlRXNHEwRC9YRXAwS0xnUHBqeXdVWkZYVXRIQlNWODBrV0ZSYitqcFZw?=
 =?utf-8?B?MEUwK3JEelU3bHV5SERuTmVNKzN2eFhQbEZHL1VZMUcxN0NPeTFNMzRyMXZ5?=
 =?utf-8?B?OXpvZ0tmVzltWDVVRGxLWWppZEVkazA3eTNHRmRKaHcvU2ZTNk5YRkNXZ0tu?=
 =?utf-8?B?dVZNQlJLU3RLMVpsWDlZWnIzdzAzUjY1MzZXSFR3NEVPYkhQTDRKOU8wZGhQ?=
 =?utf-8?B?OVUrZ2ZkLzIyekhRV2xaTzYzMjF6eDVTSHBsTzhid1BDVVorSkhzcmhZNVcw?=
 =?utf-8?B?Szl4ZWdpei9Rc3hJYStEcFpHYWJCR1BjcU1zVlBrZzlScnVWcVd6a2QvM1Nv?=
 =?utf-8?B?aVV2STNEZkpwaVI5THM2UzNpd3ZBZ3VqUnVRVGpjb3JVWHpaamRvRENQWElU?=
 =?utf-8?B?RHJGYmk0VzV5UUlCdVVqMFcxazVFRy9lREVnUW5uYUJEem9OM3RYZUxLS1JQ?=
 =?utf-8?B?b2NlNmdSSUJXRE1aSkRmVU1hTDJRRlNoS0I1ZTMxQncxL25NM056NEhZMTJk?=
 =?utf-8?B?VGtlKzF5cUQ2Ni82VlhiblBGeWdJOFNaVzN3UTdoN0x5b1paRXd6NzJ4eUZa?=
 =?utf-8?B?bWx1N0ZtdmIwT2NFbDY0V1g1bGxmeUVML2ZYZWJGbE1vRHVER1RBT0ZLR3dx?=
 =?utf-8?B?UGRiTTBJQnpHRlZtS2pGbzF6enpVVEd3MFkzWlIvanY3L0dKTFdIeE04d3hR?=
 =?utf-8?B?Nk55NnNoSmRYeThjNkx1ajIrNnFqdE9hc1lKZ2NERHluVXVSbVBtVFJrTmEz?=
 =?utf-8?B?eWUwMUwyL2tDS2Z5YmF0MVlYaHE2WGJaQmlOeU5GY0gwV3hhazBuWHNKWnhv?=
 =?utf-8?B?Vll2dnBjTzM5RDgyM0RiZXFnNzFydG1pUEFMdnJIaUNRRmR5SlU4NlNEM0pO?=
 =?utf-8?B?V1crRUdlSmYwbUJIQ1E5bVI3ejI0akY4MmdVbkJqalpvSVNSMlMvV2h0MDBK?=
 =?utf-8?B?M0RHQndNSkVlOGVSUEdybWt4c2YvYUU0d1RjZDhHNkZIRFhBWDNqQXRtYTFE?=
 =?utf-8?B?R2s2ZSthbEtyeWh2bjVJOHNOL2F0cDR3OUd2cExDZ2RDK0RXMGtzOTB5V1BY?=
 =?utf-8?B?NUNtL0Z1N3pHZFEzaUkvRGc4eWx2dzlvQ0d5LzVxSHFJcHRUeEllQk1RNXRa?=
 =?utf-8?B?aXFSMmZzREtBZDVaVThsVzBYUjc5dkh6YjMrMTN6R3Nva1JsYVh3d3RuRlg1?=
 =?utf-8?B?aDRoMElmek1EZnVoQUNkVG82QzBrQ3hJakpFWi9GWXNBOUpzVjNmOXlaYVhE?=
 =?utf-8?B?amFWMjgvQzFrRW5lQk5kbWhpR1YxZmF4eWlTWjVyTkdCRjUveWowWmVtL2p1?=
 =?utf-8?B?MWNJSDJvcVNkYStja2cveXN4c0QyZkttU3Zob1ovSmtPTW1sMEhPYk90Wnhn?=
 =?utf-8?Q?BiSFNzUTkBv46bwVmt6EJ17Zw?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4334.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b6d142-ff2d-4526-77be-08daaca75482
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2022 23:13:10.3542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: conPS7Ox0mQaJNc6xZYrV4m/xjgR1zymPMgyYpOgzFHAjktwRYdd0GfdWcdln4WQiEWB3szpaVvhTQ95zyKzmMJ1LbP25SBAk5/2Ojk2L2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6781
X-Proofpoint-GUID: raMCEJiAiKAJNRj43JQYDpo4gZT7ap8n
X-Proofpoint-ORIG-GUID: raMCEJiAiKAJNRj43JQYDpo4gZT7ap8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_11,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=982
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210120145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_161315_994905_6D56103F 
X-CRM114-Status: GOOD (  22.53  )
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
>From: Jeff Johnson <quic_jjohnson@quicinc.com>
>Sent: Thursday, August 18, 2022 12:55 AM
>To: Kalle Valo <kvalo@kernel.org>; linux-wireless@vger.kernel.org
>Cc: ath12k@lists.infradead.org
>Subject: Re: [PATCH 38/50] wifi: ath12k: add peer.h
>
>WARNING: This email originated from outside of Qualcomm. Please be wary
>of any links or attachments, and do not enable macros.
>
>On 8/12/2022 9:09 AM, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> (Patches split into one patch per file for easier review, but the
>> final commit will be one big patch. See the cover letter for more
>> info.)
>>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/peer.h | 69
>++++++++++++++++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/peer.h
>> b/drivers/net/wireless/ath/ath12k/peer.h
>> new file mode 100644
>> index 000000000000..d0346e8b1b60
>> --- /dev/null
>> +++ b/drivers/net/wireless/ath/ath12k/peer.h
>> @@ -0,0 +1,69 @@
>> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>> +/*
>> + * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights
>reserved.
>> + */
>> +
>> +#ifndef ATH12K_PEER_H
>> +#define ATH12K_PEER_H
>> +
>> +#include "dp_rx.h"
>> +
>> +struct ppdu_user_delayba {
>> +     u8 reserved0;
>> +     u16 sw_peer_id;
>> +     u32 info0;
>> +     u16 ru_end;
>> +     u16 ru_start;
>> +     u32 info1;
>> +     u32 rate_flags;
>> +     u32 resp_rate_flags;
>> +} __packed;
>
>(reviewing this out of order since I saw strange usage in dp_rx.c review)
>
>the above struct seems to be a host-only struct that is only written by
>ath12k_copy_to_delay_stats() and only read by ath12k_copy_to_bar().
>Therefore use of __packed seems unnecessary, especially since due to the
>layout that will cause many members to be unaligned. In addition the
>reserved0 member is not used, and since this is a host-only struct, is
>unnecessary.
>
>an alternative implementation would be to use the actual hardware
>definition here, struct htt_ppdu_stats_user_rate, and then functions
>ath12k_copy_to_delay_stats() and ath12k_copy_to_bar() could be simple
>struct assignments.
>
Sure Jeff. Will address it.

Thanks,
Sriram.R
-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
