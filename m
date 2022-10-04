Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F236BC433FE
	for <ath12k@archiver.kernel.org>; Tue,  4 Oct 2022 11:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/rIZer0VQvtFnmRgwPNavGWNSUGDqKEaY55wxCTPdA=; b=ta5dfuFBEP7CTU
	AzbwWd+aJ+VcW/knST7AqD171W0U9k/mdyoUnPk7P4ScODQHs6m1EWAfYC4Q/tbFTwpgFLcGfia7T
	9UhkXIjdHYKs+4uCouuwE5s4gFbC1tQ9/P9aCWbtH+ZlIlJ8dVn7itiURsX+xjZxgtd6fB6RbSyZd
	1eFjIfXDIA6XfYtXwqN4wHfqGekKKpHjQOYaut07wAd7yeu0xjzGSEdQVRbca4/KBjI5ij9L6OaoX
	Xh4L0+iGY9JukC+gQP7JWQehWFLYpsCeKSmsp/FVEUz2OXh31mcDFqInbXTDPRLjnkHCYVH2mI1Qp
	ne1jBCzJuWF2gX4YuiAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofg55-009Vf8-DI
	for ath12k@archiver.kernel.org; Tue, 04 Oct 2022 11:27:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofg52-009Veh-EB
	for ath12k@lists.infradead.org; Tue, 04 Oct 2022 11:27:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294AoTZk021298;
	Tue, 4 Oct 2022 11:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=U/qK7NsEdNSVY93mg990/GZh4nxvrY7neyOone6cXfo=;
 b=Xk6SaCCl+RVaHfIhx42HRmHIZbML05voAltxSkd4UXL65/5YZZdFwK5kFhhiOO9BVC4S
 tqiiOUPrLP3oR9FqgZzp8GV3he3BD6vUQpC1rCe9lIgP9IwAJxlqR8dHHx7VZPiO9wIl
 W6Kr8hxUHkHWBfrssTik3GOd8+vAtunPHMy+F7+XQ+Syf4VwcHiqwC8Jy5RzIgx8VfDT
 GtRkF1VhZAkiZReWCFf6QVPPaRSjg/0V02ORdBGJNzePXUXgYUN43U3DYj535CVwu0u6
 gAWjl/5qNtb1Ixa3ACuKSRSjMRw8TPT+Wj5/o7f5ryRclEXZQ3HkfJkkPOVFmkboxS0v EA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jxcjfdusm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Oct 2022 11:27:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9ih1iGRoF4NEqiSck6+BmcccLNGrc+M6F9sso3tSSceXYGyI0ebgP/ihV+94QPbMPaU4TxWbdgHuWUvn+n/S4f1VtqpTp3bQU0cqaUBoFST9sjYPAj4jVg/lH9PrWUT/RWdGD6f8oI1ZIyxL2Af3dqP8CcR37w9Cny++CMkHUmXCNYGmFaWmhuLLfIQEgkqhDVZ9Hlt/yE/l60d7e5IrLHR+Rf6Nb9wPot2RyNhQUmjWGWY5X/cdKrW+RJmT4Mq6sYKiSVxtR4SYJFzB+nCj8eUYsA2j5kmreaRnbuA+O6+mjGfJG6U5AjJqJ1+UA+S+Z/1Jr92Cqe3RnqOqxzg4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/qK7NsEdNSVY93mg990/GZh4nxvrY7neyOone6cXfo=;
 b=jpT/pdpeF0xC0FFV/odTUVDNmPqUq5/avzJDMngfpArs2N/vViEhIXmaVXpQ2UEbZRARbeIiGxXve0nVaQi0cT5DjBKT5r+XAFntw7yxH2/Wr7Qil6TW62x9XhKufqFDDMk3QiDYRKsF4AqiRKVmAqt++8SKbKqye2c/WekXMr7IyIt+o7CnL9zOYCbImTdwieP3QLfuyNrggysKjb9D+1vmQp4KA3nt2E1mAUuXvT1MfpDR8P8U/eF9ih8j4gSPJLfmhHRm5AcXIc+YjF1WOFC/6lsCgyJMJ3IpKoNqvTbLBdOsu+RCsIfGzgMLiVxH/+37hK5yGWMp7TO8Wx5lzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from CH0PR02MB8212.namprd02.prod.outlook.com (2603:10b6:610:eb::20)
 by BY5PR02MB6722.namprd02.prod.outlook.com (2603:10b6:a03:209::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 11:27:13 +0000
Received: from CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::a2aa:7ce8:a34:fdb1]) by CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::a2aa:7ce8:a34:fdb1%6]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 11:27:13 +0000
From: "Karthikeyan Periyasamy (QUIC)" <quic_periyasa@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>,
        Kalle Valo
	<kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH 28/50] wifi: ath12k: add htc.h
