Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8EDC531DF
	for <ath12k@archiver.kernel.org>; Thu, 22 Aug 2024 16:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhxxZjLwW6OAS4ZIQycIr1garHy88fn7VjVli+bpp6A=; b=CuBImS5+QLOCKRJjc5woO9fPwn
	foSZizsUXFYLg/hnJ+RuTzGXFOWucSC/p2rvra3SAX1nSGDzU4A7RzPHvIhFTkpbZ9pFPgJEmHytx
	y9bvDO/kwZnOH+sKBLsACMdKjg+orGwspdsmMGLeO8rhW+zVnY4q5srOVj8LNiArEjjOzYoQ0I265
	JzUWGW5rg5hxypdOYZ2dKaYj5/Ln2uO0nmfmgkaB4JQrYc0twp2GSzAsjgzcYNADML5cKrbC4b+aV
	N1EaD5HcBKUwR7DHZm2hvDICA1xizRry7aZZq6GzwKtMBpd4ZwAoZpHsU7zld87gryb6GmyAb7bim
	HlGgiHJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shB48-0000000DgMP-0ifC
	for ath12k@archiver.kernel.org;
	Thu, 22 Aug 2024 16:53:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shB45-0000000DgLT-177f
	for ath12k@lists.infradead.org;
	Thu, 22 Aug 2024 16:53:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8D6A5CE0F8F;
	Thu, 22 Aug 2024 16:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0D6C32782;
	Thu, 22 Aug 2024 16:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724345614;
	bh=lgNdLmnukG3y6MJRdmajbF4UCZ1fFcc63MAWP3zcrPc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=YSzsS5egdRDUAUOn3dlIyIfcPzeJOX1lY3KYh0fXV0Ngier4lAtUJg5yTfmvC3MEu
	 WCRp/nDr/u9Nk0n2ZgflebL7R5wN9QvBjTH3w/IZCW1NfE7vFzd3UFgiK8zQ05cadp
	 Kk4a86wDxwc73puD/NQsNwJiWpyucg8OQ1E1NQcfc1hOOkM2ruYufOugGbfYTtrexD
	 GuYfT/Gy6hQYlv30LNuojSg7vgohfFIqDKLS4aumuo60ZF3wFiBIloHUuFS/1P36fo
	 sYYsfmAxI9DDjeQifHJ0GDvjtJKzZWXxisoPa9CilxjcgX50DfSqlG0GfQHKdhHnY9
	 /m9cyjvhXzooQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/3] wifi: ath12k: Introduce iface combination cleanup
 helper
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240814103423.3980958-2-quic_periyasa@quicinc.com>
References: <20240814103423.3980958-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172434561175.2469785.10367608474646125650.kvalo@kernel.org>
Date: Thu, 22 Aug 2024 16:53:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_095337_512500_9C4B46B8 
X-CRM114-Status: UNSURE (   6.42  )
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

> Introduce a cleanup helper function to avoid redundant code for iface
> combination cleanup. Remove the cleanup code from
> ath12k_mac_hw_unregister() and ath12k_mac_hw_register() and replace it
> with new cleanup helper function.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00183-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

I'll drop this patchset because of MLO cleanup.

3 patches set to Changes Requested.

13763255 [1/3] wifi: ath12k: Introduce iface combination cleanup helper
13763256 [2/3] wifi: ath12k: Refactor radio freq low and high information
13763257 [3/3] wifi: ath12k: Advertise multi device iface combination

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240814103423.3980958-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


