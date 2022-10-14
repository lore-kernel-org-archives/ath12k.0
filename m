Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D78C433FE
	for <ath12k@archiver.kernel.org>; Fri, 14 Oct 2022 03:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IzBOvJPAfEF/EwDeLSXzr6akvKyoMcu83kBgDwsM6Ko=; b=orGDCapl3BAYT3
	R9sCa/4fJqznSgoYC+B2r8l1mPxM21ZYjc8QGyrsRC5unf5INLxoKxtbJvJM2YMTVybqWexuxHZ+N
	a1Qs3DFMveoJTVlQ0fCPWD9z8qSBYWa2UQ5DkjTfcc74gOxW6PbcYNZuH+fSuVQ58A88keopaWsMD
	oDhAjTdfTzJJ0XrWG8WwraCwPU2ypAtgGTUCAyFqqSVydxR8DkPFlTdx5EY9HqYqy/x0MnW01l2SX
	XZlgZVXTT/df6ClAg8GtbuifINiv9j7yLkZx31sH0eRTwEwLR/bqcZ46ZqVh55GLJGOR2dgQghjzA
	fiIiL/VGUiQqyr+OLrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojAwx-00DTFA-CP
	for ath12k@archiver.kernel.org; Fri, 14 Oct 2022 03:01:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojAwu-00DTEg-E3
	for ath12k@lists.infradead.org; Fri, 14 Oct 2022 03:01:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29E2v3Lt027444;
	Fri, 14 Oct 2022 03:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=EwdNqJ7d1h+tPuacklE1UsariNMEzy/b/E7p/wIcW3s=;
 b=ohqQQLLXZsFNIS7nR7k3oi6P9z5pg8t/t0a5gkHpm++J797OX8MeY74lsfgd9ne3C6Bf
 Fvks6n7xTnpL8pQGfTS0Ev8dkBMuROXt4cm+c2+mduIHRKDH6woQFKqd6vI9yLiqTk3g
 xJfMKG1UTW04E3y6TXwjR4Zqu3ZtLQHtbx836vsrlsSzXz3uzhz6uRm1NXIEklA0gRFX
 YIPxY9J2qeDlhg50Qp5f0/Wu9tK8stqzvmgBW2jqZ0YU3rqAARpXw9Tg4/OjNrtt+Cls
 toto+c8GiMa976LsQG9YVMWPvHsuq2BkCl6nxHvXqDdo/WjElZu83JSopjzKbLv00nVl Lw== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k6pg4h5f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Oct 2022 03:01:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kifh5O2QosKl/ab19T9a+z2zqHZmoX2IABuTkjnlgzqM3ClWwi3FpgeJI7jJPMS4oyf5DJiZZPdBDobMk23jTU9a7Q8fi+XZ2gI5RGEZfdTQpjOFzFW59PYOT5O6P5jKBpxakzhO1gBqyA7siN6veBlb6pprQoPBPmZw6BCKnfNiTR+kNEEaQhd9L1yut+ahpqyw/2X9w0/jvA84pgVZXHNL7iuFAN1Wy8280f1fWvqEmdx7/k1IZPG2qWKYZTqzfTOkhFFUu/t9PAEJV44IzKceamYTWI6JIm5ZRzSAPUqiCmVLB+ENcgP5vCYGTrgrwEX2HZSkFgs/Yb7UfpC6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwdNqJ7d1h+tPuacklE1UsariNMEzy/b/E7p/wIcW3s=;
 b=TX888AViQzmHRxTZT6TpSmLNxtHZ1kiJVbCm/uEOB1baF6R2a1HQZ6dN4qH6Dxn5wEbxSPjmApnDog6jLdwhcjnaOyPXdbUwFmPyxzO1XqPHTinN41a8ZrNcMqB8haoQsDcFp1ql47U65qxVucPHfSt6qIXVNl7ChKgn5uFb3fFxLfMATDlST1iauGRw0Hgdb3si0kUxnhyTXsemwao4JSLytltNZMIxzTJrVh1gD97dluS27XLQoaedq5k8UCJc8C0CGeCE7n9dnYre0icGrVgwdssTSiMxlSlrNdKcgq8CXfe0FDIoaW5KPD5FdFD4UknZNLXvP/sILT4VODmAlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4334.namprd02.prod.outlook.com (2603:10b6:805:ac::20)
 by CO6PR02MB7682.namprd02.prod.outlook.com (2603:10b6:303:aa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Fri, 14 Oct
 2022 03:01:16 +0000
Received: from SN6PR02MB4334.namprd02.prod.outlook.com
 ([fe80::8bd9:bdd5:901e:3afc]) by SN6PR02MB4334.namprd02.prod.outlook.com
 ([fe80::8bd9:bdd5:901e:3afc%2]) with mapi id 15.20.5709.021; Fri, 14 Oct 2022
 03:01:16 +0000
From: "Sriram R (QUIC)" <quic_srirrama@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>,
        Kalle Valo
	<kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH 15/50] wifi: ath12k: add dp_rx.c
