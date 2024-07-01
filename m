Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C816C3065A
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 18:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKfW1f2jsTAAcYdgD1Rv6yd+iStJxYKrzyzIE8397A8=; b=3VJx0Qz3IB/ZljxnlgvOCEQaH0
	Wz/tDX5+DXKf6PiTKIHsegL962VV2KoKeWmx6j2dDcTNWozURSu2LPTRApBZB1cqFi5ZxoUtk/1PR
	Ur/t1BF+l2a1rYuxPdgpocKP5fQOqJ5nOveu35q/WpoxlXnY8WLaghbEubOo8Tg9ZMhqxrSlvvn7i
	pLC1vqi81+Hd7cPh8FcmVXLxw+F8KLIk7G8naT6xCuRwFSF09ZWEIpJ9/x/4+3Hvwh58yAbQW8i60
	yOhgQMbIPXyXomjEwNHT57lZZOVPqVvojz2jVWzZGTiSzh7JkgLA2qFo6zPLgU/yYIro3i1WX3w1a
	aso/c/xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOMB8-00000004XNX-2fhh
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 18:55:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOMB5-00000004XMv-463t
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 18:55:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3C4F61751;
	Mon,  1 Jul 2024 18:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264C0C116B1;
	Mon,  1 Jul 2024 18:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719860102;
	bh=4mCb/a42Ct77gZPxD4V+B+AhOn13Z7edKd+e9S+WfDo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=NvtkY6OCKhojS8w+Ur7RMQn+W1dRzlKJ5MHP71dsuUUPgX/TjxfaebRBrr1HjJrns
	 bRB+yL5k5uv56aEywCyDocqEZ5qKxyIn0tjr2mmS2dtYJnVg3bj7h1kk1UlgxtHT9Q
	 OSJXZndoCpjh3vz876Tr6TXt5O0mPHOjsz8f/78G/qHpJgwfcvlnmRefhBgLj/Z4vd
	 qzlsAVLjty1Clg4VCG40B2wzCvFYHQv+/IfhOWnNw+82SOben/QEte78SxvKYeAfm8
	 JPpru2jg5UxXbpALxeWRl2Ukd1DDLGyZm/HDWOxoqR19AmZRZSKakWQwKpDQUsn1Sq
	 DvtaJFmrnxJtg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 1/4] wifi: ath12k: Add support to enable
 debugfs_htt_stats
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240626085854.2500681-2-quic_rgnanase@quicinc.com>
References: <20240626085854.2500681-2-quic_rgnanase@quicinc.com>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Dinesh Karthikeyan <quic_dinek@quicinc.com>,
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171986009909.2958036.17208595155066861853.kvalo@kernel.org>
Date: Mon,  1 Jul 2024 18:55:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_115504_121192_24656A79 
X-CRM114-Status: UNSURE (   4.79  )
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

Ramya Gnanasekar <quic_rgnanase@quicinc.com> wrote:

> Create debugfs_htt_stats file when ath12k debugfs support is enabled.
> Add basic ath12k_debugfs_htt_stats_register and handle htt_stats_type
> file operations.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Co-developed-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

4 patches applied to ath-next branch of ath.git, thanks.

3f73c24f28b3 wifi: ath12k: Add support to enable debugfs_htt_stats
ad201b35d3ec wifi: ath12k: Add htt_stats_dump file ops support
adf6df963c03 wifi: ath12k: Add support to parse requested stats_type
a9f2976f0e9e wifi: ath12k: Dump additional Tx PDEV HTT stats

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240626085854.2500681-2-quic_rgnanase@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


