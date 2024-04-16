Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9419C4345F
	for <ath12k@archiver.kernel.org>; Tue, 16 Apr 2024 07:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahd8FKfnpECmwWI0qcn1w4GlT0r7CYd4MlHgDT7AeRA=; b=z+3vp0AXGVlNZSXRW4MpWY81NI
	5mH/ivoTjk3mG587UVQIBY8nm2njXg6Lb4w2KfmEVyl8fwwrbfD3ZCWH2LbNkzhiqgU8e+u7XWTVH
	7dEkizUIi9GyNIG0wNIMtKNEIy81CBbYcFMjU79Jx7sEG1jPM9YdlSFgke3pLxaH/1mGRrIWzuQ6s
	I4sRpPvXDnDmqo6XopgxJS77UN573sQUwZw/aWPKByuRQHadQhzc+rpxwVCyi0BWIzt6bw3H37C0X
	qvYZUiOa1ZEZYNSQPB1NU+jzFIwO3oFeqwyPUQXezylqRnr3dDX3XUh6t2JEwCRZ3Gxsh0XBdDx0N
	a+mD1Weg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwd6I-0000000BF0m-1lbD
	for ath12k@archiver.kernel.org;
	Tue, 16 Apr 2024 07:19:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwd6F-0000000BEyr-0CLu
	for ath12k@lists.infradead.org;
	Tue, 16 Apr 2024 07:19:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0C57360F02;
	Tue, 16 Apr 2024 07:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6E1C113CE;
	Tue, 16 Apr 2024 07:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713251965;
	bh=Pr/5HGs/OWtfrjJ1CQ6MGyfV5QClGefOW002TIyUGy4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=gXNQpEAafVsoj6NDdvmOeCMGlQYwvZvH1V5/r6WwkESs38dSSrhbeSNTCKRJ08L4S
	 w1CdX8F2jKYLbyUflgmA/sTbymN5PodrSYUm/Vl20aKbVaFRLDUPgHL2KXDkjKsM9Z
	 L5/s9CRTdgcJ22fYLWfG740XlKb/TtufIZ3wLNps+KGp4QK5zO65p80ozvw/HpzIsJ
	 RCnSMkebKPWJIPTY3m5Aa6Tx6DD+Um4KYbiw75P3QSLguRJbgCTPAKw2mS4AhmVdPL
	 oSCUlQOK3qpr4LAWqYtsZkK1VpWW+7Gedqk8GHgjHh6pTqhse9yWkedmt6H/CPR4yj
	 +S6wOiza2pq+A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath12k: dynamically update peer puncturing
 bitmap
 for STA
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240408083047.22548-1-quic_kangyang@quicinc.com>
References: <20240408083047.22548-1-quic_kangyang@quicinc.com>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171325196269.4097708.17420156398205225314.kvalo@kernel.org>
Date: Tue, 16 Apr 2024 07:19:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_001927_334640_915178D5 
X-CRM114-Status: UNSURE (   6.78  )
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

Kang Yang <quic_kangyang@quicinc.com> wrote:

> Every time EHT Operation element changed, mac80211 will parse it and
> extract the valid puncturing bitmap according to the bandwidth.
> 
> Current driver only update puncturing bitmap to firmware as vdev
> parameter. Which can only meet the needs of AP. But STA will also use
> it as peer parameter. If only update as vdev parameter, might cause
> firmware crash. QCN9274 is the same.
> 
> So update bandwidth and puncturing bitmap as peer parameters once they
> changed for STA. Then send them to the firmware by WMI event.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

0531825408ce wifi: ath12k: dynamically update peer puncturing bitmap for STA

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240408083047.22548-1-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


