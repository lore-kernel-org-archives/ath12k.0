Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08365606A327
	for <ath12k@archiver.kernel.org>; Sat, 14 Nov 2026 20:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kJtO9nVx;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kau4h5fE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V9HQAvV5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1gh19ilZVJ3SurX2jL9t5jwRwJXCxBkfR2uqCXnVcRA=; b=kJtO9nVxws+F5v
	ywTRKodBgPhtZJVT58U3YCu7+iqhMnuDpQVwC/481kidizCxeQdkcywlXcRw50fAu9Qe1d84WJLvc
	JnWwxbcz6x3KgNr+NB3hCRQAWKqTLuTYjymHSpcVYlfMXRfCw9YiROTmJVXj0cEIGbGqU15H+ED1h
	5gT5pzXfeuz/Oa53WRzY9HVwAOQtoEJjX5Ok5I4J34v0J4acWHToFBngUhNWv5rPzs/ckkJQ/aY15
	Q7kJaVgOZCZqAYv2i8AYcUBjKCFiC27g8BA1oXMDp2nk9PFKvyKcsN0QAmwB9B8/82V3wtfXcgRq0
	lrHx03gzWhg8fYI498Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSKHD-0000000GiUc-03IF;
	Sat, 14 Nov 2026 20:23:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSKH6-0000000GiUH-0TCC
	for ath12k@lists.infradead.org;
	Sat, 14 Nov 2026 20:23:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEIJChh3078541
	for <ath12k@lists.infradead.org>; Sat, 14 Nov 2026 20:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gh19ilZVJ3SurX2jL9t5jwRwJXCxBkfR2uqCXnVcRA=; b=kau4h5fEFH7eSMLn
	mJfml2RP1jaUypE7uZKKei3poLMqnjRjLp21DjJDSDWQi8cPjkdvM+JeyPd9H/4X
	WTqRe3l5jllIDlbzQ7HrXrIckdh1n6Tfu6XxCKnKSMGQpDYXUPDTpFiLnbArob+C
	oL9YaiceWOHfr5CEZjwAMrA088moWKb8q8GqudBFj8VmYLw5xN5s2E7S2EcXO4y5
	C6LMi9Lhuamkgn0jQKLJIILUoM5KjHqNj4T/UHCDEc+lncHo8HLLxLSYX/vl9FW/
	INHvT0k2hyWT/x/838AKjAK1fAe8sk6zd0aQc6RYCkr18hlnWQJb8dA66zrY5Yss
	hPOXGQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmc9jx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 14 Nov 2026 20:22:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-378722fd4a3so2498090eec.0
        for <ath12k@lists.infradead.org>; Sat, 14 Nov 2026 12:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794687779; x=1795292579; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gh19ilZVJ3SurX2jL9t5jwRwJXCxBkfR2uqCXnVcRA=;
        b=V9HQAvV5HQfMGHdrN+HHlalxOmQYF/S1YPUd6VIHEuhrasrTLW6X7MfeMmaVIFlNhO
         nG2Itu5a+HMuIpVGVTiShyt7rgx1hWwnovyj7kICYpXS/Xdcu7tuzYx6B6JOaG2tfYUG
         Xjqmfv8UDVqFg7ADU5wORCOPJCU44weVHk63svjYeFqQJDsSGuNhekq7Trg//hcRMWMQ
         jbYbcLwBMCmdj0qPUnQTnjjQkFftl+WyCremG0deroci/dctqDRY7jW2lfvQeFMyiZpY
         KSE08weDYW9jOfx+6SMhAO2C6jEGkK+092Pw+HI5ahMl2foszZxzsBr6tx8ScmAUGPqk
         x4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794687779; x=1795292579;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gh19ilZVJ3SurX2jL9t5jwRwJXCxBkfR2uqCXnVcRA=;
        b=xzYS+xHuOs7VVYWFuDXY3vk2otLv08wx2qp6POhC9A3DFo4xArgrdRmdQjdcgyckvQ
         7Skds1vg5M1VyOmbNGjyivXrBjyuWtx7qLBKTjD6PIylaDGJg/lXK29BuGWyd6r+wzj2
         lGoSNAnWoTBGrECtoiKaTHwLYz0uQvCqNRgr/GFv4s308rYr4wPNEMbHZl9aFdf+kA4j
         06bAaLDC9p9gRrT1Vs7mW/+3s5Ls3gILvx28EGJTRHLyhknb9wVwoG4Ep8FDLQsc6Gb9
         HyLYxc3WibV7253/QzNNw8Hwu+c+FcLwm2dP9EEOrsuev1MtywOwd+kAB62jI7ssbs7/
         +ttg==
