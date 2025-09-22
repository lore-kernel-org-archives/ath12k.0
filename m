Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFFDCAC592
	for <ath12k@archiver.kernel.org>; Mon, 22 Sep 2025 05:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4t2MbPKeeyTCerO+jZq2CMDKEJKFkfNJ8eZh5BM34mc=; b=T5z1TCrkrq4BYzf4ZwCbgrGAYy
	EN3zI/BVMJ6HUhRUXI7ja7euU4NZ76ibCiHJk6YlBtt9bP8vkl+z7+4HFAAJv/a4knzAajtR04AVk
	2pQjR+ecXPzR6L7V0/lrKQl+AB8qjw81RkGsHNXjFbzNnqen06wqRedQwRNlAhGJD5x4qQu4Cdfzr
	ZCmYsFepsO8tWMIEBhbeTk9tUG8G5R2cfbTnKEohkJsWJWyFqyJDs9en1KFEEhOucOBS9a99+nVG7
	zdtcvGN6k72g0KdtlHNXzwQqRFxpCleSvWCYlVCalMi/AIKQp/sqkup2ItlwVHenpbaar/xJTzMW5
	mxPQ+VeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Ysk-00000008qtM-44Ob;
	Mon, 22 Sep 2025 05:14:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Ysh-00000008qsw-1bXJ
	for ath12k@lists.infradead.org;
	Mon, 22 Sep 2025 05:14:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LLdRes002069
	for <ath12k@lists.infradead.org>; Mon, 22 Sep 2025 05:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4t2MbPKeeyTCerO+jZq2CMDKEJKFkfNJ8eZh5BM34mc=; b=ivHhLo6QlpOPXuHo
	Wsuj+7nqsenYgGnx1ZJTcHbwvqN6vlNNvl4IAztNeIR2D76s1U3p8oSlK+YPGJV6
	imDhCy9mCwVXjKVnA5XACMMrowDS6P6NtuzAIFtxRuaST5FfQM+Kzt9Oxt4rbWTB
	IJ8OeZoIr+Ir0vHpHdfjo1RNWD975b73R33uFtxhNSdf5X4BUC32tyKD/0DTu9Je
	6YSvqOly4xhNpjuZNyDNkm5mzzm+rP2/wJvhegYwnRk0q8dNzNtnbfImVheGKiCC
	ouKzBoFWqsNnj4b8R/2ZKO08SHjA1Sm9ot8MPyXwe+9bUBtrTnKMX3lbaDPaz3x9
	yablJA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499nj8uaf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 22 Sep 2025 05:14:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f2191717fso718939b3a.2
        for <ath12k@lists.infradead.org>; Sun, 21 Sep 2025 22:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758518069; x=1759122869;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4t2MbPKeeyTCerO+jZq2CMDKEJKFkfNJ8eZh5BM34mc=;
        b=TxUtAcQcwcVEDrP68y6cSynPgkrn7M9tWYDFjs6MTkKQLQLuUzwd7P+Oj2CPCXoL7k
         8vPAUAbZi7onyUVulOrbVAovBzUDTeVHdjSna6I5ejsZAZugL6zQF984S6zVdLJFlNtN
         p18E5Bi09qavyfygaHFZOBG1w1JiE1zDMngTIPXvamer7gPZ2ptVhtp3/FdCDX8k9K8p
         f4VBLUqkZml/b02vwxS/sY92X+N4tJc5q/ytflWt0ec70YF7zJuDnt0ZlNIcTe8dVKI/
         VxCp6D4/mRlz5au5nksCc1hsqWrreKPR3PT3dyXRoYHXNcY2O+TbqAW5Lz8bB/yX2whO
         5HFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZzHmU9JfIcV6cx6uJbJbFFSuST++v+TSA9840MzbJeCBkK+2QChOkofr/LcGSN+Y/q0S85+0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyU6bWSQuDwetn7L3eMHkn6jRtDtcnWfnHiP38RqbYUukCqX2ye
	SWEUabqMjy1yWB/nH1cmS4k8KMQwgVNLlurvxnhA1HyMwn4pesuEwNlxAw14Rsn9KzWRkkcEG9R
	IEHih5uWWWwww5x7ee4lvZb7xlZftm6ylAXlPbssv9lHmr2jqGhx4wmmvtCtNkhHM
X-Gm-Gg: ASbGnctnIpxEQUcnhPqHFXbA7/NgU21hZjKUxJQV0//pv46To0/g+XU0xP0wI7eR1rA
	N3A4Zws8oxsQ8IZG9smzs+6xq5Le+htGMGXUKh8s6stiGbEED3yFDfL2JUAM74YdlHH4g/D5WMD
	dvNVgKpuW+oiwIM3SzF2VgP02PG39LjeK6ZQMxps5aiYT7bYh6ZeuFOPmxGX0eg6ILtVTgfEFOJ
	0WyM34EbpJfN5Ie+lT9VmCxdovhKWveDbtcmU+wOw9YkHVmtiOwk4eyhu1xC6s9QsEEPro0w4MH
	jqYMjaD8qMM2S9YzXqnG09W1JfF2orf+os8xUr5B9m7VwmVNkfpWt5ElaNOkwMYBsBsy+hSKEn5
	XCFBeuQlDUROxVdEGXPOoXHsxFyKdrnPtPJlE
