Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB26606A324
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 07:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZVau7OAT;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hsppKOwq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UBzYpxB/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=STBsifDRh0Wop1/8BVxqcSX5YT3lhc62OfRZbkhPUAg=; b=ZVau7OAThOcyLi
	TlUVsJUKjZ+bkJRAZB1QlbGaucbJES61oJ0fqObKS06TImkXtoT2eaqRNVlby7ITMCwr8W1w0DJvM
	b/B45h5LcsI9wDbjJD6shDfQ5GaKUcRSljxU6d3j+nt5uMUz2qZR0rS/Rh34akMFfMu+PfWezavaZ
	NzOBajWGeclGL5KU7jasyeQDlwr3g9AORYQYF49pI6Ng8RTwM1e83jkvyexSi8x+RDFofTM8gLhK1
	iu1zB8n/P1Aal0zxVS1GQhBc1cRGTTcjW88Ph94zi8YiKlUv2lMENF+/k3lP20tbTKxbiyWFQ528k
	pJMLJ7NAQqfejy96pQAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmF7-0000000Fj2n-11US;
	Mon, 02 Nov 2026 07:14:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmF4-0000000Fj27-2L2v
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 07:14:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vUCU2192509
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 07:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	STBsifDRh0Wop1/8BVxqcSX5YT3lhc62OfRZbkhPUAg=; b=hsppKOwqp1u+UC4z
	AGGBX7baZQAsdluNVdcg57eiYgzscdXDpa9qPFj7RjLhNhHaZI2MFHwbT2+ORDWp
	auEz2W1oUE0xNsm1oYxm3JZU1YzQr1NdZn94Uvgrfo9xAvYTpmfX8yBIF2V1OsVE
	5vJncsUmgKVpC9lE4RjDPkGvjyS3mNmM3/XPoHVLxljgB+GHLotEWlo47rMThcX6
	nNpt9bqeDS7udaRkAI/yH8ktPKCB0ssjA3eTx9qkwdW5OToqepApPD8LBwazPxm6
	n9rus3/qoVfl0hs92ZvGHxnAeMNEQCFmyb0H3d7CEp/NT6Mw4TGXMSxHOljhWGKH
	uoUXOw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93enfv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 07:14:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36998507c13so3878809eec.0
        for <ath12k@lists.infradead.org>; Sun, 01 Nov 2026 23:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793603644; x=1794208444; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STBsifDRh0Wop1/8BVxqcSX5YT3lhc62OfRZbkhPUAg=;
        b=UBzYpxB/J/yqTpe727cMhz+xDNwfxczli5K0rlCu/XH1EMlpeYZ4r/xLe7u3VyRtCD
         DLVb8IqG5lwlPmo64MoaZFsYd8pgvKFyDlrVnFrnVzqFQD90ngg39NOozeznFO1BOOnX
         neOzEQtNiZjNvEgaoi6x+bfJVNzny5k+fn4HMl3PNqVhaoEPyrJmGY5e7gxedejfxqZL
         ofKR//m8vAaHJDj2I97gYFGJsMtqpQnyAwxtRa0E/AxFARBZXxYsBj6Q8ovGGT/7EfEP
         GgcDYsoH/4r5rl/vbG4bvQTtSQtJ+Sun66gJiRCoN6jLZspK85Yx2mQE40IJorfWASKm
         TuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793603644; x=1794208444;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STBsifDRh0Wop1/8BVxqcSX5YT3lhc62OfRZbkhPUAg=;
        b=t/GkpR9X3zr9G0H0bvQ5djCePwMxxpRueyyMGHDjQXbqH9DPk6RoQcfYHVckqZDVvf
         be/9g9SzyNLj1GgdW3XM5UPRM5Fxp90DZHyUP/GlnphORLlryvkGTE2OrIU3jSdDbiQs
         0XRLRj0qHaszrz26DI81MKA5WT1q13ipOm9bBEEiaMvPlYhWAh4ppX9caYFTkmGXOX5r
         p14i1mYffmI0U0yi0sn55OMCRQ4NaIApwrcPzWyEbONAwN/cYhbC+iAyk0w3lwLBvWVe
         zm+hrhREUL9LR5HaE+GEwc74lYR1jkSvekAwonCERgFmnl9KA6BpFKnzFp9KR09kln2C
         06YA==
