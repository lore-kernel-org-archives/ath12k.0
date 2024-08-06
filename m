Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99308C3DA64
	for <ath12k@archiver.kernel.org>; Tue,  6 Aug 2024 07:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0OID9gz9KiLerY++kvcQlTrwFW3GAVu6A5XLPea7Vo=; b=jsw3wGEf3OOBl9pPSKiu6MVod1
	cWvT//qT398bh+NbPQ3hkObiV7MMeET0jRALkTbrucYobrJgSyRdOVe6IcXVhINj/ntYiUUU1749C
	WuPdAwdFd77DIPurzwIByKYLfksxuqpVvua9wfMQ398yD2SUvwIuMHvwhSyue/vSTfHY868e14UN9
	RKbC3JOxsbsHqQNH0ANdiJx41FaTp/mO8cOc5A8gBlqQB/3xly37m6M563+vFAxkvfSEnx+gvJF3w
	ge9+nBdNG1qBT1Ip5w1aLIJG4Pfejy4yDxLHKEv78UBujQhpEtcL8Z/Xsu10E4Wl9O3JLIJJQ9NVC
	eRMdZ6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEjv-00000000ofF-1PiS
	for ath12k@archiver.kernel.org;
	Tue, 06 Aug 2024 07:36:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEjr-00000000oeb-41Li
	for ath12k@lists.infradead.org;
	Tue, 06 Aug 2024 07:36:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 196A860F4E;
	Tue,  6 Aug 2024 07:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23B0C4AF09;
	Tue,  6 Aug 2024 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722929770;
	bh=usHbK2xOPfCQ+695UH71YEygSIeNYeS4X/a7jt9Wdrk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Ge9uhy4RFnnE+Ea2MfaZh/W90sczlGhPvHZWAsbNMn1+4/MOhseVZnVu4XQyDy1wg
	 H2FbwXGig59Wk2EHyPf9zihkOMXGEIlbFbNA3WJpfM1edi99B6LKIqdkI52vxLcn1d
	 6vXrJoXTMuCzF9MNwQT92VRpJcezDOBhrXBf++mEVde21IspGA/ud9p8Z7yjsqPGuN
	 JHRuSm46j6hbx0XkjsCQsbOMDWadpc/x7PEAwfvuA9lDTwH/DYCjXQIBYs1q3FlTFV
	 eVsSosepgrUrBr4RqGE58Ofjs+MTevRf1uxTei1TLdTyIvgRC87EIegDGi9DXSU0P1
	 7jkAVmR7pUICA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: read country code from SMBIOS for WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230913105156.17618-1-quic_wgong@quicinc.com>
References: <20230913105156.17618-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_jjohnson@quicinc.com>, <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172292976780.3540390.9964746290162496306.kvalo@kernel.org>
Date: Tue,  6 Aug 2024 07:36:09 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_003612_095553_E200119B 
X-CRM114-Status: UNSURE (   6.72  )
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

> This read the country code from SMBIOS and send the country code
> to firmware, firmware will indicate the regulatory domain info of the
> country code and then ath12k will use the info.
> 
> dmesg:
> [ 1242.637253] ath12k_pci 0000:02:00.0: worldwide regdomain setting from SMBIOS
> [ 1242.637259] ath12k_pci 0000:02:00.0: bdf variant name not found.
> [ 1242.637261] ath12k_pci 0000:02:00.0: SMBIOS bdf variant name not set.
> [ 1242.927543] ath12k_pci 0000:02:00.0: set current country pdev id 0 alpha2 00
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Dropping this now, please rebase if still needed.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230913105156.17618-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


