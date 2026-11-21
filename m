Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A94606A330
	for <ath12k@archiver.kernel.org>; Sat, 21 Nov 2026 12:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PidWMRJY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SA4aygek
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qGdtTk9XqIILVzAf480BTGGOJcF8Zi4YrhwrdVI2WYs=; b=PidWMRJYzaGkdOKxdm3NzbTPB/
	X+3AM50dAb0ueBCPsBTP1DJ7M0Ao16k1QHClxzEI+3KS9eVfS3xw3e2Rty3s6/AjaM7ipfhHNrtTK
	C5terNlaE0Jn1LBpkZ4v65TxYR9Qb1IKd5eihPX6einkYkKF+WBOlpDzKiVSCREIY74n+fD0FsfPW
	zl+hqvy93ABB46tSHu/kTq6r9aPx2ZtDWeefepv4CRZO/iIXxr5K4MH7auImfXwhW6+qNRAEFG8c6
	tsk9OB1rD6uAJRprXnMdhDL2MS85c4xWDcuP3vzzfAuv9XDQLmRK+4nWU8Ir2QL+tnhcE0423aXMM
	gchVb8wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkI7-0000000HB07-2Nut;
	Sat, 21 Nov 2026 12:34:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkI5-0000000HAzi-2nZd
	for ath12k@lists.infradead.org;
	Sat, 21 Nov 2026 12:34:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FF5C434C1;
	Sat, 21 Nov 2026 12:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B284C1F000C0;
	Sat, 21 Nov 2026 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264440;
	bh=qGdtTk9XqIILVzAf480BTGGOJcF8Zi4YrhwrdVI2WYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SA4aygekgDvnxsiGmOpBj5G5yaukbaRZY1uVdvgfEuVlGVQ5VmvyoBqANlgSd9Iyp
	 HFPKgZ61+CcxuiPWMHQ4evqiYe96qK1JNAGru4jhjQ+fOk2ELfDh8V5BX7BYx05TzW
	 6LqvIS8pQC8AJ9ygUd+omcCFxAfXTw8Ct72UVPqKHYurXm4yqZSzpw+koi7eN5o+1V
	 i+xb5bSxqRuFsD9RcrU6NlI7KVW0Jk8XkDBUQRgc+INhb7qCO5Ll2O3/bse/z/lHGs
	 TMF78sUnSgIJMG7rrhBO342ceoUdEGy10jRlERZeHRwjg4DvjaLXiFeigSVMcvU79K
	 AyBrgccMQUINA==
Date: Sat, 21 Nov 2026 13:33:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH ath-next v3 06/15] wifi: ath12k: add initial Wi-Fi 8 hw
 params and init helper for QCN9575
Message-ID: <20261121-blazing-accelerated-monkey-41cfba@quoll>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-6-9875d2a3953f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-6-9875d2a3953f@oss.qualcomm.com>
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 01:45:29PM +0530, Madhavan Ganesan wrote:
> +		.hw_ops = NULL,
> +		.ring_mask = NULL,
> +
> +		.host_ce_config = NULL,
> +		.ce_count = 16,
> +		.target_ce_config = NULL,
> +		.target_ce_count = 0,
> +		.svc_to_ce_map = NULL,
> +		.svc_to_ce_map_len = 0,
> +
> +		.rxdma1_enable = false,
> +		.num_rxdma_per_pdev = 0,
> +		.num_rxdma_dst_ring = 0,
> +		.rx_mac_buf_ring = false,
> +		.vdev_start_delay = false,
> +
> +		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
> +					BIT(NL80211_IFTYPE_AP) |
> +					BIT(NL80211_IFTYPE_MESH_POINT),
> +		.supports_monitor = false,
> +		.supports_cong_ctrl_max_msdus = false,
> +
> +		.idle_ps = false,
> +		.download_calib = true,
> +		.supports_suspend = false,
> +		.tcl_ring_retry = false,
> +		.reoq_lut_support = false,
> +		.supports_shadow_regs = false,
> +
> +		.num_tcl_banks = 0,
> +		.max_tx_ring = 0,
> +
> +		.mhi_config = NULL,
> +
> +		.wmi_init = NULL,

Why do you add NULL assignments, which are not even correct because
immediately in next patch you remove them?

Adding code which you remove is clear sign this is wrongly set and
confusing code.

Add complete features or code, not somerthing which you know that it is
incorrect.

Best regards,
Krzysztof


