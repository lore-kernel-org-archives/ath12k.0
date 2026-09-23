Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA2FC982FA
	for <ath12k@archiver.kernel.org>; Wed, 23 Sep 2026 12:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcdwxsPtDevmgdXTISO9Gx8YiyTOdAORxtcWjdkP/rI=; b=k69tUDCaSHsLk6xjt9eiVBlkF/
	8+D2P/7v0kDmw98VzC7xwjal248tK1JLkMgEQRbwWOZO4djy8T9Myi7q9hXIL1Hhuwx3GnRqmDgla
	94PyTSKBsVVAQ5fIU0T/JgL05qV5W/tKuhAHKC0Wd2Ygs+IdugN4bssh3bL8u7uvEG+FJFgcOQ7vF
	fAB1ggDO3YwFyER9BnpOhvFbwLjG/2QOysinA6XwU6HNvB/WRJV2AZXEWQV0VGhN9Y8V4FSVprTa3
	0xqWqJKE573b/5lUwhZUgOIN1dl3OvjOm9FBmn6c/ESwSz7efKdx4d+c6aiHOQ7HbbMyzk9oU9arg
	eMFtuzjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MQH-00000008In3-24zb;
	Wed, 23 Sep 2026 12:50:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MQF-00000008ImZ-3dZq
	for ath12k@lists.infradead.org;
	Wed, 23 Sep 2026 12:50:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbYpm3028025
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 12:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RcdwxsPtDevmgdXTISO9Gx8YiyTOdAORxtcWjdkP/rI=; b=mkbcWNQ2Urld4joy
	B1GjCm9ILdjZrN5zn6r3f1JtcngsrJEKKduNKM/y1SCr6zovXUtVP8Pwf9FIvF37
	/PrWikvnjUD7UT/17RUWa76TPiH0bVh73vVroDoubaJMLNqbfFezFxSTrc5u7j8b
	P7Bj487t7C1fxzshavuGH9YsiTsdZEkxrrCvkEzxCtm3RFjnRxEC4B24fOoRhz3/
	yu5/OW1hhDlqNOAUFB2WB3BoF1cagfoo3DO/sRD6H4lCunmUx/xkN9roG2hewtro
	+JoPy0fUJuOQIlUBsq6pGeFnhLBhyl+8PfqISQLxeWFSp6pNmhrzgnzBVMUwSa4M
	a2i4sA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwarv3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 12:50:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dd1631d291so7683235ad.1
        for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 05:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790167801; x=1790772601; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RcdwxsPtDevmgdXTISO9Gx8YiyTOdAORxtcWjdkP/rI=;
        b=htp+/h2kWNUWB5nlqlDx03/qSfxRIGkmjXtDN4r0M1HBKG/GWbosf5VqaJxzM8drZ6
         HvxIbGimT9xqia5ARv5Yt8TMl+nonGyOzuqVo21t6vVh02KsCsOiUnpkCd6TJ83CHD0A
         IEltiuC0C2v05JLJRFpH9uKd+WwcHea1VXhJtTOiZ9EH+ntAJ6lCG9WWT/HuRuxgwifY
         RYoP1ETqfinoXAzLvSsLICVxnz787Tb9FdxGJzdd8TBz/M2f012ihTg00p3RJCx1Memd
         FAjANHqZPmMVLa7pFXt+8z4Sfe+U4Q0HGgo/MtrKHHnJutx3LK4gmMmFY5kFhir4qcv/
         isdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167801; x=1790772601;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RcdwxsPtDevmgdXTISO9Gx8YiyTOdAORxtcWjdkP/rI=;
        b=TzompGyxs0t/QsrT5xCeP+LMXfuYQEimRJJaAwGS1cKuwKIYLVP7LrrSt59GfwVBxw
         bT5uXQVzKZw8S9i6++xsk9WWwbEqbOtSKrRYX5mizqs0Ikue2VsTiaD4xntP3L4io3Sb
         AGArAQZuTlDVpyB7OYgTfc2kLP3pvYrTQbuMLfvOKqfDDHwzJ2FdvlGAOCIe/NWmuxu+
         sETg9O5eART6gN7nW3GeO5YyxTwix921daJ50UWMf5AivddpaScYlUjzmowuvbRl4ts5
         70mDjaSzQpX9PlPKukwwPbw26pP2xbFW7u582eSll+NR+HeOfSOvMs2aj0cDXq1YGxnN
         6BkA==
