Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B0FC52D6F
	for <ath12k@archiver.kernel.org>; Wed,  7 Aug 2024 08:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4HsaKWiA6y7mBArB8gIUXNyAWPZsvShggwz9xOovco=; b=rUx/0QJzV0wnYixlJGbM7gr+W3
	R36QkYqqo5v0jJbhhgE3h9hDBg7y9mYgcBhERIsvm5ynzWc6rl9G0rtk3UOhe56JqNtKkfEOOOYq1
	pMh6hbv0mD2WSFT9iOidJ3oIhJE2/2O63TZ6VlnwCKA2pknO+YfE8SdhP6Rbu0e/n/q/YOOD2yeG6
	c0qO8Tl6RxOBdZHMGblC5cedS2qKx2Cfe6myTRq7aNIbsZXTMhzFcZ116Qb5PPShpW6YrlO+eqXnm
	TMYuO07QKDhJY6qwdun0Wjlprawvo4pjnEfurGs+Ldd9/gO9bFj/WLLXU/WtVK8pVzK1HVGlmqI2h
	xp4s8pwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbboq-00000004K9P-25bc
	for ath12k@archiver.kernel.org;
	Wed, 07 Aug 2024 08:14:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbboo-00000004K8f-1vqk
	for ath12k@lists.infradead.org;
	Wed, 07 Aug 2024 08:14:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CEB8E61187;
	Wed,  7 Aug 2024 08:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986C3C4AF10;
	Wed,  7 Aug 2024 08:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723018489;
	bh=S6A48Lo+MHIv1exsOmOR5EUr4shcLF6VpRjYFZfgIiU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=J7/X8GG+STwwU5AkaNvtfMCXT6PXw8Pr/JRx9zb0Oug8gLmSUlEp0+EKu0BMcPrIB
	 EJBAqin7zo8A88cm8036eEDFf6F1lUfnRwN/kPqUujNl/coCCCfChLQnsFKj5eTwXH
	 OKHyFd6ca9kOtOFnutl2pJPtS0MopeqY1r/SGYvUsnOXhb4QGzq0PMdIXBklcaPiJQ
	 Ac6xyd8UjSSsMTf+FgqEnLa0CJOdH9lsK9GO5uoI3SsM7GCF9xhWfs7+EFN+NJfF22
	 x/TEx2v2iJMVk2Kl2RAn+/1nWhCFccjmNxg0YL1lF6vGaksM0N9oX2gQe0YqlpMmAo
	 s5Fza+4fnjf7Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: fix invalid AMPDU factor calculation in
 ath12k_peer_assoc_h_he()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240710021819.87216-1-quic_bqiang@quicinc.com>
References: <20240710021819.87216-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172301848704.3886758.606294440184310150.kvalo@kernel.org>
Date: Wed,  7 Aug 2024 08:14:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_011450_583912_8BF69304 
X-CRM114-Status: UNSURE (   5.10  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Currently ampdu_factor is wrongly calculated in ath12k_peer_assoc_h_he(), fix it.
> 
> This is found during code review.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

a66de2d0f22b wifi: ath12k: fix invalid AMPDU factor calculation in ath12k_peer_assoc_h_he()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240710021819.87216-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


