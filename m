Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09553C25B74
	for <ath12k@archiver.kernel.org>; Thu, 30 May 2024 17:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqp7b5gbPUCb7BDBFGZkeznY8F+QiHQQD47HaDihL2U=; b=3umgzW/wAPpiboVL7Azg2gaj0G
	0pVsVNZqETQQ1wHxLbQEE8gYDkd5CrsmVKz2tF9srLHccgPosQDEnB1qx4Ci2SVCsxUkemDiO4xjT
	l+xzLa3gGKBlTcFT/HI5pZqie+oVC6owOj3zte9XSKfWbRE0CreqcwYC84W1IYrXh46Bufr8UPkUl
	oGS6YDrascbRPcF8VmkJyTOnXzoY0NVqqQSMWpN5cq/8FXp2RaOZ801ZFspmbBbocbegcze85stMB
	Xxr0mNge8gC0UxSmXBUalV1TXcU1+fYTZ2Fqh6TaAsb2yeybZv5+L5ZCfmQtKbelQogymiy0R5rfe
	iasrRNiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCjqX-000000082O1-38ee
	for ath12k@archiver.kernel.org;
	Thu, 30 May 2024 17:45:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCjqV-000000082NY-0iLE
	for ath12k@lists.infradead.org;
	Thu, 30 May 2024 17:45:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44UGs35V016256;
	Thu, 30 May 2024 17:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hqp7b5gbPUCb7BDBFGZkeznY8F+QiHQQD47HaDihL2U=; b=VWQHWtHlUg17SFV8
	tpbqA4MpggsKVsby/EUOk5W6VDdsKCkntuiTmLI1/gS5OE6kf9ECnwXC6W/pTNus
	D21yJKKjsY2xcnOlRRgYEoG9mEm981zP6uVxQ2XGSojBjBE/ItqW1jfb3wdqfA15
	zHt4X/6Gdw1U6O8T8ICDg4BKKHBHQNZZ3JzQlkfyK5Ra5+edX9a9zrz3nGrC9Iz2
	HWNpdVfuYNMcPE4c0ss6lQ4EMVul2iouPd463ppQqvEGcgLjBg9ts5He/V3JLLvR
	5JyxCs9jaYz/ScBM7w4BgmiYePzYGOUOCShlW0rdhz7jZXHaVqfUmab+CZyj/yXC
	AO4ijA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2nmt6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 17:45:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44UHjhN4008552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 17:45:43 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 30 May
 2024 10:45:42 -0700
Message-ID: <cb66c4b2-eb8b-4698-bc31-1c0410c81588@quicinc.com>
Date: Thu, 30 May 2024 10:45:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] wifi: ath12k: add support for WoW
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240530072714.25671-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240530072714.25671-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1rjXjWoqT08SEwotlQCJ_vSf5Bdg41LR
X-Proofpoint-GUID: 1rjXjWoqT08SEwotlQCJ_vSf5Bdg41LR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_13,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 suspectscore=0 mlxlogscore=892 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405300132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_104547_466571_B0506637 
X-CRM114-Status: GOOD (  14.46  )
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

On 5/30/2024 12:27 AM, Baochen Qiang wrote:
> Add support for WoW (Wakeup on Wireless) funtionalities, this including
> magic-pattern, net-detect, disconnect and patterns, HW data filter, ARP
> and NS offload, GTK rekey offload.
> 
> Also enable keepalive before suspend to avoid unexpected kick out by AP.
> 
> v3:
>  - wifi: ath12k: add ATH12K_DBG_WOW log level
> 	1. new addition.
>  - wifi: ath12k: support ARP and NS offload
> 	1. move ipv6 infomation parse to ath12k_wow_arp_ns_offload() to
> 	   avoid memory leak issue.
> 	2. move ARP/NS related definition from core.h to wmi.h
> 	3. rename ath12k_arp_ns_offlaod to wmi_arp_ns_offload_arg
> 	4. rename some macros
>  - wifi: ath12k: support GTK rekey offload
> 	1. add rcu_read_lock/unlock in ath12k_wmi_gtk_offload_status_event()
> 
> 
> v2:
>  - [2/7] wifi: ath12k: add basic WoW functionalities
>         1. In ath12k_wow_convert_8023_to_80211(), change to use 'size_t'
>            instead of 'int' to make GCC happy
>  - [5/7] wifi: ath12k: support ARP and NS offload
>         1. In ath12k_mac_arvif_get_arp_ns_offload(), change to use
>            GFP_ATOMIC to fix kernel crash due to sleep in invalid context
>  - rebased on ToT
> 
> Baochen Qiang (8):
>   wifi: ath12k: add ATH12K_DBG_WOW log level
>   wifi: ath12k: implement WoW enable and wakeup commands
>   wifi: ath12k: add basic WoW functionalities
>   wifi: ath12k: add WoW net-detect functionality
>   wifi: ath12k: implement hardware data filter
>   wifi: ath12k: support ARP and NS offload
>   wifi: ath12k: support GTK rekey offload
>   wifi: ath12k: handle keepalive during WoWLAN suspend and resume
> 
>  drivers/net/wireless/ath/ath12k/Makefile |    1 +
>  drivers/net/wireless/ath/ath12k/core.c   |   48 +-
>  drivers/net/wireless/ath/ath12k/core.h   |   20 +
>  drivers/net/wireless/ath/ath12k/debug.h  |    1 +

My Qualcomm Innovation Center copyright checker reports:
drivers/net/wireless/ath/ath12k/debug.h copyright missing 2024

>  drivers/net/wireless/ath/ath12k/htc.c    |    6 +
>  drivers/net/wireless/ath/ath12k/mac.c    |  110 +++
>  drivers/net/wireless/ath/ath12k/mac.h    |    4 +
>  drivers/net/wireless/ath/ath12k/wmi.c    |  720 +++++++++++++++
>  drivers/net/wireless/ath/ath12k/wmi.h    |  578 ++++++++++++
>  drivers/net/wireless/ath/ath12k/wow.c    | 1012 ++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wow.h    |   62 ++
>  11 files changed, 2554 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/wow.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/wow.h
> 
> 
> base-commit: 2580be9ee6f5d97d6763b5d4ae4f9c0383fdf130


