Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1678C4345F
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9N5CQFEPhu3v3HHvViYlvDuEc0gGnzitU61y8rg05rU=; b=fJmgyPnBlSxio8rwyGszVoLjkb
	tFN/mgpbADadS30c9V/GjTWjoxlq10MRSKXnPO0iqKIVNZc7B658lVzbUDYWxx+TYCeYOWGPrgCzI
	OXjLyxf5lqgNAQUYYz1yIbpSFpcR+IUZvSmHSAD3ZYuGxiUiYMOXL3gt/QIDQeSyC/XHQ0SrZWFmV
	7biw44ehIVHeRsGajs1ougSyh8p7JpMyZGzDWP3evTpGrWhkhtA3WzpEz5J1B+ZKU8K1HgYzE+9d0
	d0X9P21Nr82FiHFg7uXOX/ilmnxqoFCjmW/ljMtaZBMV23MG4Nw0IluxWVeBqhRVMupmJ4OiWJAJX
	SPWPmvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzedk-00000004jue-2KG0
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 15:34:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzedh-00000004jtw-1z5r
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 15:34:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D998561B9A;
	Wed, 24 Apr 2024 15:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4B7C113CD;
	Wed, 24 Apr 2024 15:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713972868;
	bh=b4bU31v1VY2Hs/KRS6Y47Mb61FbQN5DRav97Js/jzKE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=mKyP6/lwuEHuIbB2l2yu9aUoa/0T5UwS6ctMVe2yJpAKqfxoLWldSvKDSOtqAlZjt
	 7EKlp/d4veOLuLPRekjfIOqstFLZlUSUeukutGSPLciE4JHWxeCiw3oq1t0oDeM0Hm
	 D4fnNfbeEaxwW3PgP2TMG4PP8CfZG/SVnXdgbC7poJ8Rf+v2wJVrc2jMD+hPNsqZry
	 bGIzSj14mDXoD6y23N9TiIHHqkr5soQ9MqQ3JlHqiIT/CFs4RNWEzSlnAwCdvKSN31
	 UdYZYrYE6j97WeZZUgMDl1uSt5PnXRYFP3L5FAGDxl1/rsfSLfAzVy+rDWwT3CG3xz
	 3HUEn3j/0oBkA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath12k: read single_chip_mlo_support parameter
 from
 QMI PHY capability
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240418125609.3867730-2-quic_rajkbhag@quicinc.com>
References: <20240418125609.3867730-2-quic_rajkbhag@quicinc.com>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171397286596.2560403.7467583806686493830.kvalo@kernel.org>
Date: Wed, 24 Apr 2024 15:34:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_083429_597344_DECABD0F 
X-CRM114-Status: UNSURE (   8.49  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> wrote:

> New parameter 'single_chip_mlo_support' was added in QMI PHY
> capability response message. This is an optional parameter added
> in QCN9274 firmware. This parameter states if the firmware
> supports Single-Link Operation (SLO) and Multi-Link Operation (MLO)
> within the same device.
> 
> If single_chip_mlo_support = 1, then intra device SLO/MLO is supported
> in the firmware.
> If single_chip_mlo_support = 0, then intra device SLO/MLO is not
> supported in the firmware.
> 
> Hence, add support to read 'single_chip_mlo_support' parameter from
> the QMI PHY capability response message.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

ae6ec4a38aa4 wifi: ath12k: read single_chip_mlo_support parameter from QMI PHY capability
da3cbd88e780 wifi: ath12k: set mlo_capable_flags based on QMI PHY capability

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240418125609.3867730-2-quic_rajkbhag@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