X-Forwarded-Encrypted: i=1; AKwUvBzB3Q1RdZw8TT30X/idQTviseHduT/Dg+AglJSytTqsP/Y2A8RXzK7g225jAfKtnBeCPovj5wA=@lists.infradead.org
X-Gm-Message-State: AFuF++mji5BDe6czk82MS17ZYLukXo6jczzJ8vWaJ9Y0Q41m1INyusJt
	6awrU8sksotdCCv8CZ4sHIix0494iR+RZRxHmL6wetqaQiMQNPfFRXHWV7tfTV8MJsXwv19cmSf
	2QFjxWeLIaxN1u3NeJULSv7p3x1z+qYQ6+6dk41CRdlYJluvCfb3ggekaVvngrSkd
X-Gm-Gg: AYBFou2D7kQKKy89/+NBxbqILouIgtFVgN/huCnvRnJsj/BeCz3AW/QxWp/QoKJ16bd
	WQQplN7tM3SQk0osKAITTDc2FVhbW4FwjYvquRlsJ5XKn1EBDQEBwcWsDkz+Hv950f8yHMakSzk
	MNpYap/9q+9+WX9pBCA20DBY0+iLq5OdmY2grORLCSL8EjskETrigcwZPMjT5mu0IsPj/86rJhH
	iPwamaEkAklElTOpnVaffPOezAuiDX91/joCkfmzRxHOFlPkPIccX4WkG4IP3hMwG8RU5qPrEby
	dTjHFSAss2vuYc/eCOPDI/TvGrl62SXx3t3ziKfH2P2HpAcwTyRoVHuGNKPcJ7hgVs0XJniKLwE
	28f8gOL72J+HiYCOlGCgHvbIuLndF6C5kP3Kxr9Rbl+U=
X-Received: by 2002:a17:903:3503:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2df69ddf227mr19848315ad.34.1790167801221;
        Wed, 23 Sep 2026 05:50:01 -0700 (PDT)
X-Received: by 2002:a17:903:3503:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2df69ddf227mr19847995ad.34.1790167800452;
        Wed, 23 Sep 2026 05:50:00 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a5157sm9976235ad.14.2026.09.23.05.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:50:00 -0700 (PDT)
Message-ID: <5f26c2ef-ace1-4afa-b5a9-0468d692367e@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:19:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 0/8] wifi: ath12k: extend device DP stats for
 TX and RX observability
To: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX5+mtmg3dKo4r
 XiTcjQdUPpwgxWMmKEasqw9enj8LDaicX/0zjvPX+9AyLjbL2ESckyy53ScUzFaruF0Bco5E/ay
 4Ekf0vdltkyPNL7bAtxfHnlwEjMEa+V3jPM+fzB4n9Bcw66Y7U7x18Igi0QFMd54qMblY+joqRl
 g1yu8hZpF/XTbGPaddMZa1h6EDbUMsiWqMvXk5nRNAfF4lUq3hlxnBPt9awdeeGe0iLZD2lzeCC
 /3VR71aRmLfibaQ3jBX4xNoG/+YAFG7N+qyp442+I4HXcOHcq3vRv31Z3tQBJKUvyYZnqGCJTS/
 LLv825EncbOe2QuFfOjOqlS3WVuLCJcQRqOqpFYZRFvKg2DEdwPlSMXv97YtJJJb9WQNar1i0U9
 Jvhsevm+SQ4J74SXN8+Ppck2MoQN2xw+tX84aXGwveN97IUSZlFCoUAYOpMUu2/zDK4Lwiso3Ys
 8Se7HZT7vIbIFhjMezQ==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3cafa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=eVs2hV3UTgqw7q_ujHoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: uK9zbWweGLb9rG4Xyk1az-B6z-grg3Ns
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfXzNYNzk7kBIuH
 zMEWe85HpyGnGaKAwTpR04KbciK31lzaCo5FtCADKDy7l2XECZV2XCuqhCUsVIBjmDnB223WNE9
 fdxqH0Ubs+cXJDbE/D4oGwpVIJMCazM=