Thread-Topic: [PATCH 28/50] wifi: ath12k: add htc.h
Thread-Index: AQHYrmYj6N49z2GeqE2IO+ZJJkKX2a21MTIAgEk5hoA=
Date: Tue, 4 Oct 2022 11:27:13 +0000
Message-ID:  <CH0PR02MB821203B4CACFE1C1CE51587FF65A9@CH0PR02MB8212.namprd02.prod.outlook.com>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-29-kvalo@kernel.org>
 <b46f6c1c-0b3d-0960-b655-46567ede41d0@quicinc.com>
In-Reply-To: <b46f6c1c-0b3d-0960-b655-46567ede41d0@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR02MB8212:EE_|BY5PR02MB6722:EE_
x-ms-office365-filtering-correlation-id: 2be98795-f929-4fd8-1145-08daa5fb6292
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2LyleyVjOsEBebMQMNL4DZMnx0biyONkHwYSnf+rVRhuOJ+mymD4ne7hjx4nDGoa58Rc07PehmSjxEBIRi1OE6INJuR+F0m7ke6KhRKiKPunrEpQS4FuM/Jve1GkATtRgCoo5TaFfKnxRopAZ81RCkdL96SM+ZjxKx/rOlTvTT3mbf+UQo7DvNj9JNfIrTfSfSAGbReZZgANc3+71moDgVaM+K44oDBpaeZfhQ5jZALXXlcQRU8dHXi+l1JoATLgAvc2tCw4X/bhHTapNDcRqMvCTxtvgltMVIVUxqg2SwaamqWbWP5c1MUJBuhE40libRoms7I5sUx3xo4RWP+dnX2CZbw5TcR4hcEB478obSv3bwfgB0brxAEI+3Tv+fbFyS2B2tISWqNhj12myrMZqk8mKZngbUNhsYQUATnzw7AvyFzhEEocmba9M6bEmUUTCLUD/w14l71TMVHmmN5iV8hMWUGpfyUlpe3Q+5gDVN7DnXkeSlPwcdLjMrEjkaV9D8Cq+Z+2R64W5OTsVPIDDU+jFFzy2wYZaY+1+iOLwfxkbwWGI8YxnT5r9Ny2LAlFtvtnFnVaSZPoBk1ZT2hpYXRmOf829bOQwkpXaiI7DLa8952vPNFyiCwZOLR6uT8tBPSqK6daro7m7qHH9IxoNTPeYaKGIpionor8s3wNAzU51s/0CF2lh4UCWGLSb+STXzDhZ0pIsCKK0QzeI5RVoTX11bhVZS9aYldtoreu/AMAC4eQAkuqUQSKZ1spDokKSXCVa5Hf/1Bs+DTfhuWGA/h+2oE/bxyfODF2+3lwaCs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR02MB8212.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199015)(5660300002)(52536014)(8936002)(41300700001)(55016003)(2906002)(53546011)(26005)(6506007)(76116006)(38070700005)(86362001)(38100700002)(9686003)(7696005)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(71200400001)(478600001)(83380400001)(110136005)(186003)(316002)(122000001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aElUMk95S1F2NzdwQ3FFWUJBWnlxMkZYOXU1RGUyYXdnYS9QUGN5Tk5YUHNM?=
 =?utf-8?B?elQ1U2crZnhVTFRsVTFMZGl5NG1PYU9DZ21oRHh2NG9wQ3U0ZHpVUEMvTmlL?=
 =?utf-8?B?YVg5M3hQck9UU2ZyMWEwWi93MnR1eXdQT1dndDFXOHlGeXA4THVxMTgrZlo3?=
 =?utf-8?B?TDl2VlhWeWFFSVBiQXM5N0ZLZ2ZkT1RCYTdmMEZKOTIva1VkMWN0b3lka0ZW?=
 =?utf-8?B?QVdDd1lZancwcE43aldsYU1NUy9PaW1abG1DTjA4YUdwdTVSelZjQzFCNWV3?=
 =?utf-8?B?S2R4R2V5TXlETk9CdzBteEtiZGphVzE1MkxydE5UbDBTMHJmQmsveUNVc2Jp?=
 =?utf-8?B?M1NDUEdFRUVYSE5FdVJCMXpiQXVrRzNabVVmLzc4Vms5RCt2TGRpS2JnWmk3?=
 =?utf-8?B?TTl1UGNjL3pqWDFtcUxhckI3cHc1S3pzR1RvYmpQYTlhR2NwRUFvVk1xQ2pO?=
 =?utf-8?B?L1l0dXdkQmNvdUxHUjcwcXlGRGpuSW5UNVVkWlpQNGFKQjBnZW51ZWRMVHVu?=
 =?utf-8?B?Rmo3QjRjMGtPTGU3RHZlQnU2WlhVNG81UHZUMHJqc0kxd1VINWxKUlo2d2kw?=
 =?utf-8?B?cjBUbCtienZ0L203ajZpcEh5QXlzQ2FGeHVMREI3UW1rRWgwank1ejMwVnhz?=
 =?utf-8?B?dHgzSUJGdDlPQmRrNEN0MWpwUjRmRDA5bFpWZWpZdmZSMFhmL09ZYkZ2akhP?=
 =?utf-8?B?cEdrUVFKR2NRSDBxN2VJRm1DOE9VWFppY2FCOGYvRVczbXdKdmI0c244dlpB?=
 =?utf-8?B?ajJ3a0RUeG5Gd0dieVNKQmJmSXNyVCt2M3ZmWDUzN01CZjMwSEtSWDROU3J3?=
 =?utf-8?B?MjBHVUszbTlwYVo1NmhxTkhneTIzVnlhRk92UERzdEtsNmVOeE52cGZ5V1Y0?=
 =?utf-8?B?ekM3R0tITjV6V1RXWlYvQks0eDZvQW5MYk1lTkkwUHdiYS9qdC9pSm5PaDFr?=
 =?utf-8?B?MGN1dGVRQ082WU9aS0Z3UlhIelRLRUE4d05Jdll1bkMwWXE1a0lpVkE5dCtD?=
 =?utf-8?B?c0llV0crUjFLVTVPZ09sRTdjVGJxUEZBc0tsWkFpZ1ZTbDZYOEl2TEhCdU5H?=
 =?utf-8?B?c0pBalVzY3NxMUFqekdvUzNsazdaZXFtRTBaRkRXUm5vZnUyaEhBQTU1cVZI?=
 =?utf-8?B?QkN2UjZURTdPWkk3STFiVlJSTmNtclFWclhlWVlLN3B0VHNUeFNha3VQT3Bw?=
 =?utf-8?B?VGJiNHZkRno3SSs1TW5vUmczb0pkUGkvbE4zaE0rSzVqT1h4OWJheWcrRWJC?=
 =?utf-8?B?UEtPc2Nucyt2ekw3aXVDdlIwNkgyTUxqbVZIMHRBVXBGOXNNSE5FUVJuMG9h?=
 =?utf-8?B?U2wwemoxRFFPWklJVzhqSjFNa3IrUmtCNlN5U09PM01Tbi9EcWozSDE5T1dZ?=
 =?utf-8?B?ZS9rZFgvMUp5eUZKWTZjS3BlUFNNQmozREFKQllGblJPdzZ5RTlKL3ZzVy9l?=
 =?utf-8?B?cDUwQnlwS2Z3bmRrMzMzczRzdVpYYTFKcmJLaEdwTkhUVUxzQ0ZXU0RPUWU4?=
 =?utf-8?B?a09ZaTVWbXBLSzhCeUxFK0N0a0F3aHlvOXFoSUpjYWw1TUI3UXJTYkx3aTJi?=
 =?utf-8?B?ZVVIcllLU0dOY1I5c1pZM0h5ZGlTbzQ4OE5JRUx3MWxuUFFTYUZoK2J1U0Vv?=
 =?utf-8?B?SUFNRUpzV1ZUYU5jZU5LK1pTcFI0Y2w5bTBueUh3TUhBWkN6T1BKVG1oUVho?=
 =?utf-8?B?TWFjRmo2amZFUUJrTk1QcWpnSFAzQ3VvUXA2aWhJQUJ2OWN5dFExbFJQNERM?=
 =?utf-8?B?RURiaWFtOUZyK2pkNFFPcS82amhmcXdkU3pUdFZWV3lJL0x2UkRkd1FiOWlE?=
 =?utf-8?B?QlV4NjlJbjRNdkVJWGJCcmtVL1BGYmljVjZkSzVqMitYUUZtaUNJZ1E2TEE4?=
 =?utf-8?B?cEZSOG5IblAvWWd6SXI2SjRPK0lVTHNwZkZQWU1zUFhMamN4eURiS3NLbFc5?=
 =?utf-8?B?MGVHTW9iSytiMHlvazRpL1c3TlU3MnlZWUZSRzlhT3d6TDkrTG1ranl0OVMx?=
 =?utf-8?B?YkwzT2I5K0FyT1cyUGRrL3YxY3VzTEIyOHA0bjY5ODFacU53Z3k0TUxCYTBS?=
 =?utf-8?B?enR5ZVYvU3RiQ2J4MWVPSUdwUmJaN3JVbHJYcUpubnR4VE9QL0V3S3pHamw0?=
 =?utf-8?Q?B19o7g9/riNrCNHum5JmKpLoL?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB8212.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be98795-f929-4fd8-1145-08daa5fb6292
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 11:27:13.5304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wmoakr2R7byVbSGuVxfEmCIAhop7hN7waE70crSdRhGCLP8Jw8BwlHzMf9es7SJsZ6I27Nbn5BijRDMvuGq7DzoZ1LxQ1a7F2pBTA/n20gE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6722
X-Proofpoint-GUID: oHZFZdY_tRX3Bib0CgwBC4_lcF9rpm9U
X-Proofpoint-ORIG-GUID: oHZFZdY_tRX3Bib0CgwBC4_lcF9rpm9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=580
 mlxscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210040074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_042720_622929_CF79C3DF 
X-CRM114-Status: GOOD (  30.98  )
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
> Sent: Friday, August 19, 2022 2:41 AM
> To: Kalle Valo <kvalo@kernel.org>; linux-wireless@vger.kernel.org
> Cc: ath12k@lists.infradead.org
> Subject: Re: [PATCH 28/50] wifi: ath12k: add htc.h
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
> >   drivers/net/wireless/ath/ath12k/htc.h | 311
> ++++++++++++++++++++++++++++++++++
> >   1 file changed, 311 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath12k/htc.h
> > b/drivers/net/wireless/ath/ath12k/htc.h
> 
> snip
> 
> > +#define ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_MASK
> GENMASK(1, 0)
> > +#define ATH12K_HTC_CONN_FLAGS_RECV_ALLOC GENMASK(15, 8)
> > +
> > +enum ath12k_htc_conn_flags {
> > +     ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_ONE_FOURTH    =
> 0x0,
> > +     ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_ONE_HALF      = 0x1,
> > +     ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_THREE_FOURTHS =
> 0x2,
> > +     ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_UNITY         = 0x3,
> 
> it seems strange to call a 2-bit field a flag

Sure will address this comment in the next version of the patch

> 
> > +     ATH12K_HTC_CONN_FLAGS_REDUCE_CREDIT_DRIBBLE    = 1 << 2,
> > +     ATH12K_HTC_CONN_FLAGS_DISABLE_CREDIT_FLOW_CTRL = 1 << 3 };
> 
> and it seems strange to have an enum which incorporates the values of the
> ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_MASK along with
> definitions of other mask flags.
> 
> perhaps these would be more logically defined as macros just after
> ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_MASK:
> #define ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_MASK
> GENMASK(1, 0) #define
> ATH12K_HTC_CONN_FLAGS_REDUCE_CREDIT_DRIBBLE BIT(2) #define
> ATH12K_HTC_CONN_FLAGS_DISABLE_CREDIT_FLOW_CTRL BIT(3)
> 
> and then rename ath12k_htc_conn_flags to be more specific that it just has
> threshold level values?
> 

Sure will address this comment in the next version of the patch

> > +
> > +enum ath12k_htc_conn_svc_status {
> > +     ATH12K_HTC_CONN_SVC_STATUS_SUCCESS      = 0,
> > +     ATH12K_HTC_CONN_SVC_STATUS_NOT_FOUND    = 1,
> > +     ATH12K_HTC_CONN_SVC_STATUS_FAILED       = 2,
> > +     ATH12K_HTC_CONN_SVC_STATUS_NO_RESOURCES = 3,
> > +     ATH12K_HTC_CONN_SVC_STATUS_NO_MORE_EP   = 4
> > +};
> > +
> > +struct ath12k_htc_ready {
> > +     __le32 id_credit_count;
> > +     __le32 size_ep;
> > +} __packed;
> > +
> > +struct ath12k_htc_ready_extended {
> > +     struct ath12k_htc_ready base;
> > +     __le32 ver_bundle;
> > +} __packed;
> > +
> > +struct ath12k_htc_conn_svc {
> > +     __le32 msg_svc_id;
> > +     __le32 flags_len;
> > +} __packed;
> > +
> > +struct ath12k_htc_conn_svc_resp {
> > +     __le32 msg_svc_id;
> > +     __le32 flags_len;
> > +     __le32 svc_meta_pad;
> > +} __packed;
> > +
> > +struct ath12k_htc_setup_complete_extended {
> > +     __le32 msg_id;
> 
> is there a reason this isn't msg_svc_id to be consistent with the other htc
> messages?
> 

Yes, its different.

> or even have every htc msg begin with a struct ath12k_htc_msg hdr?
> 
> perhaps also consider some naming conventions similar to what were
> adopted for WMI?
> 
> > +     __le32 flags;
> > +     __le32 max_msgs_per_bundled_recv; } __packed;
> > +
> > +struct ath12k_htc_msg {
> > +     __le32 msg_svc_id;
> > +     __le32 flags_len;
> > +} __packed __aligned(4);
> > +
> > +enum ath12k_htc_record_id {
> > +     ATH12K_HTC_RECORD_NULL    = 0,
> > +     ATH12K_HTC_RECORD_CREDITS = 1
> > +};
> > +
> > +struct ath12k_htc_record_hdr {
> > +     u8 id; /* @enum ath12k_htc_record_id */
> > +     u8 len;
> > +     u8 pad0;
> > +     u8 pad1;
> > +} __packed;
> > +
> > +struct ath12k_htc_credit_report {
> > +     u8 eid; /* @enum ath12k_htc_ep_id */
> > +     u8 credits;
> > +     u8 pad0;
> > +     u8 pad1;
> > +} __packed;
> > +
> > +struct ath12k_htc_record {
> > +     struct ath12k_htc_record_hdr hdr;
> > +     union {
> > +             struct ath12k_htc_credit_report credit_report[0];
> > +             u8 pauload[0];
> 
> s/pauload/payload/?
> 

Sure will address this comment in the next version of the patch

> s/[0]/[]/ per
> <https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
> length-and-one-element-arrays>
> 
> > +     };
> > +} __packed __aligned(4);
> > +
> > +/* note: the trailer offset is dynamic depending
> > + * on payload length. this is only a struct layout draft  */ struct
> > +ath12k_htc_frame {
> > +     struct ath12k_htc_hdr hdr;
> > +     union {
> > +             struct ath12k_htc_msg msg;
> > +             u8 payload[0];
> 
> s/[0]/[]/
> 
> > +     };
> > +     struct ath12k_htc_record trailer[0];
> 
> 
> s/[0]/[]/
> 
> but this struct makes no sense. you can't have a variable-length payload that
> isn't at the end of the struct
> 
> if this is just supposed to be some sort of pseudo-documentation then
> perhaps put it in a comment so that the compiler won't see this?
> 
> or perhaps even better draw an ASCII representation?

Sure will address this comment in the next version of the patch

> 
> > +} __packed __aligned(4);
> 
> rest snipped

Thanks
Karthikeyan
-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
