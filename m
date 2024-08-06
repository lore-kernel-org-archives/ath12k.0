Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BCDC3DA64
	for <ath12k@archiver.kernel.org>; Tue,  6 Aug 2024 07:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYezjr8k25fwhpZd5nOXVIYlFTl3tFazbNS3EN7Sg1w=; b=IXzj+ylqRGpTJgXlWES/PweBJy
	DAWWhXDEJb6XzIWZf9bPHz4kVPWUw5tAsk5zSlUxsLzBp6IptveC3ROLOQCVe7MKUtbAsL2+eHwUl
	hjU53vIf77F37VUOsry9RijJwN/dCEx+VChinQE+xtUIr8HVOKHCKR10+35E/GcJqnmqJycSqu8rf
	lKMTnjUHve/so454zjlHDEYZE5AY3UGKPFA5ahn7F0AG1As6Sm2UAKp6VtU/e0Tz5zw6zHnroT+HB
	o72Ikf2fftc7Pz/nXq32DmBpLF3dLgB2QRzLRoAPgoMconex3WLArT25cYuCAYxCDTGSJdpweipij
	0RABjk4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEkg-00000000omN-3ZgY
	for ath12k@archiver.kernel.org;
	Tue, 06 Aug 2024 07:37:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEkd-00000000oly-1nDE
	for ath12k@lists.infradead.org;
	Tue, 06 Aug 2024 07:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 82B0660F4E;
	Tue,  6 Aug 2024 07:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EEEC32786;
	Tue,  6 Aug 2024 07:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722929818;
	bh=yito3hgB7SCHvAuaRIDYkcErz1MAoMbNlfM/6zmCbQg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=GQ5NDm+nmcVLNH0FqnzsA9AYPV2aMMfzvK3L2BVRvnTKvOb1ISDR1SDKRcFDW12Fv
	 +XsvcDfLHfTY4VpvsokuPdKsGEksmsWPx3I+STzh7UQpFf8vUYA5xmuFtn8Cfvivdu
	 IqYQ+GDRY/idmmhoUNn7S3J79VjjGpFkKSz7jydXD2a0mtxZMph7XVdCNwAFhgpeKF
	 UCcK3/MVd2um1bhIpQud45zQNPR14jNwnQGBaQf2ngqYa3OHUk/CRloTaCEO76gmoz
	 8t9SpWdUiUUij6a/Dh7H+xksPru6pxDLkntruQOuV1pQ5PC2YNCxOo0cdjl5h5LE0v
	 NoXnaQqPVr1eQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/4] wifi: ath12k: add configure country code for
 WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230914090746.23560-2-quic_wgong@quicinc.com>
References: <20230914090746.23560-2-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_jjohnson@quicinc.com>, <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172292981507.3540390.14117547883755048860.kvalo@kernel.org>
Date: Tue,  6 Aug 2024 07:36:56 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_003659_540609_7358F2EC 
X-CRM114-Status: UNSURE (   5.58  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> Add handler to send WMI_SET_CURRENT_COUNTRY_CMDID to firmware which
> is used for WCN7850.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Dropping this now, please rebase if still needed.

4 patches set to Changes Requested.

13384892 [v2,1/4] wifi: ath12k: add configure country code for WCN7850
13384893 [v2,2/4] wifi: ath12k: add 11d scan offload support
13384894 [v2,3/4] wifi: ath12k: avoid firmware crash when reg set for WCN7850
13384895 [v2,4/4] wifi: ath12k: store and send country code to firmware after recovery

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230914090746.23560-2-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


