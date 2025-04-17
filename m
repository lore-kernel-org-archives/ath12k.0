Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB53DC369B2
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 04:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzMOv8SgZJGivEHxR/VptP0a3kYs6RFFGPNr8etd3KQ=; b=4KJiuTROWfsc/dr0fOgmRLmRJL
	J0kk2dXEUZ804FrWlvu4Cz6J1zzuWhsDRDO28gcSUaVm8cjlbfG2d4eemdIxIJA89s6Zrh16ohUCY
	T1+uhrIwh1pchFGapZUKcsZBtk35EH1iiYh8s6nAx6A7vf2PUyT3Kc50B0qJ6k3+uHONI2ozkv5/o
	2DNIr2gIBSWaqspwf+yRb15Ujgfrzkmp6uqW4mqDi7cg5eUBecB4i9TMlZrnadjNIFWTc/w6BzERf
	tNS5M8xMjCm4KiaUxwz9oe7UjKqdxBf4x3l1mf8lQT+eDdSgAtFBdwrhMo90LKUkM57NdWwnzyua4
	O3F4LknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5HE7-0000000BiDq-1Fi5;
	Thu, 17 Apr 2025 04:51:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5HE4-0000000BiDP-3Jfg
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 04:51:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMCTLi029857
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 04:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UzMOv8SgZJGivEHxR/VptP0a3kYs6RFFGPNr8etd3KQ=; b=cP6AgNNQCcfmPS+X
	HRS2SKnTdkuSdsLheCS2PyMxR8gCNOAeoL1Zv52gQYeLDwZV53TFCKCmPw7pe2u9
	3w9Rw+lG4KP/xOPHvM39tzB2b8hoYWR/1ObGpwmkkQk/indNRvVVdLRhhJtLNUoD
	kiJJ1u+ITsSyOlo5DMs2H10YcPssrPoksX0a4sPe6cmI6w7auvZEglyPNaj20T0K
	e2TU/W5X2BM1y6r78BpBpHLROaxUY9kruPJwoaiWfe7oUtinah658ynICcm0fMgS
	2rlPXW15acVW1GRvHtWlUKmVbc4AXC/JhbqbIsb4jDZ8Wz0hpr1pMjVDLb8YWXue
	fFnA9g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk5j9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 04:51:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-739525d4d7bso273391b3a.2
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 21:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744865506; x=1745470306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzMOv8SgZJGivEHxR/VptP0a3kYs6RFFGPNr8etd3KQ=;
        b=R3C1Rxx/iAuYPITsAKAXnR/nubEo3vkaNk7TLEn0/pXQGzvbCIkigjNF1lca412szx
         PXRMiyrNd6n3hukp6ezosVOAWe5pqpWoyrah9RLaRQsqGTwMUcQiwl3sxI2q6jkVuNFR
         6q8U/ePpPLYPJqDozXDhVQZ4gPWx2FT9BCra36QcXUlcoiaJfTyfzCtk6C9qLUza/Joa
         j5hHkbXtWQJuxDHRKFBe0Wi2P+jng2PrlevZVKdeUONoVKnePeGZv7KOvV6Tb75Y2Ny7
         +ISN3+/EHTx50I/ByX5qxMn4q4rt/8PTU4OtXjOCiAKc/ELP/tlYB9rtEDvjYLglwRGR
         03GA==
X-Forwarded-Encrypted: i=1; AJvYcCV11grHzoGYspMrbpdWFSmxlUIOitsWzRd4NtYAPuBMQbcFBrUhpT3lIXM47frcXjgRhApYaCU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2PL5kpx0QL9O1T8Bicf/qu7QnH/4zwyL+mlTKV0UWWi2ACsoK
	GCjMgFeKX0lOz6UnTRy7qutAndxraMPaWwBnrgaQc9ONSxzjAPJUJUyDZucQBKqUAn75uSFImav
	ZTeCIyuYWelfN4UISvOPYAQXIqyExjJYv1imzURl3ZbW7PXrnVD9EwSH5T9ouj7Dm9+0n
X-Gm-Gg: ASbGncubKhczyAVTwUZTPBuMs6Ogrr74gZMln+hl2CQn7HozB+Vq79w05HwHi/vG/Le
	SlCgKZo6BgvwLmNSb6rmVX5w6musc3FsfGGXGV3ZsmUldZaV+rjlfRwXwPubKxKZw8rMjjcfxDD
	yZGnl5ZeIN/1FAr8mLn7UTOlHU+odK4Ebrd4NMRsgz9MbuL7CqzxFHSJ7kZC3szSAqDCGZXPMJi
	KftozxpqQEoBV+ZOtcYbzJNXP5g2lsOIowLh9MWCY7BTS3V014kWYTDPT4rY30ZBIIRhX66UUzy
	EF1IvO90n4y2O84mbKeEPfXqUW81L4zbUdkdrtIOWK6mBA9i6Y4=
