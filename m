Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F9DC43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 04:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vspwlS95JYJHwDxCx1qplsZZEuintNFQ72bn7F0hGBU=; b=IDS2qnsrI4RAvKIK/vNTOvj5Qt
	/LW+DM8ix0QirL/lom64xML+mTPSnLQlpAXCqeFz+cNwEEBj/nBMA1ysbcBsVXhfh6ZwPYrPiNadJ
	jwvsAqL1BWZIq0pjif5hxZYiU7X2nID6gaYzOFcSb1RKaBegQm2JFiknZwx/G97VoCQDQq7iBDK9A
	TQSxh2hTmnaGmWs10vQj3pG7rLyMa8MQ0p2WtGhUA0BseJAJITQunq0/CBQTbHcUIN31U/CI37Kkw
	BrOtUD16mJ642iU4B+QmvBbPNyJSDwNLFKAC2++Yp2HVJyTW0vIkmE2aWODIASBF5TwbJi2kMiWwx
	FSP1wATA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj8kJ-000000087je-34wq;
	Mon, 13 Jul 2026 04:58:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj8kH-000000087jG-1WDN
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 04:58:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D39w284153667
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 04:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vspwlS95JYJHwDxCx1qplsZZEuintNFQ72bn7F0hGBU=; b=e+APuPXbz9DxGDzs
	DhisJ5rdIXXiRQMpJlwmnsVR/iEoZj2l4pDZW1uPAGd1OSEZyVtkKHNsO+HZCeBb
	9kXglqjkgRSbNDSkzJxPNDCq6m+NooojY4YTJx1tw6QbLvqv9NuTbFJc9U5v9Rsg
	T+44otJEaSJEEBKMGqlgOtEzi0kEfDdeKvlyRpQBH/vhAT8iPjtwbcj/JuSUKk1/
	gD0eETpfmP/FQml/Gpp6Jyzxim7bTiyt0C5wgKRbBIZyF/jht9P/7dsd/lNpYJMX
	yvOY4Eowh7+M5YrZCbzabSW2gF6qBVp9PXkj9vkz+qzuNuRFGRj3PzPq432fpTeu
	nxAG7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gma04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 04:58:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc101287aso2423209a91.0
        for <ath12k@lists.infradead.org>; Sun, 12 Jul 2026 21:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783918699; x=1784523499; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vspwlS95JYJHwDxCx1qplsZZEuintNFQ72bn7F0hGBU=;
        b=Hxe4XRP2B3IS+/RPKa7O0egeObfMctEZN8mrx/dH4yyyIux5p3OEsd1GSpsYZAQVWu
         ZRbQ2AaPdRWFOSSEm8/xgKfwl3Kfe+LvIfmX0C4gYJPipCrsKI6AALG+grU8x8nYOJls
         scoGojaARj4yG2+BRmEXpSNZ1ly1Svf7Ijm5MlP9kucswWzjU0beWF1BndJ2DPvyACo2
         yEpnxXq7rUWfxLIIP7TddM6S78CLe2CIat7HmztXT2JzRTtEyu57Ro2gXjQKvMOD8bed
         ggV9liWPeSENdjDL/Hks2kynHjlu1vh5mdZFAsDEAQb6TbbQpJ2jj71N9Q2J6bSl0GPK
         xdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783918699; x=1784523499;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vspwlS95JYJHwDxCx1qplsZZEuintNFQ72bn7F0hGBU=;
        b=hWI/jkmjRc0Rm1+IqUp6g0WWSvUx1QplfMZWby1zv5vX+cm9XF/UfNKm8y1+GNJK9R
         vVNDcbsO+8Wq6vMu1ZBA8sq+WKG9jpnjvUbvRQ/ybMWexppDo7KslwyPGDmi9s/IeHQ4
         OrNCst9SkLr14uhWS1os70q4ygpy8Il6SAd0wQU0aZF+Lic2M9lirssUWlGNSO7nrGWL
         YR64sQAyi23+1YgjzYQTf9F18FbLPvqjFt0GnbIY65dXORqI9fnm9cRZt2ElhZDYUXQf
         h1RxeDC3oP/hgN+40fogRtqjqJCZcJZyK3NMbrZ0W4tMjcuiyfh9j/iRZP/JmGAmv3q3
         gFOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6oUUTe7FYEhEkOTKhYG2Y2mF2NSaSYUTwwXpAOJQmuQ5o3rwcf0omTWRynI9ZHS+QpmRitBQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBgLORC4csPSqszH6RKI8FmhNJkhOMTlZCaP66Pec5le/1aCMT
	1cQJp7UjXcqV5vbettblkLcTwRUqn81BaZ39H6F+pxACohy3EE9P7vAgn5IXzGWw6LQpz7Nygb+
	Y4UZ+yf9uwTOVgH2TbyzWFz7FZJz7zMqqEQbRuXgUxrtI12zw/NDcMOONG0hh7OcjPQOTfDAv
