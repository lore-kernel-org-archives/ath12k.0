Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1D6CD1284
	for <ath12k@archiver.kernel.org>; Tue,  2 Apr 2024 17:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/EPR/zPhGtFXo8IdK46edA1QvJVzhMRj6OW4MboqvsI=; b=lIxtmntG/rhLDgPiMMv72JboYb
	UpJduyNexOCJBbYfV7z7gGGWy2rHi8yQjM8WHUZ6syYaV0H5IYWj4LP6Zo9LIEkRBlC6oIYfPY24d
	Y1ltMZRb5DlzpXKnXw3w8Vr6QREVlVjUsEYbJla9YBjhsIErNwbN+GRZJOOu5+CG0XOOt+N1KWa23
	xdn5Z1ephEsj8TDs6GxZ+PO+DrFo3Z9TbkOX62E5MFmBDAy1EgWCSpiXotfqhom5NhGLSjaBgVCJd
	HVB/q7ydGX2q0JGIG6cRuTuAaE3V7z1ts6C7XylDhhRGyMtJE1rSoXsKzh1DwO42GM3EDVx0kapdH
	Y0uJV88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrhY9-0000000C90d-0NSa
	for ath12k@archiver.kernel.org;
	Tue, 02 Apr 2024 17:03:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrhY2-0000000C8xi-43E7;
	Tue, 02 Apr 2024 17:03:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DFC1BCE1B77;
	Tue,  2 Apr 2024 17:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13C0C433F1;
	Tue,  2 Apr 2024 17:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712077424;
	bh=eYpHvBXQKHnalmjN0yRkFSw4QRrwOjnbjUl+OVrJZYA=;
	h=From:To:Cc:Subject:Date:From;
	b=B0v41h2rdmOoYpvJGSY28fummQpWBc+huTkxb+b0GxWmgArlc7Ge0lN/yRkFJEe7m
	 Dh4ZAG3taJPDqh25byMFrf1Y6laADcC+1DAQsh1FcZ4Dzvn3XIKNW7AjhI5yuaN0ob
	 YK7kOxdo5ihFAJd8EN/b5ImBAkxLJEujMtS2nWTsY2TXdFNqVo2d33H0DMmKy0ixKW
	 vkybe4++gnfN9VQj0okJGVztA8NyRTN8S2fCk4smNJxTeV/+471wPb5wFL0CrwBe0+
	 cy2b0PC9+kzAmK2BFseUtEsvpHoALrufgXxp2kG9ECSEJ/Jh5dcUqOH4mNmM/bYj8H
	 gWhmQ3dfATcYQ==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, quic_jjohnson@quicinc.com
Subject: pull-request: ath-next-20240402
Date: Tue, 02 Apr 2024 20:03:41 +0300
Message-ID: <87sf0366j6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_100347_370939_1DAB3F81 
X-CRM114-Status: GOOD (  10.66  )
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

Please pull, more information in the tag below.

Kalle


