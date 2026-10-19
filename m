Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BFDCCF2D6
	for <ath12k@archiver.kernel.org>; Mon, 19 Oct 2026 10:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FgwZuL9W30hNH/mH6r7M7fmLLxrNmmb2Xswt5OIvzOg=; b=H/IMCBe5WxRtpxLF5btYRWwu2H
	RY75oslWDfR1VVUSpsEywNvW61cmuQ3BYu5Cf6KxR1C1zTvJFyxq6PPqpOOSv7SqX0K0ckvoK9Y4m
	0wpRuquRysnZ3edv87rAkAYTimm0jrKsY9M3dSjH5IYkfmz22K4BXlceJovJ4LM2c5tZNmDDYnQwK
	0Wc8OFEfxr3aoHBue3b1TcZfFNkvrVf2c/nlhU18ejrWesSNkeo8aKCHWp1XmNxN/ZpPCtRuwSIdo
	NgmP92nvHsVSkkgTEVOgXOkdTP4mOw+5++q9WuyIvljiPJfvD4QquxGK3ZA4fEWoQRmeLCeWjJ9aH
	ENaVbaTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkFR-0000000768l-340g;
	Mon, 19 Oct 2026 10:05:41 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkFO-0000000764V-09Iw;
	Mon, 19 Oct 2026 10:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Fg
	wZuL9W30hNH/mH6r7M7fmLLxrNmmb2Xswt5OIvzOg=; b=JhU1hRxi3HRnHriiE6
	ra+Gi8rc7KDxCmuJku+PnwpCMgF8J9kgzyHXIdGVtAlrK+ajA8ZgIne3RzI/sN9Q
	30/PuG8mH7TTzaG0ROpSPr/DrL5leWpPU3nfIldLq+eJAUUbr55C3S/zfG3NnyZg
	SA9GxnlKT1ZFNJsY4ep1jBsTk=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnLyhT69VqOE_ABA--.43992S2;
	Mon, 19 Oct 2026 18:05:09 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Shashidhar Lakkavalli <slakkavalli@datto.com>,
	kbuild test robot <lkp@intel.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	Bhagavathi Perumal S <bperumal@codeaurora.org>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/4] wifi: ath11k/ath12k: validate firmware array lengths
Date: Mon, 19 Oct 2026 18:05:02 +0800
Message-Id: <20261019100506.1915181-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnLyhT69VqOE_ABA--.43992S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jry7CF45Ar43Gw1rZrWkJFb_yoWDZFX_Wr
	4ktrZxZ3WxGF4UKa4vkF1UZryFyayj9FykAFWUtFZ3Z39rArWYvr95AFn8ur1UAw4UXF9a
	9rnxJFWfZw129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sREFks7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRUgWmrV61VXTgAA36
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_030538_474919_4D056504 
X-CRM114-Status: UNSURE (   5.72  )
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

ath11k and ath12k consume two firmware-provided arrays without fully
validating their lengths. The service-ready-ext parser accepts fewer
extended regulatory capability entries than the separately reported PHY
count, while the ready-event parser trusts the reported extra MAC address
count without checking the fixed-structure array length.

Malformed firmware data can therefore make both drivers read beyond the
corresponding TLV arrays. Add matching validation to each driver before
the arrays are indexed.

The four patches are independent and each addresses one parsing path in
one driver.

Jiale Yao (4):
  wifi: ath11k: validate extended regulatory capability count
  wifi: ath12k: validate extended regulatory capability count
  wifi: ath11k: validate ready event MAC address array length
  wifi: ath12k: validate ready event MAC address array length

 drivers/net/wireless/ath/ath11k/wmi.c | 10 ++++++++++
 drivers/net/wireless/ath/ath12k/wmi.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

-- 
2.34.1


