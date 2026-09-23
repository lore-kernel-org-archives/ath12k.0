Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E53C982FA
	for <ath12k@archiver.kernel.org>; Wed, 23 Sep 2026 08:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8FC/45d6TZh1tgW9Ibyrs38v4cdphYGxoD8UWW+7b8=; b=hzQ06xDBfVTZiIU/cCm3viGiJO
	kVijizhLg+TSvj/VU3JoioJt4XIuXUuU6EAEbueTyRNeEnslNrO+og82nHWGSc3WGHLeckEZPyPGb
	nvvVI3gfiBXFxCaP+FYY5mPGrmdh+hA8I+GcVNQF+07+0W6KPcOCGpVnRj4Sp6GNKcYlEDPqrRXJq
	hfhs+8IxTpOUxdEmHkSsO9CFQ0F0sBxJxmRzCLbWP4NDWtf4pE2dGMcB22rXplkpUGwoBy9A3g/4Q
	dqCC43oB/bfnFIz2hFCJPrmIoZKgniqHbvLqSpwJhpALQbHj5+xHQMxxkb12qMYyaHqaANXS5dpMy
	cVuBUnsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ido-00000007aTb-3A3v;
	Wed, 23 Sep 2026 08:47:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Idm-00000007aTD-21Ml
	for ath12k@lists.infradead.org;
	Wed, 23 Sep 2026 08:47:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8Jap21387436
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 08:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A8FC/45d6TZh1tgW9Ibyrs38v4cdphYGxoD8UWW+7b8=; b=IaADzWnniHWC/oDJ
	Dzq+UarNHodcKQdIrUMYmsiSiAm2OxsLY6CsWPsn7B/aorW2Uo73vBw12HisEwwR
	mc1SOhdOEJuvvvOeksOXrZbn6w0cPZD+tlnwA7QmZfLFX+SsUPOw5mBFcMNsnnhc
	obe1zXZHDvGz6rFikVegp4KBKP2D04tgfegQ2RxvBRCB/y9Z/lod5w2QQfdVahqU
	7y2WPhDk9HNoWDzh5xfXCkNupC4R/+jLV3iKFjpqbdWM7SiEfNDdrVBzCwrpWflo
	7T+/6wnB9z2O0jesYHpVI2xw+61pLkvl1lqbxt1hD5DdUyP2Pw9gsU5ZPZ74KvIs
	A9EzQw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma2xxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 08:47:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso805121a91.1
        for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790153264; x=1790758064; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8FC/45d6TZh1tgW9Ibyrs38v4cdphYGxoD8UWW+7b8=;
        b=e0L4DHQocrHk//6cwmTCKH86w971e4TEoPeubpmfledD0P8CnHqRtWqSnl6NPSWlvI
         9UbbaKf3c+JL0xKWAMmbWKo513dRi462xTGU61MKBKv0LxiUCbvAoBqSFjU2bh9VqUVf
         RtKWCLXMFDk9x4cvOnGdGssNkhFIouXd61wg35qnP/PdD+pIU+jRt9k4mWMKypeSQD+I
         BEyPgRyfl942RAYCUxjoHTNq/UcxoziJ1w46dUjN8QqIziz/+iIy7TALvGQ4d8KpNZwm
         qvoXELw1kOIhTxGNpK6FzN7V29B2FVv33HpW0WO3oSL+KrXauqsHC9FMyjVY8SQ3lR1w
         ta3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153264; x=1790758064;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8FC/45d6TZh1tgW9Ibyrs38v4cdphYGxoD8UWW+7b8=;
        b=a6BfPGiLpSYfYrg4UvldphA8zHFj8UK9emX9/SweiOHu+ADL8YuQmMezHCAWhEknuP
         dKRw0ecBihX3DV1cE0njNEKPsBtrs6Xeum+TW7iyMNQz8zShJEC7rOTameSMGcx+VzYE
         OFoj5MOF5T4597Dpz6IldjgP1v1Lp6ipvLk4QCJAlmV9vOyyH2Nmnoxk6gh6vlXZpnYf
         er1K9GpDBXM1nawo7EQJg51iFl7STqxw1aAk+YNh4tG+vYh4tnjsg0wzeKn4RBLVdhL1
         QL5XM/amoFdzia6G9ftb99DrgB8D/b2BfyOigHT1Z2E5Pc3SRgAw35djHI40a7UrY8sq
         4PSw==
X-Forwarded-Encrypted: i=1; AKwUvBzsgvVRGTehoi0vzdqPSE2bwlPf8BsHrnsdGK8Q8Bc4H8IYHFfq+Efv+nSE+ZBmhNkVxd9lhXo=@lists.infradead.org
X-Gm-Message-State: AFuF++mdjOv8DvJsno0ylo7LcqqCJ6LUdySTVlPtRx6tInbzTdjr8MTX
	IXYdU2CJvvn8YEqaUgsYD4wPWe6fa4juN+iQgfbslGoMQp1G9GRfLePiZuSXxc0PLMqInrsO4tF
	y5ooll9IMeiQd5HIO44v7IdtWJtQLpet49cUrtOeHkmR879AQVdeM/nwHzyROxHUY
