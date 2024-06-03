Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0913AC25B75
	for <ath12k@archiver.kernel.org>; Mon,  3 Jun 2024 13:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvIPiwMnjheUxpD0POtAWzfudUI7W6ANb0n+ZaOeInY=; b=RkYHFs1Ks3O5JJ88I/BiOArXjz
	zLSv8UEI+zzqSDPyCUa1Q91AWOAo32W2k37IPE4XPDBnqz1uDvxmtF9NjqiseSujky959CZsuDoCZ
	RpZbTiKKrj2bI1ZX920TFTD5Dw0WniXltTv2r3h/gCJqYO9ITb3MiV4IaFjLD5BygUXKclDw/kuEx
	A/dGI/gNnnhxKBokH3jtUgst0G9QtU9omWTnZ+o6Kr6TFOdVxjyvur6tMr3kQESbvss08mXnZboyB
	R+jP7LC8PtR91feZQkWUVJkphT4r3lY3mbpNl0LCj/qYqhIr+rCVRtSejd7VtR7IR6EmVxKmebgv4
	+h2VHdJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7Xj-0000000GsGl-33RF
	for ath12k@archiver.kernel.org;
	Mon, 03 Jun 2024 13:16:07 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7Xg-0000000GsFw-2IKJ
	for ath12k@lists.infradead.org;
	Mon, 03 Jun 2024 13:16:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A14DACE0660;
	Mon,  3 Jun 2024 13:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD760C4AF08;
	Mon,  3 Jun 2024 13:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717420560;
	bh=Oi5Pws480BNKKSEe7sI9huy38X0E8GqOQvpvBv6winQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=QbX6VyJm5H2KJZLLGrxdWRhJmYuoTSTCScF+gywdKRqclmXfSv33sXV5ebQ4071iK
	 UCJq4pJLQNpqhFfgFai4a6D5wl2fSBpPFJ8JR40wLlYz5gbxc7IeYczM9f0rxxh9F0
	 /6D2EHFUmJWA/vkK6LpSOIkES6XQqrKwAn7NTeh8ZoSUe6jHHIk8sznVebJ7H2z9YO
	 NmLalE8wOmnR/+xVfRJJI/t+odHvyzQ+kDeZP6XmQ/gkGLf7m4vtOE9A9wsdLV3Jr3
	 ZRL35LMl2gTSeiCu1+eaV6E9bhpNHYjUG3wGAL+oNTdfR7/zlSJPYjxyKeLr8/jOcJ
	 d7CS8bjpfA/Nw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: add hw_link_id in ath12k_pdev
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240529054955.4105240-1-quic_hprem@quicinc.com>
References: <20240529054955.4105240-1-quic_hprem@quicinc.com>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 Harshitha Prem <quic_hprem@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171742055763.1515473.11657840597879323437.kvalo@kernel.org>
Date: Mon,  3 Jun 2024 13:15:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_061605_212733_135A598A 
X-CRM114-Status: UNSURE (   9.14  )
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

Harshitha Prem <quic_hprem@quicinc.com> wrote:

> Currently, hw_link_id is sent in WMI service ready event but it
> is not parsed anywhere.
> 
> But, in future, for multi-link operation, this parameter would be
> needed by many WMI commands such as WMI beacon template
> (WMI_BCN_TMPL_CMDID), WMI vdev start for Multi-link virtual AP
> interfaces (WMI_VDEV_START_REQUEST_CMDID), WMI peer assoc command
> (WMI_PEER_ASSOC_CMDID) for Multi-link peer and so on.
> 
> Hence, add changes to parse and store the hw_link_id received in
> WMI service ready event in ath12k_pdev structure.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

22767241e644 wifi: ath12k: add hw_link_id in ath12k_pdev

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240529054955.4105240-1-quic_hprem@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