X-Received: by 2002:a05:6a20:9f0a:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-203b3ffb6fbmr7460310637.36.1744865506543;
        Wed, 16 Apr 2025 21:51:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcbo3BNjW3fX+SUNT/uTY1drXWRRK4WxThKide/oG1hNfmAP9eKfrm59NgdcaOP4ll1j55XQ==
X-Received: by 2002:a05:6a20:9f0a:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-203b3ffb6fbmr7460280637.36.1744865506163;
        Wed, 16 Apr 2025 21:51:46 -0700 (PDT)
Received: from [10.152.194.206] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230de24sm11642290b3a.136.2025.04.16.21.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 21:51:45 -0700 (PDT)
Message-ID: <0f52f9ab-1696-42a1-b673-96c60f757361@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 10:21:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: avoid deadlock during
 regulatory update in ath12k_regd_update()
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250408-rtnl-deadlock-v3-1-fdc12bc511ea@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250408-rtnl-deadlock-v3-1-fdc12bc511ea@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=680088e3 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9Z3WbG_t_BtRUmuvTSMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IPQ37qjVTJ3A0wXLU2XG2vE_KtPObk-Y
X-Proofpoint-ORIG-GUID: IPQ37qjVTJ3A0wXLU2XG2vE_KtPObk-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_215148_840220_1C6F0428 
X-CRM114-Status: GOOD (  22.69  )
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

On 4/8/2025 11:09 AM, Baochen Qiang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> Running this test in a loop it is easy to reproduce an rtnl deadlock:
> 
> iw reg set FI
> ifconfig wlan0 down
> 
> What happens is that thread A (workqueue) tries to update the regulatory:
> 
>      try to acquire the rtnl_lock of ar->regd_update_work
> 
>      rtnl_lock
>      ath12k_regd_update [ath12k]
>      ath12k_regd_update_work [ath12k]
>      process_one_work
>      worker_thread
>      kthread
>      ret_from_fork
> 
> And thread B (ifconfig) tries to stop the interface:
> 
>      try to cancel_work_sync(&ar->regd_update_work) in ath12k_mac_op_stop().
>      ifconfig  3109 [003]  2414.232506: probe:
> 
>      ath12k_mac_op_stop [ath12k]
>      drv_stop [mac80211]
>      ieee80211_do_stop [mac80211]
>      ieee80211_stop [mac80211]
> 
> The sequence of deadlock is:
> 
> 1. Thread B calls rtnl_lock().
> 
> 2. Thread A starts to run and calls rtnl_lock() from within
>     ath12k_regd_update_work(), then enters wait state because the lock is
>     owned by thread B.
> 
> 3. Thread B tries to call cancel_work_sync(&ar->regd_update_work), but
>     thread A is in ath12k_regd_update_work() waiting for rtnl_lock(). So
>     cancel_work_sync() forever waits for ath12k_regd_update_work() to
>     finish and we have a deadlock.
> 
> Change to use regulatory_set_wiphy_regd(), which is the asynchronous
> version of regulatory_set_wiphy_regd_sync(). This way rtnl & wiphy locks
> are not required so can be removed, and in the end the deadlock issue can
> be avoided.
> 
> But a side effect introduced by the asynchronous regd update is that,
> some essential information used in ath12k_reg_update_chan_list(), which
> would be called later in ath12k_regd_update(), might has not been updated
> by cfg80211, as a result wrong channel parameters sent to firmware.
> 
> To handle this side effect, move ath12k_reg_update_chan_list() to
> ath12k_reg_notifier(), and advertise WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER
> to cfg80211. This works because, in the process of the asynchronous regd
> update, after the new regd is processed, cfg80211 will notify ath12k by
> calling ath12k_reg_notifier(). Since all essential information is updated
> at that time, we are good to do channel list update.
> 
> Please note ath12k_reg_notifier() could also be called due to other
> reasons, like core/beacon/user hints etc. For them we are not allowed to
> call ath12k_reg_update_chan_list() because regd has not been updated.
> This is done by verifying  the initiator.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Co-developed-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

