Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C1EE77188
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 17:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyGuBftR/dVxQ+BEAk+dbg/RI07iGAC4ZV9KJTM70mM=; b=bksxziMHdv4TVZitqKli5gHGxj
	O+9C4QQhGbQd2kbHh9aop1ajGtCJCiALt4hPhKpD2hZSjDr9imLB3UqaZRORQD0k1bVVKPNLWd2vt
	0csUzdXl4NWad3zEDWVMvk6H1j2BP/lKtTRwm1Ej3IcxbKA4pop14PCKGn9UW31Ku3t4mu8sISmPB
	jBSCkxJ1A/IW4xHk3jJtsRBjxJijvZgO2vnRSkidUzQq60cEf+/ReJ/V/x2O4kM5epNka1054wC2Y
	nw4+5353BqHAX06cSqjUPpkeks4AFSO1GyJjBaYZF+c303JcV6TunpMsCQrYCvRCsplf2O6rib8hz
	ftKFBg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWItO-0000000GRwt-0kRZ
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 17:33:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWIpI-0000000GQmr-0RRp
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 17:29:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AFEiVL004032
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 17:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lyGuBftR/dVxQ+BEAk+dbg/RI07iGAC4ZV9KJTM70mM=; b=k8DEC5eXzGoOipj4
	CMQ8kkX+eJhSB2S9MqrNg5xftPIqNH/yyg45z+G6iWQd5vkiLBNtHP1P/AGyQOb3
	PwBz5DXggZzqEEW4XSdeLqwJWsdfM9OoiFCks36H+FBAAocZWiJ+BdXkkBJrHetj
	ZYI/jWFzE4vXGxc80bja70NOEtE3k01lXzCTPdkA4dvEMKJUEKYcf2NC5KBAddlT
	YYsOHQFNWFbmK8atnPT+2Mcr3pB2PkgspQWkrDVcD/r5cKR6NjDD5b9ybTVTSvL8
	Fm28ERknyBwQ1wsaRGHFGhW20XDb99v4uDFNeO3hSco2ZlCLYc17nMzBqFyC+rVT
	e5GgPQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4436188b60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 17:29:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2166a1a5cc4so39103285ad.3
        for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 09:29:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736530178; x=1737134978;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lyGuBftR/dVxQ+BEAk+dbg/RI07iGAC4ZV9KJTM70mM=;
        b=B0t19C6Wrg0TSYS58ewDirIzWlakZgC+vGzN3TKoIld3VbcP46iKYdC5D7V5cSYCuL
         IyYveL8SvSQzu0c+N7KhXTg80uGxD2CAcU7gW8Q+bbeavzTXlk0eUwCumtDtcYWMlx2v
         A9A2KQXnkQDftuRmJOJRQm7udVope2OaJXOp58fAoWGRjbhuyOOQzPYg16Htw3F3RBFE
         +U76VNeBr12cJH108alvj1jdThHgppZ9M5GcHn1ygumhDgs9FUNCSNdLs280eCC24pe1
         FrTCRXz9WVGu9sFhOmGFNvVSOUeMv8fplQRi3E0xRIucdo5HQpeIsroClqszeDMzmzSU
         BSVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQK+m6rhcUDXhtSEksiihdi9nyyvg6HI9rUDOpf3XuXPfHyab6gPFViL5oLKo7i+x8kvBGsGE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwC1LSL6OkgI1EsQWmhaofF6lB1L42HIee049/6f+ZFL5/KrpE1
	cro5twe8whbO9Hs9JFT5xAIAGpa3Q68mQKV85T20FHmKKkVSorewjpFk0L6eIw72+5kcypE6HRb
	C5O6sZanj7BhEDp/sibY3NnnddHRdGw1szeMnHHDY4gjUlRDwtav62Z98bQ1ISqooubgv
X-Gm-Gg: ASbGncuTuyCG3B4XqkC4oyR2y7oHmFb1Gg/Gk3iqWv23JMR7oaxY+V4o1z++eI66XEv
	m6ygtf+u63aW77lDryeFXJQWrtb/MEJZDnNDTbcE5o9a/6s7DsGhqKncJdQEHjqypa5Ekgc5b5z
	scm95doE2qLJewecWUiP50uFvwLeSZnhxjOc2dPpScFmx2AH9pHhZDl1y0+WQtNYdshKnR4n8yU
	Fkc+8fjAK6yzcCXijh1Qc+YySeMf4Xhp4r8axn2zc7Kn5OGdz9Vvg+WJbRXyYnPIwpBJClw8rEM
	6qIp/SRF61Tu7qgUSxG7XJ2cdA3djTK76U8lsBLJzMB0zBoV6A==
X-Received: by 2002:a05:6a00:124a:b0:725:eb85:f802 with SMTP id d2e1a72fcca58-72d21f7f072mr15849269b3a.2.1736530177783;
        Fri, 10 Jan 2025 09:29:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt/J3AXNv5RP0AhLtV1XPz9FEzbX8OGNy/tVKhZaDPesiTzJ8XymACzJ8gqVMsrSrVFIjxPg==