X-Gm-Gg: AfdE7ck88HP6oWwQ9Va9kJeVOkZpJcIBxJdgVTakkY1kKQAQDKM54N8hGSkKfetgxHC
	wZt/ZMemqcyHT5Q8rVsan5UJgFUDKV5e8bDw8BXGWXsIL7DsT2FLyL8CTNm8BM50qkblrXuW8dP
	Z+SmHaRylZy7daH2WjGy8ED+KVg0e2V1uPpRv+rqIS9EDkuc0rUBjpOSyuDJRHViLbDhIzAmshp
	deBEeAgzJERxC/4yQc03yqfICldCwETIFyA64OHnXkiD1s0WfogQbKzLZvlcAwAitJMXRAyEh3G
	dSfHL0ZQqNLcgOp265o9cnD6VV5GRjFSbqH3VW52kB9CaAwLNteTl76O43dR3Kfp7xIXbJIzpZk
	83TDItrKOZeNqXzGhW2CzqlmkVWpSBpgl6tuVgixB6AQsk7CBRgs=
X-Received: by 2002:a17:90b:3bc7:b0:37f:9cdf:f0ab with SMTP id 98e67ed59e1d1-38dc77ee692mr8247067a91.26.1783918699246;
        Sun, 12 Jul 2026 21:58:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3bc7:b0:37f:9cdf:f0ab with SMTP id 98e67ed59e1d1-38dc77ee692mr8247044a91.26.1783918698779;
        Sun, 12 Jul 2026 21:58:18 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm44958051eec.24.2026.07.12.21.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 21:58:18 -0700 (PDT)
Message-ID: <bcfe2b9c-3652-424c-bc3b-29aed334250e@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:28:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: fix peer delete race in MLO
 scenario
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260629-ath12k-mlo-peer-delete-race-v2-0-362b25590d19@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260629-ath12k-mlo-peer-delete-race-v2-0-362b25590d19@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a54706c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CzddmEZrVGVg-aw9SIEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: EilIcc4jsy9WZFYFtGquDXfoCd_xx9iu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA0OCBTYWx0ZWRfX3gzNJMzq60kl
 zEYH7CJZOPCDi5OPRsbZDXKWJaPxei8qGu7ZFd4Ln6g86aIrK7reUErlEBng8uULaj647ZMJqV8
 9OpV46q3pqP6qgZ0bN5703359XXTh1PSzDfdgQCjKkQAJjd3GV27T6wyuULDINX6XcEl6cT5CL4
 bueGIIPP4VBILVB5MQ5/knF1vk7p0Kl5kwj7fUTSSelLpST4XTwugw+OG/1Epric8nGSho5pRig
 xu82+tRsDHKw33jjHaDhOu+386DzYGCtJY/N8KOxChMTcVG/1xWM3RYak/tR7c6RN68S9h4oj1w
 ZcKqgNSoHP2ZryMbRm+GuXkwnB6SkxXg/chkD3mGUet1QlNGDnI9NO1kBdIJLWt9VJMQdPzHl3y
 1/3UxORitGchDqDr+7gidnJMvTTSVqDvyC2up09ckjsT6HHR1QWQ2IE8JliWbBbZG+I9SlQ8nbn
 k2pKOf0WYqMp7m5CVmw==
X-Proofpoint-GUID: EilIcc4jsy9WZFYFtGquDXfoCd_xx9iu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA0OCBTYWx0ZWRfX/OMzV3ibfxor
 nPEknGitktUFZVY7LDc5vHIsaCu7cSZ27IRKEbbxuqHDuppBxPWQ1VorZpv62fcLakMiykkFjJY
 ZUlgqncaA7TGplQMSFZLAiU4kkT/6+Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_215821_427753_7DBBD70C 
X-CRM114-Status: GOOD (  11.90  )
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

On 6/29/2026 12:31 PM, Baochen Qiang wrote:
> Patch 1 fixes a pre-existing UAF in ath12k_mac_vdev_create()'s
> err_peer_del rollback path.
> 
> Patch 2 fixes "Timeout in receiving peer delete response" on MLO
> disconnect, caused by a per-radio shared completion that gets
> clobbered between back-to-back WMI peer_delete sends.
> 
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
> Changes in v2:
> - rebased on ToT
> - patch 2/2: make ath12k_peer_delete_wait_register()
>               and ath12k_peer_delete_wait_unregister() static to peer.c
> - Link to v1: https://lore.kernel.org/r/20260617-ath12k-mlo-peer-delete-race-v1-0-ab3c4f455dfb@oss.qualcomm.com
> 
> ---
> Baochen Qiang (2):
>        wifi: ath12k: fix dp_link_peer dangling references on AP vdev rollback
>        wifi: ath12k: fix MLO peer delete race
> 
>   drivers/net/wireless/ath/ath12k/core.c |   2 +-
>   drivers/net/wireless/ath/ath12k/core.h |   5 +-
>   drivers/net/wireless/ath/ath12k/mac.c  |  20 +----
>   drivers/net/wireless/ath/ath12k/peer.c | 130 ++++++++++++++++++++++++++-------
>   drivers/net/wireless/ath/ath12k/peer.h |  14 +++-
>   drivers/net/wireless/ath/ath12k/wmi.c  |  16 ++--
>   6 files changed, 133 insertions(+), 54 deletions(-)
> ---
> base-commit: 1547a99cd8d8c1ab3e04dbd92b72b3b5f7cb85a9
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

