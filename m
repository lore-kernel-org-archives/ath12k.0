Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4062AC47258
	for <ath12k@archiver.kernel.org>; Wed, 17 Jan 2024 08:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PkxS2eIiJkEDS4Gzxhg7kzb+ad0B0y+OXtXzNQlTm4=; b=dyZb4bsuVBoo/Uh2+7vc0iorOB
	26nLrGcCPiixycWsM2V0hmiLkTlkLLXg4t5Td1SXL74PlsBe+N1sxwCMaaZ4w7nPsagvTWQxVcvSO
	S6IYfENqOrabMDB5nHP6nEWt/b2KMPPANEetO4VLs/NlQ8oYqb0Agp/uxb/eAC+cvciiwKbE+ESJq
	4xJaXWz92JcxUwGq02pkppsAuVAeVIALz9lQX2sFag2a0V7K/QDR/WZbJJpbK2/I/trGqNJziWt8I
	k281A3eoVMf/wHvpRYU8z8MH6cSJpXlTSKpSEKJe5pOk/p/fQW4TcFmHdyMiwNTp7DXNsh/rAXY30
	/gsjPdgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ1PQ-00EuBi-2j
	for ath12k@archiver.kernel.org;
	Wed, 17 Jan 2024 08:36:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ1PL-00EuAu-2r
	for ath12k@lists.infradead.org;
	Wed, 17 Jan 2024 08:36:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0EA43CE1BC8;
	Wed, 17 Jan 2024 08:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD34C433C7;
	Wed, 17 Jan 2024 08:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705480578;
	bh=EhFtoGKibbkyyMB2iwpWCPpm9o6LfTvX0EBzHsQvWBM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=KtnA9CuRxHW/UDmEOttHymayv16A/bQdS9pAJVbuxOcwAeVGzEyHDYXwaKSJMdvVE
	 BjpMAGSytWHG46sTXVIUnPjfPfIiWrEV67bzckMvNbso4pg51hSTUW9jFagFPEPi2f
	 3HqlTdqHBTX0Syf2nbrnR9x2uxCqosI/asotiBq002MS1O7rNrT0caRo+8wjBTF+3q
	 9qoXGJa6JWZgaqoPIlNfa+OtT/pw2VpMNtaxO8c8XPk/7vKcx9RutoMCc/mLUiStb5
	 FXXToqBh3cxsPYUWlFW3O4aUOgo+IQlwetNFjc9nuM73wPpTAKIdN2ZEfwCUL3Hn/a
	 epmLOyJtrPxTQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] wifi: ath12k: Add QMI PHY capability learn support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240113001659.1022465-3-quic_periyasa@quicinc.com>
References: <20240113001659.1022465-3-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170548057504.2185974.5246732710512983160.kvalo@kernel.org>
Date: Wed, 17 Jan 2024 08:36:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_003624_171296_4201C393 
X-CRM114-Status: UNSURE (   9.05  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> Currently, the number of PHY is learned from the firmware service ready
> event message. However, on the QCN9274 platform, number of PHY is a
> variable parameter. To enable MLO capability in the QMI host capability
> request message, the driver needs the PHY count information earlier than
> the firmware service ready event. Therefore, a new QMI message,
> "PHY capability message", is introduced to retrieve this information.
> This message allows the driver to fill in the MLO parameter in the QMI
> host capability request message. If the new QMI PHY capability message
> fails, the default configuration in the HW params will be used.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

I did some cosmetic changes to this patch: s/{ }/{}/, lower case debug messages etc.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240113001659.1022465-3-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


