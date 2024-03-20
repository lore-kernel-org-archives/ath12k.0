Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206D2C54E67
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 10:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9kzftu5I3haVkfU8V77nXTy162Lw1sSdSa3fs+Dm3w=; b=06tsVJGvse9Mq26/8/TTURUvsz
	MDLLnbvJDD9p06+rFy2EbsE7Iy/+4MOpN6tHY7QiS3lhBz8cfJ0sSolhCYH4kDqimyuMvjm/ACIA8
	UlQB0DKiTJpA4IR1Fp3uOa4UIZBDiLM1leIbfAKplJnrPrY56T9ATSm5+HE+Diw70EXnRy8Z/yoJU
	ROzDblzgFDo4qgPqdr9VoTt0V5uKdbadpA/5RDdIwtoA3IWFy94Of/9TDgG+uiEYLYsJgxF7BOLbF
	cxmoBFQDa5JayShBYX3KhnGreAiKZV/N4C+LtkJsJCVc0Ov+Smqn3XBNCS4se0KwTswVtKtJLp+Sl
	jgk+Papw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmsuF-0000000GfWU-3Wo5
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 10:10:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmsuC-0000000GfUY-1JDX
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 10:10:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8AC0ECE09CF;
	Wed, 20 Mar 2024 10:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF303C43390;
	Wed, 20 Mar 2024 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710929441;
	bh=4TwZ4eTytvpjDqWUFlc3s3YWRHki+yQ9NNjbPrJCSsI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=UD/shUz3aHZTM9P0cgIp4XayZpkUhD8VFC/TUZdVHM81N8xAoJYZXTH6pua5kyUlQ
	 iUzcANF8b2GxYqJlUKgvr9ttp571LTNBy4x30WNkyisCfUypB14z5az+0SFbfVTeTq
	 stLS22mDEV6cvTWPZWXdqa915Rx5d2p/Lz5c37oYgRqC8vEhpCZWFz4ziSh/dd10uM
	 ZIi7FYqDb1fhNgB8ttCO2UTvBvTea/ASXg8WiUnn4psb+J967i8uj6gprRjtb3lMkH
	 s11WNKe+TCTbGDcxcSj1MTPJ7KsZ0wciAjAEPEKaC6sfbUF1hWViBKwEjrhvPEIuxg
	 IbaVbM4gVTlUw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: use correct flag field for 320 MHz
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240314204651.11075-1-quic_alokad@quicinc.com>
References: <20240314204651.11075-1-quic_alokad@quicinc.com>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aloka Dixit <quic_alokad@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171092943914.3054175.1910579955534536390.kvalo@kernel.org>
Date: Wed, 20 Mar 2024 10:10:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_031044_571408_7E5FD21F 
X-CRM114-Status: UNSURE (   6.96  )
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

Aloka Dixit <quic_alokad@quicinc.com> wrote:

> Due to an error during rebasing the patchset 320 MHz channel support got
> broken. ath12k was setting the QoS bit instead of the correct flag.
> WMI_PEER_EXT_320MHZ (0x2) is defined as an extended flag, replace
> peer_flags by peer_flags_ext while sending peer data.
> 
> This affected both QCN9274 and WCN7850 which use the same flag.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 6734cf9b4cc7 ("wifi: ath12k: peer assoc for 320 MHz")
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

020e08ae5e68 wifi: ath12k: use correct flag field for 320 MHz channels

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240314204651.11075-1-quic_alokad@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


