Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B02BCCF9E9
	for <ath12k@archiver.kernel.org>; Mon, 27 Oct 2025 03:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yugFEZZSWkfP7XR6u8dKpoHfHUQdVHQorE5yF/x30Zg=; b=l4CKQCu9ktHusklhnbaexoRWNj
	YkwoxZ0uHxoew5DzJ9b7uQGLnd6UavsQyo5CukphqWN3BPSu95N9F2ldaQUSu1q/AEjlhxxGuSJiw
	Q/L2zwd/96RFL+Ms5jFmVkPnl8TJv4RfZvjMMzvZIrM92zWRPYsUt08+5s07CatnyBw8QAiMI9fFf
	2YCdpwy3onAIfxcId2xm2Usfkhmlvi0Qvc76mDHO/+vHsClOMbc3o2fjNby7DxWKIShzmnoq+/X8B
	eUVKugHb+f6nEp5V5lvMDljv0Ldx0XsNrpXltBp51wXBTYNrbH6nUiGpjLPO1ZbmORr89ZB5p5QfR
	Vs2XOcOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDDnG-0000000D3Jl-40Om;
	Mon, 27 Oct 2025 03:21:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDDnE-0000000D3JO-48Kf
	for ath12k@lists.infradead.org;
	Mon, 27 Oct 2025 03:21:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QMwrCk1052123
	for <ath12k@lists.infradead.org>; Mon, 27 Oct 2025 03:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yugFEZZSWkfP7XR6u8dKpoHfHUQdVHQorE5yF/x30Zg=; b=lMuX2Pm2XCEKxLII
	Y0U0GJIznsf56GhhrdhQecNR8kW2Q10bO8/BbX7die2CMnUeskvOFow2aawAO0Nv
	+KU9FnpTXnwi94+UhVXU1XgADAM1Uov0eJEkRO9wMRXzOaC4jJrdMgvsInZvL4Ph
	jhaBfc1gYRGpCGG/jHwUT0FWHtdymwhg+Ev8Z+uwtL0ZmzpDQvKiNFvD+lKm78qt
	prm1J+NhH4DprmFL3+JbvJD2PZRk1XxboiqeMaqDXdQs4c2nAARKlQv2xDs2gGCg
	adenta+pYejIbWu1RlMlcuw+AZDx4tlsH+rEYTja6a7iXhxVl5/Hg75PA7S5excu
	Pc7I3g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a1ud1rfm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Oct 2025 03:21:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-294880e7ca4so69412005ad.0
        for <ath12k@lists.infradead.org>; Sun, 26 Oct 2025 20:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761535271; x=1762140071;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yugFEZZSWkfP7XR6u8dKpoHfHUQdVHQorE5yF/x30Zg=;
        b=GY+z1XcFWdrSp0vwEYOhwRwabFSJkgPsTCnLA+zyPUku5uhZnCmgff2Lnc6nGxN9mx
         77wdPe2y6n0WssU+3uAPO8x3JxCsd1Jlm80P7hp/HuYpIlMkLY9fwxAIJkkqgPSMA0EN
         UQvQC6TnJOHcyaAVq/UBKH020O2t1xgWcX3NY3JZ8S1rbYp6vhl24R4MvYyUwDESozmU
         xeopNYcNX/escoepjIUVOhAS6eHElb0W3hb2DMbnGqNKRmeVZpBW3EV1wKP62aGtFJfA
         N0VhgA1Ur1WZcWo7HhZ2jS6l7N47DNU2LKZfMsD74Nvv894k/ggLNOBnk9HXEuirT1Ry
         xBaA==
X-Forwarded-Encrypted: i=1; AJvYcCVl+LNJOAdWJ/fGqfYIa2K87yxKJnrKWsrYejwlZ0DbhGsfyImA5sWAk8O7LDQD6DedWsH9hog=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz80adfq8k6F2yJYYkzCi14slxlHt4s9f9SmJxc9HZXliNP4C1z
	UDbecqTNBSnOHxupcKT2rUmUwu5ZlEQxlWPpLk+BP5/iO/6Oa3W0FIsOk1nb/4hZPrCcjuiR+GE
	4/hZ2/XHmoVtIGSxJ2v1HCcwlMJio5apl6klJR6TFQn/Z8r9GE3C2A5cbGLVON7Vm