X-Forwarded-Encrypted: i=1; AKwUvBx0fqMDf7bAbVZz4ckQXHMzle4LNw6VA2ILl2rF127YXC6e5sfDMLAyBXIJPu/HmsyQ63+gTl0=@lists.infradead.org
X-Gm-Message-State: APuU4Z9riszqowhQ4YX/SfXqfYPSH+GK73MJgcOix8SjVoi8fFV5AxCL
	mGIyhyPNj5hBKGQg5sGQxaJx2uzvg5FukKXoo4UcjEcabXd6N1i8/TCnUGssGH6JlkDqLuLyZBd
	HVurFlVMyaPzyn2AK561XhrWfegrDMshDOh0x5vcsRfBUnJoKqu90BkKWM0V0zdxx
X-Gm-Gg: AYBFou3URCOmxug6UR2XdgGOsccmUzepJVHD2MpAv1e4OiNorxLqK1gShdBIBf/Vhdk
	unWKTNespm7wd/ez2R1K4rD0Lv251PxSfyCo4IBnEItki1gsgwlogm6XZ+8s/vfcdxPEWPY0Pxb
	aa3/ybtw2Qm5YY2oih2O8GcpIYLZAMvOF928REZaoldzXLOBhTH7JNcqOS1sGOXyR/HhmMw2mCX
	sdBYyfa/KdF4qw93/sSS/ro39AX3ixxz+GDta1LVb84ka4Rn4TZpiLx1IW/srhxN5ZK4t6PeznL
	gL61b7Gs3CdBoxSEJOtCE44H/2BFKFWmyEWTprjMN6ymH2kFbhSElZl8fxadl4W4fpd5S2iW1I9
	SNAd47jKcMVMiet3iRqDh4mxXvjHd+UmsnGtCX/4FncXStoS0YYB6sNFNJkHxM41dgTJPp1XA+W
	Bn
X-Received: by 2002:a05:693c:880e:10b0:369:987f:d15e with SMTP id 5a478bee46e88-36a4221b055mr14782212eec.2.1793603644217;
        Sun, 01 Nov 2026 23:14:04 -0800 (PST)
X-Received: by 2002:a05:693c:880e:10b0:369:987f:d15e with SMTP id 5a478bee46e88-36a4221b055mr14782164eec.2.1793603643375;
        Sun, 01 Nov 2026 23:14:03 -0800 (PST)
Received: from [10.152.204.131] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm36299529eec.7.2026.11.01.23.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:14:02 -0800 (PST)
Message-ID: <904cabf1-b803-457d-8a89-d80bed639de5@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:43:57 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath12k: rely on page_pool APIs for buffer
 allocation
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Ripan Deuri <quic_rdeuri@quicinc.com>,
        P Praneesh
 <quic_ppranees@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261008-ath12k-pp-v1-0-68f888cd7eec@oss.qualcomm.com>
 <20261008-ath12k-pp-v1-3-68f888cd7eec@oss.qualcomm.com>
Content-Language: en-US
From: Praneesh P <praneesh.p@oss.qualcomm.com>
In-Reply-To: <20261008-ath12k-pp-v1-3-68f888cd7eec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOCBTYWx0ZWRfX6FCsek59ckjY
 4VRiqUhFP5cguIIa/FqBIFf4jop57radmSlmJqN9hTMIUU2imqIp/a4l7ZhWVDayBweBRr4ht/y
 +ACRr54ujV2U8yNABs/+d8EYsUyZXNP44omfwpkZcypfjGsPRHxTQ7bXPFcjJKjFOuSo7qjhNfM
 zftvDGa4gRfUC+wlz9VXUHb3qT9tG7TvlZmEd89g8bpEOIzLelHNn8gsqt6YVmbBdXO7w5YL6q/
 m86uWmxSFlv9/YE5ll+GeYJCq8rHbVj0ea377ECQvZKh5qUt8iaiDOs+Hv2az+ORdFhbfeegb5q
 ZcMaPF4Thu8yzVhtXpayT18KuyJVzWJ/N5QjcMn2IGdAXDnfkz1DGQ2jHNhIUQCfkLfGO9LgJzy
 WJuW1VqsbOj96JD5EamFFdBNEHGVOg9Ph6+GK7Tf25gMWfHMkcaYNAJLXAZaJs+Y1PcLGdpPHmJ
 ilm9WPE35CfVB1UsTcA==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae8383d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-srEPthScLmXCGoj88AA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: HIiBJBl5QdFXCilUwkM1MMcRnpgOY5r9
