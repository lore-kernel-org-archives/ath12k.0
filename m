Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381BEC2BA18
	for <ath12k@archiver.kernel.org>; Thu, 20 Jun 2024 14:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGxdrqgQEiW0MdSd9SjNFePgJD+WGTKgF8IQPWpiGJk=; b=zuR4fpRsPYeNEhiCgUYCwb24di
	ukSG9mvYhh9MNApWnp9FuqyviXcGG+avSg6NMxO2JHt/pO9BgVBcmlIOhYv+qSIlXz6J++W0++F4Q
	PQQgtv/1TiwtGw9lUXDf1dphmWNpU1sOFKF76LRuut7ZVcCwGHSi3iJClIppeJw3VKpnCh4o+U5r6
	08pmfl2gdmlf9G2arjz9AI6FL9BxCErNmFba0uzI1h/IQqpCG0DjbHWBZJ07rte2WDMnFk/FViSqI
	adhSX0hcbbg7OKeclN00ChgrKbxaHWFcZ80SO0bWRjv2JJ1iABnvNJrF2MwBEH0tR6KDmmM4sxuLd
	Wy0jV7HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKITK-00000005Mfm-3kMv
	for ath12k@archiver.kernel.org;
	Thu, 20 Jun 2024 14:09:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKITH-00000005Mdx-1PnL
	for ath12k@lists.infradead.org;
	Thu, 20 Jun 2024 14:09:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9360D621B7;
	Thu, 20 Jun 2024 14:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040D5C32786;
	Thu, 20 Jun 2024 14:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718892540;
	bh=9bJfbKRupOXgKTJN/Kgr1szk1mCSg6BrwEvmo45z+iM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=r6lmXn7YyMWbrxV+GjC510QWKGm33Jsaq0O35EZwfQF0A6tKUI5hO+7CMbQ7Hv/4z
	 2jf4+rgglzHIibOsqbVkNt49P0CXJwnwp/erEDHDuIVk2psvKuw6Bkpm7H4raZoSUi
	 zfgnGE0WXP4eKEzfTMc6yFVSxiq478oSlVzxKISTuIqQIgpFwkOWR4bUych5wgCO1t
	 63Wf0q6j8ICz59kFKquAKFYgS57AYv4M2mf4GXlux2+CYmEBEOZ+qs/OSKzN9eAe/5
	 ert9LhvYlJJi/zeZ+dCKS82Zujcflmgn5m43D/0cA6VOfUKYEzZZf4y0lV2B81Ihss
	 RvpJQf46dttKw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3]wifi: ath12k: Add firmware coredump collection support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240325183414.4016663-1-quic_ssreeela@quicinc.com>
References: <20240325183414.4016663-1-quic_ssreeela@quicinc.com>
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Sowmiya Sree Elavalagan
	<quic_ssreeela@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171889253841.918573.15918536206746856053.kvalo@kernel.org>
Date: Thu, 20 Jun 2024 14:08:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_070903_547761_6D50E591 
X-CRM114-Status: UNSURE (   7.92  )
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

Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com> wrote:

> In case of firmware assert snapshot of firmware memory is essential for
> debugging. Add firmware coredump collection support for PCI bus.
> Collect RDDM and firmware paging dumps from MHI and pack them in TLV
> format and also pack various memory shared during QMI phase in separate
> TLVs.  Add necessary header and share the dumps to user space using dev
> coredump framework. Coredump collection is disabled by default and can
> be enabled using menuconfig. Dump collected for a radio is 55 MB
> approximately.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This didn't compile for me, I added this to pci.c:

+#include <linux/vmalloc.h>

Also in the pending branch I made some whitespace in struct ath12k_dump_file_data:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=44ae07628b68375f476895f4fc1e89a570790ac0

Any tips how to test this until we have the debugfs interface to crash the firmware?

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240325183414.4016663-1-quic_ssreeela@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


