Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFE1C3064D
	for <ath12k@archiver.kernel.org>; Thu, 27 Jun 2024 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZQvxiNdKDUPBmYVD0vxiABvhrgr/USoR9JXofU3gM4=; b=sG6OUuArvEfkiqvjqXfwgdh+Cy
	wTa1RWPoLXgaiHllvQwu/YcAKBH6WSghanfW3IfqlfRYqJOG2v/h9ypGa/iuezcTl0BOMAbPiuYO8
	KJcdlxn2a9Ql8PerXTVe0a1R8H5t1s8L9H+DQ+zrTGUbd1MU7vR0dj4e83UIHgV16XLbnm+wQ1qdz
	uacF1ymjX8IveKoPaz2VF+7wd6VhwW0gNTku7BhAz2sw7/IVTtEoALnGq2+kbmC3COWHIBWIV8ryY
	KcZUgRDelaU0yBBQNNPbjXk2C56HAxTPKFCXQM20C6KuYjiqsBSQuSGFlHLNGbI6W/cvZnojfNfIg
	gxfZf9xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrst-0000000B16p-222T
	for ath12k@archiver.kernel.org;
	Thu, 27 Jun 2024 16:22:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrsq-0000000B14p-39qi
	for ath12k@lists.infradead.org;
	Thu, 27 Jun 2024 16:22:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 31FAD61E1B;
	Thu, 27 Jun 2024 16:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13C4C2BBFC;
	Thu, 27 Jun 2024 16:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719505322;
	bh=kVLYV7wBgQxmFh3aypgRbiiiHGjW8/Z2O0qs1JuDPUI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=oEQyaSPPC/uxDY8WI+6LGF11pXkgny5Urm0SRMnJYYhCQihD/dFusuB07/b0XCV+Y
	 RHV1jE7DBuMJMuhWFehTn2kk+//p6ka/ndvF3zJGSFZMcTLYEd7uyBFi8SfWmgqzjL
	 aCaoeR2jCJuTakPgMPFF16GLW6vSogFGLgIZgiDpsWP+2JryLVK10k+LETrt0EY26X
	 crGCMrQpomQtgscKvC0xdqgWvHIc4VQD3HTXeB2CGLtVZG79fZDWDJF+GatFv/Vp47
	 lar/8aJBpdisdN832DPHlos20tu0T9bJTwt493SIKwUpmbMWD4YegXg9+sFMz4eB5X
	 337v150xiokmA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: Allow driver initialization for WoW
 unsupported
 devices
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240626024257.709460-1-quic_ramess@quicinc.com>
References: <20240626024257.709460-1-quic_ramess@quicinc.com>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Rameshkumar Sundaram
	<quic_ramess@quicinc.com>, <stable@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171950531986.2164695.17835818417025337826.kvalo@kernel.org>
Date: Thu, 27 Jun 2024 16:22:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_092204_949904_BA9F1926 
X-CRM114-Status: UNSURE (   6.41  )
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

Rameshkumar Sundaram <quic_ramess@quicinc.com> wrote:

> Commit 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities") broke
> driver initialization, now mac registration is allowed only for devices that
> advertise WMI_TLV_SERVICE_WOW, but QCN9274 doesn't support WoW and hence mac
> registration is aborted and driver is de-initialized.
> 
> Allow mac registration to proceed without WoW Support for devices
> that don't advertise WMI_TLV_SERVICE_WOW.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9783e0407421 wifi: ath12k: fix driver initialization for WoW unsupported devices

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240626024257.709460-1-quic_ramess@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


