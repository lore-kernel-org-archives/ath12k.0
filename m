Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5746AC4345F
	for <ath12k@archiver.kernel.org>; Tue, 23 Apr 2024 09:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8awUfCO73/yIc4iAaIadfDF1bl3sBBseky4DhQ76QY=; b=gLztUpk5PmXrhX2nx4NtV9W5QM
	EwOdPp3rgd+ApkgLchUG8m30u2nJc/6B/A6wv0eYH9jviLiuLZktnz6qfE8NiJ1LYYcB1x2ucSMe2
	Km0dAudhHBVVMNkdRFpJquG+jfAPFA7lwa24r/1DW22GQg44T89BqKF1JxUzx+vIFBu04vdM8Yhir
	W9RW7x/UaeLzV2mEzH2ZoQFOdZZafJHgOEzx4HnmTXG4UGcFkzH66KepGb/meVscRzua1X2lYI9tt
	jFWwrBiq7iyL5O8VCUYBS3NUm6+MfupOsJTC4LdMfbGwQUDs1gj7t/Xn78Dfrn68Ln+rlmKtFbSlI
	oaSadcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCfz-0000000Gi1a-46yV
	for ath12k@archiver.kernel.org;
	Tue, 23 Apr 2024 09:42:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCfv-0000000Ghxc-3Gjm
	for ath12k@lists.infradead.org;
	Tue, 23 Apr 2024 09:42:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4E242CE0ECC;
	Tue, 23 Apr 2024 09:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1C8C116B1;
	Tue, 23 Apr 2024 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713865371;
	bh=0NEJcL4Fu4kFtcHzsuxbPRyIY+LtD3O0HgV9YNRZ+30=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=EXDtNpoBkeaGMvmR58Cp8HKlK7Y+VEj7m0q4Z2wFw/L3xmcTS0NjD8P4mN7Wfwc7a
	 S1dRwwOFlFqXF9ZXeuy/IhEU3s7a5LdpzWiIYdb7rmLUQp5DiszD3qcMDYcy6nXqvB
	 nGtYAVmTU1gMlMzvgK5aEUoRC7W9VT4vYObxANT9U89A5/4qzrjNujnczJF2Ypa3XL
	 rVfDopcUdqFA3XCKMzUUpNztu5/2XffZN9RBkIPLbt81uBuRBjz0hTzOmMQ70Gj8ZQ
	 HvewLxMTozHPJMK6l2TCbhQ7mOsWI4RCs1xek3RJrXhojPtyh1rYxS5+WFf35xTueT
	 XPd56HJhjEFkQ==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: Nicolas Escande <nico.escande@gmail.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: drop failed transmitted frames from
 metric calculation.
References: <20240419170314.3117623-1-quic_kathirve@quicinc.com>
	<D0QHV8UV73N5.2N5E3MH37JQW7@gmail.com>
	<f4c65f7e-ccc7-4a0b-a6e8-df56d5c19d7f@quicinc.com>
Date: Tue, 23 Apr 2024 12:42:48 +0300
In-Reply-To: <f4c65f7e-ccc7-4a0b-a6e8-df56d5c19d7f@quicinc.com> (Karthikeyan
	Kathirvel's message of "Mon, 22 Apr 2024 22:27:45 +0530")
Message-ID: <874jbsv2hz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_024256_117906_D7DF0F95 
X-CRM114-Status: GOOD (  12.12  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> writes:

> On 4/22/2024 1:35 PM, Nicolas Escande wrote:
>> On Fri Apr 19, 2024 at 7:03 PM CEST, Karthikeyan Kathirvel wrote:
>>
>>> +	case HAL_WBM_TQM_REL_REASON_CMD_REMOVE_MPDU:
>>> +	case HAL_WBM_TQM_REL_REASON_DROP_THRESHOLD:
>>> +	case HAL_WBM_TQM_REL_REASON_CMD_REMOVE_AGED_FRAMES:
>>> +		/* The failure status is due to internal firmware tx failure
>>> +		 * hence drop the frame do not update the status of frame to
>>> +		 * the upper layer
>>> +		 */
>>> +		dev_kfree_skb_any(msdu);
>>
>> Shouldn't this be ieee80211_free_txskb ? I'm not clear when to use
>> which.
>
> Yes, there is an internal patch is in pipeline, that will take care of
> addressing all dev_kfree_skb_any() to ieee80211_free_txskb() in
> ath12k_dp_tx_complete_msdu(), this patch doesn't take care of that.

Let's not add new bugs knowingly. Please fix this patch to use
ieee80211_free_txskb(), that is much more reliable than waiting for some
other patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