X-Gm-Gg: AYBFou0s1GSlKqposkXttISWvDtrKYVirlxs0GiABQDsU/XQI0Vy6YLieAKCCNTDGGz
	WLW7oiGALeKFjsraFtLxLegWgF/CzivPOTVOt10C9wpFGont6AHbSRg8DE3yjXWqKcdwpzKNz53
	JnLNEweqkyyMmQzkhsHt4BAjHOYZgLAHl6DX7NTwrJZLPmyhnxUEkgFvDC4bRnXXTfsHnPXLUVc
	sjb8RTaj3Qd7kg1jCpjVFP/6ItmREbn5qCMyQcd6z+V16mPFHwHD58e4JECaA/uXFFgNg7zjNIh
	VCIDC7R/4vlrYhrvwwI+pD8LZH9PJ9qi2Xu/Yd5PCkSBbQb4egf8mDRlWGeT+3k+Jli4Ob4hxVO
	XBYTrHJtYZjGGc1at8GY0qosMrjLOJVp/Xqn5y49ygXcgVJXtFGQOgb9aEbE3ZMcyhfMou2IQSZ
	Apnq8IWbg=
X-Received: by 2002:a17:90b:1fcf:b0:39d:f06f:79be with SMTP id 98e67ed59e1d1-3a07e5b1921mr1565249a91.15.1790153264230;
        Wed, 23 Sep 2026 01:47:44 -0700 (PDT)
X-Received: by 2002:a17:90b:1fcf:b0:39d:f06f:79be with SMTP id 98e67ed59e1d1-3a07e5b1921mr1565235a91.15.1790153263774;
        Wed, 23 Sep 2026 01:47:43 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a089197169sm1553060a91.8.2026.09.23.01.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:47:42 -0700 (PDT)
Message-ID: <5cc7e55c-c7c0-4882-87b1-35bd5a1614cd@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:47:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 0/8] wifi: ath12k: extend device DP stats for
 TX and RX observability
To: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NGGPyuTj-CUmi6YQev_izSZZfWOE7t86
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX4fH2UPfizyPl
 uuE3F1UVlTP/ipEsk54J5ngaPAKLJBRgYqzfDiyaJtUJp764fraE37b8wBUBe4XhfODRFf25k+a
 vcOTVdaw6+NE0yUBBK2f8bZFdU90Yhs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX4GF/874Wc5lb
 igPhvNgh5LFfHzWFhNlcnMLul9K3RjYdSNYN44DnG1Ki3w8KjpuD6pNa69LYDXiMyuqP9uBafs2
 ITB2u1dkeeBOkvlwC3UANueNFUYOE0xmkSwhn8K7BgvEwZ9jwV1BHub98r/A8doAT4v4c7/3LYM
 hnnhHS34Le78/xC3ajB/VM+K5j5Os4YQHYbtkn+cDe3Nsns5E9qBQ/hxRuZti8QEhOEgLoG7aeK
 9dUHJoSRNEo02PLMTdn61F/D2lajIa2B68IikDezCztps1yl1sMTuV3nz22umnnfbIGhnM8fej+
 HmxFNYUlNFQVKY+SNKtKSOn/NJZFaJy4WJAvrZO3uA+NSqvhyPL2rpAbi8LFGMWGVFxsRzU0DOR
 OkkYluKFZptnO3h9vBKFmxtAV6lWZ59JtiemZ66tLTI/osmKirUVa4ObWvHp6TWMk0WX8mN+JrJ
 s9ZzVu6qj6yUK6kcfTQ==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab39230 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eVs2hV3UTgqw7q_ujHoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: NGGPyuTj-CUmi6YQev_izSZZfWOE7t86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_014746_558220_D227776A 
X-CRM114-Status: GOOD (  25.37  )
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



