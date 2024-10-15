Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BE9D1D88D
	for <ath12k@archiver.kernel.org>; Tue, 15 Oct 2024 16:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjKsJQOKyMHGX3oDEW9ZILq+YlIuJebWQPFLX1vJYQs=; b=q8bpUS/hz3gEJooOeURlG0gqlC
	gBaIm4DSXMcdNErW4G/G/jdF8e2T3olJZDSijheppPzAQ0aBJS46ocFanBe2aOC4+1tLiMKJb/27l
	iYSu9kLnAEfUF/9gT2+LRv5nWQRB+3wJsD/1YAX/cUm/Uw4TUmHKDfU6fTH/ko1v5L9FlKWQXFzVi
	8PJUfAqRgkrC5AIgVkyLHj0RCel6gZkIT29RbXagNaUGQWrLNqjFJ838lxLwW/NmFFpz3/y4n1J3G
	IM9ZB/dnPvZfsldEl4IMRLEFd61UCC6KYt8ZqnjledGoJYNVh3Wao8gJHTAGng589GC2/9WTuukCG
	HX6KujEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kYm-00000008taz-2Gmw
	for ath12k@archiver.kernel.org;
	Tue, 15 Oct 2024 16:38:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kYj-00000008tZN-0LIs
	for ath12k@lists.infradead.org;
	Tue, 15 Oct 2024 16:38:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FBS9le031245;
	Tue, 15 Oct 2024 16:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TjKsJQOKyMHGX3oDEW9ZILq+YlIuJebWQPFLX1vJYQs=; b=mgLejmyGhKpCjzLK
	cXmJ/jSudOUR478ZzQD1T0eZsto6N1v3GAtzN6lq2u31xo/iOLnPFTuyejsSCLZ2
	G4kocDeUgxXW2lmBbG4B3BEhaP9xF2ljU4wsmZ1CyUcpc3E0OvY21zRhzdNjnqH3
	KAr+LitNBCsuJTrMna7bJUTcyJeq1IGZvJQXKY/KWc7o5PatCG9mcn6BchTQ1gqh
	I2aVEPvXB5LdhNuVslIA1vvLwIo4OPPpUEU71cd+224i7zHawkxllK4ebHo2OYxD
	2qQ2HbeAnEjeosKLx3p+vMzlBy6eRZp/iicuc+NJkanV0qih6dOeRw1Rc+MOj+dY
	xOpPaA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427jd906mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 16:38:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FGc7Ke010969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 16:38:07 GMT
Received: from [10.48.240.238] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Oct
 2024 09:38:07 -0700
Message-ID: <81f38361-b289-4fc9-8be9-f1fa59195468@quicinc.com>
Date: Tue, 15 Oct 2024 09:38:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] wifi: ath12k: add 11d scan offload support and
 handle country code for WCN7850
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241008065638.1142-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241008065638.1142-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: a1fOGpro587Nu0omuyeIO-zxxZAXqgV_
X-Proofpoint-ORIG-GUID: a1fOGpro587Nu0omuyeIO-zxxZAXqgV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_093809_183184_44023D80 
X-CRM114-Status: GOOD (  13.88  )
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

On 10/7/2024 11:56 PM, Kang Yang wrote:
> This patch-set is mainly does four things:
> 1. Add handler to send WMI_SET_CURRENT_COUNTRY_CMDID to firmware.
> 2. Implement 11d scan offload, and report country code to firmware by
> WMI command WMI_SET_CURRENT_COUNTRY_CMDID.
> 3. Use WMI_SET_CURRENT_COUNTRY_CMDID to set country code for WCN7850.
> 4. Store country code, and update it to firmware after device recovery.
> 
> With this patch-set, WCN7850 can do 11d offload scan and update country
> code to firmware successfully.
> 
> Note: This patch-set is an old patch-set in public review written by
> Wen Gong. Just resend it for him.
> Link: https://patchwork.kernel.org/project/linux-wireless/cover/20230914090746.23560-1-quic_wgong@quicinc.com/
> 
> v4: rebase on tag: ath-202410072115.
> v3:
>     1. use wiphy::mtx lock instead of adding a new lock(patch#2).
>     2. rename struct according to wmi naming convention(patch#1, #2).
>     3. update copyright in reg.h
>     4. modifiy patch#3, #4 due to struct name change.
> v2: change per Jeff.
>     1. change alpha2 length from 3 to 2.
>     2. change wmi_11d_new_cc_ev to wmi_11d_new_cc_event.
> 
> Wen Gong (4):
>   wifi: ath12k: add configure country code for WCN7850
>   wifi: ath12k: add 11d scan offload support
>   wifi: ath12k: use correct WMI command to set country code for WCN7850
>   wifi: ath12k: store and send country code to firmware after recovery
> 
>  drivers/net/wireless/ath/ath12k/core.c |  34 ++++-
>  drivers/net/wireless/ath/ath12k/core.h |  17 +++
>  drivers/net/wireless/ath/ath12k/hw.c   |   6 +
>  drivers/net/wireless/ath/ath12k/hw.h   |   1 +
>  drivers/net/wireless/ath/ath12k/mac.c  | 167 ++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/mac.h  |   7 ++
>  drivers/net/wireless/ath/ath12k/reg.c  |  70 ++++++++---
>  drivers/net/wireless/ath/ath12k/reg.h  |   4 +-
>  drivers/net/wireless/ath/ath12k/wmi.c  | 158 ++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/wmi.h  |  38 ++++++
>  10 files changed, 480 insertions(+), 22 deletions(-)
> 
> 
> base-commit: b9545f4570fcfebe982439de7c9106e55b4bf756

using current ath/main:
Applying: wifi: ath12k: add configure country code for WCN7850
Applying: wifi: ath12k: add 11d scan offload support
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/core.c
M       drivers/net/wireless/ath/ath12k/core.h
M       drivers/net/wireless/ath/ath12k/mac.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mac.c
Auto-merging drivers/net/wireless/ath/ath12k/core.h
Auto-merging drivers/net/wireless/ath/ath12k/core.c
Patch failed at 0002 wifi: ath12k: add 11d scan offload support

Looks like this conflicts with Kalle's locking rework, can you please rebase
again?

/jeff

