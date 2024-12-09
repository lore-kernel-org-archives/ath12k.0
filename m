Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A0CE7717D
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 20:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqR+6NHj+QTKjaod0dEZ8FoANZGhOzaXjJ4YUxd+pNs=; b=zGrKISWwLqovHG88SkTlrs9jY3
	c1Yc7OfPuGO88iYipwHyY4GOVHNfBV2G75/g52i5slksoCToIvaZNTbMPNskR6cbuEECueQivTHdP
	Kvkz5wdxZUVE2rMDks5RBV4MXALAmVzVK7L7tJWPVZ+Jp41J4Q9nNMGu/MwqYYuK524pgVLIuKxfn
	tIY8eOwnjNcqbD2mnYzGwlTzhiuXSQM5kfE/mWZNH2tUO28dhs5w3Gv1KkAUeolQU9sI2Q3RfOs5u
	QsA+lbU2WFqcqhcGIpVzRbrLz0EaB0eY4ts4U/zsJkiOsccgt8TxaeGlfhMuG5goekh3UTs3oRbto
	pYslXUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjxI-000000097Pi-2Mor
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 20:02:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjwm-000000097Fs-49I5
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 20:01:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC79E5C5FCD;
	Mon,  9 Dec 2024 20:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B03C4CED1;
	Mon,  9 Dec 2024 20:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733774496;
	bh=lkY0uUrK3CZkh1e6aGm0hECU7XcpI4k1pID/IsNdns4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mXp6BR79asXVv9biiC+SSusBuKMDsOJCAAVLsmBGqDtybeRQB6vPnXf163BdogGc4
	 1iV+gICycfEUUC/MBRm30tfp+NOrnb4Zfxi11Vtvht2ebCwlW+K2KzuTyAu44tAGAv
	 JAJ+XBD05PBJWAXYtTq9CkA0hnDWkKXGVq4ECzeecGoVNeS1FySvEP0rCGRad1l4WG
	 yBjyij8Tj71NgRqpcCc/QDX9W/R8fa4HcAPG2EWxo93PoHXAKXBXMDh6Y8CX2wtOIJ
	 1g7eLYeIbz4SLz4eDM4JB0LJhfjHs9ASKdKssDUQF38xZZ/hr+MPkKmAJcODIMdkLq
	 ekPnYBc9hJA+g==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/9] wifi: ath12k: move to HW link id based reveive
 handling
References: <20241209185421.376381-1-kvalo@kernel.org>
	<20241209185421.376381-2-kvalo@kernel.org>
	<6f9bf36e-6866-4c83-a165-dd0af49902d9@oss.qualcomm.com>
Date: Mon, 09 Dec 2024 22:01:33 +0200
In-Reply-To: <6f9bf36e-6866-4c83-a165-dd0af49902d9@oss.qualcomm.com> (Jeff
	Johnson's message of "Mon, 9 Dec 2024 11:44:31 -0800")
Message-ID: <875xnssk0y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_120137_079505_927B5C8A 
X-CRM114-Status: UNSURE (   5.56  )
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

Jeff Johnson <jeff.johnson@oss.qualcomm.com> writes:

> Subject nit: s/reveive/receive/
>
> I'll fixup in 'pending' if there are no additional comments on this series

Great, thanks.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

