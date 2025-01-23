Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B34C02182
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 19:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rp+WoVb4Ir2FS5YckET275G6b9qljQCT2IocqP9kwdc=; b=Ugk2YBLgjcyW4dmmC2XR/2QBRP
	hX6F75/KZrX7ihyeb3bU44pGXWi8oUa7cv8FO+MPXpvETOQqBGUFsUNQBCAwLpCtFdjUzjkGMeV3H
	ZalBHkBA1KY/JbgHBPXeUJXVjgR5nVr7DOk71xVRY2cEXxm6KbKkTRsrcdCDOM9eHgd6KkntDxRlH
	d6/xyY5oxCOoa9mMy2yj/kSEYMaolwnnDvYJqmsh3gGWRPS4GItCq2RKXbT27rM7rw9Gm3RzK4noZ
	d8d8SlAKKg7XOTcO1cLD/cfMyygwDkAoloXH4LBiq1/cCsvqCxHdSZrGrSVwCS4v7LuE7F+TBGTQx
	XUOWFscA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2TE-0000000D57Q-05Mh
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 19:02:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2TA-0000000D56L-2kaT
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 19:02:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NFr8k3031758
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 19:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rp+WoVb4Ir2FS5YckET275G6b9qljQCT2IocqP9kwdc=; b=P+Zo3Y3Ismdxxl5a
	wba/RuENpw0bCuKVYsQ3flfi0SClsBTBA1kW+hdQzQzHMz8jnMX7v5AtmcbXSE9L
	YcXNaFxNGZo3uAapPpfo9NJ8501AdH7eKmRAurQ9yBV49goO0qVERFnEGslKlZnG
	IDV7iARKx8RPQlC5/DaM/2XvhhMZOZXVhGdBUmz9i7HqwZa3yBWM0/8/OG9ED3y4
	SRtUlRWPZwSiEabSpK6BWBZ9bCc5G4D+6RfnARAmYNe1JWh5Ag4xK/fg+wboFplH
	Nkbj+DEx9ZcHhZpgUlpD09EKE/Z+G80QEzMGWaun9UIudIOC8jRd0kXwUCsVnc0u
	0Wg25A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44brsygf3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 19:02:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216266cc0acso41758905ad.0
        for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 11:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737658941; x=1738263741;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rp+WoVb4Ir2FS5YckET275G6b9qljQCT2IocqP9kwdc=;
        b=JJKFEBXNq707YH4rcNEdzR17CfhvYuxjAKZhk56Z9HJNOXUP74UmzMdlMyf2wzwE5J
         mMeUsRYvLy4Uwf7HEKJb24EcYu/PWIXwz/DsCAV4Qe4NJgqbJuxctUp90i9AjxqqTEF1
         UVVD188aKiFH+AETsfLzJ+wJY1+WqIxjZOmkaggF1SARQXiwueOKn0fWpSIBPtsNH6DD
         9Bg/eIde/Lw1ryG4RHTF6ZbgyZK0w+UkPvxv7JhF8z2u81ikEFyvAEPMbCqpO2lsnt09
         OBXcwF84o2M5sH/rwXWvOn9UXnb+B0uXKXwJsLWJuZ2qnXezrKJZrYm0uvbVqVo/2QGl
         SQWw==
X-Forwarded-Encrypted: i=1; AJvYcCX/0h09VTqHw74SoBSK3wejkuuKFBkQR30+cIWgAizklqPktzgWPewOzPiXGQG3BRoUGFEUUsA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7jcZHJiMxHZOt/mamRfG24BPNgnZ1F0Y03GlbiPl220FMH9BG
	orvLN+8kaIQUuFY1K3JFIbIDZw3WDe1b4DNesTT9u7A/5NGsbIRs1VAtryq72smvhPIZQ9uT2Ok
	FywLhXl7ym/7Fh7KV9FAwAN4Kix5otAr6IfllKkiY28An7cztBplbQp2wUuAB
X-Gm-Gg: ASbGnctQmp1z0ZLvwLxZsQE0Pqf/OFhIGyLFkI3DYGhxwXYC+bNhT/BUavWXcHSS2gN
	ai8GDtXl9uQWKKwSQQ5GqAP3T+SW8C5jVImr5PGTSFzAT4KU4tANvfLJSi0kT1mts9CSsH+AFSJ
	+mbK9W7mUvrOqjftyDYIs/bqm7aWhqA4hnBerwTMfTfGnyDk88fBaFZbCoEQAKzQd9S6xMTsQJ8
	YgmwljCtxrSlI5jzMf44CBuF01DDe6PP7O8HjqVXs+UuhNrro77pwnKSJ3dpnkKor3+LRQ4/zjP
	6fiLg2+irl7Ml0njX7ZFg/TOQ4v/ucaMHJX9OC1AxqX+attQkubLR4NsDoYjB+o=
