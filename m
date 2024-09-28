Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A0BCF6493
	for <ath12k@archiver.kernel.org>; Sat, 28 Sep 2024 09:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vV29/9QS0D5UC1nqdNnuP1DJGgMxBCgbSNAnO1ERpc=; b=MTnMyrmKAElw4C6Qi6ivlEuRbc
	b2AKmoumcicTIYCkAgQANmL0TtaR3L3+DGyA1Uk+qHw/N+tvCQ4JT6c/xuG4/FpPLPMhmyWrAkv9g
	YQCIozsyyq95/IQhDSNE9UFJ/pzIGZXZFzgLXvYvA7gSLU9JFDo8n9eTo5Xio7w7BagQPb1gxIRog
	Z4HObc1mpfNIVhD3jwsEE4jqC+fBjl9l1jDJuHpfg6WrICcw5GIBXN5gTXgNNW7FFbPcHFWBIpqIv
	eMFj9tFCdTytxgokC6QZx7Msvj5W2NcLprF2ifl/PP5NQQYSOmjVA+4IZ2vnX8ZVK5rSGa0uT75nS
	FirSW8xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suThw-0000000CseJ-3ViR
	for ath12k@archiver.kernel.org;
	Sat, 28 Sep 2024 09:25:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suTht-0000000Csdt-47RZ
	for ath12k@lists.infradead.org;
	Sat, 28 Sep 2024 09:25:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE6F4A4018C;
	Sat, 28 Sep 2024 09:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C7EC4CEC3;
	Sat, 28 Sep 2024 09:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727515540;
	bh=RTSIXYJVg1J54Vg06POAlgZCyQjSmDNTebc8pUKwVBM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=s4CXk5OR/xvxQxhkkFARzng/rb28T7m5tXVBACpcPX5EtRa+dNABTVRNsSIHHoJHx
	 7RAn2h73/H3xKBOhLTzxIv1jro2a2sOR+Y90JCa3VRg6nEWxr0Z1TXOj/HOUih5Rm1
	 DkJXErxujRFelBazG2tK6MyFCrrJMMY9T/fIUbprwrBksIDxPeGIHWNufvAzaPjtjC
	 e4Js/TQI5k1/IF2g1f9llNdzJs9viVhZYFCjsd/2QfnK3YSZvZkG4oh8sp03ItQAMv
	 MTIn/+YaVcFF2/Ib5hQxvNLiCdwvzjavRM21iN0QhhgOKPBd58bq0EfxZi9Dll5fr+
	 0/GnbJWcL5iXw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: Skip Rx TID cleanup for self peer
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240905042851.2282306-1-quic_rgnanase@quicinc.com>
References: <20240905042851.2282306-1-quic_rgnanase@quicinc.com>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172751553827.2272178.15822222576794808433.kvalo@kernel.org>
Date: Sat, 28 Sep 2024 09:25:39 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_022542_126879_7FCC951F 
X-CRM114-Status: UNSURE (   7.28  )
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

Ramya Gnanasekar <quic_rgnanase@quicinc.com> wrote:

> During peer create, dp setup for the peer is done where Rx TID is
> updated for all the TIDs. Peer object for self peer will not go through
> dp setup.
> 
> When core halts, dp cleanup is done for all the peers. While cleanup,
> rx_tid::ab is accessed which causes below stack trace for self peer.
> 
> WARNING: CPU: 6 PID: 12297 at drivers/net/wireless/ath/ath12k/dp_rx.c:851
> Call Trace:
> __warn+0x7b/0x1a0
> ath12k_dp_rx_frags_cleanup+0xd2/0xe0 [ath12k]
> report_bug+0x10b/0x200
> handle_bug+0x3f/0x70
> exc_invalid_op+0x13/0x60
> asm_exc_invalid_op+0x16/0x20
> ath12k_dp_rx_frags_cleanup+0xd2/0xe0 [ath12k]
> ath12k_dp_rx_frags_cleanup+0xca/0xe0 [ath12k]
> ath12k_dp_rx_peer_tid_cleanup+0x39/0xa0 [ath12k]
> ath12k_mac_peer_cleanup_all+0x61/0x100 [ath12k]
> ath12k_core_halt+0x3b/0x100 [ath12k]
> ath12k_core_reset+0x494/0x4c0 [ath12k]
> 
> sta object in peer will be updated when remote peer is created. Hence
> use peer::sta to detect the self peer and skip the cleanup.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1a0c640ce1cd wifi: ath12k: Skip Rx TID cleanup for self peer

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240905042851.2282306-1-quic_rgnanase@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


