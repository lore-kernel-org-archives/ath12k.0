Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08469C27C4F
	for <ath12k@archiver.kernel.org>; Fri, 31 May 2024 17:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=antZWW8IGb+9ZCNfPqsl6RlwE3y0DrtIK/3sJKRt72c=; b=ZF4LYye5Q5YWKa556Ms1LpQHcf
	ja4o/BRC0n+FXL+aZP1hHbGSRGRHFjpjefIuX2yM5ksoqLdrXyZ0iFSSIKvkRoEy9sMaQZH275N8n
	42Ktpx8fMFGnPTjA3Y3ie4k/L7nG65UB+yvAwt6t/SuqLu4H9zOFagTDhZEmfdeK5fHijTS30GmNA
	L9KU7Cyg78Cr8cwnrch5h3wfQZS6s80NkTKIo74GhlD6WjKN1CpIr/+B04e2dtzTTMrVcl5a/ESo6
	FTAqi0099FZSuNrKDFAZTxFwq/o1/n2eFUzHEPXMnTDOdgv7vaORe3rUdZ8xmev8XbjjjB/MDgzyz
	hxXmkfrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD5ci-0000000AwYj-2L1Q
	for ath12k@archiver.kernel.org;
	Fri, 31 May 2024 17:01:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD5ce-0000000AwWM-0dTr;
	Fri, 31 May 2024 17:00:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B1ED9CE1D47;
	Fri, 31 May 2024 17:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C767DC4AF0B;
	Fri, 31 May 2024 17:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717174850;
	bh=npo7uATaKkeSuypMjGQBs62SKdU1v8hnJzTlwcO6QEM=;
	h=From:To:Cc:Subject:Date:From;
	b=oDUuhoJTWb3vqDy0rIuhvvDNpIP0eTwVsXJ2Vwd5OOaBMYbd1+sBtJR6gt63LJX6N
	 YPqnKYB4vWoFxA1hS2E6NEG6HiXX9jy7TNyIeehjisHsY5N2raoTO4J2H6b0+b+AUI
	 PvpUGTkPDj5HcHDB0P+GBFRU0DU+rDjxPm4Ti8Wd5SPjh3Fgj0+Rx/D7EqLbJoEDyI
	 EgmpAl+1t2ZbLPOGQ4ZR/rcQapjTgN6Eo4H8iZ5aHxJ+akNSEjPx+O0ZmviXMUoSm1
	 wnya48XURoAbpY+JFRmBobiGnC14/iDbIYSIYwudZA13OmF2TJYTiM73iYbLRsH0k3
	 J7WlzUDE+aTAg==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, quic_jjohnson@quicinc.com
Subject: pull-request: ath-current-20240531
Date: Fri, 31 May 2024 20:00:46 +0300
Message-ID: <87ttidvrup.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_100056_393828_5CFE4935 
X-CRM114-Status: UNSURE (   7.07  )
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

Please pull, more information in the tag below.

Kalle

The following changes since commit 1d60eabb82694e58543e2b6366dae3e7465892a5:

  wifi: mwl8k: initialize cmd->addr[] properly (2024-05-07 15:08:14 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git tags/ath-current-20240531

for you to fetch changes up to 6e16782d6b4a724f9c9dcd49471219643593b60c:

  wifi: ath11k: move power type check to ASSOC stage when connecting to 6 GHz AP (2024-05-23 15:45:52 +0300)

----------------------------------------------------------------
Merge ath-current from git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git

ath.git fixes for 6.10. Two fixes for user reported regressions in
ath11k. One dependency fix and one error path fix.

----------------------------------------------------------------
Baochen Qiang (1):
      wifi: ath11k: move power type check to ASSOC stage when connecting to 6 GHz AP

Breno Leitao (1):
      wifi: ath11k: Fix error path in ath11k_pcic_ext_irq_config

Carl Huang (1):
      wifi: ath11k: fix WCN6750 firmware crash caused by 17 num_vdevs

Dmitry Baryshkov (1):
      wifi: ath10k: fix QCOM_RPROC_COMMON dependency

 drivers/net/wireless/ath/ath10k/Kconfig |  1 +
 drivers/net/wireless/ath/ath11k/core.c  |  2 +-
 drivers/net/wireless/ath/ath11k/mac.c   | 38 ++++++++++++++++++++++-----------
 drivers/net/wireless/ath/ath11k/pcic.c  | 25 +++++++++++++++-------
 4 files changed, 44 insertions(+), 22 deletions(-)

