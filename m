Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F77E7AD58
	for <ath12k@archiver.kernel.org>; Tue,  3 Oct 2023 14:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XX2SFfyLrdFLLH3oyKj8QTwZ7KCm0/JpCog2UqMLzTA=; b=XnWjz1/zdQ4AIZ
	SixnsqObjFZnr3hyRPgOwWn2/DkwX2iTEEp93QTJhW/aSas72TyaCp+KUqXeSjqNSR9m/3ySVWSqW
	Ji69lX/BtaRIOpkNhINGbUJQMTRK0X6Jx3hcN1yXSDF2jq+iu+16PT8OKol1BY1x1r4n7r8/Zky+6
	a4QzeU2ZUhOxrtKH1kEjAtq2MM9YZ2uL4V3K0ATJjlWvXyHrikAo0ZMkojmts1PbsvMOpzIMC5Gc/
	E1KA5b6bFjjG2hrlaj2ePstelvMV/cycUbqevZo5riVWFF7UlxT2lyUnlsFEtd+m5qyfrS2F0c51+
	bJoMOHBoGmwxq16irqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qngos-00Epu1-2g
	for ath12k@archiver.kernel.org;
	Tue, 03 Oct 2023 14:56:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qngop-00Eptb-1n
	for ath12k@lists.infradead.org;
	Tue, 03 Oct 2023 14:56:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 080E9B81B2F;
	Tue,  3 Oct 2023 14:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691DCC433C7;
	Tue,  3 Oct 2023 14:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696344973;
	bh=p0AgQWyC7sV+5Z0KZ2RWo84QUqVPvvrxy7P5WybgfBA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=JteOu6smdI73xmfL2Gj/5UxP+Jfrh/iElevnZvhn2tThq0DhhZqMiBSpcPjz0gmu1
	 e2je7eOU/WH7Qr+h92BTDaavu6fzHKwlYWaRbURygw27uTdX6CrJKt5xFtsWO6Q4fz
	 Y8/PpPWt96bGpqDOiVR9hbT4eDMrggw6ADT6NbI37OnNqJvn4Gw67DLQP+tgiMWYJz
	 vd92qWv5n7iU5z3CjNR2pNIvsynPcdAUPZA0st2MZCfnLyzI21kvKBbOz5ISTV3mB6
	 qeX0TMZRFRkx+KZ+00P+/h22UH6s2vjdRpmLaC/kP2se8wzk3Lakd50OPWnbuu0cuH
	 SsEYRovi07AEA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: Encoding regdb.bin in board-2.bin
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230131123422.24985-1-quic_karm@quicinc.com>
References: <20230131123422.24985-1-quic_karm@quicinc.com>
To: Karthik M <quic_karm@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthik M <quic_karm@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169634497029.182212.8117239239886289035.kvalo@kernel.org>
Date: Tue,  3 Oct 2023 14:56:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_075615_732573_2F6D85D1 
X-CRM114-Status: GOOD (  10.55  )
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

Karthik M <quic_karm@quicinc.com> wrote:

> Currently regulatory database information are in regdb.bin outside
> the board-2.bin.
> 
> In this implementation, Add support to encode the secured regdb.bin
> in board-2.bin along with the bdf files.
> 
> New api(ath12k_core_fetch_regdb) fetches the board specific regdb
> from board-2.bin. If it fails, it downloads the default regdb.
> 
> Firmware receives the binary over QMI and verifies the signing.
> If it is authentic, the binary will be used.
> 
> Renumbered the enum ATH12K_BD_IE_BOARD_EXT to '2' since it is
> not used in the code. ATH12K_BD_IE_REGDB enum will take the value '1'
> as per the ath11k upstream design.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthik M <quic_karm@quicinc.com>

It's a long time since I tested this and this doesn't apply anymore so I
cannot give you any detailed report. But IIRC I noticed in my test that
having just board.bin didn't work anymore. Please double check that, rebase and
submit v2.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230131123422.24985-1-quic_karm@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
