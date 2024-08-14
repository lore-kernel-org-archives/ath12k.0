Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EC8C3DA4A
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 07:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqOUbSUmrsgEwjlgeMonk1pold/BwBF2/nvA9qCFy90=; b=wOPzF/ZUZ8pdHcL/fKLQg9utT5
	vcEs6G8FsdCg+94hMECMGFIir6iIDJUnImQWkS0cwsc/Pfi3D/HLR1AvR4V4VvlT47OsEBCdVCBT1
	muxk/UPUzs7Fx6Hro6Nl0bWw2h43hiNBH+NaB2Lb4EqrBnzq7kmVLH0aUSJjW0UQaMe+uFNFAbN3p
	o8YZBgf57pIuK/s6nByBC1cGU0Culx+P9TWjxj5qchFWIoaCyAjRl6zaJMhYJ7A7Fv/r9Nyu/5Cpg
	3B9hJ2f7YTmeo64HPiK4ZCoFnmQ4FlMLU5xxjE7MKjudrFo44ZrHfZN3pSmcfbXVE8q8VB3wcLePE
	3EiI4+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se8Qs-000000064WV-2UrF
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 07:28:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se8Qo-000000064UG-4AmG
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 07:28:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DNFba7031804;
	Wed, 14 Aug 2024 07:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TqOUbSUmrsgEwjlgeMonk1pold/BwBF2/nvA9qCFy90=; b=dNMJW5GSBcLWKpGM
	GkVnczJ77hRyj1TUL5RxKyvvHftmb1v4dJQEXrF09wFKMwv+hVpMD6DF8NiCqABS
	MqnfEIUQcuywo7BXFdPs84GvsjOIgzhQrA6OXxjIDtxvxD8ZBSUarfU+jCRABbBH
	7/y082JHsni7nUmyLDYQnS6qW6POwX2xYmAl1WJ7izbek0BlKmTME+Ii0M9LcCrS
	Wol3V36vdkEEMFv7tgSE5Jj8HgM7vsVHRRUWNcLYC/MF+XOKJJaZ+lQBRv2971QX
	hjvbThB2K/7AP4SQ92WKbIpPyXJOEM3k34Sh4plon1eccL/fTdCsaq3BF+mHGQXZ
	2DjfFQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41082wjbx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 07:28:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47E7SK50009528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 07:28:20 GMT
Received: from [10.110.122.19] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 00:28:19 -0700
Message-ID: <c21666cf-4b55-4f55-a55a-7a7db4c2fbfd@quicinc.com>
Date: Wed, 14 Aug 2024 15:28:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wcn7850 issues
To: david Atkins <david@3adesign.co.uk>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8NVg_5GOJgSDn8dtvfu2jiUa_V7UxvPz
X-Proofpoint-GUID: 8NVg_5GOJgSDn8dtvfu2jiUa_V7UxvPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_04,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_002831_096976_92686E97 
X-CRM114-Status: UNSURE (   9.97  )
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



On 8/6/2024 4:06 PM, david Atkins wrote:
> 
> Hi,
> 
> I have updated the kernel we use for testing today to main from https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/, the base install is the ubuntu 24.04 desktop release
> 
> Kernel reports as
> 
> 
……
> 
> I have set region to GB
> 
> sudo iw reg set GB
> 
> so we get
> 
> mailto:openwrt@wifi7-amd:~/datkins/kalo/ath/.git$ sudo iw reg get
> global
> country GB: DFS-ETSI
>          (2400 - 2483 @ 40), (N/A, 20), (N/A)
>          (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
>          (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
>          (5470 - 5730 @ 160), (N/A, 26), (0 ms), DFS
>          (5725 - 5850 @ 80), (N/A, 23), (N/A), NO-OUTDOOR
>          (5925 - 6425 @ 160), (N/A, 23), (N/A), NO-OUTDOOR
>          (57000 - 71000 @ 2160), (N/A, 40), (N/A)
> 
> phy#0 (self-managed)
> country na: DFS-UNSET
>          (2402 - 2472 @ 40), (N/A, 20), (N/A)
>          (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
>          (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>          (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>          (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>          (5945 - 7125 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>          (5945 - 7125 @ 320), (N/A, 30), (N/A), AUTO-BW, PASSIVE-SCAN

Hi, david:

	We have related patch-set, they are currently under review.
	With our patch-set, country code could be set successfully.
dmesg(CN->GB):
root@yk-E5440:/home/yk/ath12k-upstream# iw reg get   //CN
global
country CN: DFS-FCC
         (2400 - 2483 @ 40), (N/A, 20), (N/A)
         (5150 - 5350 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
         (5725 - 5850 @ 80), (N/A, 33), (N/A)
         (57240 - 59400 @ 2160), (N/A, 28), (N/A)
         (59400 - 63720 @ 2160), (N/A, 44), (N/A)
         (63720 - 65880 @ 2160), (N/A, 28), (N/A)

phy#2 (self-managed)
country CN: DFS-FCC
         (2402 - 2482 @ 40), (N/A, 20), (N/A)
         (5170 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
         (5250 - 5330 @ 80), (N/A, 23), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
         (5735 - 5835 @ 80), (N/A, 14), (N/A), AUTO-BW

root@yk-E5440:/home/yk/ath12k-upstream# iw reg set GB
root@yk-E5440:/home/yk/ath12k-upstream# iw reg get   //change to GB now
global
country GB: DFS-ETSI
         (2400 - 2483 @ 40), (N/A, 20), (N/A)
         (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
         (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
         (5470 - 5730 @ 160), (N/A, 26), (0 ms), DFS
         (5725 - 5850 @ 80), (N/A, 23), (N/A), NO-OUTDOOR
         (5925 - 6425 @ 160), (N/A, 23), (N/A), NO-OUTDOOR
         (57000 - 71000 @ 2160), (N/A, 40), (N/A)

phy#2 (self-managed)
country GB: DFS-ETSI
         (2402 - 2482 @ 40), (N/A, 20), (N/A)
         (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
         (5250 - 5330 @ 80), (N/A, 23), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
         (5490 - 5590 @ 80), (N/A, 30), (0 ms), DFS, AUTO-BW
         (5590 - 5650 @ 40), (N/A, 30), (600000 ms), DFS, AUTO-BW
         (5650 - 5730 @ 80), (N/A, 30), (0 ms), DFS, AUTO-BW
         (5735 - 5875 @ 80), (N/A, 14), (N/A), AUTO-BW
         (5855 - 5875 @ 20), (N/A, 14), (N/A), AUTO-BW
         (5855 - 5875 @ 20), (N/A, 14), (N/A), AUTO-BW
         (5855 - 5875 @ 20), (N/A, 14), (N/A), AUTO-BW
         (5945 - 6425 @ 320), (N/A, 24), (N/A), NO-OUTDOOR, AUTO-BW


	Other issues will be replied by someone else, Please be patient.

Thanks.


