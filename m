Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88560C47DB3
	for <ath12k@archiver.kernel.org>; Fri,  2 Feb 2024 11:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AO0MWTRFxpRMchPNzjlTP+FC8Sbw5/dCirH5IsXaLUc=; b=eaXkndPzgUtB9vHfWF3AGdkinS
	o1k72Rew8hq81F6Swb4VJt5Su8CoZOuuGzygXN0a+sGv8Wp6QS4zkq0L9zRlo9ziPDTiI2iPAkYD/
	MQ9sOuDj3gza9dOl3fiJm2rh6VNOM8XSHLo6AGf4nvRy9ZGT/j4iK3WvbbSptoLAFZ6pLEdbPVIHK
	5dV91RY7LDF0T6NDZjrOJNjGtGh7Iwkg1uZAwXicaOShvGYIiRHg5B3OOMZyBpQW0GDqDb013DSpm
	Z7VghZIQHbsxvTNcYPDSUSE35tNsDGXzviS71N8UtlOImssfj3KTKUJgBA64L9cTb5Gux1ZUqx64t
	J5tOapcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVrwt-0000000BL8O-11Pj
	for ath12k@archiver.kernel.org;
	Fri, 02 Feb 2024 11:43:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVrwq-0000000BL7I-20k4
	for ath12k@lists.infradead.org;
	Fri, 02 Feb 2024 11:43:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFDB462278;
	Fri,  2 Feb 2024 11:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936C7C433F1;
	Fri,  2 Feb 2024 11:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706874187;
	bh=XydI6xT5hhzbAD6CD+gBysVeg8PlHDgGQwcXTq31HfI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=lOKjlCv7rq2w8m+UOTFXL/XfRRUT6NlPNKc+2cUGHuGhRwVP98Z8xwq6omHyXF56/
	 YfI4StYFfh27NqLf46IrnTRrxIkdiVi/EbSnrsxb9YDZQRCSHaGhnVlL+TpuGt1b5h
	 GOfWXj90AiklO5xTLGrQDrB3zztJmimmIx+f0YrTMxKwVk4Z6YXNKcC9fhOaushG5v
	 okDVuY8cWOrsAXCiQBVT0fPzGNMFrulfZjVcdqvlSNaeStF0GkuhB2MnHtTnoIRFTG
	 uAcm7duw1ndSNqUDGDZZlM/hN3VjOxS2wuX4Qu4toLAFw0PW7gXMThPS/2ECU1lCgC
	 URyL0IFmXf+7Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath12k: add firmware-2.bin support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240123122812.3811251-1-quic_rajkbhag@quicinc.com>
References: <20240123122812.3811251-1-quic_rajkbhag@quicinc.com>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170687418485.3200018.10517939278018200198.kvalo@kernel.org>
Date: Fri,  2 Feb 2024 11:43:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_034308_634939_87051DBB 
X-CRM114-Status: GOOD (  11.81  )
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

> Firmware IE containers can dynamically provide various information
> what firmware supports. Also it can embed more than one image so
> updating firmware is easy, user just needs to update one file in
> /lib/firmware/.
> 
> The firmware API 2 or higher will use the IE container format, the
> current API 1 will not use the new format but it still is supported
> for some time. Firmware API 2 files are named as firmware-2.bin
> (which contains both amss.bin and m3.bin images) and API 1 files are
> amss.bin and m3.bin.
> 
> Currently ath12k PCI driver provides firmware binary (amss.bin) path to
> MHI driver, MHI driver reads firmware from filesystem and boots it. Add
> provision to read firmware files from ath12k driver and provide the amss.bin
> firmware data and size to MHI using a pointer.
> 
> Currently enum ath12k_fw_features is empty, the patches adding features will
> add the flags.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

12f491cd6d81 wifi: ath12k: add firmware-2.bin support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240123122812.3811251-1-quic_rajkbhag@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


