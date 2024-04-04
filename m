Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F93CD1297
	for <ath12k@archiver.kernel.org>; Thu,  4 Apr 2024 10:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78YNN8Bi7ONdV9gorBJskPgTVvnHMLZiUls6jRo6jmE=; b=qq43YVHywSt4SS+4s2YxjP05sI
	4to2rci9BTl1wglT0ewFIcHpt2iBusQ3pHpMXRxbJmq+KAiM0h/8tdfHcUiutMt/OKC/pDxg6dJl+
	SwQI2QQs9FYxho9ROc7q6RdaZTYGQfKYGdm1XbPWbSvJL0EGzCD4UdD7Q3Gu05AKASFylp85VjHpj
	2CchxIBge473tgxQf57znjoe2ezOmOI+Xq3DThEuKKkJdl08I76QeWfh4grC0/u7hf3qjIq+6WB1O
	U+V5DAiikCMcy6oMqzmezivTZIM2UPkSEX/tv3+VdMy/5C103u7LEaHsNXsUVsAwOL/S9USW0pZ0c
	n/Jm5iAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsK3n-000000028WT-30CD
	for ath12k@archiver.kernel.org;
	Thu, 04 Apr 2024 10:11:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsK3k-000000028Vn-14UE;
	Thu, 04 Apr 2024 10:11:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4760C614F6;
	Thu,  4 Apr 2024 10:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D078C433C7;
	Thu,  4 Apr 2024 10:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712225462;
	bh=2ICbELwnFGH+a0N7gJ1LBKZFvxxZnlHWv/8MCXufs+k=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=afcAcSgjXrXmctBSAV8A90nVsSdGsh4iUp3glik9135/662NTYSgRfh4QL0ffe3ue
	 42eI70RY4kYnfBjI9nF8kWeHJCFSYGy/ZJVEnVHJ84wEG3PvRKL3Vb5KtgoFj4etML
	 BVfmxieaaj3LIecYBCiWMPtYKck/6qn7AEEUL+PVd1/duhbO5CMR/VvULehl7zY8aA
	 JRO2RE14PQkbcImPCQaSGhoMQPiJYhHe+Mv0WD3CUivKpG1YviUUQG0aEC5mkFHtc3
	 EDIL9KdnIlBr6oBEOE/MtRX2TdNfyHT9+araegpgK4dqEKErt1iwe1GtSB+USLr3Ov
	 eOk/L+Xu0Sn7w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath11k: fix hal_rx_buf_return_buf_manager
 documentation
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240329-hal_rx_buf_return_buf_manager-v1-1-e62ec9dc2af9@quicinc.com>
References: <20240329-hal_rx_buf_return_buf_manager-v1-1-e62ec9dc2af9@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>, Jeff Johnson
	<quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171222545973.1806092.2233111780041686983.kvalo@kernel.org>
Date: Thu,  4 Apr 2024 10:11:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_031104_584345_9F55EFE8 
X-CRM114-Status: UNSURE (   4.62  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> kernel-doc flagged the following issue, so fix it:
> 
> drivers/net/wireless/ath/ath11k/hal.h:668: warning: missing initial short description on line:
>  * enum hal_rx_buf_return_buf_manager
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

68d1beaf3ebb wifi: ath11k: fix hal_rx_buf_return_buf_manager documentation
024c4ab0415f wifi: ath12k: fix hal_rx_buf_return_buf_manager documentation

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240329-hal_rx_buf_return_buf_manager-v1-1-e62ec9dc2af9@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