X-Forwarded-Encrypted: i=1; AL+hErFvRXnLnzJ/vQUIOnjSOQifEi8Av9ROzkr4Uu3h9LPKpUWi1lyIKB5R7jlmiZr2WoZLY/BuU6w=@lists.infradead.org
X-Gm-Message-State: APuU4Z/mq5lpheJL585njhsROalo7eh+carM0vHlTmaGk1jo/r8+JfL0
	p82AqZIjbutl8kKg+UVHFIEgQmvAIz6kO+T2R/9p+Nh2iMRVsNzg3VDdDJ6IQHaFDXZ74AamMnl
	CVDPwizI8OXJi6n+575nNdfa0asBKFp9ZovvAYFr4iu/6HAg0biGmer8GUHIc7Zj0
X-Gm-Gg: AYBFou0TFHPZXpouX0JmjobwNqsK306YdmpY/zCsM3T4ib7pu1c1PYgVBGoNcuI/jRu
	3ZbYMuYim5r32wCAbdWcVJa6iHGqsRhbcKR10HLfNj5BeJ1PWfVO0iDpMQ5equPYYxjiH2hEGfe
	Pc44ZimgS2Uty06Wta8vk1LfPBB6TB6iEA/+vLHKP+nKK6TU/M/kIjyG+cTIdO2oY7m7NWHk7ZQ
	ivWX6WbXQPcVWMyN9i6cQqCtCI8/lMjS3whB6zyq9LAAC0AZhJhB5g6HwduzamQJwwIpxP5ghtr
	XyatynU8FxXPjM1HFEb/m2dq5EuJjpbOUgL0/qlVYd8C8GKvSu95T+B9cy5IEsRgO7mYg0T1l2v
	QR/jhyXTaaN3DKrFukDgoH34PiLw2N+BXIDlrPuJ2o8VFWboZAl9+2IvsfTYy5f8ywkWIHac5OQ
	yT+XvBrEEeJ5hU8esJhzOCfXuHClfi
X-Received: by 2002:a05:693c:83c3:20b0:377:678:231b with SMTP id 5a478bee46e88-37966a591dfmr6611951eec.25.1794687778382;
        Sat, 14 Nov 2026 12:22:58 -0800 (PST)
X-Received: by 2002:a05:693c:83c3:20b0:377:678:231b with SMTP id 5a478bee46e88-37966a591dfmr6611923eec.25.1794687777595;
        Sat, 14 Nov 2026 12:22:57 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm33215643eec.21.2026.11.14.12.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 12:22:56 -0800 (PST)
Message-ID: <92d632b3-3aee-4786-9c89-b106b66a32ac@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 12:22:55 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v3] wifi: ath12k: fix DMA direction for
 re-injected Rx buffers
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261023-ath12k-fix-dma-mapping-for-reinject-packets-v3-1-443f9e13bbc9@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261023-ath12k-fix-dma-mapping-for-reinject-packets-v3-1-443f9e13bbc9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA4MSBTYWx0ZWRfXx1i1WSzwH79s
 LAHWCz7XjEpSF1DUdS9tJCg6znD2UpyUZp0jMvl8CCel1adFLiiYbQ0vN5eDz8ImlIi0oW5HGBS
 frVfi9e2wvh5EQWs7Y91M18qVP4Dseg=
