Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D252CCA464
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 19:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1Y2degSRNAyhIkkt7NeJKf9SNBwC9k9gvH+7XOqk5Q=; b=r4Y0ZibO5FGIbPs7H5fCvLykY6
	+5s0p/LiKkqAwKE80oe4z/+Un+Pwd+2YQCAJw98J5E45rBO35NXTeXgKm8DOo1QOe2cRUdU+a78rQ
	3kHA6b8/CW6fa6MtmV5RWq70clwB2V6FHcTwanAGOSaKpQ3tk8HBg0C0p1iMG+e+CncT78w1sdt21
	W8C6KeA6zzp5HC30ib4cCo7a0FIMJZcPc1aGr2ld8t+l0TOh7+fB+HMjckvoIRw15k5d3lsgCr0CS
	oXl4IlMdv/rccbWehbD44hTre166kiZQxbMenUPJIsj1zeY1eG8Kgj84AECd5iNlRKIzY9spPCXzg
	Ese+mr4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRG0-00000001G7P-2ucd;
	Thu, 15 Oct 2026 19:36:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRFz-00000001G6a-2xZz
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 19:36:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DF59960A57;
	Thu, 15 Oct 2026 19:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D221F000CD;
	Thu, 15 Oct 2026 19:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792093010;
	bh=W1Y2degSRNAyhIkkt7NeJKf9SNBwC9k9gvH+7XOqk5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VouZ6BoKYA2CNoL8QFA7VYi/Rr+nDsk0DC6T/W4RqkkP7/ZRfqrpGiYQ7Fd5aMIVA
	 mQHJkFB5xT8coQLY85jqlESCoC0OFoTf3yN25Yqh/zYOSnCCshbpPdLm3oLphdjOpB
	 acv8ZTd31A+42ueH2FAJ/NLRwsPsRP0sE7NJBoPKy3YeVGkwba5MqdCSjwbu0J34gc
	 2zjQzlQlIXmhP5/iP9WwCh3ZgGLDIlSdWQK0a4paQRXio0O8aw5DjbtppQ0X8aJtiA
	 Y/TQA+TPg8U2+3EfpEUVVkZDmVZw6wSskw8881xpbv1Yy1zd7uLaCpQTWQKKAe1ptm
	 vSHv+PE212kzA==
From: Sasha Levin <sashal@kernel.org>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Artem Dinaburg <artem@trailofbits.com>,
	stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.6.y 2/2] wifi: ath12k: copy M3 firmware when reusing the buffer
Date: Thu, 15 Oct 2026 15:36:04 -0400
Message-ID: <2026-10-15-1-daily-reply-0021-ath12k-m3-copy-6-6@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <bc760367-4896-4626-8f5b-1bc3ef6cba22@oss.qualcomm.com>
References: <20261012165925.32575-1-artem@trailofbits.com> <20261012165925.32575-3-artem@trailofbits.com> <bc760367-4896-4626-8f5b-1bc3ef6cba22@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Queued the series for 6.6, thanks.

-- 
Thanks,
Sasha

