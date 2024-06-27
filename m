Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23ACC2BD09
	for <ath12k@archiver.kernel.org>; Thu, 27 Jun 2024 17:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6C0HwtMCxp+deLNLyQ/xDv6sug7jMmZcW15Wk+QhRA=; b=nbqSRe3Hgyzt2WGf+wdyWDE/ni
	1mY/ZnatUlvIH+PUM++wfj8mFMbHKdPhG2oHgHyQYnXNU9YjA7F4eZk2E3xGnou2VkbZrS78purBn
	7FGS94jxI4U94NxjXo/CPeV5kCkJ+seoloLZtFnttyDvoHxFM9dCLJUlvkZ1ijWDQ3V7m82jLT6KB
	8yN6w4ZrdviBT9BDxeTwuxOclJjNf7L/n5zvfi6UkN4KD41Ehi/Eb3ujAeu5ShOCnHjDB2kduUVPP
	jHd4uDQeuPrZStQ0YMNLkbRBMF7zHqtK/tv3QPzF23SJeAsGeqBBipg9TS9Ga7bO3UcRBwlnJA8kN
	wuX7h/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtAC-0000000BHAr-1WoR
	for ath12k@archiver.kernel.org;
	Thu, 27 Jun 2024 17:44:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtAA-0000000BHAQ-1I51
	for ath12k@lists.infradead.org;
	Thu, 27 Jun 2024 17:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 48C5FCE338F;
	Thu, 27 Jun 2024 17:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8566DC2BBFC;
	Thu, 27 Jun 2024 17:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719510239;
	bh=XGBF4GFzPS+lpA68bAhNFUcHmk0+0gf0K6RVl3Httmw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=NSsLewCqmaIaii72vpwEpE8/Nly5FkRszug9HhMhN1+TT7EcnnnOWJtXUyVhWzsF0
	 kRAidIj34Jadp77iomLAMxoDT9KgkqDU/uXPg+v+rv/jlc84ZvaEUTSrpvxZ5D0pCd
	 1BbPhvTKVZekbnbRJ6KizUy7LhyVfQSf+UqsyFBQcWDCBB4YLXtdQ7KhXyxgPNP3MF
	 6LvR1BUjSMf8qJI3lrZh441669FctXoCYzRsaaUgKjHQ2mZyvunlNsAYOj4EWDYSbv
	 C63gCc5rqE2e+dE+2Y8veu+PIp8izs0Uy6/oAhZIrTVFPAh3CrktsdrIz+/+H1Vt/e
	 C3ccZUzg9eGRA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 3/4] wifi: ath12k: add factory test mode support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240624095305.37189-4-quic_aarasahu@quicinc.com>
References: <20240624095305.37189-4-quic_aarasahu@quicinc.com>
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171951023642.2426772.2204079316674415145.kvalo@kernel.org>
Date: Thu, 27 Jun 2024 17:43:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_104402_561603_BFCF5FD2 
X-CRM114-Status: GOOD (  13.08  )
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

Aaradhana Sahu <quic_aarasahu@quicinc.com> wrote:

> Add support to process factory test mode commands(FTM) for calibration.
> By default firmware start with MISSION mode and to process the FTM commands
> firmware needs to be restarted in FTM mode using module parameter ftm_mode.
> The pre-request is all the radios should be down before starting the test.
> 
> All ath12k test mode interface related commands specified in enum
> ath_tm_cmd.
> 
> When start command ATH_TM_CMD_TESTMODE_START is received, ar state
> is set to test Mode and FTM daemon sends test mode command to wifi
> driver via cfg80211. Wifi driver sends these command to firmware as
> wmi events. If it is segmented commands it will be broken down into
> multiple segments and encoded with TLV header else it is sent to
> firmware as it is.
> 
> Firmware response via UTF events, wifi driver creates skb and send
> to cfg80211, cfg80211 sends firmware response to FTM daemon via
> netlink message.
> 
> Command to boot in ftm mode
> insmod ath12k ftm_mode=1
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Now that the wow patchset was applied I saw a new warning:

drivers/net/wireless/ath/ath12k/wow.c: In function 'ath12k_wow_op_resume':
drivers/net/wireless/ath/ath12k/wow.c:982:17: warning: enumeration value 'ATH12K_HW_STATE_TM' not handled in switch [-Wswitch]

I fixed it adding the new state to ath12k_wow_op_resume(), please check:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=882f310572b27564412e1d6158d1e9709861b7a7

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240624095305.37189-4-quic_aarasahu@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