On 8/19/2026 1:32 PM, Pardeep Kaur wrote:
> From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
> 
> Extend ath12k device DP stats for TX and RX path observability.
> 
> Patch 1 fixes out-of-bounds array access on TX stats arrays
> fw_tx_status[], tx_wbm_rel_source[] and tqm_rel_reason[] by adding
> likely() bounds checks before each increment. The default: case of the
> switch statement that follows already handles unknown values with
> ath12k_warn(), so no WARN_ON_ONCE is added for fw_tx_status to avoid
> double-warning on an out-of-range htt_status value.
> 
> Patch 2 renames the local variable wbm_status to htt_status in
> ath12k_dp_tx_process_htt_tx_complete() to accurately reflect the field
> origin, and simplifies ts.acked to use true directly.
> 
> Patch 3 adds a per-pool TX descriptor allocation failure counter
> txbuf_na[] indexed by pool_id to track which traffic class ran out of
> TX descriptors, and exposes it in device_dp_stats debugfs.
> 
> Patch 4 adds a write handler to device_dp_stats debugfs so that writing
> 'reset' clears all device DP stats counters without reloading the driver.
> Uses simple_write_to_buffer() to correctly handle partial writes and
> non-zero ppos, consistent with ath12k_write_simulate_fw_crash().
> 
> Patch 5 introduces a new dp_stats.h header with the
> ath12k_wbm_err_drop_reason enum, adds per-drop-reason counters in the
> WBM RX error path, and exposes them in device_dp_stats debugfs.
> 
> Patch 6 adds a 2D sent_to_stack[ring_id][device_id] counter to track
> successful MSDU deliveries to the network stack, attributed to the ring
> owner's dp so it is directly comparable with reo_rx[] in the same
> debugfs file in MLO configurations.
> 
> Patch 7 fixes the REO Rx Received debugfs output to use 0-based ring
> indexing and lowercase "ring%d:" consistent with other ring counters.
> 
> Patch 8 adds a dedicated sw_desc_fallback counter to track how often the
> WBM RX error path falls back to SW descriptor retrieval when HW CC is
> not done, distinct from actual packet drops.
> 
> v4 changes:
> - Rename WBM_ERR_GET_SW_DESC -> WBM_ERR_DROP_GET_SW_DESC and
>   WBM_ERR_DESC_PARSE -> WBM_ERR_DROP_DESC_PARSE for naming consistency
>   with all other enum values in the same enum (patch 5).
> - Remove extra space before = in wbm_rx_drop[] array initializer (patch 5).
> - Drop ath12k_warn() on unsupported command in the stats reset handler;
>   -EINVAL is the correct user-facing mechanism, consistent with all other
>   .write() handlers in the same file (patch 4).
> - Fix missing colon in "REO sent to stack" section header; all other
>   section headers in the same function use ":\n" (patch 6).
> 
> v3 changes:
> - Remove WARN_ON_ONCE for fw_tx_status out-of-range: the default: branch
>   of the switch already calls ath12k_warn() for unknown htt_status values
>   so adding WARN_ON_ONCE would double-warn (patch 1).
> - Replace copy_from_user() with simple_write_to_buffer() in the stats
>   reset handler to correctly handle split writes and non-zero ppos (patch 4).
> - Drop Fixes: tag from patch 7; cosmetic debugfs fix not needing backport.
> 
> v2 changes:
> - Fix txbuf_na[] indexing: use pool_id instead of ring_id so the counter
>   tracks TX descriptor pool exhaustion per traffic class (patch 3).
> - Fix sent_to_stack[] to use a 2D array [ring_id][device_id] attributed
>   to the ring owner's dp, making it directly comparable with reo_rx[] in
>   the same debugfs file in MLO configurations (patch 6).
> - Fix double-counting of WBM_ERR_DROP_RXDMA_GENERIC: move the increment
>   inside rxdma_err()'s default: branch (patch 5).
> - Remove WBM_ERR_INV_PEER_ID, WBM_ERR_DROP_INV_COOKIE and
>   WBM_ERR_DROP_INV_PUSH_RSN from the drop reason enum; no increment
>   sites in the datapath (patch 5).
> - Remove leading space from "WBM Rx Drop Count" section header (patch 5).
> - Add likely()/WARN_ON_ONCE() bounds check on ring_id for sent_to_stack[]
>   (patch 6).
> - Update commit messages for patches 3 and 6 to reflect corrected
>   semantics.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
> ---
> 
> Aniruddha Mishra (2):
>   wifi: ath12k: add WBM RX error drop statistics
>   wifi: ath12k: add WBM SW desc fallback counter
> 
> Hariharan Ramanathan (4):
>   wifi: ath12k: rename wbm_status to htt_status in HTT TX completion
>   wifi: ath12k: add TCL ring TX buffer allocation failure counter
>   wifi: ath12k: add device DP stats reset support via debugfs
>   wifi: ath12k: track per-ring RX sent-to-stack count
> 
> Pardeep Kaur (2):
>   wifi: ath12k: fix out-of-bounds access on TX stats arrays
>   wifi: ath12k: fix 1-based ring index in REO Rx Received debugfs output
> 
>  drivers/net/wireless/ath/ath12k/debugfs.c     | 78 ++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/dp.h          | 14 +++-
>  drivers/net/wireless/ath/ath12k/dp_stats.h    | 25 ++++++
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 52 ++++++++++---
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 27 ++++---
>  .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |  5 +-
>  6 files changed, 175 insertions(+), 26 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/dp_stats.h
> 
> base-commit: e07447e654476262558bee570f4cf456e2b32565
> --
> 2.34.1
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