X-Proofpoint-GUID: HIiBJBl5QdFXCilUwkM1MMcRnpgOY5r9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOCBTYWx0ZWRfX4RqGQJ2lFG3S
 xmeSaXNq5PSWzvI9Pc3b0QMhfe+ubbAjEv1mSnRPodQdY7MVdKZxoxToeXoLax4KU2QVM8+iAsI
 jiDYaRnklnaBzJKndPYlKciN5e3/C5U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_231406_620493_8A20FFCA 
X-CRM114-Status: GOOD (  34.25  )
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


On 10/8/2026 6:46 PM, Lorenzo Bianconi wrote:
> Convert the Rx refill buffers to the page_pool API instead of allocating
> an skb with dev_alloc_skb() and mapping it with dma_map_single(). The pool
> handles the DMA mapping and buffer recycling.
>
> Add a page_pool to struct dp_rxdma_ring, created in
> ath12k_dp_rxdma_ring_buf_setup() and destroyed in
> ath12k_dp_rxdma_ring_buf_cleanup().
>
> Update ath12k_dp_unmap_rx_buf() to sync page_pool buffers for the CPU
> instead of unmapping them, and guard the teardown paths
> (ath12k_dp_cc_cleanup(), ath12k_dp_h_msdu_buffer_type()) against
> page_pool buffers. In the re-inject path, sync an already mapped
> page_pool buffer for the device instead of mapping it again, and fill the
> descriptor with the DMA address stored in the rxcb.
>
> The monitor, CE and TX paths are left unchanged.
>
> This is just preliminary support: the goal is to use a single page to map
> two separated fragments of 2048B.
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/Kconfig       |   1 +
>   drivers/net/wireless/ath/ath12k/dp.h          |   1 +
>   drivers/net/wireless/ath/ath12k/dp_rx.c       | 101 ++++++++++++++++++--------
>   drivers/net/wireless/ath/ath12k/dp_rx.h       |  32 ++++++--
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  34 ++++++---
>   5 files changed, 121 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
> index 0d5d1c55bfc1..13985daffaee 100644
> --- a/drivers/net/wireless/ath/ath12k/Kconfig
> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> @@ -7,6 +7,7 @@ config ATH12K
>   	select QRTR
>   	select QRTR_MHI
>   	select PCI_PWRCTRL_PWRSEQ if HAVE_PWRCTRL
> +	select PAGE_POOL
>   	help
>   	  Enable support for Qualcomm Technologies Wi-Fi 7 (IEEE
>   	  802.11be) family of chipsets, for example WCN7850 and
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index c53eac20b989..599ce3c45c7a 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -59,6 +59,7 @@ struct dp_rxdma_mon_ring {
>   
>   struct dp_rxdma_ring {
>   	struct dp_srng refill_buf_ring;
> +	struct page_pool *page_pool;
>   	int bufs_max;
>   };
>   
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index cfaf26ae2720..de9ea84323df 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -68,6 +68,31 @@ static void ath12k_dp_rx_enqueue_free(struct ath12k_dp *dp,
>   	spin_unlock_bh(&dp->rx_desc_lock);
>   }
>   
> +static struct sk_buff *ath12k_dp_rx_build_skb(struct ath12k_dp *dp,
> +					      struct dp_rxdma_ring *rx_ring)
> +{
> +	struct sk_buff *skb;
> +	struct page *page;
> +
> +	if (!rx_ring->page_pool)
> +		return NULL;
> +
> +	page = page_pool_dev_alloc_pages(rx_ring->page_pool);
> +	if (!page)
> +		return NULL;
> +
> +	skb = build_skb(page_address(page), PAGE_SIZE);
> +	if (!skb) {
> +		page_pool_put_full_page(rx_ring->page_pool, page, false);
> +		return NULL;
> +	}
> +
> +	ATH12K_SKB_RXCB(skb)->paddr = page_pool_get_dma_addr(page);
> +	skb_mark_for_recycle(skb);
> +
> +	return skb;
> +}
> +
>   /* Returns number of Rx buffers replenished */
>   int ath12k_dp_rx_bufs_replenish(struct ath12k_dp *dp,
>   				struct dp_rxdma_ring *rx_ring,
> @@ -81,7 +106,6 @@ int ath12k_dp_rx_bufs_replenish(struct ath12k_dp *dp,
>   	int num_free;
>   	int num_remain;
>   	u32 cookie;
> -	dma_addr_t paddr;
>   	struct ath12k_rx_desc_info *rx_desc;
>   	enum hal_rx_buf_return_buf_manager mgr = dp->hal->hal_params->rx_buf_rbm;
>   
> @@ -114,51 +138,33 @@ int ath12k_dp_rx_bufs_replenish(struct ath12k_dp *dp,
>   	}
>   
>   	while (num_remain > 0) {
> -		skb = dev_alloc_skb(DP_RX_BUFFER_SIZE +
> -				    DP_RX_BUFFER_ALIGN_SIZE);
> +		skb = ath12k_dp_rx_build_skb(dp, rx_ring);
>   		if (!skb)
>   			break;
>   
> -		if (!IS_ALIGNED((unsigned long)skb->data,
> -				DP_RX_BUFFER_ALIGN_SIZE)) {
> -			skb_pull(skb,
> -				 PTR_ALIGN(skb->data, DP_RX_BUFFER_ALIGN_SIZE) -
> -				 skb->data);
> -		}
> -
> -		paddr = dma_map_single(dp->dev, skb->data,
> -				       skb->len + skb_tailroom(skb),
> -				       DMA_FROM_DEVICE);
> -		if (dma_mapping_error(dp->dev, paddr))
> -			goto fail_free_skb;
> -
>   		rx_desc = list_first_entry_or_null(used_list,
>   						   struct ath12k_rx_desc_info,
>   						   list);
>   		if (!rx_desc)
> -			goto fail_dma_unmap;
> -
> -		rx_desc->skb = skb;
> -		cookie = rx_desc->cookie;
> +			goto fail_free_skb;
>   
>   		desc = ath12k_hal_srng_src_get_next_entry(ab, srng);
>   		if (!desc)
> -			goto fail_dma_unmap;
> +			goto fail_free_skb;
>   
> -		list_del(&rx_desc->list);
> -		ATH12K_SKB_RXCB(skb)->paddr = paddr;
> +		rx_desc->skb = skb;
> +		cookie = rx_desc->cookie;
>   
> +		list_del(&rx_desc->list);
>   		num_remain--;
>   
> -		ath12k_hal_rx_buf_addr_info_set(dp->hal, desc, paddr, cookie,
> -						mgr);
> +		ath12k_hal_rx_buf_addr_info_set(dp->hal, desc,
> +						ATH12K_SKB_RXCB(skb)->paddr,
> +						cookie, mgr);
>   	}
>   
>   	goto out;
>   
> -fail_dma_unmap:
> -	dma_unmap_single(dp->dev, paddr, skb->len + skb_tailroom(skb),
> -			 DMA_FROM_DEVICE);
>   fail_free_skb:
>   	dev_kfree_skb_any(skb);
>   out:
> @@ -196,12 +202,21 @@ static int ath12k_dp_rxdma_mon_buf_ring_free(struct ath12k_base *ab,
>   	return 0;
>   }
>   
> +static void ath12k_dp_rxdma_ring_buf_cleanup(struct dp_rxdma_ring *rx_ring)
> +{
> +	if (rx_ring->page_pool) {
> +		page_pool_destroy(rx_ring->page_pool);
> +		rx_ring->page_pool = NULL;
> +	}
> +}
> +
>   static int ath12k_dp_rxdma_buf_free(struct ath12k_base *ab)
>   {
>   	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
>   	int i;
>   
>   	ath12k_dp_rxdma_mon_buf_ring_free(ab, &dp->rxdma_mon_buf_ring);
> +	ath12k_dp_rxdma_ring_buf_cleanup(&dp->rx_refill_buf_ring);
>   
>   	if (ab->hw_params->rxdma1_enable)
>   		return 0;
> @@ -236,11 +251,28 @@ static int ath12k_dp_rxdma_mon_ring_buf_setup(struct ath12k_base *ab,
>   static int ath12k_dp_rxdma_ring_buf_setup(struct ath12k_base *ab,
>   					  struct dp_rxdma_ring *rx_ring)
>   {
> +	struct page_pool_params pp_params = {
> +		.order = 0,
> +		.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
> +		.nid = NUMA_NO_NODE,
> +		.dma_dir = DMA_BIDIRECTIONAL,
> +		.max_len = PAGE_SIZE,
> +		.dev = ab->dev,
> +		.offset = 0,
> +	};
Did you observe any improvement when increasing the pool size from the 
default 1K
to the RXDMA ring size? Also, is there any specific reason for using the 
default pool size?
>   	LIST_HEAD(list);
>   
>   	rx_ring->bufs_max = rx_ring->refill_buf_ring.size /
>   			ath12k_hal_srng_get_entrysize(ab, HAL_RXDMA_BUF);
>   
> +	rx_ring->page_pool = page_pool_create(&pp_params);
> +	if (IS_ERR(rx_ring->page_pool)) {
> +		int err = PTR_ERR(rx_ring->page_pool);
> +
> +		rx_ring->page_pool = NULL;
> +		return err;
> +	}
> +
>   	ath12k_dp_rx_bufs_replenish(ath12k_ab_to_dp(ab), rx_ring, &list, 0);
>   
>   	return 0;
> @@ -263,10 +295,13 @@ static int ath12k_dp_rxdma_buf_setup(struct ath12k_base *ab)
>   		ret = ath12k_dp_rxdma_mon_ring_buf_setup(ab,
>   							 &dp->rxdma_mon_buf_ring,
>   							 HAL_RXDMA_MONITOR_BUF);
> -		if (ret)
> +		if (ret) {
>   			ath12k_warn(ab,
>   				    "failed to setup HAL_RXDMA_MONITOR_BUF\n");
> -		return ret;
> +			goto error;
> +		}
> +
> +		return 0;
>   	}
>   
>   	for (i = 0; i < ab->hw_params->num_rxdma_per_pdev; i++) {
> @@ -276,11 +311,15 @@ static int ath12k_dp_rxdma_buf_setup(struct ath12k_base *ab)
>   		if (ret) {
>   			ath12k_warn(ab,
>   				    "failed to setup HAL_RXDMA_MONITOR_STATUS\n");
> -			return ret;
> +			goto error;
>   		}
>   	}
>   
>   	return 0;
> +error:
> +	ath12k_dp_rxdma_ring_buf_cleanup(&dp->rx_refill_buf_ring);
> +
> +	return ret;
>   }
>   
>   static void ath12k_dp_rx_pdev_srng_free(struct ath12k *ar)
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
> index c3715c99054f..a1113f8b7399 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.h
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
> @@ -6,6 +6,7 @@
>   #ifndef ATH12K_DP_RX_H
>   #define ATH12K_DP_RX_H
>   
> +#include <net/page_pool/helpers.h>
>   #include "core.h"
>   #include "debug.h"
>   
> @@ -187,15 +188,32 @@ void ath12k_dp_extract_rx_desc_data(struct ath12k_hal *hal,
>   	hal->ops->extract_rx_desc_data(rx_info, rx_desc, ldesc);
>   }
>   
> -static inline void ath12k_dp_unmap_rx_buf(struct ath12k_dp *dp,
> -					  struct sk_buff *skb)
> +static inline bool ath12k_skb_from_page_pool(struct sk_buff *skb)
>   {
> -	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(skb);
> -	enum dma_data_direction dir;
> +	if (!skb->head_frag || !skb->pp_recycle)
> +		return false;
>   
> -	dir = rxcb->reinjected ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
> -	dma_unmap_single(dp->dev, rxcb->paddr, skb->len + skb_tailroom(skb),
> -			 dir);
> +	return page_pool_page_is_pp(virt_to_head_page(skb->head));
> +}
> +
> +static inline void ath12k_dp_unmap_rx_buf(struct ath12k_dp *dp, struct sk_buff *skb)
> +{
> +	if (likely(ath12k_skb_from_page_pool(skb))) {
> +		struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
> +		struct page *page = virt_to_head_page(skb->data);
> +		int offset = (void *)skb->data - page_address(page);
> +
> +		page_pool_dma_sync_for_cpu(rx_ring->page_pool, page,
> +					   offset,
> +					   skb->len + skb_tailroom(skb));
> +	} else {
> +		struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(skb);
> +		enum dma_data_direction dir;
> +
> +		dir = rxcb->reinjected ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
> +		dma_unmap_single(dp->dev, rxcb->paddr,
> +				 skb->len + skb_tailroom(skb), dir);
> +	}
>   }
>   
>   void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> index 9cd9c0bb07db..d1703c736d49 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> @@ -902,14 +902,26 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
>   	/* change msdu len in hal rx desc */
>   	ath12k_dp_rxdesc_set_msdu_len(hal, rx_desc, defrag_skb->len - hal_rx_desc_sz);
>   
> -	buf_paddr = dma_map_single(dp->dev, defrag_skb->data,
> -				   defrag_skb->len + skb_tailroom(defrag_skb),
> -				   DMA_BIDIRECTIONAL);
> -	if (dma_mapping_error(dp->dev, buf_paddr))
> -		return -ENOMEM;
> +	if (ath12k_skb_from_page_pool(defrag_skb)) {
> +		struct dp_rxdma_ring *rx_ring;
> +
> +		rx_ring = &dp->rx_refill_buf_ring;
> +		dma_sync_single_for_device(dp->dev,
> +					   ATH12K_SKB_RXCB(defrag_skb)->paddr,
> +					   defrag_skb->len +
> +					   skb_tailroom(defrag_skb),
> +					   rx_ring->page_pool->p.dma_dir);
> +	} else {
> +		buf_paddr = dma_map_single(dp->dev, defrag_skb->data,
> +					   defrag_skb->len +
> +					   skb_tailroom(defrag_skb),
> +					   DMA_BIDIRECTIONAL);
> +		if (dma_mapping_error(dp->dev, buf_paddr))
> +			return -ENOMEM;
>   
> +		rxcb->paddr = buf_paddr;
> +	}
>   	rxcb->reinjected = true;
> -	rxcb->paddr = buf_paddr;
>   
>   	spin_lock_bh(&dp->rx_desc_lock);
>   	desc_info = list_first_entry_or_null(&dp->rx_desc_free_list,
> @@ -928,8 +940,8 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
>   	list_del(&desc_info->list);
>   	spin_unlock_bh(&dp->rx_desc_lock);
>   
> -	ath12k_wifi7_hal_rx_buf_addr_info_set(&msdu0->buf_addr_info, buf_paddr,
> -					      desc_info->cookie,
> +	ath12k_wifi7_hal_rx_buf_addr_info_set(&msdu0->buf_addr_info,
> +					      rxcb->paddr, desc_info->cookie,
>   					      HAL_RX_BUF_RBM_SW3_BM);
>   
>   	/* Fill mpdu details into reo entrance ring */
> @@ -994,8 +1006,10 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
>   	list_add_tail(&desc_info->list, &dp->rx_desc_free_list);
>   	spin_unlock_bh(&dp->rx_desc_lock);
>   err_unmap_dma:
> -	dma_unmap_single(dp->dev, buf_paddr, defrag_skb->len + skb_tailroom(defrag_skb),
> -			 DMA_BIDIRECTIONAL);
> +	if (!ath12k_skb_from_page_pool(defrag_skb))
> +		dma_unmap_single(dp->dev, ATH12K_SKB_RXCB(defrag_skb)->paddr,
> +				 defrag_skb->len + skb_tailroom(defrag_skb),
> +				 DMA_BIDIRECTIONAL);
>   	return ret;
>   }
>   
>

