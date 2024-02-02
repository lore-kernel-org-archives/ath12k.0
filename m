Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07C4C47DB3
	for <ath12k@archiver.kernel.org>; Fri,  2 Feb 2024 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAJlq1hnC/EhYGnyIJmtWOP8z/ZmMFq6UCSoY7fP69k=; b=neVln0xnjLkNPfvKpc0vtiQgLr
	GuwNkuTMyKX7lzysDJnvEwHbnh5mOGrDUnz9YhwePtckZpDFYLFNp24RrJYpM0kdDgE0KuYGSiy5r
	KTzJblDM8ijg7BPsiBINlF9dmWuzVHjzAxQQk9YHTm/duO1FJuEHleXpien/LGEjQ0ZYJWW0bKKYg
	yuhZD3/yCV90f0bG5gKfxTBwY6hyGTvYF7xepDwwJ1qAyq3mgf4kvTFg8/tOZfEDVg5fVMl255IZF
	kc9PUG/3TMPPSG7VEGZ+4JYJSkKS91h+AmjSCSOA4DJIHWrgZCN9z7rwSOWQw2p/B8Wcd7C7RINv7
	le+28PUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVseA-0000000BTYn-2Leo
	for ath12k@archiver.kernel.org;
	Fri, 02 Feb 2024 12:27:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVse7-0000000BTXQ-1LYT
	for ath12k@lists.infradead.org;
	Fri, 02 Feb 2024 12:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 96015CE2B54;
	Fri,  2 Feb 2024 12:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7710DC43390;
	Fri,  2 Feb 2024 12:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706876868;
	bh=4+Tcqf7flwEe/Wihkl7auL2+mJsPDzRGCARCAnx0HDQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=oZcBYhVetNgRqy0DqkE0VFQmZDURpoxSzAcn5HzU3GBv79dhEKLb+GHqj5vJqhbJs
	 PEbZ3jOsXZkqGquMNxpjafKCwBibOYys8DC9czykF+zuj1ULc/vvbc49PWKJptles3
	 7Dr3jSulOEcYQ6pinYR9CxlcNGwl3IekRKYaMgd0+DbOlqW+Zi4Gm6FhURtrtiF4Mn
	 pwP3lwF9oCrQYZ3kqXwz490lepFfM+NbOlOYxKCrJaxGKHF5grpqmNgVYdvjdY+b8v
	 N3jXTWVvwGE1XvTlr312+nXpi850pmubDrjTnI7yoLHFEseOjcxRHmjBnvIxM1yDID
	 S7OgaHCh7RFeA==
From: Kalle Valo <kvalo@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Subject: Re: [PATCH v3 09/13] wifi: ath12k: subscribe required word mask
 from rx tlv
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
	<20240129065724.2310207-10-quic_rajkbhag@quicinc.com>
Date: Fri, 02 Feb 2024 14:27:45 +0200
In-Reply-To: <20240129065724.2310207-10-quic_rajkbhag@quicinc.com> (Raj Kumar
	Bhagat's message of "Mon, 29 Jan 2024 12:27:20 +0530")
Message-ID: <87eddvt5j2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_042751_556615_CE4C54E1 
X-CRM114-Status: GOOD (  15.40  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> writes:

> From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
>
> Most of the RX descriptors fields are currently not used in the
> ath12k driver. Hence add support to selectively subscribe to the
> required quad words (64 bits) within msdu_end and mpdu_start of
> rx_desc.
>
> Add compact rx_desc structures and configure the bit mask for Rx TLVs
> (msdu_end, mpdu_start, mpdu_end) via registers. With these registers
> SW can configure to DMA the partial TLV struct to Rx buffer.
>
> Each TLV type has its own register to configure the mask value.
> The mask value configured in register will indicate if a particular
> QWORD has to be written to rx buffer or not i.e., if Nth bit is enabled
> in the mask Nth QWORD will be written and it will not be written if the
> bit is disabled in mask. While 0th bit indicates whether TLV tag will be
> written or not.
>
> Advantages of Qword subscription of TLVs
> - Avoid multiple cache-line misses as the all the required fields
> of the TLV are within 128 bytes.
> - Memory optimization as TLVs + DATA + SHINFO can fit in 2k buffer
> even for 64 bit kernel.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

[...]

> +static void
> +ath12k_hw_qcn9274_compact_rx_desc_set_msdu_len(struct hal_rx_desc *desc, u16 len)
> +{
> +	u32 info = __le32_to_cpu(desc->u.qcn9274_compact.msdu_end.info10);
> +
> +	info = u32_replace_bits(info, len, RX_MSDU_END_INFO10_MSDU_LENGTH);
> +	desc->u.qcn9274_compact.msdu_end.info10 = __cpu_to_le32(info);
> +}

Don't we have le32_replace_bits()? That would simplify this function.

No need to resend because of this, but a followup patch cleaning this up
would be nice.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

