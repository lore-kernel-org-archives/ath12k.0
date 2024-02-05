Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE424C4828D
	for <ath12k@archiver.kernel.org>; Mon,  5 Feb 2024 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Q8EFFedaXj7WDNwu52pImfXlitC5Z/0rxc1XStBMmw=; b=Ve6QHoSrhc4mxC7+bnx7hg6THc
	JtBDA8/oES4Iooa33+Yxkn/+nIw0WOr1CDquC6nSVDToBX5vZa0IFdIc/XT3XvfAFQV40l7HzYkP0
	fzN3uRDDHPy6JMnVRgvuC4B+ASrxlJuox+4LR1TRBHsG+b1c9gVlPJtl0AZterw5uYNmqacMOKKqk
	cd5/cfhJ12XK5nIyH9ODuZ0WmAf6ymMgzDorTv4Yx2j0WxeCPKuIGFCREYD9VtO/2m0PMqhRlaCfm
	oQqH8OJyfZ8XD/oYjDNfyT3akuixSB4ccL7o62x9vWoecQTg1iywUxA+QHN5OX/V92qirZDZ5lcfb
	rt0MvnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1eu-00000003xmC-1UaC
	for ath12k@archiver.kernel.org;
	Mon, 05 Feb 2024 16:17:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1eo-00000003xj8-0Wp2
	for ath12k@lists.infradead.org;
	Mon, 05 Feb 2024 16:17:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7412A60FED;
	Mon,  5 Feb 2024 16:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6FFC433F1;
	Mon,  5 Feb 2024 16:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707149837;
	bh=zlF1znOg4DaD2qj2azQ5lGme9OlhIk2O3oHaH5uFPpI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=dHvPP3sbpckVuCgj6s1HL+X/rO6HxRqZyaoeMm31VvqdHMKEoyPQUedKgs0p5jVAS
	 TmUGg8VYACmXEnDShszkXATDMxuoM+zaGwyvDehH/kmC0gAxKIHeUFNn8agy2A4PrV
	 a3OVOR4KlhUvpN6gL/NOQkonwC1Cyvefky6xM1Ry39Tc1eRYMznweSMWv2U3KvbdrL
	 PZCLMNM14ovw8sGLMZ6ZQJr12l6TfG2rgqvnLCFRIejekguGd+rFejtiiBZvm1cRkm
	 bfA5SIwjtp9xb2JTie5j7aYC/QFu5D9UFNGZ6LyiJqF6zh/w23KmH+HACO+S3McFT3
	 1ZIXdcnT2SkWw==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6 04/11] wifi: ath12k: add P2P IE in beacon template
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
	<20240130040303.370590-5-quic_kangyang@quicinc.com>
Date: Mon, 05 Feb 2024 18:17:14 +0200
In-Reply-To: <20240130040303.370590-5-quic_kangyang@quicinc.com> (Kang Yang's
	message of "Tue, 30 Jan 2024 12:02:56 +0800")
Message-ID: <87bk8usx6d.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_081718_523604_74D7CD3E 
X-CRM114-Status: GOOD (  12.02  )
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

Kang Yang <quic_kangyang@quicinc.com> writes:

> P2P Element is a necessary component of P2P protocol communication.
> It contains the Vendor Specific Information Element which includes
> the WFA OUI and an OUI Type indicating P2P.
>
> Add P2P IE in beacon template, and implement WMI interface for it.
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

[...]

> +static int ath12k_mac_remove_vendor_ie(struct sk_buff *skb, unsigned int oui,
> +				       u8 oui_type, size_t ie_offset)
> +{
> +	size_t len;
> +	const u8 *next;
> +	const u8 *end;
> +	u8 *ie;

Reverse xmas tree and you can merge next and end:

const u8 *next, *end;
size_t len;
u8 *ie;

I changed that in the pending branch.

> +	if (WARN_ON(skb->len < ie_offset))
> +		return -EINVAL;
> +
> +	ie = (u8 *)cfg80211_find_vendor_ie(oui, oui_type,
> +					   skb->data + ie_offset,
> +					   skb->len - ie_offset);

So cfg80211_find_vendor_ie() returns:

static inline const u8 *
cfg80211_find_vendor_ie(unsigned int oui, int oui_type,
			const u8 *ies, unsigned int len)

You are casting away the const here. I see that other drivers do the
same as the assumption is that the pointer points to the same buffer,
but I still don't really like casting away const. Thoughts?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