Thread-Topic: [PATCH 15/50] wifi: ath12k: add dp_rx.c
Thread-Index: AQHYrmYbHK9N0DA8vkGURLObKZSNEa2yRiIAgFtLm8A=
Date: Fri, 14 Oct 2022 03:01:16 +0000
Message-ID:  <SN6PR02MB43343C4EE7BBA09592CF8CDDF7249@SN6PR02MB4334.namprd02.prod.outlook.com>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-16-kvalo@kernel.org>
 <576a0720-fe45-36bd-abd1-b772dbe380b0@quicinc.com>
In-Reply-To: <576a0720-fe45-36bd-abd1-b772dbe380b0@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4334:EE_|CO6PR02MB7682:EE_
x-ms-office365-filtering-correlation-id: 97820398-fecd-45b3-bd2c-08daad905caf
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6qiqcgda7JyrsMdBq7epEngic3/moAzEMay6xt8ui1DuuSIqYu9q7psuuAM5aa+WjDzXuKHGi3gIXlYzNhKo4AB8scqcc6xQNn2fz+WN7yfX5+uXhtEHqFMFaXNfrxXFsKQJOPohMIrqdoayZ4v+EGeLcEgJ1pWxuapKYvssuS5gxqNbLWQXebZHTxJWBINaaAICZucsU+a5vDhTrJ9AZ0LRXq1YVeT2QWZmbiCIG8CwHCUTy6eu+FO3EElw6SSvncDzglCqBCV24BwDRx3qMa4cOA/OEtT/ZX9UFLqWM7nyzH58VGbesNLEOngT9VgCkCC7cEvQGjhomL/VcU5w1hvJPMCNekyEE7J08FCmgVm5u63vXd018x+fmS+B2arRH52wMqfN8blzkcW5jh0h1qMFwudOsDoGtalrOfIBT2cNvqNDAV1dJ+p8ZISr6P+XVEZSdCQJkiT/V+Z9hGWT93+N7PwSB2ptibbmpbo4MJp/g5eHdBvRpiv9cpo2z+HW7khPcjWamx605rRR3Wob/OnrEM4I+Od1L6PqSzHD8MmE7gi3Z9/hcbumyG2nbgbIEg7hEjv8QSHr/vE4cNaVm2+Tml02TrqS2wqtE6aE7ExaVXp7yDu4CdQ02AVovmYHnoYU3Eqe7gpsBYvOooalq7vfr2gXnC3YYftPczZFLLrKyOl5nZNG6r/nyZYbRQyADJAL3tLQfUPD0cVpZH/xR9L5xLotS1iMV+/142PJXjQ7S4FcrWcJ09fLMAAqsgXUwjILIaK6tR2UTpisjoxFkw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4334.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199015)(7696005)(6506007)(52536014)(5660300002)(8936002)(41300700001)(55016003)(66446008)(66476007)(66946007)(76116006)(66556008)(38100700002)(64756008)(8676002)(26005)(4326008)(38070700005)(9686003)(86362001)(122000001)(2906002)(33656002)(4744005)(186003)(71200400001)(316002)(110136005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?b2dBRU1udWhGT1Y0akhkcWZhTTVvY2dXUVhOWkdUb0IzZjFyd0pPaTEwYlRz?=
 =?utf-8?B?bG1Zb29hV1lZdzdHVEp0VHVpdXA5L0txRk8raEt1aXFLNU9QckpGYnVYVU5Z?=
 =?utf-8?B?SXpjdm9QM3poUFNOTVZ0MmMyalBCRnFwRDZsZWxmNTg2aDVqSUc4V0pjaFFl?=
 =?utf-8?B?S3gxT1J2VHdKb2ZHRi9WSE9aWUwrdENpZ2pZVHBGaDhUWXhTYkZ4a0s4bHEr?=
 =?utf-8?B?ZkN3aW9wOWFBMkxVOUoxT2xHZmhYS25sNm5tTUVwZG9NYlQzMkZjVDN1aDJE?=
 =?utf-8?B?Qk1RMWpPb1drQmk1cmpUWnp4YTJocVBQY3llQWdpVjI2VjdHby9ibjdxbW9F?=
 =?utf-8?B?MmcydHp2V2xUNUdkYWE4SEJ6NkREWFFjbTV3MjhPVnBNN3NEaUwwUWR6YkQ4?=
 =?utf-8?B?ZlJtSDUvUGczazBCR2hOZ0tEc0xNOTBYWDZVTWNXMzN5Rk1ERlNRS2ZYc250?=
 =?utf-8?B?Ni8wN1V1ZHJKb0ZmSVVrNGlIaC9kdWR2Rm1YSkw4MVlHcXYzODJlMzQ5NGdp?=
 =?utf-8?B?dDZSU1Btb0xGa2k2c2wrSy9uZS9zYW12b244SVNFTVRzS0NYUFEraCtEaUFs?=
 =?utf-8?B?eWlrM01wSDFHanF4N2paR25tM1IyMFZXMVZlZURNVWZZR09KY1RiRW5KTzll?=
 =?utf-8?B?OHRHRTFzc3ZLSVc3QTJUdWVkSENJMERkaTBUWlJybTZ4N0ZlcngxQU1OUnRE?=
 =?utf-8?B?eUdIRTlxNlJBZWtjYzhJNDJ3ZlRweWJ4SFVXUUVIc2I0cHFRZHFzUHZJbzRa?=
 =?utf-8?B?eXo0UFJ1U0ppM2pyUWxtQWlYaVhtcDFUTk1uZndkWCtHeWh1Y01scmpmcnBC?=
 =?utf-8?B?eXcyOEZvRUFYaW8rTWVLYmYyWXBMOHVIdDBiVVJHNEV0NXFOYlBUT2NXa21G?=
 =?utf-8?B?T0J2Y01TZmJVRjV0bUdUM2tBNEY0V0FtTVllVEtmd1NScG1LZlc2a0JuWWNy?=
 =?utf-8?B?dEVEaTUxUC9WQWZjYnZ5VzJ3NTRsZS84T24xKzZJakMvSDQwaXczaGI2cksz?=
 =?utf-8?B?a09SaGVlQlNlQjNzNkpwRzIxYm8xN2VTSTdlYmc0ZUcvT0VOSERFUFg1Rld6?=
 =?utf-8?B?MjRIY0xUNmdRdFVwNkxpYzZ1cGllblVqNjBmQ3E3aXdhMmoyT0R6M1NseTcv?=
 =?utf-8?B?QWdaYXhiN3EwYnkraWM0QlhaWUs0TlRmWWczOC9FSkRxQWxnTnBCNkE5VERG?=
 =?utf-8?B?a01oZHBDMW43VTBweEhxd251UWVSSUNVMVo1N29JeUV5dHBFS1JiVGtzdW1k?=
 =?utf-8?B?YXhSYlBFRzhkNjJTckdiVThaUnFqbkNDTjloU1UvaE0vR2NlUnVGMTdIR2Vm?=
 =?utf-8?B?UE9pUnVBUHZJbHpGTWthRnUzSllaZHNYQ1ZiZEFiMHlNWWtwNVpjdGtkZGlX?=
 =?utf-8?B?ZGNwVWE1WVhUbW4vdUJCY2szcVZvVzUvK3NFaHJzWktaelluV3M2SHV2Sys1?=
 =?utf-8?B?QjhoNkliRzlxcGFkdCtLMkg5RHJ0aDByQ3VvU3M0b09xbzliTmo0VjZkcVFO?=
 =?utf-8?B?a0xjYjRXL29CekdDWWVwY1RkNlQ0U290eS9QRlZNSjBzOW5lNnNzblkrbkF6?=
 =?utf-8?B?VFdxbmlnNW0xdW9scEVmWS8wenhlU3FXU1FJSVpnbitpWFhRb3lsajhCVDhC?=
 =?utf-8?B?bzhpOGdUcCtkWHh2NlpDV3dUdUpxc1dYVEtjTWtBY2FsUlBkQXNrNHBFV3Ju?=
 =?utf-8?B?cUpsQ1pSeUVseUZOZmxUMDZXRDIyNFRzSVFSU2dVYkJLSmYxYy96MS9UN2do?=
 =?utf-8?B?a0gxTkdnSWo4VnkyL0JFYTA2c1ZNMWhNU2FEdVFxRWJIbkNxamtxS2pmWXlh?=
 =?utf-8?B?QXFmQm5GZFZ6aE5jaXhIaXdIVTVFVy9DQzRVOFpRSit0eUR4ckd0SDc0WWpG?=
 =?utf-8?B?SDVUNG9OREpHditpa2N6WUpXV0xzc3BvbjJpT1Nzb3ZsSmFrSVdLNjh4N0lu?=
 =?utf-8?B?QjVwRUlsT0dxUWZrQnlzN3A2MnBTMnpDV0g4QTVhb010cWw0aTVGNTJNZG95?=
 =?utf-8?B?OW95anJ4V3ZyNDQ1V1VSamdpZFBZWmdWT0ZSN2tJK2dMM2FoSm56TStxd3FI?=
 =?utf-8?B?cWkzKzA1ZmppdEdVTnF2OTZqYzZRbzEzYXFiSTNrN2RwRHBxSkEvaVp4RlNa?=
 =?utf-8?Q?ShnfWtWqA/F89+QWmddm3U9FJ?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4334.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97820398-fecd-45b3-bd2c-08daad905caf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 03:01:16.8107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kx2FzyL2bIIyAQC5GMbIA/0Ci2sR0eLde2oVAInprMC2UgwKdNvjOm6g4+54zlL8NaJp24ae/lSa7sthZtgQdAxuEY7ZsJTY5KTWL6FFeOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7682
X-Proofpoint-ORIG-GUID: stUUrrMdR1s-7Y90VibTJsJGwMq42NGV
X-Proofpoint-GUID: stUUrrMdR1s-7Y90VibTJsJGwMq42NGV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_01,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=401
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_200124_636526_48FE17F2 
X-CRM114-Status: GOOD (  15.85  )
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

>> +             paddr = dma_map_single(ab->dev, skb->data,
>> +                                    skb->len + skb_tailroom(skb),
>> +                                    DMA_FROM_DEVICE);
>> +             if (dma_mapping_error(ab->dev, paddr))
>> +                     goto fail_free_skb;
>> +
>> +             if (hw_cc) {
>
>hw_cc is a very cryptic name. is there a better name for this?
>presumably this has something to do with hardware giving us unique
>cookies so we don't have idr overhead?
The hw_cc indicates Hw cookie conversion, which converts the
cookie passed in the rxdma descriptor to a corresponding SW descriptor vaddr
(which was allocated mapped during init time in ath12k_dp_cc_init())
and passes back the addr directly during msdu rx rather than having
the idr overhead.
Since 'cc' was used across the driver to indicate this feature, we used it similarly
here as well.

Thanks,
Sriram.R
-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
