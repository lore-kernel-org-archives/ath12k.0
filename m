Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A196CE77188
	for <ath12k@archiver.kernel.org>; Fri, 20 Dec 2024 15:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25h8dKbO2+Yqpbfld4GgnVo3aWLmO5LWc7LtkzwkDq8=; b=SYd4C7HqSLvAuWPwRtOd2bqyja
	iHG8FqI4CDclyAYv4AI/xGDAOFkmdULgqNtQF62ReGCekzkK6aTHa0OD4fb7KA0op5lDIZfc99KYM
	agiNvaqN0s93EMYBTj1iEnM055OP1jA/vHOdQ3WpN/m0W6CzjYq1jA/qY9ZLPkqmG7fCBIOg+No7x
	EdmyLFirIeVMahtVOxVerxcvQw/ZigapzzFvqD3pPtPLn99PfjzWqyB7Cecc44FNKRTvg53dXZPhU
	aNrY5Wx62Ug8ai9kduqbg8pz2mgoBFgoOpuEOHIm1+KUjtswHJMslsxFJIw0ScATq2iBs8aq33HGB
	lcUxrCIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOf4F-00000005KwA-1VhY
	for ath12k@archiver.kernel.org;
	Fri, 20 Dec 2024 15:37:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOf4D-00000005Kvo-2SMv
	for ath12k@lists.infradead.org;
	Fri, 20 Dec 2024 15:37:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D2795A407DA;
	Fri, 20 Dec 2024 15:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089ADC4CECD;
	Fri, 20 Dec 2024 15:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734709048;
	bh=ktv6hTJvatOdLf8QRamLBtFjYchk1/vaWBbpmEoSXsI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=iRKILxDOi3tECpU7ZkQh7b3n9GJPogIwDurltPCceYyyD2nbDxMrfY0Tlbw/VkRB5
	 mxf1/pGRRU6W0cz7z7m7elEB4qE5BIKMMnKAbWbnVFqnfhx4gTxIM+9oGpBwupXyTi
	 haU/ANRKv0Woih2WSw97e35Yzhv1kSn6MoL+FR702ZrZVk9irHHV2q0mxIgHlwoeU8
	 SgqpwmeZqPFuXYYsNzVmTKGiLmHb4ccXsb0IsSBaj+nqB3fGaR4b+hQOGXaAm4DDXh
	 gaFEoktawwAxffoBXaUXOdemGfVtrWNIx2scKR9q7w7DbW44mB+ghFgzWkzoQUMF8p
	 Fn3WtZf5g/JBA==
From: Kalle Valo <kvalo@kernel.org>
To: Muna Sinada <quic_msinada@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Ramya
 Gnanasekar <quic_rgnanase@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: set flag for mgmt no-ack frames in Tx
 completion
References: <20241219190845.605116-1-quic_msinada@quicinc.com>
Date: Fri, 20 Dec 2024 17:37:25 +0200
In-Reply-To: <20241219190845.605116-1-quic_msinada@quicinc.com> (Muna Sinada's
	message of "Thu, 19 Dec 2024 11:08:45 -0800")
Message-ID: <87seqifjre.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_073729_694824_0654D827 
X-CRM114-Status: UNSURE (   7.22  )
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

Muna Sinada <quic_msinada@quicinc.com> writes:

> From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
>
> IEEE80211_TX_STAT_NOACK_TRANSMITTED flag signifies that frame was
> successfully transmitted without any errors when no-ack is requested.
>
> In WMI Tx management completion path, driver is not setting
> IEEE80211_TX_STAT_NOACK_TRANSMITTED flag for the frames with
> IEEE80211_TX_CTL_NO_ACK. Without this flag, the management frame
> statistics will not track such frames.
>
> Add IEEE80211_TX_STAT_NOACK_TRANSMITTED flag as part of the flags in
> skb transmit information when WMI is processing Tx completion for
> management frames.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