X-Received: by 2002:a05:6a20:7492:b0:1e0:c166:18ba with SMTP id adf61e73a8af0-1eb69731123mr6251858637.12.1737658941508;
        Thu, 23 Jan 2025 11:02:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFsxRN1zIKOddGbZZ3gkr0+K9prBCVrNuMXjlsd75VaNlfXAy9k4RP0v2eUsb7d6SR3hhwrg==
X-Received: by 2002:a05:6a20:7492:b0:1e0:c166:18ba with SMTP id adf61e73a8af0-1eb69731123mr6251816637.12.1737658941020;
        Thu, 23 Jan 2025 11:02:21 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b31besm295407b3a.54.2025.01.23.11.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 11:02:20 -0800 (PST)
Message-ID: <a889082f-67eb-45d1-bef9-dc6b9486ff29@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 11:02:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Add support for link specific datapath
 stats
To: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250110205912.2585850-1-quic_bmahalin@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250110205912.2585850-1-quic_bmahalin@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UhG12_Tfgl2nmbal2e8FvlNhmiShXEJv
X-Proofpoint-ORIG-GUID: UhG12_Tfgl2nmbal2e8FvlNhmiShXEJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_08,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_110224_840305_873A3EEE 
X-CRM114-Status: GOOD (  11.80  )
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

On 1/10/2025 12:59 PM, Balamurugan Mahalingam wrote:
> Add support to record the number of frames enqueued, hardware
> descriptor type, encapsulation/encryption types used, frames
> dropped and completed. This is useful for understanding the
> datapath performance and tune the peak throughput.
> 
> The link specific stats can be viewed through the below debugfs file
> 
> cat /sys/kernel/debug/ieee80211/phy0/netdev:wlan1/link_stats
> link[0] Tx Unicast Frames Enqueued  = 9
> link[0] Tx Broadcast Frames Enqueued = 78689
> link[0] Tx Frames Completed = 78698
> link[0] Tx Frames Dropped = 0
> link[0] Tx Frame descriptor Encap Type =  raw:0 native wifi:78698 ethernet:0
> link[0] Tx Frame descriptor Encrypt Type =  0:78698 1:0 2:0 3:0 4:0 5:0 6:0 7:0 8:0 9:0 10:0 11:0
> link[0] Tx Frame descriptor Type = buffer:78698 extension:0
> ------------------------------------------------------
> link[1] Tx Unicast Frames Enqueued  = 0
> link[1] Tx Broadcast Frames Enqueued = 78689
> link[1] Tx Frames Completed = 78689
> link[1] Tx Frames Dropped = 0
> link[1] Tx Frame descriptor Encap Type =  raw:0 native wifi:78689 ethernet:0
> link[1] Tx Frame descriptor Encrypt Type =  0:78689 1:0 2:0 3:0 4:0 5:0 6:0 7:0 8:0 9:0 10:0 11:0
> link[1] Tx Frame descriptor Type = buffer:78689 extension:0
> ------------------------------------------------------
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
> ---
> 
> Depends-on : 
> [PATCH 0/2] wifi: ath12k: Add support for MLO Multicast Handling
> Link: https://lore.kernel.org/all/20250109184932.1593157-1-quic_bmahalin@quicinc.com/ 

The dependent patch still applies cleanly to ath/main and is now in pending.
However this patch doesn't apply cleanly on top of that, so please rebase.

* Applying 20250110_quic_bmahalin_wifi_ath12k_add_support_for_link_specific_datapath_stats.mbx 
Applying: wifi: ath12k: Add support for link specific datapath stats
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/core.h
M       drivers/net/wireless/ath/ath12k/dp.h
M       drivers/net/wireless/ath/ath12k/dp_tx.c
M       drivers/net/wireless/ath/ath12k/mac.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mac.c
Auto-merging drivers/net/wireless/ath/ath12k/dp_tx.c
Auto-merging drivers/net/wireless/ath/ath12k/dp.h
Auto-merging drivers/net/wireless/ath/ath12k/core.h
Recorded preimage for 'drivers/net/wireless/ath/ath12k/mac.c'
error: Failed to merge in the changes.
Patch failed at 0001 wifi: ath12k: Add support for link specific datapath stats


