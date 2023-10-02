Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C13E784AB
	for <ath12k@archiver.kernel.org>; Mon,  2 Oct 2023 16:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IW0VdZTa7ABzSZHboNXPD6d0Y2Ic5bjG/L9LPP+ESTs=; b=nHOdSDE5LkHUGj
	zqEkuD8TbSktTkAgIC9PEuliuQ9idU3jsf/OaWDHbL2XYjpqqyA/GW1IPmcyTzNdgOp7CqPHyePox
	gyC6kSi4bYa6x8OckCaFdwS6gwHTHaoYTCd7sAiS57ZyYhrYgaN6CtpkYfdrsjJtbqQN03dhKJDTu
	okane33InXiHV6GloqwCqm03vq5B9zYhueIQ1VLZLdak0derlipfw1UpLg0rTswKMuGTsyfhNhgkz
	cnPcBAT4AgOmOrrhjh9uZ3wrmV9/Frve3Ignv76b+GD02jVODlkVFQe9ogHRf35H093hlW/OxccBH
	Aq6+Rs9Z8YmIML3QEEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnMB8-00D6Vj-0p
	for ath12k@archiver.kernel.org;
	Mon, 02 Oct 2023 16:53:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnMB3-00D6VQ-18
	for ath12k@lists.infradead.org;
	Mon, 02 Oct 2023 16:53:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D6021B810AC;
	Mon,  2 Oct 2023 16:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1933EC433C8;
	Mon,  2 Oct 2023 16:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696265627;
	bh=oTuYt4RKTX5vllByYPk/pwJSTZDswhr00Q277HMhn70=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=hFf9DP4T4MLMSB0Z2Q2Wl1QtBGIGcckftF1zzpfwVx5bLlx+W6MTaVN1+FKwoka5g
	 AQnfy1+M99FqKxmxzOKXWk53iohWqEl//EbRXQZwr+YhPMWvMZCHSHewcxX8rNt83Q
	 EfSfLFPAzY/1ehQCbWeDJ9Q8+Kgjr7+sV4AB6V1Bfc10HmFY6pmc4G0Ybmze6YCnse
	 UmffHpasUAgXUj4fDab3vjHJgo6KjXzywJD3MYqHWHJgfZjEeIqFb71iRAC+G+AVxi
	 CbyeuKzO1V36mfv5y6d/bsyexhXXuD4bbb6CeI3P3C5YFwBxqpujS+M1Y5kVA72jYj
	 mvfNEU+rls9qw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: add keep backward compatibility of PHY mode
 to
 avoid firmware crash
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230913105757.17744-1-quic_wgong@quicinc.com>
References: <20230913105757.17744-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_jjohnson@quicinc.com>, <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169626562397.3936351.5793272402512844617.kvalo@kernel.org>
Date: Mon,  2 Oct 2023 16:53:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_095349_527570_59FBD489 
X-CRM114-Status: GOOD (  14.54  )
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

> In a special WCN7855 firmware release the EHT (IEEE 802.11be) support has
> been disabled for size reduction. Currently ath12k always enables EHT PHY
> mode during vdev start but with the special firmware that will cause a
> firmware crash during vdev start in firmware initialisation. This is
> because the firmware will use the EHT mode to allocate resources but as
> the EHT mode is not available in the firmware, there's an internal
> conflict and the firmware will crash.
> 
> To fix the crash check the WMI_TLV_SERVICE_11BE flag to see if the firmware
> supports EHT. If EHT is not supported downgrade the PHY mode to HE
> (IEEE 802.11ax).
> 
> This does not impact QCN9274, because WMI_SERVICE_11BE is always enabled
> for QCN9274, then eht_cap->has_eht will always set for it, and the logic
> of this patch will not take effect and the PHY mode will not down grade
> for it.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

972754bfeec4 wifi: ath12k: add keep backward compatibility of PHY mode to avoid firmware crash

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230913105757.17744-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