X-Received: by 2002:a05:6a00:124a:b0:725:eb85:f802 with SMTP id d2e1a72fcca58-72d21f7f072mr15849239b3a.2.1736530177282;
        Fri, 10 Jan 2025 09:29:37 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658c4bsm1836573b3a.100.2025.01.10.09.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 09:29:37 -0800 (PST)
Message-ID: <9c8ab4a3-eae1-458c-a47b-66b4475aa3ba@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 09:29:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/3] wifi: ath12k: report station mode stats
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250110064848.790733-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250110064848.790733-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: f2G8Io75a1ZuRKGTnleQxqgIQvdfTj1p
X-Proofpoint-GUID: f2G8Io75a1ZuRKGTnleQxqgIQvdfTj1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_092940_195370_EB96A691 
X-CRM114-Status: GOOD (  14.38  )
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

On 1/9/2025 10:48 PM, Lingbo Kong wrote:
> Currently, the transmit rate, the receive rate and signal strength of "iw
> dev xxx station dump" always show an invalid value.
> 
> This is because ath12k has no logic to handle this relevant information.
> 
> To solve this issue, ath12k parses the information passed by the firmware
> and passes it to mac80211.
> 
> After that, "iw dev xxx station dump" show the correct value.
> Such as:
> 
> Station 00:03:7f:12:03:03 (on wlo1)
>         inactive time:  600 ms
>         rx bytes:       4642228
>         rx packets:     23796
>         tx bytes:       933967
>         tx packets:     8761
>         tx retries:     66
>         tx failed:      0
>         beacon loss:    0
>         beacon rx:      8925
>         rx drop misc:   191
>         signal:         -20 dBm
>         beacon signal avg:      -18 dBm
>         tx bitrate:     1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
>         tx duration:    0 us
>         rx bitrate:     1801.4 MBit/s 80MHz EHT-MCS 11 EHT-NSS 3 EHT-GI 0
>         rx duration:    0 us
> 
> v9:
> 1.rebase to dbe50a7420e2
> 
> v8:
> 1.rebase to 09fa3b6974a1
> 
> v7:
> 1.use switch statement
> 2.use guard(mutex)(&ah->hw_mutex)
> 3.use info0 = le32_to_cpu(desc->rate_stats.info0) and then use u32_get_bits() everywhere
> 4.replace time with time_left
> 
> v6:
> 1.rebase against wifi: ath12k: prepare sta data structure for MLO handling
> 
> v5:
> 1.use ieee80211_find_sta_by_ifaddr() to avoid using base_lock
> 
> v4:
> 1.rebase ath-pending-202404181533
> 2.change ATH12K_EHT_MCS_MAX from 13 to 15
> 
> v3:
> 1.change wmi_vdev_stats_event to wmi_vdev_stats_params
> 
> v2:
> 1.change copyright
> 2.change name according Naming conventions for structures
> 
> Lingbo Kong (3):
>   wifi: ath12k: report station mode transmit rate
>   wifi: ath12k: report station mode receive rate for IEEE 802.11be
>   wifi: ath12k: report station mode signal strength
> 
>  drivers/net/wireless/ath/ath12k/core.h    |   5 +
>  drivers/net/wireless/ath/ath12k/dp_rx.c   |  20 +++-
>  drivers/net/wireless/ath/ath12k/dp_rx.h   |   3 +
>  drivers/net/wireless/ath/ath12k/dp_tx.c   | 139 +++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/hal_rx.h  |   3 +
>  drivers/net/wireless/ath/ath12k/hal_tx.h  |   7 +-
>  drivers/net/wireless/ath/ath12k/mac.c     | 138 ++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/mac.h     |   3 +
>  drivers/net/wireless/ath/ath12k/rx_desc.h |   3 +
>  drivers/net/wireless/ath/ath12k/wmi.c     | 132 ++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wmi.h     |  48 ++++++++

Since you are rebasing in 2025, you need to update copyrights:
* drivers/net/wireless/ath/ath12k/core.h copyright missing 2025
* drivers/net/wireless/ath/ath12k/dp_rx.c copyright missing 2025
* drivers/net/wireless/ath/ath12k/dp_rx.h copyright missing 2025
* drivers/net/wireless/ath/ath12k/dp_tx.c copyright missing 2025
* drivers/net/wireless/ath/ath12k/hal_rx.h copyright missing 2025
* drivers/net/wireless/ath/ath12k/hal_tx.h copyright missing 2025
* drivers/net/wireless/ath/ath12k/mac.c copyright missing 2025
* drivers/net/wireless/ath/ath12k/mac.h copyright missing 2025
* drivers/net/wireless/ath/ath12k/rx_desc.h copyright missing 2025
* drivers/net/wireless/ath/ath12k/wmi.c copyright missing 2025
* drivers/net/wireless/ath/ath12k/wmi.h copyright missing 2025