X-Proofpoint-ORIG-GUID: uK9zbWweGLb9rG4Xyk1az-B6z-grg3Ns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_055004_031603_5E92A800 
X-CRM114-Status: GOOD (  26.41  )
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

On 8/19/2026 11:02 AM, Pardeep Kaur wrote:
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
>    WBM_ERR_DESC_PARSE -> WBM_ERR_DROP_DESC_PARSE for naming consistency
>    with all other enum values in the same enum (patch 5).
> - Remove extra space before = in wbm_rx_drop[] array initializer (patch 5).
> - Drop ath12k_warn() on unsupported command in the stats reset handler;
>    -EINVAL is the correct user-facing mechanism, consistent with all other
>    .write() handlers in the same file (patch 4).
> - Fix missing colon in "REO sent to stack" section header; all other
>    section headers in the same function use ":\n" (patch 6).
> 
> v3 changes:
> - Remove WARN_ON_ONCE for fw_tx_status out-of-range: the default: branch
>    of the switch already calls ath12k_warn() for unknown htt_status values
>    so adding WARN_ON_ONCE would double-warn (patch 1).
> - Replace copy_from_user() with simple_write_to_buffer() in the stats
>    reset handler to correctly handle split writes and non-zero ppos (patch 4).
> - Drop Fixes: tag from patch 7; cosmetic debugfs fix not needing backport.
> 
> v2 changes:
> - Fix txbuf_na[] indexing: use pool_id instead of ring_id so the counter
>    tracks TX descriptor pool exhaustion per traffic class (patch 3).
> - Fix sent_to_stack[] to use a 2D array [ring_id][device_id] attributed
>    to the ring owner's dp, making it directly comparable with reo_rx[] in
>    the same debugfs file in MLO configurations (patch 6).
> - Fix double-counting of WBM_ERR_DROP_RXDMA_GENERIC: move the increment
>    inside rxdma_err()'s default: branch (patch 5).
> - Remove WBM_ERR_INV_PEER_ID, WBM_ERR_DROP_INV_COOKIE and
>    WBM_ERR_DROP_INV_PUSH_RSN from the drop reason enum; no increment
>    sites in the datapath (patch 5).
> - Remove leading space from "WBM Rx Drop Count" section header (patch 5).
> - Add likely()/WARN_ON_ONCE() bounds check on ring_id for sent_to_stack[]
>    (patch 6).
> - Update commit messages for patches 3 and 6 to reflect corrected
>    semantics.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
> ---
> 
> Aniruddha Mishra (2):
>    wifi: ath12k: add WBM RX error drop statistics
>    wifi: ath12k: add WBM SW desc fallback counter
> 
> Hariharan Ramanathan (4):
>    wifi: ath12k: rename wbm_status to htt_status in HTT TX completion
>    wifi: ath12k: add TCL ring TX buffer allocation failure counter
>    wifi: ath12k: add device DP stats reset support via debugfs
>    wifi: ath12k: track per-ring RX sent-to-stack count
> 
> Pardeep Kaur (2):
>    wifi: ath12k: fix out-of-bounds access on TX stats arrays
>    wifi: ath12k: fix 1-based ring index in REO Rx Received debugfs output
> 
>   drivers/net/wireless/ath/ath12k/debugfs.c     | 78 ++++++++++++++++++-
>   drivers/net/wireless/ath/ath12k/dp.h          | 14 +++-
>   drivers/net/wireless/ath/ath12k/dp_stats.h    | 25 ++++++
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 52 ++++++++++---
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 27 ++++---
>   .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |  5 +-
>   6 files changed, 175 insertions(+), 26 deletions(-)
>   create mode 100644 drivers/net/wireless/ath/ath12k/dp_stats.h
> 
> base-commit: e07447e654476262558bee570f4cf456e2b32565
> --
> 2.34.1
> 
> 

Apart from Jeff's comment on commit text of 4/8

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

