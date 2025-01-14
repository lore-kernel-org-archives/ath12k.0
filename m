Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574ABC02187
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 19:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOUt7IYQcvBlbefUzHArfKzbnsnkw0mqw78Gw1NGLxA=; b=1OcZpxU4sMiMA6IU47EkGpfaMR
	gs3MhotqgStzpIF1RoBkQPEUqbxVQcDq3MyTIXtF3jnIpAGzgf3n5OgDYSTuYIwcfB0vtNQbaqdZh
	lmZUm1xWiKsTSpgd98B91X1wuy+wnEsxT5zNhOaZxzidsgDJQi/ZPBcZTKRc9wTxw+SL3U4fzhVrH
	eRJGQz8SFCdpDvHmu14uj/uvqrGkWtI84QXoKgjhnBWCYZ7Lz6XffrcxniEj3Abwgtt2uRJUy4Q0d
	L+Q9rSQ16CYks3zpPfjKTOu7CA0/MjKrFUnKpun0u9HtZgTrzvGlbwGmeR9fTwXIOyrOSpUz3F3N3
	9C8LOXsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmsr-00000009Zhe-0TcQ
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 19:47:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXliZ-00000009QzJ-0NR5
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 18:32:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A1B6A41818;
	Tue, 14 Jan 2025 18:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D885DC4CEDD;
	Tue, 14 Jan 2025 18:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736879565;
	bh=23gDuo/pDGl97jIU8J84fFgtWGyHxomgLeWhUr+NDDk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=DdwrLncPLo0GuRLTGYyWUjEBDtLpuidsm5/YruvOZZioSqFcdcRCVy0MHnmiO7F0F
	 GRQld23BAMJSbFqoj5oe0PtV3yICOqmm3QkYoYV/GXzt5HGhw+Ko7wiNJKlk+4PNS2
	 Q/eY7zVb8ElxNsGUXKv4BtrnfIirg9wM5GoWOvveM1DndnQPTJd1ERVcs0oy39S55/
	 +0CiphYAqyOJ4G1FQOpSMV9ziir7H5/GImIBXnA8vXEQbc6BnvkCORNin+QwFrJd5o
	 BjwGaMpd19jhQ+lFMdgQEiMHHHILOzu+rzTr0YGbtzledAnpzK+xEvjSU+J/3Qo5wY
	 MzJcBSokRSz3g==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Jeff
 Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/4] wifi: ath12k: Fix uninitialized variable access
 in ath12k_mac_allocate() function
References: <20250112071630.4059410-1-quic_periyasa@quicinc.com>
	<20250112071630.4059410-5-quic_periyasa@quicinc.com>
Date: Tue, 14 Jan 2025 20:32:43 +0200
In-Reply-To: <20250112071630.4059410-5-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Sun, 12 Jan 2025 12:46:30 +0530")
Message-ID: <878qrdp7p0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_103247_194494_316D0F3D 
X-CRM114-Status: UNSURE (   9.07  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> Currently, the uninitialized variable 'ab' is accessed in the
> ath12k_mac_allocate() function. Initialize 'ab' with the first radio device
> present in the hardware abstraction handle (ah). Additionally, move the
> default setting procedure from the pdev mapping iteration to the total
> radio calculating iteration for better code readability. Perform the
> maximum radio validation check for total_radio to ensure that both num_hw
> and radio_per_hw are validated indirectly, as these variables are derived
> from total_radio. This also fixes the below Smatch static checker warning.
>
> Smatch warning:
> ath12k_mac_allocate() error: uninitialized symbol 'ab'
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Fixes: a343d97f27f5 ("wifi: ath12k: move struct ath12k_hw from per device to group")
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

