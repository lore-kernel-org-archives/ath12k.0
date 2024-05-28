Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB2DC25B78
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tc/JWKXjZb2ug8+2X9i0CkFvNk1UAQAZ6eCuCTlUvNw=; b=P4EuJFiv9O6x5aZoh5HwExp1Vo
	bw+ar12TTI3a/QDnktdTOBxlsCutlez7jxJMobLBKH6o11/dx/qij7sCwWkRYGiz5DF2ni3mV3LTC
	JBeDGg8gq5uoffSaYKATW+tkmqaYcNA1Y86MIj1wQyEdgPmE9gd6143s+Qw595csZNAEbDtbDObnz
	TKvaoxhfn9SZtakoRLLgmnxLJr89bEjygbeLZrODipcPZ2oWIWaaNjuyNPI2Qc1+HgEqc7epvKVuq
	OjxKQmA2SNefpgfMQYFEyzUfpP5h3Gdk9TWMYbKnRKySuTo6HiMBeOlhobdsuFxh1KG35bxWlna88
	jjSfMo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBuez-00000000JC0-3AGS
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 11:06:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBuew-00000000JB0-1aaZ
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 11:06:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 32F34CE127B;
	Tue, 28 May 2024 11:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B33DC3277B;
	Tue, 28 May 2024 11:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716894383;
	bh=OFv/XQ7TNpRWDLL7BFsEL4AhJkfJ4AV+GjTSjS5J4hQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=LuhkYiuwfZIhwJ7aNOWXnj123F88a3WBjc2t4h5ygqe/3cUwlZt6nLVZo/xhtOQkR
	 +2bP3WvbicsumVeCdGwTt7Nj+WRjRRIBWzLNTUBZqjNOVU5ss0NHSyCU8aZrbhZKCP
	 E+cnvGzFCDE3NTnBC98u9FN640clFKmWnT1XWqImO4lZzDP8LUArN7MpAyhl3O9VCN
	 vbsk7vVJ1o28dAB4+tdAIL8tHHrvx+aUOQKRJXb2Rkf4XLmJ74QEWS+YBbVEzORGz2
	 +cwhnpuxVEakZUdHDSOrhl7K1cw0sY30xyadZXiHd8TZ8e2157sxU7/QwN/Er4K+E7
	 hmZzqMxUAdVuw==
From: Kalle Valo <kvalo@kernel.org>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] wifi: ath12k: Dump additional Tx PDEV HTT stats
References: <20240510050806.514126-1-quic_rgnanase@quicinc.com>
	<20240510050806.514126-6-quic_rgnanase@quicinc.com>
	<87le43d26u.fsf@kernel.org>
	<024e2594-309a-4549-9c69-d527717c5dd4@quicinc.com>
Date: Tue, 28 May 2024 14:06:20 +0300
In-Reply-To: <024e2594-309a-4549-9c69-d527717c5dd4@quicinc.com> (Ramya
	Gnanasekar's message of "Mon, 27 May 2024 15:08:40 +0530")
Message-ID: <87r0dm6vrn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_040626_695033_BE6FA4BC 
X-CRM114-Status: GOOD (  11.55  )
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

>>> +static inline void
>>> +ath12k_htt_print_tx_pdev_mu_ppdu_dist_stats_tlv(const void *tag_buf,
>>> +						struct debug_htt_stats_req *stats_req)
>>> +{
>>> + const struct ath12k_htt_tx_pdev_mu_ppdu_dist_stats_tlv
>>> *htt_stats_buf = tag_buf;
>>> +	char *mode;
>>> +	u8 j, hw_mode, i, str_buf_len;
>>> +	u8 *buf = stats_req->buf;
>>> +	u32 len = stats_req->buf_len;
>>> +	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
>>> +	u32 stats_value;
>>> +	u8 max_ppdu = ATH12K_HTT_STATS_MAX_NUM_MU_PPDU_PER_BURST;
>>> +	u8 max_sched = ATH12K_HTT_STATS_MAX_NUM_SCHED_STATUS;
>>> +	char str_buf[ATH12K_HTT_MAX_STRING_LEN];
>>> +
>>> +	hw_mode = le32_to_cpu(htt_stats_buf->hw_mode);
>>> +
>>> +	switch (hw_mode) {
>>> +	case ATH12K_HTT_STATS_HWMODE_AC:
>>> +		len += scnprintf(buf + len, buf_len - len,
>>> +				 "HTT_TX_PDEV_MU_PPDU_DISTRIBUTION_STATS:\n");
>>> +		mode = "ac";
>>> +		break;
>>> +	case ATH12K_HTT_STATS_HWMODE_AX:
>>> +		mode = "ax";
>>> +		break;
>>> +	case ATH12K_HTT_STATS_HWMODE_BE:
>>> +		mode = "be";
>>> +		break;
>>> +	default:
>>> +		return;
>>> +	}
>> 
>> Why are we not adding "HTT_TX_PDEV_MU_PPDU_DISTRIBUTION_STATS:\n" with
>> ax and be modes?
>> 
> Sorry for the delayed response. I was on OoO for a week.

No worries.

> We will receive this TLV for each hw modes. Since
> "HTT_TX_PDEV_MU_PPDU_DISTRIBUTION_STATS:\n" is header and it would be
> suffice to print it once, hence added it inside hw mode ac which will be
> the first hw mode integrated inside the TLV.

I would have expected that we print that outside of
ath12k_htt_print_tx_pdev_mu_ppdu_dist_stats_tlv(), before the function
is called at all.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

