Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE092C77B60
	for <ath12k@archiver.kernel.org>; Wed, 26 Apr 2023 14:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVsGMDQ/X6dmeTkR+h6WHKaPlse3a21xoLpO+Qq1VbA=; b=ezhzHhs4I0Nj/Z
	UhBOs6QMQS44ENtXRRhpOPzkwFEiDpHGNce5ktUSRpQR1U2xfthU4WRmYmXyBjvgeul2oIEUQBeAq
	VYFa+/8cpMdH01IYcyZtVPHnnJuY+ygi2M29/vlscSxW5TyQxuITC2V+L8POhee2q/kmdL+1p3j/A
	nXJh1uTwjy7MvN7ohcjNhxJCzAy3zduqvZP38rW3dOulaXK2cBJSnJUKnwuSDW5mfKGR+EKq+GepZ
	Zglo2vFh3b6TCLwQLBNHyGzlqL9oELl/689suc2cEJKtMsbLIfQib2hYRwmDQj1qNYznDiXYYFztK
	EW9Qi6OM1h1n6eZ44Paw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prgA8-004D1q-1u
	for ath12k@archiver.kernel.org;
	Wed, 26 Apr 2023 14:30:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prgA3-004Cz9-0F
	for ath12k@lists.infradead.org;
	Wed, 26 Apr 2023 14:30:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E8292631AD;
	Wed, 26 Apr 2023 14:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00022C433EF;
	Wed, 26 Apr 2023 14:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682519420;
	bh=Kp1TnWGnN/Kp/l9dZHy796dza+UltCAqyBeBTE3TkCw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=FTvCYqqGklX3i/MbZJlLsiQs1XDzMuNOI9/SMvMjZSsxE/8/GOjJ29lL9iqnyWsWP
	 7K1FxdWyfYO2O0uUbVwS+zQBe9+PCb45UPpbx3QktXLmEzkskV6vD34UNd2g4uIv8U
	 0x0lP6iNm/QLADxWsRnyn1r8CHOQmEzPgccQwxT0SWpmlzCAu8gsCUsyZqa7dP0Tpk
	 9zq8tI/dF02q8+T4Vz5rCOAqsMUtIg99qunj8h1LBcRKBB0tzcL1sCGltxSWq3rIO2
	 IRg1kp7RjlJ9mX7y24RAZSpDv84iEh3x1msFgMIhAwfUDkj3D7tf5UuZq81dln/Edh
	 hHx7dL1Og+JPA==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] wifi: ath12k: add qmi_cnss_feature_bitmap field to
 hardware parameters
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230404032057.3236122-2-quic_cjhuang@quicinc.com>
References: <20230404032057.3236122-2-quic_cjhuang@quicinc.com>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_cjhuang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168251941703.11960.15779460259597957228.kvalo@kernel.org>
Date: Wed, 26 Apr 2023 14:30:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_073023_180546_8594353D 
X-CRM114-Status: UNSURE (   8.72  )
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

Carl Huang <quic_cjhuang@quicinc.com> wrote:

> Currently the CNSS (Connectivity Subsystem) QMI feature is assigned to
> qmi_wlanfw_host_cap_req_msg_v01 request directly, this prevents chip-specific
> CNSS features from being added easily.
> 
> Solve this by adding a new field qmi_cnss_feature_bitmap to hw_params so
> chip-specific CNSS features can be assigned to this field and later assigned to
> qmi_wlanfw_host_cap_req_msg_v01 request.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

9981a3ac5887 wifi: ath12k: add qmi_cnss_feature_bitmap field to hardware parameters
34c5625a459a wifi: ath12k: set PERST pin no pull request for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230404032057.3236122-2-quic_cjhuang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