X-Gm-Gg: ASbGncv+HY3qV1Ka+9Fcqp6EOG1PQycEIO0BgxjpU5Jsb9rVKW/HJ03bOJg2bo8+IO6
	hkkz9W3KGyONzopAr9qCqht4UIJLuQODSSYnBybck/S2u5aWyODRWLxD9JdktO+HFpd9LpCdxZR
	tjeMRfNOKLsgQIVP9fDhYNdR/F3GRA2rdnmd93CnN9xq+vwPYG66iCikSUl9+QRQR+gXqCCVcQU
	6SnHXrGx2gkKTTmU0v2aQpe7JvdUXCYvDo0aDZDf/CkeJrZ7pVvoTFlOsz3ZUcXQUrRSQf8KgTl
	SjuabXq5qwyUM4pvYLLzD/pS7PMB/IyYrYDd/A8nLsH+svmMKN2PdqGku/oA7wWwKabKEL5+zfa
	n7v+e8+lz34WWzBOCC2iCqTCrEKcgH16JZCkWEyJLTJkkFzp7ow1Xq08rYPkVea3/dP0cXjhk
X-Received: by 2002:a17:902:ce06:b0:293:11e9:192b with SMTP id d9443c01a7336-2948ba562e6mr113675655ad.42.1761535270718;
        Sun, 26 Oct 2025 20:21:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw0FVH59t3iumLkT6otArROk3B/9hZgM51dvGbVKU2gzakeUfX0AsxXZ/EDwyrQAi7j5JI0w==
X-Received: by 2002:a17:902:ce06:b0:293:11e9:192b with SMTP id d9443c01a7336-2948ba562e6mr113675395ad.42.1761535270204;
        Sun, 26 Oct 2025 20:21:10 -0700 (PDT)
Received: from [10.133.33.216] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40de4sm65243555ad.77.2025.10.26.20.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 20:21:09 -0700 (PDT)
Message-ID: <c082dabc-5ced-4eb8-9c15-0f2de678381b@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 11:21:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng 0/9] wifi: ath12k: Modularization of peer object
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251024181548.3255166-1-quic_rdeuri@quicinc.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251024181548.3255166-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDAyOCBTYWx0ZWRfX98ubFJAoQwJM
 RP9Dk/rF4+9tbY4sUxOZdpZT+102GpM0IztxN3AHg7941VTfCHT26ZVSE9RuSmaZNO9mlfJXP6T
 02HaMCc2Gy4/azoUuL2FZ6pfhV+2zq4Ctw8vYcofmj9dse+RzIkfmOKii1jZ5n4INvNdnX0BPfa
 cFq9DghtMCkalbt2EhOgIGdJmjk8Ces9HBrQZSqcgPZDLTrpK335LeDQctwe+/GY8e+DKx51QDw
 v0oXw8nWmqxM9w41MjEHvFLVnT2RHeAesXU1vpBQS5Z5fU6F1pUYmzDfWJswlJst6bjpk0T6YRY
 flP7B8YmDpPq1XQKatdspTvey8GPjE7Y9hus3FIymmLEg+4ANBHbZ0O89IKquVldhmPCDC0qYgv
 X2lI0Jkptk9yg/eciDePn9TMcZBSPg==
X-Proofpoint-GUID: qnqI3GVxEbdZdUL_8ey00NTxaoTChFsy
X-Proofpoint-ORIG-GUID: qnqI3GVxEbdZdUL_8ey00NTxaoTChFsy
X-Authority-Analysis: v=2.4 cv=UqNu9uwB c=1 sm=1 tr=0 ts=68fee527 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kNLFdMDWvYlnOyC5niMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_202113_038498_B4D4FF2A 
X-CRM114-Status: GOOD (  23.81  )
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



