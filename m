Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A842CDB487
	for <ath12k@archiver.kernel.org>; Thu, 19 Oct 2023 11:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Tvw4v3qZChXu/HOy3u3m8HgxUZhu9UiUd1dtc/vxzA=; b=CvM6LCYS1wCT29
	tejwS7X2/scRIbiy67kWSs4D/PYiL4rdwM3QEIzGDKOzxtjaM8SfGZ557EKqvEDoVSPFJKsydgCdt
	QSpvc/emIP5zqFi2+SbGY3kJrIBFEtAkswWi2TihSETvj9wFbsLIWExPth40xCB0brpNR1Y6WK/rE
	tMQsQA3SHiF0MPjUn6InZtow7wL/LxC12WPEtAsf8P6EB3HjdOzFpuEv7rERRLVviwyqU50ESfWga
	Mq54JrmeebL5bIcgHBwXzjUJgsZj/wtYGOAcLoYDAr6p98/jAUxCTos/xdkoGdxySHWQ4DnfEJmLp
	UDz1TFnGU/XadrBpZyxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtRLD-00HBMz-0p
	for ath12k@archiver.kernel.org;
	Thu, 19 Oct 2023 11:37:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtRLA-00HBLG-08
	for ath12k@lists.infradead.org;
	Thu, 19 Oct 2023 11:37:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6BE39B8282E;
	Thu, 19 Oct 2023 11:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08C3C433CA;
	Thu, 19 Oct 2023 11:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697715441;
	bh=XRLiFEfMwPbR8a7nAVapktcO0NcTy6NCdxqoQM3snxg=;
	h=From:To:Cc:Subject:Date:From;
	b=qmRuIlXIR74X5BKQOa/KowjNG5uJeJiJ6i+tre6pUhvGQ2DkBCeoBtdGWga2qZs5g
	 fgCNo5+CbGFk4UbfgkX9QTHPEhTQbZ0m6paBxhyUk/X6bmT4VkRW21N0ArYVRGYI2l
	 YJdnZpIEdAVVPsHkeEAIwHVNwABELZlIQB2DrWspIgqk6avSx0Wfs2p3ZXhP9+XB1H
	 8R5Hr1WDlsNlYHi0j6q+ARCIkxkzrVDiDoOkORsfDbXbobEuXqmNOJNvAL4xQ8tlZA
	 LROdrQSqlROmkbAgsVLw2jbvU2iqO1ufL5UVkWlRdjQlQGowOtDhJnf77IIS5UM6no
	 Y/vZpgGaCRT7g==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qtRLA-0002Me-2u;
	Thu, 19 Oct 2023 13:37:24 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] wifi: ath12k: fix event locking
Date: Thu, 19 Oct 2023 13:36:48 +0200
Message-ID: <20231019113650.9060-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_043724_248093_18DB9346 
X-CRM114-Status: UNSURE (   6.52  )
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

As was reported here:

	https://lore.kernel.org/lkml/20231019104211.13769-1-johan+linaro@kernel.org/
	https://lore.kernel.org/lkml/20231019112521.2071-1-johan+linaro@kernel.org/

RCU lockdep reported suspicious RCU usage in the ath11k temperature
event handling code and code review revealed a few more handlers with
similar problems.

Apparently these issues have also been reproduced in the ath12k driver. 

Note that these were found through inspection and that this series has
only been compile tested.

Johan


Johan Hovold (2):
  wifi: ath12k: fix dfs-radar and temperature event locking
  wifi: ath12k: fix htt mlo-offset event locking

 drivers/net/wireless/ath/ath12k/dp_rx.c | 7 +++++--
 drivers/net/wireless/ath/ath12k/wmi.c   | 8 +++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.41.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
