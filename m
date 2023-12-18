Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A40C46CD3
	for <ath12k@archiver.kernel.org>; Mon, 18 Dec 2023 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsnXwRU5Vw/Pkm47of2friVVMngVb09zDKAVrdau3Pc=; b=trg6eMth9KLAAaVksbND3hZQly
	Vu+4BkW6W25hrwGZ6aiZZdDTc72xB0W36jAX0x7Fp2t4JpTDCsfXUadlUm4mSXN1jPnjGebX1vP42
	LWXklkDp7T61MBKNE78FH5rwehIKpce1eahRxKn2nQhP2xpwZkfeS5FrrwiTO0jjB1OsEZMbflwtm
	aGfgNuTw2elR6j5SlnXL/QjXV5wSiT5olwr36S3+MK3/M3/6AJZ40veKbEh+LJG48OPzKJfAxBM1b
	gf9DOLpv1LPQ6qJrF4aBAEsrBxQbBg1ZN9JxpalLeYXGsNkXUNFboVa+P3cDzb5/Ct4R6kzFjWtgL
	9/7RJbYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFIfD-00BnlR-1m
	for ath12k@archiver.kernel.org;
	Mon, 18 Dec 2023 18:48:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFIfB-00BnkQ-1p
	for ath12k@lists.infradead.org;
	Mon, 18 Dec 2023 18:48:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E95A3CE018A;
	Mon, 18 Dec 2023 18:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76EBBC433C8;
	Mon, 18 Dec 2023 18:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702925303;
	bh=W5pDp/Xk6bcXYEyHt0i/qxoIwl3g0rlTDIvftKERqZA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=KKxqtYyauP0FnHa8EY0g7ZZx08lXZ3xggrE+0AqnXt7ynlLv6LpF5G8vJVaQbLrvl
	 k7r+ynRpsErOqNTxdrMK3P0AoEol3rLI6+HV3O/XjenDnQ51aTz2rIaf3FfSmXWkKV
	 7CcYvkWsh+Cir9xZILvB/8tUYIGSwWZrs4D2QKIz3Mf9jXL2tMYpA+gzcKNzocTvlA
	 FwLcFD/GTJqKmrorhAxDToa8gy7xDlETCr/hd4sUrLKZ7ltjhT5KaATjSnECdXAwtr
	 YTkiNZ+p+YtekKI26PempXDVIzICDt4S7zfw/lAH1F1hOB3fcQtYQq2JBix8Wbs7w3
	 8J6i78R3N2Vnw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/5] wifi: ath12k: add string type to search board data in
 board-2.bin for WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231216060140.30611-2-quic_bqiang@quicinc.com>
References: <20231216060140.30611-2-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170292530072.424292.15296808219565634981.kvalo@kernel.org>
Date: Mon, 18 Dec 2023 18:48:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_104825_777849_5DAAD40E 
X-CRM114-Status: UNSURE (   9.25  )
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

> Currently ath12k only supports string type with bus, chip id and board id
> such as "bus=ahb,qmi-chip-id=1,qmi-board-id=4" for AHB bus chip and
> "bus=pci,qmi-chip-id=0,qmi-board-id=255" for PCI bus chip in board-2.bin.
> For WCN7850, it is not enough to distinguish all different chips.
> 
> Add a new string type which includes bus, chip id, board id, vendor,
> device, subsystem-vendor and subsystem-device for WCN7850.
> 
> ath12k will first load board-2.bin and searches in it for the board data
> with the above parameters. If matched with one board data, ath12k downloads
> it to firmware. And if not, downloads board.bin instead.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

5 patches applied to ath-next branch of ath.git, thanks.

f4c2a9d62213 wifi: ath12k: add string type to search board data in board-2.bin for WCN7850
7173972a2eb1 wifi: ath12k: add fallback board name without variant while searching board-2.bin
97474e5f5424 wifi: ath12k: remove unused ATH12K_BD_IE_BOARD_EXT
511207452221 wifi: ath12k: add support to search regdb data in board-2.bin for WCN7850
52f8c45fa36d wifi: ath12k: support default regdb while searching board-2.bin for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231216060140.30611-2-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