On 10/25/2025 2:15 AM, Ripan Deuri wrote:
> struct ath12k_sta has an array of struct ath12k_link_sta wherein each index
> represents one link of the connected station.
> 
> For each ath12k_link_sta, there is a corresponding data path peer which is
> represented by struct ath12k_peer.
> 
> Diagrammatic view of the station is a below:
> 
>         ath12k_sta
>             |
>             |-> ath12k_link_sta <--> ath12k_peer
>             |
>             |-> ath12k_link_sta <--> ath12k_peer
>             |
>             |-> ath12k_link_sta <--> ath12k_peer
> 
> Currently, in control path, ath12k_link_sta and ath12k_peer are used
> interchangeably, while the data path makes use of ath12k_peer only.
> 
> With ath12k next-generation driver framework, in order to have a clean
> segregation between control and data path, the plan is to use ath12k_link_sta
> only for control path operations.
> 
> Station view for the data path is revamped as below:
> 
>         ath12k_dp_peer
>                |
>                |-> ath12k_dp_link_peer
>                |
>                |-> ath12k_dp_link_peer
>                |
>                |-> ath12k_dp_link_peer
> 
> where:
> ath12k_dp_peer is newly introduced structure and represents the data path
> version of corresponding ath12k_sta.
> 
> This ath12k_dp_peer contains the fields used in the per packet Tx Rx paths
> applicable across all the links and maintains an array of ath12k_dp_link_peer.
> Per packet Tx and Rx path operates on ath12k_dp_peer. This ath12k_dp_peer is a
> standalone new object and has back pointer reference to ieee80211_sta.
> 
> ath12k_peer has been renamed to ath12k_dp_link_peer and the fields which
> are common across all the links are moved to ath12k_dp_peer. ath12k_dp_link_peer
> contains the fields specific to a link and these are mostly for statistics and
> monitor usage.
> 
> Final view of station is shown below:
> 
>             Control Path                            Data Path
>         -------------------------------------------------------------------
>         ath12k_sta                            ath12k_dp_peer
>             |                                       |
>             |-> ath12k_link_sta    <---->           |-> ath12k_dp_link_peer
>             |                                       |
>             |-> ath12k_link_sta    <---->           |-> ath12k_dp_link_peer
>             |                                       |
>             |-> ath12k_link_sta    <---->           |-> ath12k_dp_link_peer
> 
> To achieve this, following set of changes are done in this patch series:
> 1. Refactor functions present in file peer.c in such a way to retain functions
>    operating on ath12k_link_sta in peer.c and move functions operating on
>    ath12k_peer to dp_peer.c
> 2. Rename ath12k_peer to ath12k_dp_link_peer and change find APIs
>    correspondingly
> 3. Add hash table for ath12k_link_sta in ath12k_base
> 4. Move peer linked list from ath12k_base to ath12k_dp
> 5. Add hash table for ath12k_dp_link_peer in ath12k_dp
> 6. Define ath12k_dp_peer structure and APIs for creation and deletion
> 7. APIs for assign and unassignment of ath12k_dp_link_peer to ath12k_dp_peer
> 8. Use ath12k_dp_peer in per packet Tx and Rx path
> ---
> Harsh Kumar Bijlani (8):
>   wifi: ath12k: Move DP related functions from peer.c to dp_peer.c file
>   wifi: ath12k: Rename ath12k_peer to ath12k_dp_link_peer
>   wifi: ath12k: Add hash table for ath12k_link_sta in ath12k_base
>   wifi: ath12k: Move ath12k_dp_link_peer list from ath12k_base to
>     ath12k_dp
>   wifi: ath12k: Add hash table for ath12k_dp_link_peer
>   wifi: ath12k: Define ath12k_dp_peer structure & APIs for create &
>     delete
>   wifi: ath12k: Attach and detach ath12k_dp_link_peer to ath12k_dp_peer
>   wifi: ath12k: Use ath12k_dp_peer in per packet Tx & Rx paths
> 
> Ripan Deuri (1):
>   wifi: ath12k: Add lockdep warn for RCU
> 
>  drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>  drivers/net/wireless/ath/ath12k/core.c        |  12 +-
>  drivers/net/wireless/ath/ath12k/core.h        |  17 +-
>  drivers/net/wireless/ath/ath12k/dp.c          |  48 +-
>  drivers/net/wireless/ath/ath12k/dp.h          |  17 +-
>  drivers/net/wireless/ath/ath12k/dp_cmn.h      |  28 +-
>  drivers/net/wireless/ath/ath12k/dp_htt.c      |  44 +-
>  drivers/net/wireless/ath/ath12k/dp_mon.c      |  30 +-
>  drivers/net/wireless/ath/ath12k/dp_peer.c     | 627 ++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/dp_peer.h     | 125 ++++
>  drivers/net/wireless/ath/ath12k/dp_rx.c       | 151 +++--
>  drivers/net/wireless/ath/ath12k/dp_rx.h       |  19 +-
>  drivers/net/wireless/ath/ath12k/mac.c         | 381 ++++++++---
>  drivers/net/wireless/ath/ath12k/mac.h         |   1 +
>  drivers/net/wireless/ath/ath12k/peer.c        | 439 +++++-------
>  drivers/net/wireless/ath/ath12k/peer.h        | 112 +---
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  47 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |   6 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  24 +-
>  .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |   5 +-
>  .../net/wireless/ath/ath12k/wifi7/hal_rx.h    |   1 +
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  19 +-
>  drivers/net/wireless/ath/ath12k/wmi.c         |  14 +-
>  23 files changed, 1504 insertions(+), 664 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/dp_peer.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/dp_peer.h
> 
> 
> base-commit: 25122460e7f96864a80b59ffe6c953911516d3b3

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


