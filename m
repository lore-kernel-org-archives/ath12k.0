Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C31BC7EE29
	for <ath12k@archiver.kernel.org>; Fri,  9 Jun 2023 13:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVCWv/Ovdk+hJbsQPP3h/7kQ4n2lJ6vImFelmjmRveA=; b=Im2TcUY3a6p4a3
	G96yxPP2x7wvGQEfH2C9YyfuykNG36TX7C01N+pqj3jcCt6tySFSN0PrIYpESkIVFi4xAlO8geWdx
	p77R+HhoJvgmWMFr8gkST99YePMgSZVU32mZpknRrkyLNQ2mW67IdPqcALSMJ4YyCY8o0UvA2h5xw
	ZiJkIi1XNSP+TQmzauVsvGo9iZOJSwRCczKlpNoQrFSWNwfAJK73LW2P08IMuUp2L4LC5zInjLLFK
	9vihmmzhFbgINy2MIIuCHdK/r2NHr5DsgPJbG1paOYRFHcKVFJZ3Q65YT8wP3uaYtoiCNhTEPQ9Yg
	Mzjz5SUSnOIc4sVPweFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7cEG-00D8ct-0J
	for ath12k@archiver.kernel.org;
	Fri, 09 Jun 2023 13:32:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7cEC-00D8bm-1o
	for ath12k@lists.infradead.org;
	Fri, 09 Jun 2023 13:32:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B009657A4;
	Fri,  9 Jun 2023 13:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93DA0C433EF;
	Fri,  9 Jun 2023 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686317551;
	bh=VWtPK+NVPlTuC/kTVE/KyPcbrCeJD6EGJahYJ6mP0Ug=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=t847Ao8slT5+aUu/DkOUkfZ5+q8om2Iw4WxHZRE+Hn/9NmrWfKbi+TlRAWWtyiADk
	 DHgw0bpbkMEj3q3F98xbrHtetkLhVll9/dlkFfES/lb1wpJGl2RSiaksA5sviqDw2Z
	 p/d/x2F1hysxNWllCPPw5e9Bv0w51f1I7IrLRcINiHt2MWspHD+6C8T4k712EZVzXe
	 9OmjKnHPw9rDv0fX6KzIdqr/pJY6jf/w4NbqCvX4uHwmt+J9zv9qzv7im/BkAiObMU
	 r2vBLiozPBhZVrIpfB+GpriAEzO+hQRb1QfCPuk96NUW7dnOM+a3hynrG/on3kYpxI
	 lVvYE9V7w3DOQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: check hardware major version for WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230518105741.1281424-1-quic_cjhuang@quicinc.com>
References: <20230518105741.1281424-1-quic_cjhuang@quicinc.com>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_cjhuang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168631754869.7235.13448644597853055562.kvalo@kernel.org>
Date: Fri,  9 Jun 2023 13:32:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_063232_645507_D32780D8 
X-CRM114-Status: UNSURE (   7.20  )
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

Carl Huang <quic_cjhuang@quicinc.com> wrote:

> This is to check the hardware major version for WCN7850 so only
> supported hardware is initialized. Now only WCN7850 with major
> version 2 is supported.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3394b51c7d3f wifi: ath12k: check hardware major version for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230518105741.1281424-1-quic_cjhuang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
