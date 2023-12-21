Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB8FC35274
	for <ath12k@archiver.kernel.org>; Thu, 21 Dec 2023 14:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JSB9y7n7RIJjUgFAJ1GHRM7yJSw9HndK6oNiJvykfLw=; b=t3t0lrZK771hdO/0IWwTZVaLwg
	lOkF5KDNXXbH5nMugJf2VT3zHI2vft3l1LI5JU5YrMrJK5U6W0L5tjupzBTU77s1wsyxwz4oTgae+
	ZklbqwsKo+/OvZsG6kUN90wJm0SfAE6iDl39tBrm6IL7J1/L6MWfkziQqV4ljgWHItMd/fPI0NRtj
	1c0zYG5qyDY6YvonW2TP5CP5aZqTdlVp1CN2uCo+QdGPDwzLn8fJ7Ar/i16wqiIT5UIEi4kW6ZPf7
	bJVcIgidNCeqgCaT5ShQ1JGL2Pj3rf0MHCGy87yeEaPXy/tpEWMB+ahjtWqcWq+4qFvYzixtgzggR
	m5lLlj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJxG-0039zS-3C
	for ath12k@archiver.kernel.org;
	Thu, 21 Dec 2023 14:23:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJxD-0039yh-0K;
	Thu, 21 Dec 2023 14:23:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CB96618D7;
	Thu, 21 Dec 2023 14:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6DAC433C7;
	Thu, 21 Dec 2023 14:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703168593;
	bh=VJVm9sAChmhhS6GxWESn6J/w+ak9YS7aw1uRnA4naCM=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=F0KZNngNNerCSpNgXx08zdCJ7MWD3cQz2V7WGtrDChd5eGMN6wktSGBsL1swgycGC
	 EVPB4u9Ui87pncDv3e6pp2p8U8NPrplg/Ad6F7YgWT6itHfn9jU2nATIlIDkhYCgBQ
	 liMCaFOqhuVdu1kKCKHDN/GFE2HHafnxw6D7w02WotV1s8BYm6BXp1jaqqMC51LNIb
	 G8l5x8WxH51g13VlzUmPE0I/XBaN4eBfVuS+X+ESmTpo/6s53Hf7bFXHDtR73b6ZZn
	 hmtApyxWPU6ZOTWUad7haCHdhS2wgRxzYuaO0ZMCHr2x5rE0GoZSQqPaf5MyjQVqxT
	 TPxqpfPS3D06A==
From: Kalle Valo <kvalo@kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware 2023-12-21
Date: Thu, 21 Dec 2023 16:23:10 +0200
Message-ID: <878r5nprch.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_062315_203146_6010AFD0 
X-CRM114-Status: UNSURE (   9.83  )
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

Hi,

Here's a new pull request for ath10k, ath11k and ath12k. We have a new
driver ath12k and the first firmware for WCN7850. And as usual firmware
and board files to other hardware.

Please let me know if there are any problems.

Kalle

The following changes since commit c156e6be6d4a0a2290e7059bc74fb0612aa19693:

  Merge branch 'robot/pr-0-1702625169' into 'main' (2023-12-15 12:16:57 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20231221

for you to fetch changes up to 17509e53b97baaefeb287b98d3358da8a6e1c199:

  ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.36 (2023-12-21 16:13:58 +0200)

----------------------------------------------------------------
Kalle Valo (9):
      ath12k: add new driver and firmware for WCN7850
      ath10k: QCA6174 hw3.0: update firmware-6.bin to WLAN.RM.4.4.1-00309-
      ath10k: QCA4019 hw1.0: update board-2.bin
      ath10k: QCA9888 hw2.0: update board-2.bin
      ath10k: WCN3990 hw1.0: update board-2.bin
      ath11k: IPQ8074 hw2.0: update board-2.bin
      ath11k: WCN6750 hw1.0: update board-2.bin
      ath11k: WCN6855 hw2.0: update board-2.bin
      ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.36

 WHENCE                              |   16 +-
 ath10k/QCA4019/hw1.0/board-2.bin    |  Bin 1798148 -> 1822336 bytes
 ath10k/QCA6174/hw3.0/firmware-6.bin |  Bin 706004 -> 706360 bytes
 ath10k/QCA9888/hw2.0/board-2.bin    |  Bin 206444 -> 218596 bytes
 ath10k/WCN3990/hw1.0/board-2.bin    |  Bin 513892 -> 670116 bytes
 ath11k/IPQ8074/hw2.0/board-2.bin    |  Bin 1311380 -> 1442536 bytes
 ath11k/WCN6750/hw1.0/board-2.bin    |  Bin 843548 -> 843548 bytes
 ath11k/WCN6855/hw2.0/amss.bin       |  Bin 4980736 -> 4988928 bytes
 ath11k/WCN6855/hw2.0/board-2.bin    |  Bin 6278772 -> 6308684 bytes
 ath12k/WCN7850/hw2.0/Notice.txt     | 3386 +++++++++++++++++++++++++++++++++++
 ath12k/WCN7850/hw2.0/amss.bin       |  Bin 0 -> 6000704 bytes
 ath12k/WCN7850/hw2.0/board-2.bin    |  Bin 0 -> 382856 bytes
 ath12k/WCN7850/hw2.0/m3.bin         |  Bin 0 -> 299660 bytes
 13 files changed, 3400 insertions(+), 2 deletions(-)
 create mode 100644 ath12k/WCN7850/hw2.0/Notice.txt
 create mode 100644 ath12k/WCN7850/hw2.0/amss.bin
 create mode 100644 ath12k/WCN7850/hw2.0/board-2.bin
 create mode 100644 ath12k/WCN7850/hw2.0/m3.bin

