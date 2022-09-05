Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D593ECAAD3
	for <ath12k@archiver.kernel.org>; Mon,  5 Sep 2022 18:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jo3oc7sZWXZJ8x4Obd6JQPyFup6ASXtAUHwIpUVEO8U=; b=y86kyWTVj4IenX
	7HEPQJ75dAqx75ZgxbLig+wZGse7DMVVesNeffbuvlSqG7O0DxJHxB2DZ4TRe2X7IKyBgBGx72L75
	FGS17vTMGmsONBHeDRkWHoMxy2kGIIaJU2iFUhUrVsPEJoIV6vTNnENLM6BQYIdBY7lNKv0NzlH2V
	h5adz4B6N2r5BxDWYFyVA8/wM6eVwTmkpDUITovK9uEraSd/z4+FdJWdZ13T3FR5ZofEwha2RmWzy
	ldLoN1r4VFlzbbtnctjbNHcs3HOqsJvslntWvhcS1lKeAEsNvBFNLwcPLF91Q7RlTByrnCpdniqau
	UXUX/Mf/csusliNUhM1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHGN-008oIn-NC
	for ath12k@archiver.kernel.org; Mon, 05 Sep 2022 18:56:03 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFv6-007ZwY-Sy
	for ath12k@bombadil.infradead.org; Mon, 05 Sep 2022 17:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YYfBfAEwjXsdCSfDLY+JGlk9fbvyfif9J3n/bTdG2jE=; b=U3chteZCCcAL6HApKo9iDPNgTr
	/DLf7ZcSTAyRdNkWaLyO51BEIE2HF0bP0DdMiQRNnTpjECmLrSGwefAYOWWMJu0azXkKZYjGQU0VN
	Q3creLJn1dBp7VHPTJPn8nmnRje7fqR8DrKK5diJ9Wqy1fGI6tXEdAlx4C0c709lAoq6gEVFqA6Ml
	tPrPF6OtuFqw45kZcKA+uvQZSwFk134LMj/B8gcK71hJOszaO3FEL4dx4pHXzYFE30dAO6SVBENs1
	I2aQcwfRQ3DM2MGHV2mfqcQwEcxMvI7SlyTt1sGWToaryq7q4HgVlhwEqXpeoUQcQndbe5KzmCm+t
	XSo0yZ4w==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFsf-009rqu-Rp
	for ath12k@lists.infradead.org; Mon, 05 Sep 2022 17:27:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5178161326;
	Mon,  5 Sep 2022 17:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECAEC433D6;
	Mon,  5 Sep 2022 17:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662398843;
	bh=fJpAOfJekN2R/5hBZo84bD//9tKTsWRdDFtRLRiqM9g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Pd34kc6GWu5jRr99i7Y6M5PaRdRSR7joIuJ08yM6veDktvVCm0phfNbZy51iE+c+b
	 KfJN++OszYQJqm45UK6ECO4KhGu1rJhR3X8IBvP6qHpg8K6pdXyejlkuY87mBrG0uz
	 KPsGzAdaOMefYxrfYW7m3xxfvABzkW2k32pmh/l+uO3feOofJZ5z5CW4Lzl8JMAqUs
	 xl1p9PMJmGuAoklfyjKg8OjUDb2VHxr4Hg/XEfo1kGC51zjDQwN+GrS5moPCEjvbcK
	 PtNREKN3ZLej7obmybSMdW80+9atGuTxnXghB4hU+szSwqS5DRnIIl03apJsKw6hHE
	 gRnjjvBHxepRA==
From: Kalle Valo <kvalo@kernel.org>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "ath12k\@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Re: [PATCH 12/50] wifi: ath12k: add dp.h
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-13-kvalo@kernel.org>
	<0eabd6c1b3ca4d8a8152ad5b4f3efee6@realtek.com>
Date: Mon, 05 Sep 2022 20:27:20 +0300
In-Reply-To: <0eabd6c1b3ca4d8a8152ad5b4f3efee6@realtek.com> (Ping-Ke Shih's
	message of "Mon, 15 Aug 2022 01:56:29 +0000")
Message-ID: <87leqxag07.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_182730_056213_AD52E4D8 
X-CRM114-Status: GOOD (  16.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Ping-Ke Shih <pkshih@realtek.com> writes:

>> -----Original Message-----
>> From: Kalle Valo <kvalo@kernel.org>
>> Sent: Saturday, August 13, 2022 12:09 AM
>> To: linux-wireless@vger.kernel.org
>> Cc: ath12k@lists.infradead.org
>> Subject: [PATCH 12/50] wifi: ath12k: add dp.h
>> 
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> (Patches split into one patch per file for easier review, but the final
>> commit will be one big patch. See the cover letter for more info.)
>> 
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/dp.h | 2017 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 2017 insertions(+)
>> 
>> diff --git a/drivers/net/wireless/ath/ath12k/dp.h
>> b/drivers/net/wireless/ath/ath12k/dp.h
>> new file mode 100644
>> index 000000000000..cf9610dffbb8
>> --- /dev/null
>> +++ b/drivers/net/wireless/ath/ath12k/dp.h
>
> [...]
>
>> +
>> +struct htt_srng_setup_cmd {
>> +	u32 info0;
>> +	u32 ring_base_addr_lo;
>> +	u32 ring_base_addr_hi;
>> +	u32 info1;
>> +	u32 ring_head_off32_remote_addr_lo;
>> +	u32 ring_head_off32_remote_addr_hi;
>> +	u32 ring_tail_off32_remote_addr_lo;
>> +	u32 ring_tail_off32_remote_addr_hi;
>> +	u32 ring_msi_addr_lo;
>> +	u32 ring_msi_addr_hi;
>> +	u32 msi_data;
>> +	u32 intr_info;
>> +	u32 info2;
>> +} __packed;
>> +
>
> Should they be '__le32' instead of 'u32'?
>
> This struct is used to fill data of ath12k_htc_send(), and the fields of
> htc header are __le32: 
>
> struct ath12k_htc_hdr {
> 	__le32 htc_info;
> 	__le32 ctrl_info;
> } __packed __aligned(4);
>
> If above is correct, some struct(s) related to ath12k_htc_send() have
> similar problems:
> struct htt_ver_req_cmd
> struct htt_ppdu_stats_cfg_cmd
> struct htt_rx_ring_selection_cfg_cmd
> struct htt_ext_stats_cfg_cmd
> struct htt_tx_ring_selection_cfg_cmd  (miss __packed)

Good catch, we'll fix those and the missing __packed. Thanks for the review!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
