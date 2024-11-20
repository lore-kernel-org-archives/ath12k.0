Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59094D743C6
	for <ath12k@archiver.kernel.org>; Wed, 20 Nov 2024 19:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAu+u24D0ENA4f4vSOQ7vZjlitl9eAhdHvb236dQvtc=; b=0is2tpeP4AkcbKaQHAvLIPNacI
	naSd+uzHEXjEqm6YeX9InEgA1PQEjIZNT9Kh4fwxji1T39to0wzDnxriI4OQOHMBsEVfdclWcTxQ5
	c8YjmH+HPiVxK0NpH0m55rqmXQ8QRnrqLncqcVbn76kJaY6uIkoX7zYHftoecXab6jsfDTty09Op2
	U/nf3kWRkSL/jj4qFvi72TgDD/BbAlpb2gRCUwAcoeufFJ9gh3160dE1rvGlzAld8T1TFXjTzp7fD
	RSqnBpkoCqslMoEhxDw7Jz+IK9jQbnR+vk2Qz6HL85qcU5X1bO8AFCHAAyU61aJktcq0RXY2Hemat
	xRpfJ8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDqXX-0000000G8Ih-0UL7
	for ath12k@archiver.kernel.org;
	Wed, 20 Nov 2024 19:39:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDqXV-0000000G8IF-0Ja5
	for ath12k@lists.infradead.org;
	Wed, 20 Nov 2024 19:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 84D1A5C554F;
	Wed, 20 Nov 2024 19:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D39C4CECD;
	Wed, 20 Nov 2024 19:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732131540;
	bh=Yi3WJy6m5CwXAjlwhr4BdhlMShZCbdJseWCmo3EP5W8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Whk6ClMGEjtJL7VGPsmtVupTwozwKyMyS0W6cdkFiuX+mgZ4VPqL70fM7DFszf+au
	 9K5XWkSyZSljsLBcIsS6xVbSwMTXhXlx/KH6lyi4VIbWhto6Am5hF7Kq/aqPMNFi86
	 U1h1oaz6oCK5u+AiYb/VEgmYaPHRzFCzFAkfAJvpXsouvfHDoRWNPpFaWbD/LP2dXo
	 IQL8LBJ/83SdGwGTnY7v1WehlRK8dhCXpKKYIelQPmq9McmpI4McoNJ8IXVKQHXBL1
	 0p0VEYjidSWghRi2GGNHswekrrFueXpF8vk4kyWTrRz/eO0pRz14Bmst9feWLdW3Hv
	 DPD/9gPpnYt6g==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Roopni Devanathan <quic_rdevanat@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Dinesh
 Karthikeyan <quic_dinek@quicinc.com>
Subject: Re: [PATCH v6 2/4] wifi: ath12k: Support phy counter and TPC stats
References: <20241115062854.1919672-1-quic_rdevanat@quicinc.com>
	<20241115062854.1919672-3-quic_rdevanat@quicinc.com>
	<13d6d7a6-5073-4dc0-b229-c9b4365756d1@quicinc.com>
Date: Wed, 20 Nov 2024 21:38:56 +0200
In-Reply-To: <13d6d7a6-5073-4dc0-b229-c9b4365756d1@quicinc.com> (Jeff
	Johnson's message of "Fri, 15 Nov 2024 13:16:26 -0800")
Message-ID: <877c8xzodr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_113901_199760_AF1DD8DD 
X-CRM114-Status: GOOD (  12.69  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 11/14/2024 10:28 PM, Roopni Devanathan wrote:
>
>> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
>> 
>> Add support to request counters and Transmission Power Control
>> (TPC) stats through HTT stats type 37. These stats give
>> information about counters like received packet count, CRC pass
>> count, error count, transmit abort count, etc., about counter reset
>> like reset cause, channel frequency, number and mode, channel flags,
>> etc., about TPC like transmit power scale, maximum transmit power,
>> gain cap, EIRP, etc.
>> 
>> Note: MCC firmware version -
>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4 does not
>> support HTT stats type 37, i.e., the firmware does not respond to the
>> command requesting stats.
>> 
>> Sample output:
>> -------------
>> echo 37 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
>> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
>> HTT_PHY_STATS_TLV:
>> bdf_nf_chain[0] = -92
>> bdf_nf_chain[1] = -94
>> bdf_nf_chain[2] = -94
>> bdf_nf_chain[3] = -93
>> .....
>> 
>> HTT_PHY_COUNTERS_TLV:
>> rx_ofdma_timing_err_cnt = 18068
>> rx_cck_fail_cnt = 0
>> mactx_abort_cnt = 2612
>> macrx_abort_cnt = 0
>> .....
>> 
>> HTT_PHY_RESET_STATS_TLV:
>> pdev_id = 0
>> chan_mhz = 0
>> chan_band_center_freq1 = 0
>> chan_band_center_freq2 = 0
>> .....
>> 
>> HTT_PHY_RESET_COUNTERS_TLV:
>> pdev_id = 0
>> cf_active_low_fail_cnt = 0
>> cf_active_low_pass_cnt = 0
>> phy_off_through_vreg_cnt = 0
>> .....
>> 
>> HTT_PHY_TPC_STATS_TLV:
>> pdev_id = 0
>> tx_power_scale = 0
>> tx_power_scale_db = 0
>> min_negative_tx_power = 0
>> .....
>> 
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> 
>> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
>> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>
>> +struct ath12k_htt_phy_stats_tlv {
>> +	a_sle32 nf_chain[ATH12K_HTT_STATS_MAX_CHAINS];
>> +	__le32 false_radar_cnt;
>> +	__le32 radar_cs_cnt;
>> +	a_sle32 ani_level;
>> +	__le32 fw_run_time;
>> +	a_sle32 runtime_nf_chain[ATH12K_HTT_STATS_MAX_CHAINS];
>> +} __packed;
>
> it just occurred to me that these structs are actually misnamed.
> these represent the payload of the tlv, not the actual tlv.
> Kalle, as a future cleanup I suggest that we either rename these or modify
> them plus the parsing code such that the TLV header is included in the struct.

Yeah, that would be good to do.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

