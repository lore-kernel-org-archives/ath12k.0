Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C029CCF9E0
	for <ath12k@archiver.kernel.org>; Mon, 27 Oct 2025 07:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fseerEKgqzrw0vcTSs3SD7JIOJTePWS9S/GRHHk6XtM=; b=ojYquScR39zGs8XNxeoeDl8NQn
	Bc1mL7IxovJ4ybbuK1z/ZTZuIEtRPROmtEbpjaODmkFuHnufIXl9igJdof1jWqWp6K9cbSEQ0sul0
	GA1SS795YVAYwDyxmYdOVO9RCU9/piz2vFl1aKaBEmvp2wuDbyytW12j7KGDsKYLJG0KRPzfGrZsw
	TfrncsM4mxsTQElWaaeHGcMYvDu0oUTy+u650KItmMIZWHiDFIWnzI+DFTn+KM+R9s2S50rhk94zM
	9QMcj5gDE2I+TM6ONq8r03ut2TOcLhLRf+z9mJNkDW9+UkdM3VfS0/x1BbxMYx/3B91BAFg22JFDX
	c9zrb90Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHgU-0000000DHEy-1744;
	Mon, 27 Oct 2025 07:30:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHgR-0000000DHEE-20mb
	for ath12k@lists.infradead.org;
	Mon, 27 Oct 2025 07:30:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QMBPOn956986
	for <ath12k@lists.infradead.org>; Mon, 27 Oct 2025 07:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fseerEKgqzrw0vcTSs3SD7JIOJTePWS9S/GRHHk6XtM=; b=AJcDMgAGeut/Vrqd
	gF2vIoNSeQD50iy1e9rahMxBLBZX5PhhUOBUSdQplkAfeonVRUDxeqXIJ0To6U7Y
	V2Fyc+sYeU3Y5GzlxZoqZkLGpvIsAGZzTwt+gFmMFzWlfH8W7UCP0uZ0dzSZmmfS
	vGUQS78sW3yuLb/XtO/sa1t66WthXep4d8ZvPmtz4avqFLjj+KzViiajUQ+HViIV
	y8/wEe267+Ri0x9awf9SUWJ9rpVfUo+mATZ5TS63Oowu7X0YsqzX5LF0auST03H+
	piNsVxAzdcvga/LXhK39MkglhScjkU4ps+1kNPW00laLvRmerkLHH0Tah3JnSrH2
	SJfkxA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p2q3nt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Oct 2025 07:30:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c1d4853ddso120041966d6.0
        for <ath12k@lists.infradead.org>; Mon, 27 Oct 2025 00:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761550225; x=1762155025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fseerEKgqzrw0vcTSs3SD7JIOJTePWS9S/GRHHk6XtM=;
        b=LSdHAAAJ/616iEA2okcfC7h/QttL+VzEHi43r2Yd83+sbZDIT45gAnDL7F/gXIixfd
         4GfAJO94c5A2fktFUZeYiBiCB7zZ+pJgDuQZ7ePYILTtkQrbaprWgYAjIp4h3tnkhOXr
         W0QwXlQsffRzxxPsTfgKJI810P+iq5l2kOFsrD4o1j1xwHzutARIrjPu/LX6ek0SYD8M
         w+DT8FzMHJtFamMXczMwUkN6OvltR7U2894/Q3zhjDj2lm/vo4SjqgiTU5efku+KRbpV
         0M+0x7HFVGefQZMj4gTma7M8Q5sg+A+4N9lGsng9bR6tfPEVfyC9yI3HZ+qRasUB8Aof
         gS4g==
X-Forwarded-Encrypted: i=1; AJvYcCXSD3p+u621yCfsWIN0njHhxTjNdyxeGimNuLTylYUioRJxS2waeLwzqOekNRUHr6xLUkHOEPM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBo2B0jUcv8+6zHyLuCaD9QUJoJ+YxmgFbBmLQMOeB7wnqrk0r
	XOCj6iOhB3kDbXf8N1CLcmanzKm/YRh+Hgua42SEFCiTv4e3A3dlwJFPC3nuEvOFPaD4r9KsYLL
	jVDknlHUP2MH9uA/TTWDewmkvKYFs2FQQSbMxtVCxvlypgJwe15iU7oVIP7SsLD2kRPnl0Od/
