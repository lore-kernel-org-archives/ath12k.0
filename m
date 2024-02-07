Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1B5C4828D
	for <ath12k@archiver.kernel.org>; Wed,  7 Feb 2024 15:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROYsMwLgr8m/j9wKQt+eHnwx1am+yls/spnqzJOZOs0=; b=hYwKe1y1j8HLiclUlGdXqtt+mL
	DQO9yXugHeeOo0OSNa7hpHq7KvMn8X4uSj1v/LVpe5Ax73D6PZDe4fKxfCmUPvX6lbbOif0EUUK2a
	uXe4dTjIhMlfoJOCU3wOHOHvkgBFCEtTbm3mCR9YH1k/xeSiDgbGHEoO9w6UInXbrt628OzEH/tBv
	qPNGe28uHOnACE2vsWZxwXHzfOo4nU0wI5OVSEgk9Deboxh0RZ+C17d7aV6exlZesdGBsFABpEuG+
	ZAvNzz0yYif+w3P+hI6DnOdgQRLjZbN4Ygz4BYhiQz60AksPgBA0xGwW0yeICs+ZH3mSNOVu5HuDC
	tOdKxJdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjWO-0000000B2EZ-36Me
	for ath12k@archiver.kernel.org;
	Wed, 07 Feb 2024 15:07:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjWM-0000000B2Dk-1gbU
	for ath12k@lists.infradead.org;
	Wed, 07 Feb 2024 15:07:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9EA58CE18CE;
	Wed,  7 Feb 2024 15:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C404CC433C7;
	Wed,  7 Feb 2024 15:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707318447;
	bh=Uan/Q0Q/Kd3LAVTiDWGEOTgNM9yrcvXDA8uVoN+txvs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ryM9v1pmg05T+lGq3uWagDc6CPJIPOSNi6YpyOlZErZ3WQ/nm+zM4sdBouNbnsL14
	 iFrKkQlPSkfZ3R27P7crodhPfE0U/JLSxFnBHYC5Yq8N64ALCuxG++9Xig3p3994rt
	 TgQzQRtsWs9AGHIHsufaX0mvhz8U3GuvcQoNeIxzaGGyb1AvET79yjB6u4s973YqQ7
	 G+tWyc567A4+J+duliNfrQj5gqvNPoxtSpaylI8cv95jxvOsNML09JTbUs9CbYYV5w
	 HcBdLnWPtUdMtznlw1S5vq+Bw4lL+pxjm4U3LcXsS5LRIWdrkX8Ly2eBUejjvgWi06
	 hkz3BphPc5v2Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 01/11] wifi: ath12k: fix broken structure
 wmi_vdev_create_cmd
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240130040303.370590-2-quic_kangyang@quicinc.com>
References: <20240130040303.370590-2-quic_kangyang@quicinc.com>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170731844476.2220494.14154220146045485839.kvalo@kernel.org>
Date: Wed,  7 Feb 2024 15:07:26 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_070730_644794_032F5F13 
X-CRM114-Status: UNSURE (   6.51  )
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

Kang Yang <quic_kangyang@quicinc.com> wrote:

> Current structure wmi_vdev_create_cmd is not matched to the firmware
> definition. So update it.
> 
> And update vdev_stats_id_valid for vdev_stats_id.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

11 patches applied to ath-next branch of ath.git, thanks.

4f684533afe2 wifi: ath12k: fix broken structure wmi_vdev_create_cmd
019b58dcb6ed wifi: ath12k: fix incorrect logic of calculating vdev_stats_id
ef860c6a3adf wifi: ath12k: change interface combination for P2P mode
575ec73cb880 wifi: ath12k: add P2P IE in beacon template
9411eecb60cb wifi: ath12k: implement handling of P2P NoA event
2830bc9e784f wifi: ath12k: implement remain on channel for P2P mode
28035a88f8b3 wifi: ath12k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
32e7b12e2611 wifi: ath12k: allow specific mgmt frame tx while vdev is not up
c9e4e41e71ff wifi: ath12k: move peer delete after vdev stop of station for WCN7850
cf0425eead75 wifi: ath12k: designating channel frequency for ROC scan
e65a63986575 wifi: ath12k: advertise P2P dev support for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240130040303.370590-2-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