The following changes since commit f654e228ed6b822e87e6e6ad8e889bedccae2e16:

  Merge tag 'ath-next-20240305' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath (2024-03-05 20:57:28 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git tags/ath-next-20240402

for you to fetch changes up to f09e3b774fe806ee0b1f2bb69771e8c29961e40a:

  wifi: ath9k: eeprom: fix sparse endian warnings (2024-03-25 12:51:37 +0200)

----------------------------------------------------------------
ath.git patches for v6.10

ath drivers now have no remaining sparse warnings, otherwise smaller
fixes and some refactoring.

ath11k

* P2P support for QCA6390, WCN6855 and QCA2066

----------------------------------------------------------------
Aloka Dixit (1):
      wifi: ath12k: use correct flag field for 320 MHz channels

Baochen Qiang (3):
      wifi: ath10k: poll service ready message before failing
      wifi: ath11k: don't force enable power save on non-running vdevs
      wifi: ath11k: do not process consecutive RDDM event

Jeff Johnson (3):
      wifi: ath12k: remove obsolete struct wmi_start_scan_arg
      wifi: ath11k: remove obsolete struct wmi_start_scan_arg
      wifi: ath11k: fix soc_dp_stats debugfs file permission

Kalle Valo (7):
      wifi: ath6kl: fix sparse warnings
      wifi: wcn36xx: buff_to_be(): fix sparse warnings
      wifi: wcn36xx: main: fix sparse warnings
      wifi: wil6210: fix sparse warnings
      wifi: ath9k: ath9k_set_moredata(): fix sparse warnings
      wifi: ath9k: fix ath9k_use_msi declaration
      wifi: ath9k: eeprom: fix sparse endian warnings

Kang Yang (8):
      wifi: ath11k: change interface combination for P2P mode
      wifi: ath11k: add P2P IE in beacon template
      wifi: ath11k: implement handling of P2P NoA event
      wifi: ath11k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
      wifi: ath11k: change scan flag scan_f_filter_prb_req for QCA6390/WCN6855/QCA2066
      wifi: ath11k: advertise P2P dev support for QCA6390/WCN6855/QCA2066
      wifi: ath12k: remove duplicate definitions in wmi.h
      wifi: ath11k: remove duplicate definitions in wmi.h

Karthikeyan Periyasamy (3):
      wifi: ath12k: Refactor Rxdma buffer replinish argument
      wifi: ath12k: Optimize the lock contention of used list in Rx data path
      wifi: ath12k: Refactor error handler of Rxdma replenish

Kevin Lo (1):
      wifi: ath11k: adjust a comment to reflect reality

Li Zhijian (1):
      wifi: ath: Convert sprintf/snprintf to sysfs_emit

Thiraviyam Mariyappan (1):
      wifi: ath12k: fix desc address calculation in wbm tx completion

 drivers/net/wireless/ath/ath10k/thermal.c    |   2 +-
 drivers/net/wireless/ath/ath10k/wmi.c        |  26 +++-
 drivers/net/wireless/ath/ath11k/Makefile     |   3 +-
 drivers/net/wireless/ath/ath11k/core.c       |  20 ++-
 drivers/net/wireless/ath/ath11k/debugfs.c    |   4 +-
 drivers/net/wireless/ath/ath11k/mac.c        | 175 +++++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/mhi.c        |  17 ++-
 drivers/net/wireless/ath/ath11k/p2p.c        | 149 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/p2p.h        |  22 ++++
 drivers/net/wireless/ath/ath11k/pci.h        |   1 +
 drivers/net/wireless/ath/ath11k/thermal.c    |   2 +-
 drivers/net/wireless/ath/ath11k/wmi.c        | 107 +++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h        |  78 ++++++------
 drivers/net/wireless/ath/ath12k/dp.c         |  31 +++--
 drivers/net/wireless/ath/ath12k/dp.h         |   7 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c      | 140 +++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp_rx.h      |   1 +
 drivers/net/wireless/ath/ath12k/dp_tx.c      |   2 +-
 drivers/net/wireless/ath/ath12k/wmi.c        |   2 +-
 drivers/net/wireless/ath/ath12k/wmi.h        |  34 ------
 drivers/net/wireless/ath/ath6kl/htc_mbox.c   |   3 +-
 drivers/net/wireless/ath/ath6kl/htc_pipe.c   |   3 +-
 drivers/net/wireless/ath/ath9k/ath9k.h       |   1 +
 drivers/net/wireless/ath/ath9k/eeprom_4k.c   |   2 +-
 drivers/net/wireless/ath/ath9k/eeprom_9287.c |   4 +-
 drivers/net/wireless/ath/ath9k/eeprom_def.c  |   6 +-
 drivers/net/wireless/ath/ath9k/pci.c         |   2 -
 drivers/net/wireless/ath/ath9k/xmit.c        |  10 +-
 drivers/net/wireless/ath/wcn36xx/main.c      |   4 +-
 drivers/net/wireless/ath/wcn36xx/txrx.c      |   4 +-
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h   |   7 +-
 drivers/net/wireless/ath/wil6210/cfg80211.c  |   4 +-
 drivers/net/wireless/ath/wil6210/fw.h        |   1 -
 drivers/net/wireless/ath/wil6210/fw_inc.c    |   4 +-
 34 files changed, 660 insertions(+), 218 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/p2p.c
 create mode 100644 drivers/net/wireless/ath/ath11k/p2p.h

