Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5634CC25B75
	for <ath12k@archiver.kernel.org>; Fri, 31 May 2024 18:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQBKP8HIU7V/qhU5K2EXPD0S9Lhu7hxxodXhouTJL8o=; b=jBocUOrjQODyu0QKQ0iqzRJwXC
	vpJP3/IZzqVWhjh+rTZbriLC0+4ylF5gPoGYhZtWAKI+cX6SkuiNNG/ba5jK0F7xbXMhU64FJYtsE
	zddaDIhLP9ev+8OBlTcGOt1LHOMOJ05zACxy+wgj1J2hxZwTrh1uDdC0OBL++liUd6m7keND2mTo5
	MKvOWlKTz36OGtPPe+TJdExWrlZHKIzxBeMbUlpRbN9QCnTm0GL6jVvuqUdLGo9jfpsOU+XyvUToB
	AYy1IXd8M8LlbDRH/XE4Gt5xykvAYMqpp8AQXd/AL8UGePe6bpQ7gf3TZ2jZXvMMTvQUZkgDVSWcX
	PLg6otzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD6YI-0000000B4YN-49kB
	for ath12k@archiver.kernel.org;
	Fri, 31 May 2024 18:00:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD6YE-0000000B4XQ-2P7d
	for ath12k@lists.infradead.org;
	Fri, 31 May 2024 18:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2E8B62AF4;
	Fri, 31 May 2024 18:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3199C116B1;
	Fri, 31 May 2024 18:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717178425;
	bh=qlU+WYP7/d64bQDIKAIfVrPzMMEKKHCH53akTxStboM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=lNKTL/jNEiGb4YbmYyYpb0yznZrbnZAH76r+euDZAWw2ddMSrKIJwz0cLi2L8E/+h
	 49D9KYx5JtN3IE7zKkCr87TfwH39P8a0FGrlVeqtv8y2wAf0R5S+O+8KKUZ0l5lzCH
	 uAEx1ypz4TB9UC7cTF3Lup3klluADc0iWBXijEFJl0E++QZID907DWBo/ymRI9+3TU
	 lX0MzI7JRqqt1/P8bEkG52O0fb+XfnNXQAISI2riELgMd20vB/OmDIJtkKjYd8ZXVw
	 t2BDTSWVLXzpGqsLTOz4uCXRjoOQ5ptpsaxp3491zUvsraY0gK44RjK/nw6zxVwf68
	 QVBAlP1tQgNMA==
From: Kalle Valo <kvalo@kernel.org>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] wifi: ath12k: Dump additional Tx PDEV HTT stats
References: <20240510050806.514126-1-quic_rgnanase@quicinc.com>
	<20240510050806.514126-6-quic_rgnanase@quicinc.com>
	<87le43d26u.fsf@kernel.org>
	<024e2594-309a-4549-9c69-d527717c5dd4@quicinc.com>
	<87r0dm6vrn.fsf@kernel.org>
	<1be3531d-b550-4b19-93bb-d41e93362e19@quicinc.com>
Date: Fri, 31 May 2024 21:00:22 +0300
In-Reply-To: <1be3531d-b550-4b19-93bb-d41e93362e19@quicinc.com> (Ramya
	Gnanasekar's message of "Tue, 28 May 2024 22:18:18 +0530")
Message-ID: <87plt1vp3d.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_110027_438704_7975393B 
X-CRM114-Status: GOOD (  13.19  )
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

Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:

> On 5/28/2024 4:36 PM, Kalle Valo wrote:
>> Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:
>> 
>>>>> +static inline void
>>>>> +ath12k_htt_print_tx_pdev_mu_ppdu_dist_stats_tlv(const void *tag_buf,
>>>>> +						struct debug_htt_stats_req *stats_req)
>>>>> +{
>>>>> + const struct ath12k_htt_tx_pdev_mu_ppdu_dist_stats_tlv
>>>>> *htt_stats_buf = tag_buf;
>>>>> +	char *mode;
>>>>> +	u8 j, hw_mode, i, str_buf_len;
>>>>> +	u8 *buf = stats_req->buf;
>>>>> +	u32 len = stats_req->buf_len;
>>>>> +	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
>>>>> +	u32 stats_value;
>>>>> +	u8 max_ppdu = ATH12K_HTT_STATS_MAX_NUM_MU_PPDU_PER_BURST;
>>>>> +	u8 max_sched = ATH12K_HTT_STATS_MAX_NUM_SCHED_STATUS;
>>>>> +	char str_buf[ATH12K_HTT_MAX_STRING_LEN];
>>>>> +
>>>>> +	hw_mode = le32_to_cpu(htt_stats_buf->hw_mode);
>>>>> +
>>>>> +	switch (hw_mode) {
>>>>> +	case ATH12K_HTT_STATS_HWMODE_AC:
>>>>> +		len += scnprintf(buf + len, buf_len - len,
>>>>> +				 "HTT_TX_PDEV_MU_PPDU_DISTRIBUTION_STATS:\n");
>>>>> +		mode = "ac";
>>>>> +		break;
>>>>> +	case ATH12K_HTT_STATS_HWMODE_AX:
>>>>> +		mode = "ax";
>>>>> +		break;
>>>>> +	case ATH12K_HTT_STATS_HWMODE_BE:
>>>>> +		mode = "be";
>>>>> +		break;
>>>>> +	default:
>>>>> +		return;
>>>>> +	}
>>>>
>>>> Why are we not adding "HTT_TX_PDEV_MU_PPDU_DISTRIBUTION_STATS:\n" with
>>>> ax and be modes?
>>>>
>>> Sorry for the delayed response. I was on OoO for a week.
>> 
>> No worries.
>> 
>>> We will receive this TLV for each hw modes. Since
>>> "HTT_TX_PDEV_MU_PPDU_DISTRIBUTION_STATS:\n" is header and it would be
>>> suffice to print it once, hence added it inside hw mode ac which will be
>>> the first hw mode integrated inside the TLV.
>> 
>> I would have expected that we print that outside of
>> ath12k_htt_print_tx_pdev_mu_ppdu_dist_stats_tlv(), before the function
>> is called at all.
>> 
>
> Function itself will be called more than once.

Sure, I got that. But I still think it is not really good design to
print it like that.

Maybe the output could be something like below? Or print the mode
separate in the first line?

HTT_TX_PDEV_MU_PPDU_DISTRIBUTION_STATS:

ac_mu_mimo_num_seq_posted_nr4 = 0
ac_mu_mimo_num_ppdu_posted_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
ac_mu_mimo_num_ppdu_completed_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
ac_mu_mimo_num_seq_term_status_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,

....

HTT_TX_PDEV_MU_PPDU_DISTRIBUTION_STATS:

ax_mu_mimo_num_seq_posted_nr4 = 0
ax_mu_mimo_num_ppdu_posted_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
ax_mu_mimo_num_ppdu_completed_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
ax_mu_mimo_num_seq_term_status_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,

ax_mu_mimo_num_seq_posted_nr8 = 0
ax_mu_mimo_num_ppdu_posted_per_burst_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
ax_mu_mimo_num_ppdu_completed_per_burst_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
ax_mu_mimo_num_seq_term_status_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

