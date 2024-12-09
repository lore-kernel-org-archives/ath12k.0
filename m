Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ACAE7717D
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bk30PHksNSH205ckxiQ/Lfg3iE5hsXXjQlclXTNIww0=; b=R5DxQWadr5uA7Fa/UV8Ekjey7N
	ReQY0ebDt2KD/EFjCSRZzd4sA59B/JjNfAzR2FFo9JXo3PuGdQfOs8+sFXXSi92TN224tOuUoCoI6
	CqrOBMuZq+WhIbJTT342QAndJdRKjFHr06DVUKDcnvAmN3oBDRmR5dSKs/SgHjgw18BnnlIAkc5L+
	2iLhNOgTxnI3OTBqQCTDVorjKanlPf15Bl6NkQwhQQqC8y9UP5pqFwL5NmrRCJcR8gVCe6G5jlA9P
	L462SiuqYpZN/RLxdnOJwOk1pnHlga7AdoweZAjOcu+rBaifINLPf/IB2ts8v4IETI4/znlkCHwOM
	Nindm7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfpT-00000008Pa9-0GLc
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 15:37:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfpQ-00000008PZi-028w
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 15:37:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9DC6FA416D6;
	Mon,  9 Dec 2024 15:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D33C4CED1;
	Mon,  9 Dec 2024 15:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733758662;
	bh=cXpfKad7ahdOsjhCoNvLsP9akGn3j6cxcJ0cD82I8co=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nd+XeR4u4fWoq3FzdBO50fYSn4o3+gZdL4MRRWbuRc0rB0IL4jMU9yIGv9LDBCAbG
	 Rzp6hZ+NzdSCT6lcr0806Tv0uQU0ZUhk6Ui7DJ3BaG97+54pt7cvME+8TRIgLSbpzK
	 8ISTTRAhn/Z49zdozu7N/JuanYFw0QfO6F4pKLy0nLhv6Vun8g9EHbZ/BIgp6Q3qxB
	 mdVwz7Ov1BZebPT1wlGinm+/VFd0EcGhU+JbCIW2TvSGIO1QZCA1ZBWELd9s7RnoGs
	 nN8Ga3b4x/Owc4VANDL4so8Acv/No/i2qGzvUEv2jo7S2lukbE6gYGkC2TSi9nrbx6
	 YgkoAPygtazkQ==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fix leaking michael_mic for non-primary
 links
References: <20241206054552.177424-1-quic_bqiang@quicinc.com>
Date: Mon, 09 Dec 2024 17:37:40 +0200
In-Reply-To: <20241206054552.177424-1-quic_bqiang@quicinc.com> (Baochen
	Qiang's message of "Fri, 6 Dec 2024 13:45:52 +0800")
Message-ID: <87ikrssw8r.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_073744_111220_BF9AA635 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> In ath12k_dp_rx_peer_frag_setup(), commit ea4192553850 ("wifi: ath12k: add primary
> link for data path operations") checks whether a link is the primary link, and
> returns directly if it isn't. In ML scenario where we have non-primary links created,
> this results in leaking the michael_mic info since it is allocated by default but
> could never be freed for a non-primary link.
>
> Note that we can not move the might-sleep allocation after primary link check since
> there we are in atomic context (due to spin lock). So keep the default allocation,
> and then free it before return to fix this issue.
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Fixes: ea4192553850 ("wifi: ath12k: add primary link for data path operations")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

