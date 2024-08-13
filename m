Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81975C52D7F
	for <ath12k@archiver.kernel.org>; Tue, 13 Aug 2024 16:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vedtT6Chhe///2lfmmvo2ALtWT6s8iqXDAfNOl1f85o=; b=RzIc1/5bOiLQpovaeBmxXneUFF
	sV5tIKoiodp8jAswjIY+IukOGCDk5PD+hzZly+gy9hVE7mTwxD73IIVcB7ratHYXWgrlQDzoeeXln
	sWFoZa/jToU1+q7ZJ9+pC8AkUT+jC8Wppde+QXsYqBHzSeH41s5/XenCyz0nDvxcaybFc4U7TILuD
	rM9zet9DlSOSug1YqyISVb7tWLH03iM7c6npEn6Giuqs4RsdyuRX9Z7fK4SJnvKMBhV1xz5aeb8Nc
	/BOJOBZoFHO/geZHd+GjTPh2Et1iMTxpLH05sLqPKW6JkdSu6NJoRomSNee/QQKrXXsMZN+4KyZ3N
	a1Hpy2dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdud5-00000004Os2-0qnL
	for ath12k@archiver.kernel.org;
	Tue, 13 Aug 2024 16:44:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdud1-00000004OpD-1EZQ;
	Tue, 13 Aug 2024 16:44:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9A031CE138D;
	Tue, 13 Aug 2024 16:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF08C4AF0B;
	Tue, 13 Aug 2024 16:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723567448;
	bh=xYyT1jdZW9+VRI9b3mmRuSwMQCc/AU1cbEeq1xxXdqI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=qgWj1/f45FsiBjyvxVIsvfiyZWbOjDa2zUWIhvZ8wCjDognaZpO446u7f0K2jaE9l
	 Fc9Q2Kt4IZK424bqFSkFOKwOrN7s8DLNUZfanTCnqgzYP/XKdl5aFSljtqWuEEssiK
	 V01sE5wu4vA/8BuHln3NO22OcPbDgjj1Wiun485ZEsBsuDU/YGkXi1DOTcjKvCX2t2
	 Dp/YTovZxaUpcoOiYKV9xqcfASuhBfRDftzakYDNqJJ+QkVf+2EX+av4AEFQ+/IXE7
	 6u0AjyjyQB4OQllQA9L0z5yHXfjnLnLcncNEHWrPFEIcIwdJRrv9CkE2IF5TQ0Fgqb
	 HdnueSfdk/v/w==
From: Kalle Valo <kvalo@kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
    Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PULL linux-firmware] ath11k and ath12k firmware 20240813
Date: Tue, 13 Aug 2024 19:44:05 +0300
Message-ID: <87cymc1iga.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_094411_703549_3FF0B46B 
X-CRM114-Status: UNSURE (   9.03  )
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

Here's a pull request for ath11k and ath12k. We have new ath11k hardware
QCA2066 hw2.1 and usual smaller updates.

Please let me know if there are any problems.

Kalle

The following changes since commit 594600762910b4bbe8a88d0dc6495521366c880c:

  Merge branch 'vpu' into 'main' (2024-08-09 13:02:09 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20240813

for you to fetch changes up to 82318c966fd1af87044299d34611751c76f70927:

  ath12k: WCN7850 hw2.0: update board-2.bin (2024-08-13 19:36:13 +0300)

----------------------------------------------------------------
Kalle Valo (6):
      ath11k: IPQ5018 hw1.0: update to WLAN.HK.2.6.0.1-01291-QCAHKSWPL_SILICONZ-1
      ath11k: QCA2066 hw2.1: add board-2.bin
      ath11k: QCA2066 hw2.1: add to WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.3
      ath11k: WCN6855 hw2.0: update board-2.bin
      ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
      ath12k: WCN7850 hw2.0: update board-2.bin

 WHENCE                           |    9 +-
 ath11k/IPQ5018/hw1.0/m3_fw.b01   |  Bin 136 -> 136 bytes
 ath11k/IPQ5018/hw1.0/m3_fw.b02   |  Bin 262144 -> 262144 bytes
 ath11k/IPQ5018/hw1.0/m3_fw.mdt   |  Bin 284 -> 284 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b00   |  Bin 532 -> 532 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b01   |  Bin 520 -> 520 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b02   |  Bin 7552 -> 7552 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b04   |  Bin 86788 -> 86788 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b08   |  Bin 4096 -> 4096 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b09   |  Bin 2330624 -> 2334720 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b10   |  Bin 269028 -> 269220 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b11   |  Bin 99436 -> 99456 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b13   |  Bin 7024 -> 7072 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.mdt   |  Bin 1052 -> 1052 bytes
 ath11k/QCA2066/hw2.1/Notice.txt  | 3658 ++++++++++++++++++++++++++++++++++++++
 ath11k/QCA2066/hw2.1/amss.bin    |  Bin 0 -> 5349376 bytes
 ath11k/QCA2066/hw2.1/board-2.bin |  Bin 0 -> 685144 bytes
 ath11k/QCA2066/hw2.1/m3.bin      |  Bin 0 -> 266684 bytes
 ath11k/WCN6855/hw2.0/amss.bin    |  Bin 4988928 -> 4988928 bytes
 ath11k/WCN6855/hw2.0/board-2.bin |  Bin 6308684 -> 6429240 bytes
 ath11k/WCN6855/hw2.0/m3.bin      |  Bin 266684 -> 266684 bytes
 ath12k/WCN7850/hw2.0/board-2.bin |  Bin 382856 -> 1897968 bytes
 22 files changed, 3665 insertions(+), 2 deletions(-)
 create mode 100644 ath11k/QCA2066/hw2.1/Notice.txt
 create mode 100644 ath11k/QCA2066/hw2.1/amss.bin
 create mode 100644 ath11k/QCA2066/hw2.1/board-2.bin
 create mode 100644 ath11k/QCA2066/hw2.1/m3.bin