X-Gm-Gg: ASbGnctDPEspewTYhqZ+L8cNmmMkxguTUcx+xQvgGsqiWt1qrmFMB/z9Sb4xSJeGRgq
	jCFmjvEeac4uKFdzUhtk/Q2hR0NBY2t/bRLRNe1MZmfqAv6bYQ4aJvSexZ271yXNLFwl0Nj91hW
	aFgxDAd7N276BEP4dwSw9zi6tmUMI88HPIVmHhBb9vyRNWa0/p8WU855L9Qi5DBETYE3q2fW1uj
	pRDn2dlxd6cuwkRW+rEbTvkZCzoap3zFBB4iMCetrfgZmoSOJqiWOKzDqVW0LkW2iwWpmB+bh6j
	QG3DFfOYflPEFF2235mCxNZz8BWJFa0ndf9DgeI91zvhYAxMRdeJsw7nC1nv3zXX1QYgP7PSnCt
	5Ews0C6ERF1JdKYLBotaWVM9a8V4uwwlsiPdK322QaStk
X-Received: by 2002:a05:6a21:339f:b0:32d:b924:efdc with SMTP id adf61e73a8af0-33dead4c184mr14454782637.36.1761549616088;
        Mon, 27 Oct 2025 00:20:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0X8mJy5YWdQz2Yc8elWfoJ5MDivNok1CbxKfg+gEBCPZps6FV7o9YJmJHkmQ76O1g6CMvNg==
X-Received: by 2002:a05:6a21:339f:b0:32d:b924:efdc with SMTP id adf61e73a8af0-33dead4c184mr14454747637.36.1761549615520;
        Mon, 27 Oct 2025 00:20:15 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71288857c6sm6187911a12.18.2025.10.27.00.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 00:20:15 -0700 (PDT)
Message-ID: <ea8f8013-7f38-9255-4383-ad112ab79372@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:50:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath12k-ng 0/9] wifi: ath12k: Modularization of peer object
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251024181548.3255166-1-quic_rdeuri@quicinc.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251024181548.3255166-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QvpTHFyd c=1 sm=1 tr=0 ts=68ff1f92 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=XqnS_aCHDDeeCFjmF_sA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA2OCBTYWx0ZWRfX5xj34DCGWLue
 UZBPJ/hGTrxK9h429kvARRIq6vhOKO4fd3V+2NbV0V0dIDA2YhHBnFC1cDtSE8Uo4HL3SJLpN6N
 GQNJfrv+TW+Lv5E5EztSucccfPkb3woQUles5p4IOI19jqU76+qRvVakc03lu0EHz5P+POu3OHL
 xLashj5LZ4w4Nzok83nH5Jf59k4pfr6/kY8aJSS62e/draJkQudeRvaWr+p1mNr2A5dAGSLNFM/
 XvxbPK4glRHc+GrXxUfCan7WQpQFcfKa31kGicJ3stpm4EhJvTnSEzG65WlPTjgL0PBJ2jjJBRY
 a4uhAdROgo9HO14qGw7tARE7rJr4o7koHQ6Kf8enHgG3K+Z40EKezKhOq/HmBNchZs4o+WTPxoN
 Ic0ugRS/gXgPMXB9kHDESicQfjAm/w==
X-Proofpoint-GUID: 2hcT3YTdsfVYWulZrom8gnarJE1J8Sp5
X-Proofpoint-ORIG-GUID: 2hcT3YTdsfVYWulZrom8gnarJE1J8Sp5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_003027_533713_C97FBFF8 
X-CRM114-Status: GOOD (  23.51  )
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



