Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30268C04FFE
	for <ath12k@archiver.kernel.org>; Mon, 20 May 2024 11:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjJk3oknQ5vXL8/XnbuT+YTN82yNrQHIUcrSBoiYIG8=; b=2QPpnUE7fm1rzIoHP4/rpJrGHA
	A8ID4AmeXtnP0Uh34UUOXZyYt1+Wi0tz7+y9skyWAK8PiFnxh+opOhHw0ndwtXlaoiiwASaXiNOY9
	VvA0I9aFf3n2cXGSEX2JrGENI5adNuAfB1AJCqnFhMeM0wUg/d53mJh9OwwEwguZpM3g76RC8ovaH
	cLMuBXgtTi9nDMBCHr7RWv1QuVZsaLEqzNwG1Yz0C6msSp167CrUzRKzUU4Qa/o4wuDHByXrGab7Q
	aPot4sluA5UqSlqaduD7jlW0teuM2lThhl1TkHjyNJ6A/eIoGmUOeAQw8yId6gW1JxiWpKz3Kyzd9
	HM3UeQBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s91cG-0000000ENo2-23Sf
	for ath12k@archiver.kernel.org;
	Mon, 20 May 2024 11:55:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s91cD-0000000ENlw-1O4X
	for ath12k@lists.infradead.org;
	Mon, 20 May 2024 11:55:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8566ECE0B51;
	Mon, 20 May 2024 11:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0609C2BD10;
	Mon, 20 May 2024 11:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716206138;
	bh=f1j3Tqo79beaP7NnAvfjwKD3XcqiDwySY4RJO7UpV0c=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=onq/54R+yQZ1NwzqgzJWeaKChFODPwUMqzEXhibs6mld5/qFl2dCxnnNk1empSL5p
	 kIwxEy59DRE0tH5nL85/2XXpR01mPQwMYguvDHlDFRLo+NUXPrFRIyQL9XM65DEu4j
	 3pkhHJ+E6WCj8oFfSYee6Le2TqrAZL4/v/Qwpff+9OtNwupeMocY9/MAV5W2RlHqrJ
	 8DN1umku2j7jsABjccd1Ns6d2Hwyjw4wkZ2vYHdrneH6ZrEdZ4gKMy/U/nw4AkhBln
	 dNZ8ZirmnWvV4O7YaseZ1ExnKAGjry49OabJJOZjZuJZIkY3pWiLjN/bLW01YDMACI
	 sdwXayR4DjYGg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath12k: Add Dynamic VLAN support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240515192830.995013-1-quic_msinada@quicinc.com>
References: <20240515192830.995013-1-quic_msinada@quicinc.com>
To: Muna Sinada <quic_msinada@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Muna Sinada <quic_msinada@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171620613612.3753090.12657165170702284157.kvalo@kernel.org>
Date: Mon, 20 May 2024 11:55:37 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_045541_600708_CBAA2283 
X-CRM114-Status: UNSURE (   7.53  )
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

Muna Sinada <quic_msinada@quicinc.com> wrote:

> Add support for dynamic VLAN. VLAN group traffic is encapsulated and
> encrypted in mac80211 and driver needs to set flags for the VLAN group
> traffic to skip hardware encapsulation and encryption.
> 
> VLAN group traffic utilizes ext MSDU and HTT Metadata to set
> encapsulation type to RAW and encryption type to OPEN in order to
> inform firmware to skip hardware encapsulation and encryption.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

26dd8ccdba4d wifi: ath12k: dynamic VLAN support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240515192830.995013-1-quic_msinada@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


