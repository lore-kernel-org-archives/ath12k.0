Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0756C001E0
	for <ath12k@archiver.kernel.org>; Wed,  2 Aug 2023 16:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lEiHtIyUZadNfzpKnyYeSnLpdj0M64qP5649cnvPWQ=; b=o/3B417fe+iOI0
	0HSixlCDNLirqDJZ/b4PWnzUjvS+nxDP4fJvvkbayHlUCdMTeW1KV+RkgGhrI/5C8+irqVnKXenjM
	B/V5PSpoJt6dFuVdjAnxHahBl4IR2+C6m9uuQuihe/wRWih8ZGGlvJrtuZNrb8LreTCgBaq4f7/bN
	HsdkpkZsl2ilUXrH/773Ez4ekSstdAv+OisXxM4+3bh23Ybb/8oRxLBAQb525cWtWFSZlfrhyFIM7
	zlHmljwbf25/eJBmbzZVNYaYCtPaGp1KgpfHFqkm6q4d0YtYx/ibG9EMIiuO9FaUo/+hQE/eha/fd
	WKrCNE9xixKKke1CLmlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF7K-005QLX-1F
	for ath12k@archiver.kernel.org;
	Wed, 02 Aug 2023 16:54:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF7H-005QKy-29
	for ath12k@lists.infradead.org;
	Wed, 02 Aug 2023 16:54:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D82E615C2;
	Wed,  2 Aug 2023 16:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C002C433C8;
	Wed,  2 Aug 2023 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690995270;
	bh=A2OruOp+lJC1+M5+VpWcfMzRWKAKt+bR0nx1v+/4O/M=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=kny19TAcHybABvRt1Rhy4fqlLq0E3v3v7M4AAFjXHGn9Shag3S1BMy7I9JwhK1vv9
	 Q4LPmWEzhlU8NignCZieIvNZoBWgHEMoNjVN3CCMk3Ki1HNfhuYRy71ChKggBVrXqe
	 rhZaGKyzkfmzbF5obxpcTCw9amx8NzRirw3VChAtYxLU7KbYHrrCSS71+S7GX74Y5R
	 r83D90lDaa5gDFGc6BI+LfgfdqDaAVDrzs1EFYuVDJnejSpnmLj1ESxDecWXuaSY6v
	 7YRxv7W0PB9NtqPNPa2rxE1iJ4teSYbkj1gx7cj5dmVI81nhLvZJcnWuJDn45pUes/
	 nnq5theb2oFow==
MIME-Version: 1.0
Subject: Re: [PATCH] ath12k: Fix a NULL pointer dereference in
 ath12k_mac_op_hw_scan()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230726092625.3350-1-quic_wgong@quicinc.com>
References: <20230726092625.3350-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169099526747.463701.13168373572998934165.kvalo@kernel.org>
Date: Wed,  2 Aug 2023 16:54:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_095431_740966_4A0626C9 
X-CRM114-Status: UNSURE (   8.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> wrote:

> In ath12k_mac_op_hw_scan(), the return value of kzalloc() is directly
> used in memcpy(), which may lead to a NULL pointer dereference on
> failure of kzalloc().
> 
> Fix this bug by adding a check of arg.extraie.ptr.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

8ad314da54c6 wifi: ath12k: Fix a NULL pointer dereference in ath12k_mac_op_hw_scan()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230726092625.3350-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
