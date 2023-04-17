Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587DCC77B72
	for <ath12k@archiver.kernel.org>; Mon, 17 Apr 2023 12:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxzpZPMriLnU0BE7z1vcw0kGp2/7qs4/bPD65122XAg=; b=SxFLJh2MW1t4A4
	CT8HmjFdaKrxWgrDara4bV1aIBibbYWmBQZZ4d+k3B63Z+aFwLalwPl/PogmpsbuP94odMrbRNypk
	mFVjzbtET+CzD/qWR6wXT7FHl/pyOQWrsqD+dtrTPF2YEmXvX1cPHEND55o7c2rFVkGZ/ghjZOpTZ
	RMtyqaDPv0sH11PD+BmhrcLygeLGyy21G37ti2W6Y9anDjvIKI7Bih8dXX28OMIcV4AhE+QERTVkp
	YuOFCVKz06mvyrmJf3TgtGXsF7Ex0Ju0D9fmL2DpAp2u0sKxCec/PkOt1nDDk3L4QlvQm+4JNFYBK
	R4FlNHv4vfutHX0m4bZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poOHG-00GCis-09
	for ath12k@archiver.kernel.org;
	Mon, 17 Apr 2023 12:48:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poOHD-00GCi7-1w
	for ath12k@lists.infradead.org;
	Mon, 17 Apr 2023 12:48:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 20454617E2;
	Mon, 17 Apr 2023 12:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60708C4339B;
	Mon, 17 Apr 2023 12:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681735690;
	bh=ymO97Aj1BROKbgIqWrbAJ92afJ5pSqiQ6//laZMowAg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=TmYdTvq1LLLHHdM0flTSPwHd4wyIIkC2JLcI8mLDjHRIbPYon+zCWc5fnkYm7xAV0
	 Y1jBjSn9BEKTHe7WOktlS1fN+d1TM6lBQxqcZfSFP+m1kpxbRzAJRLLMaC/YDZJ+UV
	 zw8uJE+zv+0uXuLw1iCl32kcOnmmHr206/hBFFydFgsZu+9BBFGH49QOrpq7kEf57i
	 CE8mXBDl/8X32hux5NROGyrWiOYa/zD0PuwFz3OCKzinXc5r7aWuFtSDeOZYuyiIw5
	 gFjkyFDW+/BGeYE2cJrtRNO5R9PHz3cB5cRWjmRiekN5K5iYPiGcT2fvhkO/uPKBJf
	 gESkuQ+z5Zvxg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: fix missing unwind goto in
 `ath12k_pci_probe`
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230417115921.176229-1-lnk_01@hust.edu.cn>
References: <20230417115921.176229-1-lnk_01@hust.edu.cn>
To: Li Ningke <lnk_01@hust.edu.cn>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 Carl Huang <quic_cjhuang@quicinc.com>,
 P Praneesh <quic_ppranees@quicinc.com>,
 hust-os-kernel-patches@googlegroups.com, Li Ningke <lnk_01@hust.edu.cn>,
 Dongliang Mu <dzm91@hust.edu.cn>, Kalle Valo <quic_kvalo@quicinc.com>,
 Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
 Baochen Qiang <quic_bqiang@quicinc.com>,
 Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
 ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168173568189.28224.5440053310426162831.kvalo@kernel.org>
Date: Mon, 17 Apr 2023 12:48:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_054811_675262_9BD8DB0F 
X-CRM114-Status: UNSURE (   8.26  )
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

Li Ningke <lnk_01@hust.edu.cn> wrote:

> Smatch complains that
> drivers/net/wireless/ath/ath12k/pci.c:1198 ath12k_pci_probe() warn: 
> missing unwind goto?
> 
> In order to release the allocated resources before returning an
> error, the statement that directly returns the error is changed
> to a goto statement that first releases the resources in the error
> handling section.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Li Ningke <lnk_01@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

Already fixed with an identical patch:

https://git.kernel.org/kvalo/ath/c/488d9a484f96

error: patch failed: drivers/net/wireless/ath/ath12k/pci.c:1195
error: drivers/net/wireless/ath/ath12k/pci.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Rejected.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230417115921.176229-1-lnk_01@hust.edu.cn/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
