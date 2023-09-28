Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E90BE732DF
	for <ath12k@archiver.kernel.org>; Thu, 28 Sep 2023 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMvCjPbmMgg+MRDipPm6DIOgXXJItE5ohyCeukuN5d0=; b=X7mYo30fvrn3f1
	8Ezwlnh61+Owpqzvrw204B50SfqXerMRTfc/kz0iPcui6l/dQCKg/wGENGkZEBTofvm8tb89drhaN
	QUhWm8iWRDZTyWChCmKEaNKGGuPfGJpJkRudd8Gd/WGg6i4sguMYUmr8xiCV8b+4ngYbt04t0Hue3
	KoLBOLzGvC5yyiSfhyuw54SHYwroZN/42KCNlcM8v4z8YUIDH0ADOls92C16NmFR3KOXiZOV66vI6
	P5rdTMB4EKOi9+WHOla2kFDEVJobHf8L7UOAJeve2gKC+ufdZq4ZmbOD8Cc0wrKp/X1Tlapfi8//P
	8WzR3oMvqxQ6KrgxfqqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsW8-005AgN-06
	for ath12k@archiver.kernel.org;
	Thu, 28 Sep 2023 15:01:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsW4-005Acq-0h
	for ath12k@lists.infradead.org;
	Thu, 28 Sep 2023 15:01:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9F2F1CE21CB;
	Thu, 28 Sep 2023 15:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CF6C433C8;
	Thu, 28 Sep 2023 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695913280;
	bh=Sv4ZYwTJOdt8iL9WrmtNcE/NncscTaorBT+D7H4XgLk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ePHKEK7kdeARJnGXIHDaatuXWLffil8m9TDDOfhKeuFmylbKUDrqWvSxsT0PkdCtI
	 JdmfiCoYEPO0dhVDJi19IyjFzifjOSg9BStv/gfyhWpHDW7JWWsaUPGdFcYF7mZh7W
	 NzxLERpHbGU7XCO72xwAIIX7UPcDWIlf5ConemRsch7k8OQ0QW90IkQp1XM8vC4iUV
	 JZLMbnMm5p+zgMKBUuY+OYA6w2BJoHk3zzITfgLoo1AuK/HxNA1AVEvdADrZCQvDWL
	 XwjPgGL5EqB1qQu+78IGQ1bk0YQskETFvLFu3lFoQ4IrQf8orVJ+Y2qixQjUBi+1kh
	 IzRjuGxOEeDqg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: fix recovery fail while firmware crash when
 doing channel switch
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230905105229.10090-1-quic_wgong@quicinc.com>
References: <20230905105229.10090-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169591327779.3019228.18229314827081753794.kvalo@kernel.org>
Date: Thu, 28 Sep 2023 15:01:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_080124_507546_0A3A9792 
X-CRM114-Status: UNSURE (   6.90  )
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

> When firmware crashed while channel switch running, recovery starts in
> ath12k. Then ieee80211_sta_connection_lost() will be called by function
> ieee80211_restart_work() in mac80211. And then many WMI command timeout
> because firmware is crashed. Each WMI command cost 3 seconds, then the
> total time will be large and leads recovery fail.
> 
> Hence change to set value ATH12K_FLAG_CRASH_FLUSH early and then
> ath12k_wmi_cmd_send() will not wait 3 seconds, then recovery will be
> started quickly and success.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

ecbb987b0a96 wifi: ath12k: fix recovery fail while firmware crash when doing channel switch

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230905105229.10090-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
