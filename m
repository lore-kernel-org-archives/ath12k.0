Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CBCC25B74
	for <ath12k@archiver.kernel.org>; Thu, 16 May 2024 08:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/KQibZtwBcsLSU+z/hJpl0M3unYttlT+PTQbeFw05o=; b=CeHkmEbxznGE7+7UCiPKgSHl13
	2oXOH1TX458QN5lRnLhJTU7mLIM9ha0n7oNvQOXvsVMuQoGSSM2CdrkM+Jz+P6zX/jlfo/T1S/ber
	ADfoYbirlmgAwKXGq7NA8bmxw6pbHAWWOjYJ4rVTLgPYHg20u0oVgI+3N1Ysr6yyrk5cBXOzuWQxG
	fSGXSAGTr5IZc11UusSTAJRjX32RMHv8yCkwxTKHjx8PSW4zM06CpfC+oAn1u+NvWwjlbU9qBPTGF
	Lcx5T8XVJ/G1x0k5hVWZXSth8eFCbu3QTHnwVRUd9E6mwOwd4UuqoONMxMiOxh0vBjsrQXW4B447O
	ZAZRq2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WH9-000000047Q2-3x2b
	for ath12k@archiver.kernel.org;
	Thu, 16 May 2024 08:15:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WH6-000000047PK-3v5O
	for ath12k@lists.infradead.org;
	Thu, 16 May 2024 08:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F134FCE1813;
	Thu, 16 May 2024 08:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C76DC113CC;
	Thu, 16 May 2024 08:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715847336;
	bh=xDaNkHNQXzpDPw+YewmPEWMqT5K3zGQy05CkUwlt848=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=i3FPZQZzY2ZfEsoxsomjTVPyzAKZ53Rhb0EhAKXeT6xFFmld1lJBcti9Mr4CKgImw
	 hbY+OsAXxEaUdaZDls27pqbVZHD0J50z1LBEoYW6L9rAwcwwVSy+eOsbwHH7Qqo5pC
	 4nC8vAePHmhBV34PfSLCeSdG6vgBgxlN1IgiD5G+FDl7ISrzlBxeHAX0jY/e0UnZaz
	 QNBwWsAxwbvDKE6t8tbZmrMVhyUqk+Q5PWkAvc/hVOd9g591SeqzQASlc427bFebKP
	 qr82FY6uGZnl8DyYFq8hpM4F8VuTHSuz5cdYS9pmg18TUg9WYAYhFGHtNOGOvjWBRl
	 9DyNQbKGyKwEg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/9] wifi: ath12k: advertise driver capabilities for
 MBSSID
 and EMA
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240508202912.11902-2-quic_alokad@quicinc.com>
References: <20240508202912.11902-2-quic_alokad@quicinc.com>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aloka Dixit <quic_alokad@quicinc.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171584733371.2755978.4141116655256699503.kvalo@kernel.org>
Date: Thu, 16 May 2024 08:15:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_011541_220208_052118B1 
X-CRM114-Status: UNSURE (   9.17  )
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

Aloka Dixit <quic_alokad@quicinc.com> wrote:

> Advertise the driver support for multiple BSSID (MBSSID) and
> enhanced multi-BSSID advertisements (EMA) by setting extended
> capabilities.
> 
> Configure mbssid_max_interfaces and ema_max_profile_periodicity
> fields in structure wiphy which are used to advertise maximum number
> of interfaces and profile periodicity supported by the driver.
> 
> Add new WMI fields to configure maximum vdev count supported for
> MBSSID and profile periodicity in case of EMA.
> 
> Set WMI_RSRC_CFG_FLAGS2_CALC_NEXT_DTIM_COUNT_SET flag to allow
> firmware to track and update the DTIM counts for each nontransmitted
> profile.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

9 patches applied to ath-next branch of ath.git, thanks.

519a545cfee7 wifi: ath12k: advertise driver capabilities for MBSSID and EMA
ea68f1bba616 wifi: ath12k: configure MBSSID params in vdev create/start
5fbd97f25c4c wifi: ath12k: rename MBSSID fields in wmi_vdev_up_cmd
51c47463543e wifi: ath12k: create a structure for WMI vdev up parameters
84edf47bcb31 wifi: ath12k: configure MBSSID parameters in AP mode
9fd28936b641 wifi: ath12k: refactor arvif security parameter configuration
8c6faa56bfb2 wifi: ath12k: add MBSSID beacon support
f27fbd76a98f wifi: ath12k: add EMA beacon support
c740a18f62f5 wifi: ath12k: skip sending vdev down for channel switch

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240508202912.11902-2-quic_alokad@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


