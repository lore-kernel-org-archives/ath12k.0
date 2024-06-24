Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4C6C2BD09
	for <ath12k@archiver.kernel.org>; Mon, 24 Jun 2024 16:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdf4/V5JvoXy8h8u/FswV0QDkXM37B1H9TJueTrRU1M=; b=uBRG5aFJKh4VPTw9nsDi2jlQ4V
	EuBYyLYSLKF/CtAdosbC4WUodSs+ll+hNrcCqlelBl2nR/dwJPf4cl+i+Rz5O1Cz9geg2rpE+V/SW
	x1nf5mZXCp8Qjs+pye43ndJlGaP/U/Fs8WiVSWyiZPoQJRyRjg+M8DRiFqi4blgOUikQLGP+oML6m
	9DU6x4Vh9VmW9M3RN0FlMW/zrOs0MKq1enGsfGYKO/NpI/Mc2NGRQOdesDaJbvkakmzCztw3U5Zcx
	qXV66Yqb2Ame75oMQfbYkW757AYtXfjPnbfzp+VmSwyzVdfvCx+5oLvaLZIyKEmnHKEpnMEOSpfNd
	bj2XVxgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmcA-0000000HWej-0ODG
	for ath12k@archiver.kernel.org;
	Mon, 24 Jun 2024 16:32:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmc6-0000000HWeC-3E68
	for ath12k@lists.infradead.org;
	Mon, 24 Jun 2024 16:32:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F04C4CE12FF;
	Mon, 24 Jun 2024 16:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE8DC2BBFC;
	Mon, 24 Jun 2024 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719246736;
	bh=Uh2ZIN9pvy/iUjlsXO0wAESSdBzozMzUQVRB0UPoNfo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=vGhEpIR2Ji2jGebVOE/4HNpTSINoYxU+oG8fnHRGKj+MCpvFMNjgm653+KlnWgkud
	 8QnZMVQOI8skCVxHQLDX3zhJHsrsCcPpvOnzZnMfmepFQxh6V8deFoUVlbIJAmY/ni
	 nVZPXR7EJSRpt1oOTO/7tNLU1lJCKGCk8oIpiTwrhprooRkOdVk5Dvpz9/08ICV1cX
	 TjDKJgY0jmMOckbL201ny1IRBka/J7hO+bLgXpn4onx3M31fIvydYjA1g9TATkXHgE
	 sszm6JhSEZ7FmJb/Vn093UKUJeYemGyRJp1ktt2GN1eaEyWUSVtED0qIYZh29y1p/j
	 jePEztEavTaVw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 1/8] wifi: ath12k: add ATH12K_DBG_WOW log level
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240604055407.12506-2-quic_bqiang@quicinc.com>
References: <20240604055407.12506-2-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171924673369.1037115.14418546599352720662.kvalo@kernel.org>
Date: Mon, 24 Jun 2024 16:32:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_093219_027417_A6D5D9DE 
X-CRM114-Status: UNSURE (   5.06  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Currently there is no dedicated log level for WoW, so create it for future use.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

8 patches applied to ath-next branch of ath.git, thanks.

3216b7bcd719 wifi: ath12k: add ATH12K_DBG_WOW log level
593174170919 wifi: ath12k: implement WoW enable and wakeup commands
4a3c212eee0e wifi: ath12k: add basic WoW functionalities
16f474d6d49d wifi: ath12k: add WoW net-detect functionality
66a9448b1b89 wifi: ath12k: implement hardware data filter
1666108c74c4 wifi: ath12k: support ARP and NS offload
aab4ae566fa1 wifi: ath12k: support GTK rekey offload
7af01e569529 wifi: ath12k: handle keepalive during WoWLAN suspend and resume

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240604055407.12506-2-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


