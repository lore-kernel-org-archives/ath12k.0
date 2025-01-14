Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C44C02189
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 19:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8xTZ0arK7hF8ilqdBPjJxMuJ1rcBmOTiZq8JQTWCaw=; b=pnkhL5I6JKB5J5l9SN6MR8Khzk
	mZ24ktBosm4Ai31y+Gq4DiL6BSEd3M/zBmr2Yt1ZoLjQXsKJ9DUZugT/hPxM+6r3xn4PoPT9WBLPB
	02FfGqIEGURcKVIkUvpiwj1E54MtWp1uKjzBioFKiXB88sFvO6NEJ0cf4LVIj4E+jmVpeDPaeVBsC
	bB42UCMBLb8bJSs+ibJGC/8YMDXCStu/voe7R8ZI9hT0QV6ApTt9C/bncbnasWSeJzzMr4sVqD6K8
	EiJYN2MuvumFFZeFVnqqdRw3G2LueQSZfHI54ME8lZnJxfbgkmKCJKI3NXQBIBeKsfq8hEvK4SzAb
	ynZip20g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmss-00000009Zir-0wbz
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 19:47:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlkV-00000009RIP-05Ik
	for ath12k@bombadil.infradead.org;
	Tue, 14 Jan 2025 18:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=X8xTZ0arK7hF8ilqdBPjJxMuJ1rcBmOTiZq8JQTWCaw=; b=BJeNeEdP3Ggz7odxs1at365b+A
	1uQMPM16z6K5yK8KvFlZuS0oPAh84zfiTc7KTRrEyhldS7yRXVZcnW43c974OK7TbQQ18yH7E9g6A
	wF7JKhYo8Bo4qBWXGy8KptPUJHKnvlqHbGA+3p1NzsTCV41qHrskJnoQzVMcVNG2F164diT32pU0U
	DiOqW4KL8zgnZs3+/B5qFgwEP3ixspVZZv1j4zelnwbM0qbK15nZMYZ1+YVgw3KNWkwA2/XZG7zIB
	ff4IldiirYKjpGuqicUELrmurI0aLb401B9TyDsTlt03gbqR7qm4Pnm90reAavKst0viV2p/F8b8M
	aLyaS4Uw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlkR-0000000AYAp-3oGs
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 18:34:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7B405C5933;
	Tue, 14 Jan 2025 18:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5FAC4CEDD;
	Tue, 14 Jan 2025 18:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736879680;
	bh=UZlAWxazLyKXPF6jT2tCXWEb0opztpqdgjV+D26ctXU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=dIG7ISXqlo95SRmOtAyzskF56poaoYZfp/MKy/nBWFwO1nG6N3zddqjUmZvaR2H5m
	 TCChiBuh7gCVWn31LLp6H0rKjLePET6Ni/HRSWbzyaqs2g3hgrqBPVoy5IMngtWRpe
	 iSDSRUtB8RmRY+0niSIXgtrJ+Ss981z5s7SwZukcpLoYmSliQBKU3RnBtGygut7885
	 5+u+CoFmKxYwz1brDvKv6pQis+zs9V9ZHRPDwU2fzB60fA3ZM+eF4Cme+l5eZOiVv4
	 QmZNkEcdGSohSYYjMr8yUL3eXJB4ShBmmSP52ZVtEBCC5vrnLggNGfVCJQOtnjSpW+
	 M95icH/TgDXOQ==
From: Kalle Valo <kvalo@kernel.org>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,  Rameshkumar Sundaram
 <quic_ramess@quicinc.com>,  Kalle Valo <quic_kvalo@quicinc.com>,  Jeff
 Johnson <quic_jjohnson@quicinc.com>,  <linux-wireless@vger.kernel.org>,
  <ath12k@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: ath12k: fix key cache handling
References: <20250112-fix_key_cache_handling-v2-1-70e142c6153e@quicinc.com>
Date: Tue, 14 Jan 2025 20:34:36 +0200
In-Reply-To: <20250112-fix_key_cache_handling-v2-1-70e142c6153e@quicinc.com>
	(Aditya Kumar Singh's message of "Sun, 12 Jan 2025 11:23:00 +0530")
Message-ID: <874j21p7lv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_183444_176128_FE10782E 
X-CRM114-Status: GOOD (  14.39  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> writes:

> Currently, an interface is created in the driver during channel assignment.
> If mac80211 attempts to set a key for an interface before this assignment,
> the driver caches the key. Once the interface is created, the driver
> installs the cached key to the hardware. This sequence is exemplified in
> mesh mode operation where the group key is set before channel assignment.
>
> However, in ath12k_mac_update_key_cache(), after caching the key, due to
> incorrect logic, it is deleted from the cache during the subsequent loop
> iteration. As a result, after the interface is created, the driver does not
> find any cached key, and the key is not installed to the hardware which is
> wrong. This leads to issue in mesh, where broadcast traffic is not
> encrypted over the air.
>
> Fix this issue by adjusting the logic of ath12k_mac_update_key_cache()
> properly.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Fixes: 25e18b9d6b4b ("wifi: ath12k: modify ath12k_mac_op_set_key() for MLO")
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

