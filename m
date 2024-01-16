Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08506C47077
	for <ath12k@archiver.kernel.org>; Tue, 16 Jan 2024 12:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Acga5plFFSx2JaEUnvLzqlDB1a2tLE6wffbV1Arc25w=; b=KKR6nebBZX/wkAohsSJ1TtP8f1
	x4FfnOvMRBUkaUcHNIkKXylOXAo4JEhuiIU7rTXj8uimN8lb9L/LBWqX20+/lgBaS7JDvqO/lstHt
	BfwGeFTmf0fFy9SXOKd9Ov32Bjj9ShZ7hHIIUcEdl7tw1p4qF9mbww+hz2FcnZ+CTYfG6pSdeWQGq
	QJ7Tb71/wRsK7yJw4cJjSnW0GGP1Xa2p0jEmB7Cbtzi947nAY/fl222g8OtMK9CIaMhhjp8NNKCyV
	GY36GmYmnBnxzM4/WCML5uT1Sh93UVWvfRL/DKaSzMCGkEmH1mh5KULGuiPjo6iKKwFWfo005U76L
	RNk2Orcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPiSE-00C3pH-2C
	for ath12k@archiver.kernel.org;
	Tue, 16 Jan 2024 12:22:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPiSC-00C3p0-1a
	for ath12k@lists.infradead.org;
	Tue, 16 Jan 2024 12:22:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9D827CE17A3;
	Tue, 16 Jan 2024 12:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEACEC433C7;
	Tue, 16 Jan 2024 12:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705407721;
	bh=dR8CBQ3B2SO+JTqS8n8ZkaY08urpncIcQX5n8mMD14I=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HXYZrAAgTzgRtdedMEO6qtsZk9H9tShl1+DbO23j7R174H6j7RUK5TVwkoJ7YjlxL
	 sKgp0H2TKNHZCJpjCXG0JLJkgFUVoOG/Vdc0YL/uSmI0E9ieMS5r2O0xHYVheJXioO
	 ddMYtMVq52Ve7cdh17svYu6PouBdiG1MHKcXdTuiSpwLvpu4y3s2VYo9OjkPxcGar8
	 jJY0UOy6bg3UPebcZMVFxumX7zRLritzzNBQul61NATWWFKgCVrcmcR9anPR4VR7ed
	 JL0ixTHT3/UH+4iItKi91EYUCvQ/kZo/tAlZ9dUtRuSKexvGEOgbRQ/f8BVmXR7De3
	 rBcj3y5WAIsRQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 01/10] wifi: ath12k: Refactor mac callback of config
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240103063731.3356060-2-quic_periyasa@quicinc.com>
References: <20240103063731.3356060-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170540771884.1846129.16513288629933447199.kvalo@kernel.org>
Date: Tue, 16 Jan 2024 12:22:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_042204_731267_BA29383B 
X-CRM114-Status: UNSURE (   5.46  )
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

> To support single wiphy abstraction, introduce link/radio specific helper
> function in the mac80211 callback config(). This way, the callback can be
> extended to handle multiple link/radio in the future.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

10 patches applied to ath-next branch of ath.git, thanks.

3e141f0034d5 wifi: ath12k: refactor ath12k_mac_op_config()
ce20a10fdff4 wifi: ath12k: refactor ath12k_bss_assoc()
00c9b1a6d21d wifi: ath12k: refactor ath12k_mac_op_conf_tx()
e1e275a69906 wifi: ath12k: refactor ath12k_mac_op_start()
3bbc9c7429ff wifi: ath12k: refactor ath12k_mac_op_stop()
92b30bb39786 wifi: ath12k: refactor ath12k_mac_op_update_vif_offload()
d629b0c149c9 wifi: ath12k: refactor ath12k_mac_op_configure_filter()
5b1b5dbfd6a6 wifi: ath12k: refactor ath12k_mac_op_ampdu_action()
b33dcbe8d53d wifi: ath12k: refactor ath12k_mac_op_flush()
5bdfb8c9db22 wifi: ath12k: ath12k_start_vdev_delay(): convert to use ar

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240103063731.3356060-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


