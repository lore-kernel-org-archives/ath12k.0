Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4075C25B75
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 16:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcbpX5c5QniOODrVoHtbsCIRxrVUpkToVewsQMFoqmI=; b=Mne0mKyVkWM6hEJFrjZh6ZNRrJ
	INi0mjadx9TI8F27JL6xqxksMu4UJQpM+qX9UJXlGJR6sWvQFZxbc9isTWgMfsL1tBjPCTyPE/0gS
	7A+P2Oyr2t71auI2x1MUA4Mk5Y1cBQT8cApylDoqs7V45YkvUMz4W/IKz9eTBsJ7la7C3r1KhIGYV
	N1for1GhJb2ybwQRXy3ol4Br0rLTOQVbgBQKpBDXQqORXaVSqdF9uD7SRAou4E4oN+NvWkRQ/tM0C
	ii3BZ7poA3+sk1uNuywK8HWOuCFltXyhYYcIMgNeXYqZJblD0qvx4Xi+qyT0CQWrGoz8OvzqYpZ2x
	oRHnKr4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCMEG-00000004wCU-2umX
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 16:32:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCMEE-00000004wAQ-06cm
	for ath12k@bombadil.infradead.org;
	Wed, 29 May 2024 16:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GcbpX5c5QniOODrVoHtbsCIRxrVUpkToVewsQMFoqmI=; b=c3Tus31lR1mkPwHGwr8jYcW6qT
	/jpwuSIxHY4lMhIJxipgFHb/CCI0gn3cmXe94VQ4OMDG3N1j/rga03Jp427uDxIxnsT9wN/9Uke0B
	r+H4LgrXinE/qmNJDHVsOy2dy0R2vbt/tWb7BPMhSA/XwHRSLDHk5HYuFpuRthA9VOA3z1JY25tZ4
	LUIJJUjJj6kPPqlWiplfEb2RPZeBpsWU+88MNem5nK8Pv77EfBzEpHOecFGsDh3KvhmOtT11dDcOW
	7C/L6C6KKUi3cGtKgZ0TkpfT3JBwLNW1FTcwWwrSTEQqUbyLMjnKZwzMPoLeOjMSvxPrYGIr/HQCz
	FGTWQnKQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCMEA-0000000DwAm-1MWH
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 16:32:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TBGj7Y018130;
	Wed, 29 May 2024 16:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GcbpX5c5QniOODrVoHtbsCIRxrVUpkToVewsQMFoqmI=; b=GIsaY+/JvuTPaJWi
	+9cSu8WDuLq0fxOhJO7DFayR+9u54N95g9nEDgpxwdxlabRg9lahSxI/APKvtv5m
	FeLLJfqLJSMrujkUQmD3Bu7kyfMX4sSFnVo7striMk9yPC2hGrmwVsBWzf4IFThW
	rbXzHxVru8HfEd2yeIKJDpr8fq9mGFtpKzJT0q+1XZNNOTp4vHU9PUlmafvx28f0
	uMpubqt2V1jSPTkthToDnzZNvkqQ7u/gRbdXRoTq85r3b5400Mj9QLYCV+ZuuRQK
	kOvY9147rqmL0xr/9wSJUBtCRuFloP9a/zR+0yA+D5OTbUilFfpWbHACZ2rx4dtT
	1rcHUg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qhg8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 16:32:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TGWNap021639
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 16:32:23 GMT
Received: from [10.110.122.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 09:32:23 -0700
Message-ID: <6c95d8e2-c8f7-4ef4-ad17-46480bca27fd@quicinc.com>
Date: Wed, 29 May 2024 09:32:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix WARN_ON during firmware crash in
 split-phy
Content-Language: en-US
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240529034405.2863150-1-quic_aarasahu@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240529034405.2863150-1-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: i4a54sxiXLBKIm1dPrERTf-FKp8ZtFxy
X-Proofpoint-ORIG-GUID: i4a54sxiXLBKIm1dPrERTf-FKp8ZtFxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_13,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_173238_825990_E2FA4212 
X-CRM114-Status: GOOD (  14.42  )
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

On 5/28/2024 8:44 PM, Aaradhana Sahu wrote:
> Whenever firmware is crashed in split-phy below WARN_ON triggered:
> 
> ? __warn+0x7b/0x1a0
> ? drv_stop+0x1eb/0x210 [mac80211]
> ? report_bug+0x10b/0x200
> ? handle_bug+0x3f/0x70
> ? exc_invalid_op+0x13/0x60
> ? asm_exc_invalid_op+0x16/0x20
> ? drv_stop+0x1eb/0x210 [mac80211]
> ieee80211_do_stop+0x5ba/0x850 [mac80211]
> ieee80211_stop+0x51/0x180 [mac80211]
> __dev_close_many+0xb3/0x130
> dev_close_many+0xa3/0x180
> ? lock_release+0xde/0x420
> dev_close.part.147+0x5f/0xa0
> cfg80211_shutdown_all_interfaces+0x44/0xe0 [cfg80211]
> ieee80211_restart_work+0xf9/0x130 [mac80211]
> process_scheduled_works+0x377/0x6f0
> 
> The sequence of WARN_ON is:
> Thread 1:
> -Firmware crash calls ath12k_core_reset().
> -Call ieee80211_restart_hw() inside
>  ath12k_core_post_reconfigure_recovery() which schedules worker
>  for both hardware.
> -Wait for completion of ab->recovery_start.
> 
> Thread 2 (worker thread):
> -One hardware acquires rtnl_lock() inside ieee80211_restart_hw() and
>  calls ath12k_mac_wait_reconfigure() into ath12k_mac_op_start().
> -Hardware is waiting for ab->reconfigure_complete but at this time
>  recovery_start_count value is 1 because another worker thread
>  (local->restart_work) is still waiting for rtnl_lock().
>  recovery_start_count is not equal to number of radios
>  (2 in split-phy). So ab->recovery_start complete does not set
>  due to this, thread 1 is still waiting and not able to perform
>  hif power down up and firmware reload.
> -Wait timeout happens for ab->reconfigure_complete and comeback
>  to caller (ath12k_mac_op_start()) and sends WMI command to
>  crashed firmware and gets error.
> -This returns error to drv_start() and local->started is set to false.
> -Hardware calls cfg80211_shutdown_all_interfaces() after receiving error
>  inside ieee80211_restart_work() and goes to drv_stop(), here we trigger
>  WARN_ON as local->started is false.
> 
> To fix this issue call ieee80211_restart_hw() after firmware has been
> reloaded. Now, each hardware can send WMI command to firmware
> successfully. With this fix we don't need to wait for
> ab->recovery_start completion so remove
> ath12k_mac_wait_reconfigure().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 HW2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


