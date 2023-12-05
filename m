Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E370C07E97
	for <ath12k@archiver.kernel.org>; Tue,  5 Dec 2023 15:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTuX19aeLOz99DEmFUcIkOqVFefXlP4bcoq0pwzcRyE=; b=4y/cop9Ifp1j6ed+3bvdsQZkvN
	MbxbNM8r+B2FvCkYJHUNeXJ8c24rzIdFDNRQ+IbS67Sp9sdK+XZnY24Z1djea90PnW+jYM/jKrJHX
	4BZM/yeQFJUdTa2KgYTC1xB+MAOCw00CUk/N2O/lH1vfrRD/PeS0uUHMIVak6e2F8sQoNKWz6/+cP
	VlU2hdSnIaboVt8IPiviQPYDZBNPYHBDR+nEuPOCRrL6DxKtEWhHQhrnPFIRbdkdG7bIc6VVrmcan
	x2I08ZCG6V6tZcJYMvi9NHrVdbx8TJouvf1P27PCkTXDESK3zRk+GS+9nlks0603EC5qYGz31/80U
	srC7uFbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAX3m-007gc6-1F
	for ath12k@archiver.kernel.org;
	Tue, 05 Dec 2023 15:10:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAX3j-007gba-1G
	for ath12k@lists.infradead.org;
	Tue, 05 Dec 2023 15:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 91027CE187D;
	Tue,  5 Dec 2023 15:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD14C433C7;
	Tue,  5 Dec 2023 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701789000;
	bh=YpmLEyUZCZpUEOzslM23kiDsHRP5zwc+nXw2molgSLw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=p2bHu2G/hNeE3aWt/FUmXv2emFu3yXIztnALlPyTeBsZieTbj9HEH5iyLg9kKm6Z/
	 auZcN3cNcKiRe06W/n5DjLwLzla8cStz+ZJNSyDS10ApGiDtZD1oOU97h6YAZfpyX4
	 tYHLjge0rde5ZcJQHm+1KBW0tb+KjmlkxRbAsUvR0Pl6EWgdqhyaznXXZ6E2v+1AEw
	 Xi1ZFFj4nUJYneLbi2KeUM4RPz3cYkwif5D3LNZeDn4ENykYxp3PBzHbj3GDLKOR51
	 1TmVWBeu0zRmDvK92HhBYwteSNRlgJTu5mJFgoVN2k+J3lWKGPnr4JpbGh8y1/EpSS
	 bcQtYCVDBdJ3Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath12k: fix and enable AP mode for WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231121022459.17209-1-quic_kangyang@quicinc.com>
References: <20231121022459.17209-1-quic_kangyang@quicinc.com>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170178899778.2418939.15506998345561558345.kvalo@kernel.org>
Date: Tue,  5 Dec 2023 15:09:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_071003_610772_BCF7923E 
X-CRM114-Status: UNSURE (   7.79  )
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

Kang Yang <quic_kangyang@quicinc.com> wrote:

> For AP mode, the peer is created earlier in ath12k_mac_op_add_interface() but
> ath12k_mac_op_assign_vif_chanctx() will try to create peer again.  Then an
> error will return which makes AP mode startup fail.
> 
> Kernel log:
> 
> [ 5017.665006] ath12k_pci 0000:04:00.0: failed to create peer after vdev start delay: -22
> 
> wpa_supplicant log:
> 
> Failed to set beacon parameters
> Interface initialization failed
> wls1: interface state UNINITIALIZED->DISABLED
> wls1: AP-DISABLED
> wls1: Unable to setup interface.
> Failed to initialize AP interface
> wls1: interface state DISABLED->DISABLED
> wls1: AP-DISABLED
> 
> So fix this check and enable AP mode for WCN7850, as now AP mode works normally.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

ed7e818a7b50 wifi: ath12k: fix and enable AP mode for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231121022459.17209-1-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


