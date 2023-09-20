Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC91CE79D0
	for <ath12k@archiver.kernel.org>; Wed, 20 Sep 2023 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5tf0SkmdUqD9JiJSBfE0KIriQtiPmtI6fIS5GMmQ+s=; b=gnV6elGnjk3xF6
	FR75CgE4B+NS0NJtkRIgyXM0Ls5axh0b1RXGtBoxbKfEgIZYovWnOLu1D8lkXQWEEB7dOFAUveNY8
	/WsA7m/FGmTUCwxzgcmpwFsln58/rpmbtBwdlRcoAhO/QEO3laEE1RiELBJ4m45oWiBLxrKG3d6hY
	4p/zzXVHIln+PzOgZ86Q0GI1TnnmwQFBVwwZPHrt+x7bvimVs0qpSbGaYKy8+r2Fb1OoGFpYXqiE7
	3OeLtABtuwIFNBNItsdq1FuuKbZkn4MH+k+Lo1fj+prPQUJjzwck4BiYWJ2uCO/yHS19D4C2syGHO
	73SwqS0hT5+xYUFY4HzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixOi-003CYC-2w
	for ath12k@archiver.kernel.org;
	Wed, 20 Sep 2023 13:37:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixOf-003CXk-2N
	for ath12k@lists.infradead.org;
	Wed, 20 Sep 2023 13:37:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C47DCCE1AD9;
	Wed, 20 Sep 2023 13:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28081C433C8;
	Wed, 20 Sep 2023 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695217058;
	bh=veIfcWlWTsrY0AmMLrZOqSmINoFBrTlbDMbu88kTSq4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=K50G4oOUnJw7XxXV7HiR0ddeIffMHY/xsM8j26rZRZUu/HEGiMw63MkkTwqPK0agU
	 hRmINIMwtg5UbIhIVH06+oS32nUMCwRGzz8slsDr9czVFTOnqCofkRAZFzYxQ34ocR
	 bUzq4PkYr3FRhkpOtuhufUrypFOxRnjwx/OkeCAl9n+NAX+idN2k52ALYZELzUs1Am
	 hla+aMXvrq4qwd9MRU3yQf+QOPAWsQXtOb+mVWZjtlxI/hCvgce1vCr9pWWYQDsWuR
	 09WE3CvVHMoyXII+PH1fRcyrXIO1H7VqoOtBuPeXmJRsf6+vvCzug+N3PSaoGpMGx9
	 5fdG4zTWc/Ivg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: change to initialize recovery variables
 earlier
 in ath12k_core_reset()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230830060850.18881-1-quic_wgong@quicinc.com>
References: <20230830060850.18881-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169521705525.1118199.1914505460908896362.kvalo@kernel.org>
Date: Wed, 20 Sep 2023 13:37:36 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_063742_003552_F790F727 
X-CRM114-Status: UNSURE (   9.38  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> Sometimes device recovery fail with this operation.
> Run test command for many times:
> echo assert > /sys/kernel/debug/ath12k/wcn7850\ hw2.0_0000\:03\:00.0/simulate_fw_crash
> 
> While recovery start, ath12k_core_post_reconfigure_recovery() will
> call ieee80211_restart_hw(), and the restart_work which queued by
> ieee80211_restart_hw() is running in another thread, it will call
> into ath12k_mac_op_start() and ath12k_mac_wait_reconfigure(), and
> the variables ab->recovery_start_count and ab->recovery_start is used
> in ath12k_mac_wait_reconfigure(), so ath12k need to initialize the
> variables before queue the restart_work, otherwise ath12k_mac_wait_reconfigure()
> maybe use the un-initialized variables. Change to initialize the 2
> variables earlier and then recovery process become correct.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

41e7a399aea1 wifi: ath12k: change to initialize recovery variables earlier in ath12k_core_reset()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230830060850.18881-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