On 10/24/2025 11:45 PM, Ripan Deuri wrote:
> struct ath12k_sta has an array of struct ath12k_link_sta wherein each index
> represents one link of the connected station.
> 
> For each ath12k_link_sta, there is a corresponding data path peer which is
> represented by struct ath12k_peer.
> 
> Diagrammatic view of the station is a below:
> 
>          ath12k_sta
>              |
>              |-> ath12k_link_sta <--> ath12k_peer
>              |
>              |-> ath12k_link_sta <--> ath12k_peer
>              |
>              |-> ath12k_link_sta <--> ath12k_peer
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
>          ath12k_dp_peer
>                 |
>                 |-> ath12k_dp_link_peer
>                 |
>                 |-> ath12k_dp_link_peer
>                 |
>                 |-> ath12k_dp_link_peer
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
>              Control Path                            Data Path
>          -------------------------------------------------------------------
>          ath12k_sta                            ath12k_dp_peer
>              |                                       |
>              |-> ath12k_link_sta    <---->           |-> ath12k_dp_link_peer
>              |                                       |
>              |-> ath12k_link_sta    <---->           |-> ath12k_dp_link_peer
>              |                                       |
>              |-> ath12k_link_sta    <---->           |-> ath12k_dp_link_peer
> 
> To achieve this, following set of changes are done in this patch series:
> 1. Refactor functions present in file peer.c in such a way to retain functions
>     operating on ath12k_link_sta in peer.c and move functions operating on
>     ath12k_peer to dp_peer.c
> 2. Rename ath12k_peer to ath12k_dp_link_peer and change find APIs
>     correspondingly
> 3. Add hash table for ath12k_link_sta in ath12k_base
> 4. Move peer linked list from ath12k_base to ath12k_dp
> 5. Add hash table for ath12k_dp_link_peer in ath12k_dp
> 6. Define ath12k_dp_peer structure and APIs for creation and deletion
> 7. APIs for assign and unassignment of ath12k_dp_link_peer to ath12k_dp_peer
> 8. Use ath12k_dp_peer in per packet Tx and Rx path
> ---
> Harsh Kumar Bijlani (8):
>    wifi: ath12k: Move DP related functions from peer.c to dp_peer.c file
>    wifi: ath12k: Rename ath12k_peer to ath12k_dp_link_peer
>    wifi: ath12k: Add hash table for ath12k_link_sta in ath12k_base
>    wifi: ath12k: Move ath12k_dp_link_peer list from ath12k_base to
>      ath12k_dp
>    wifi: ath12k: Add hash table for ath12k_dp_link_peer
>    wifi: ath12k: Define ath12k_dp_peer structure & APIs for create &
>      delete
>    wifi: ath12k: Attach and detach ath12k_dp_link_peer to ath12k_dp_peer
>    wifi: ath12k: Use ath12k_dp_peer in per packet Tx & Rx paths
> 
> Ripan Deuri (1):
>    wifi: ath12k: Add lockdep warn for RCU
> 
>   drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>   drivers/net/wireless/ath/ath12k/core.c        |  12 +-
>   drivers/net/wireless/ath/ath12k/core.h        |  17 +-
>   drivers/net/wireless/ath/ath12k/dp.c          |  48 +-
>   drivers/net/wireless/ath/ath12k/dp.h          |  17 +-
>   drivers/net/wireless/ath/ath12k/dp_cmn.h      |  28 +-
>   drivers/net/wireless/ath/ath12k/dp_htt.c      |  44 +-
>   drivers/net/wireless/ath/ath12k/dp_mon.c      |  30 +-
>   drivers/net/wireless/ath/ath12k/dp_peer.c     | 627 ++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/dp_peer.h     | 125 ++++
>   drivers/net/wireless/ath/ath12k/dp_rx.c       | 151 +++--
>   drivers/net/wireless/ath/ath12k/dp_rx.h       |  19 +-
>   drivers/net/wireless/ath/ath12k/mac.c         | 381 ++++++++---
>   drivers/net/wireless/ath/ath12k/mac.h         |   1 +
>   drivers/net/wireless/ath/ath12k/peer.c        | 439 +++++-------
>   drivers/net/wireless/ath/ath12k/peer.h        | 112 +---
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  47 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |   6 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  24 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |   5 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_rx.h    |   1 +
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  19 +-
>   drivers/net/wireless/ath/ath12k/wmi.c         |  14 +-
>   23 files changed, 1504 insertions(+), 664 deletions(-)
>   create mode 100644 drivers/net/wireless/ath/ath12k/dp_peer.c
>   create mode 100644 drivers/net/wireless/ath/ath12k/dp_peer.h
> 

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