X-Received: by 2002:a05:6a20:431e:b0:249:824c:c60d with SMTP id adf61e73a8af0-2925f75d4c6mr16889443637.20.1758518068655;
        Sun, 21 Sep 2025 22:14:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjli9PJGgzAEkxVobbRVAo/BmjPvQIrfSHP0w7nF8GqIuv8u+ix93pGvdvoksek93V0d74PA==
X-Received: by 2002:a05:6a20:431e:b0:249:824c:c60d with SMTP id adf61e73a8af0-2925f75d4c6mr16889421637.20.1758518068196;
        Sun, 21 Sep 2025 22:14:28 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55396db81fsm4702577a12.19.2025.09.21.22.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 22:14:27 -0700 (PDT)
Message-ID: <aae30f00-1d05-4f3f-afb0-8f4924f57bba@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 13:14:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current 0/7] wifi: ath12k: Fix Issues in REO RX Queue
 Updates
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dZ6A3WXe c=1 sm=1 tr=0 ts=68d0db35 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=xzmuE1EisdE_tCyGCEEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: mWgUFZ5gjV0kKh5cNnMD0XvWBRG1HmjF
X-Proofpoint-GUID: mWgUFZ5gjV0kKh5cNnMD0XvWBRG1HmjF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MyBTYWx0ZWRfX8DPuz8J7hL4M
 UpqIKemxX6IR7nl9A7vrsFvtUoTuvUpQ9N+FHzP/OOpxI1xZpbTcvAMB07ezSR/2q4j71sQLouS
 ma1ArTGrQWUpIJReI3EmIO7JpNmNnu7Hz/uVLJlRuW4OKqX5ciWBLBAQL2YZq/X1bXeKWQP+5An
 blbY0tjl33uy4yKWx8jiEKCSTy6e4E7dRx/8RvVFLixqJ1ljhbSlDv82u/RTPrhhCcbmPuqh0Dd
 Ln6O/WfryStrQaqVHoFDlJuBvcSRWtr5l4imo0z6U1keR811GGsdP9459Q1MhKAg3vN905RRu6p
 ErVsQ79amwEpieTlUJUaSVM2d1ijOK/XGGBWqe5AgsFgE5hOESy2hYVoEf2aIq+0C4V5a98R7NI
 c3OZ7YPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_10,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_221431_448248_F242859C 
X-CRM114-Status: GOOD (  19.04  )
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



On 8/6/2025 7:17 PM, Nithyanantham Paramasivam wrote:
> During stress test scenarios, when the REO command ring becomes full,
> the RX queue update command issued during peer deletion fails due to
> insufficient space. In response, the host performs a dma_unmap and
> frees the associated memory. However, the hardware still retains a
> reference to the same memory address. If the kernel later reallocates
> this address, unaware that the hardware is still using it, it can
> lead to memory corruption-since the host might access or modify
> memory that is still actively referenced by the hardware.
> 
> Implement a retry mechanism for the HAL_REO_CMD_UPDATE_RX_QUEUE
> command during TID deletion to prevent memory corruption. Introduce
> a new list, reo_cmd_update_rx_queue_list, in the dp structure to
> track pending RX queue updates. Protect this list with
> reo_rxq_flush_lock, which also ensures synchronized access to
> reo_cmd_cache_flush_list. Defer memory release until hardware
> confirms the virtual address is no longer in use, avoiding immediate
> deallocation on command failure. Release memory for pending RX queue
> updates via ath12k_dp_rx_reo_cmd_list_cleanup() on system reset
> if hardware confirmation is not received.
> 
> Additionally, increase DP_REO_CMD_RING_SIZE to 256 to reduce the
> likelihood of ring exhaustion. Use a 1KB cache flush command for
> QoS TID descriptors to improve efficiency.
> 
> Manish Dharanenthiran (2):
>   wifi: ath12k: Add Retry Mechanism for REO RX Queue Update Failures
>   wifi: ath12k: Use 1KB Cache Flush Command for QoS TID Descriptors
> 
> Nithyanantham Paramasivam (5):
>   wifi: ath12k: Increase DP_REO_CMD_RING_SIZE to 256
>   wifi: ath12k: Refactor RX TID deletion handling into helper function
>   wifi: ath12k: Refactor RX TID buffer cleanup into helper function
>   wifi: ath12k: Refactor REO command to use ath12k_dp_rx_tid_rxq
>   wifi: ath12k: Fix flush cache failure during RX queue update
> 
>  drivers/net/wireless/ath/ath12k/dp.c       |   2 +
>  drivers/net/wireless/ath/ath12k/dp.h       |  12 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.c    | 336 ++++++++++++++-------
>  drivers/net/wireless/ath/ath12k/dp_rx.h    |  18 +-
>  drivers/net/wireless/ath/ath12k/hal.h      |   1 +
>  drivers/net/wireless/ath/ath12k/hal_desc.h |   1 +
>  drivers/net/wireless/ath/ath12k/hal_rx.c   |   3 +
>  7 files changed, 251 insertions(+), 122 deletions(-)
> 
> 
> base-commit: 95bf875b89b48a95a82aca922eeaf19d52543028

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