X-Proofpoint-ORIG-GUID: JcadoU7HsUcpp-AgU4i2B19bT8e5alpW
X-Proofpoint-GUID: JcadoU7HsUcpp-AgU4i2B19bT8e5alpW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA4MSBTYWx0ZWRfX9xEmElxDaldc
 jg5ZCFcdVM9ACIgkbS++MiIs7Yb8oz2Aku8Lg3vetFGl+/ploqnQLxzvJi61zY/9F05820NU0c8
 Z1IdAklM/wnLsKT7awyfcvCExqgeKH5fU0vZciyip+q6Y5rYCAK61ECshFuQOwlkUvzyyH5rAH9
 ATUOND8sYjaI5BtoywIdgsiB7TDNk1e6V4fHo5+eQB9pquJ1ia9ge0MVGPDwo0a3kaNshlALCU2
 gftzmS4drYCa4VhHlGJ5CDC95TdeZm+v4n/9jmDOq/cUm5CpR9q3f7/bBa3UdH6eSpj+5R9ja6r
 kpzQ/4uZp+RfZTHZgk/fJaFM15zmrsX8iPIbYRr+0MPEgMZKvnbExD/0AXeuyKydAl06/bDpvm/
 f2BMNHT3cxLDCFz9+VzlO6nHtCGlZDVwrJvWe43sPtTEHKAq2e7EjPksM3VUmR+O+sW3OrV/YZr
 fTOlO3/Hb0Y77AZochw==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6af8c323 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2LnXmgUbajm_jcWkuQEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_122300_176420_0A7F5845 
X-CRM114-Status: GOOD (  16.43  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/23/2026 9:49 AM, Lorenzo Bianconi wrote:
> Defragmented MPDUs that are re-injected into the REO are mapped with
> DMA_TO_DEVICE, but all the Rx reap and teardown paths unmap them with
> DMA_FROM_DEVICE. The DMA API requires the unmap direction to match the
> map direction, so this violates the contract.
> 
> The mapping actually spans both directions, since the host has written
> the buffer before the REO reads it and the buffer is read back by the
> host afterwards, so DMA_BIDIRECTIONAL is the correct choice.
> 
> Add a common ath12k_dp_unmap_rx_buf() helper that selects
> DMA_BIDIRECTIONAL for re-injected buffers, identified by the existing
> ath12k_skb_rxcb::is_frag flag, and DMA_FROM_DEVICE otherwise, then use it
> in all the Rx reap and cleanup paths. Map and unmap the re-injected buffer
> with DMA_BIDIRECTIONAL consistently.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 33322e3ef074 ("wifi: ath12k: change DMA direction while mapping reinjected packets")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
> Changes in v3:
> - Set ATH12K_SKB_RXCB()->paddr before err_unmap_dma condition in
>   ath12k_wifi7_dp_rx_h_defrag_reo_reinject().
> - Link to v2: https://lore.kernel.org/r/20261023-ath12k-fix-dma-mapping-for-reinject-packets-v2-1-9f436a26dd72@oss.qualcomm.com
> 
> Changes in v2:
> - Rely on ath12k_skb_rxcb is_frag field and drop reinjected one.
> - Link to v1: https://lore.kernel.org/r/20261017-ath12k-fix-dma-mapping-for-reinject-packets-v1-1-b94860e18ba4@oss.qualcomm.com
> ---
>  drivers/net/wireless/ath/ath12k/dp.c           |  6 ++---
>  drivers/net/wireless/ath/ath12k/dp_mon.c       |  5 ++--
>  drivers/net/wireless/ath/ath12k/dp_rx.c        |  3 +--
>  drivers/net/wireless/ath/ath12k/dp_rx.h        | 11 ++++++++
>  drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 17 +++---------
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c  | 37 ++++++++------------------
>  6 files changed, 31 insertions(+), 48 deletions(-)
This conflicts with recently added:
febe1f8cbccc ("wifi: ath12k: avoid double DMA unmap of held monitor RX buffers")

Please rebase.

/jeff

