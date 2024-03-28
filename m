Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D03CD11DF
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 20:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfFSAsJsT2Wmw0hTegLH8ssxfxvZ8MTXjUEz/hkR0cs=; b=Zto6R3mp55LaCt2HKEpyJA5E0V
	i0YzaFMhrTqFciMHSWIbqM+wSd6HdA714AAVcXWivHh/xo5KWckifc9PUq6J+mA7cKS/oog5BjuO9
	R6J6WVy2CyQQDC+u+chv/Fn+OrToKUDxApDC8SiFIPVHCkfl1d4HqxZGgAyr1GXXiUAYyUZCZoLWb
	HiFIAgK+YVVUlCmbr2nRXcuWF7YwYrY9Wdd9ioXi1IFKzH1m1/G+5VmNiXEp+hLOAb+1TOvk/DZQM
	YuhADQgahl6cCje0zvSwhGt/oTgNfZFeoDqDFIG9hT4cDFKs1fOH6L2E2sUO+wNUbW96Kkyoc6CSW
	rM5+CZ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvyf-0000000FWCe-32XK
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 20:03:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpuwe-0000000FHZc-0SZy
	for ath12k@bombadil.infradead.org;
	Thu, 28 Mar 2024 18:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rfFSAsJsT2Wmw0hTegLH8ssxfxvZ8MTXjUEz/hkR0cs=; b=a7C8FwQkoMW3faOImu2VZcYNRT
	KWemHVOMsnYhQI2XeDBHlNaJ/uWeO8QLfVvb1ZVsNAJZLcMKdxl7C16BsBL/g2+FLX84dIXri/gqN
	7uoPkChpnxciBzlMS2hfnHbUs2fvjcghbdFsA1ycRHb+C4Tjnih072CbsksD2fI/HrA81TWZzKX/b
	ahNu4K7ONK3YpIKziRtsrePYuSiTD9NzXAX7Ygdco6nhGvGKcmLbhTksU1rkV8QNBscKhsi4EQR3K
	asPopQVtkOyh2mrN9qn6ovy9dgFOiCuFiVpGsXe7/m6N0hV6xG/WSXx/rV6ZftPWvEu/AmQnLO8aB
	N9F9NkHQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpuwa-000000017dn-3azH
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 18:57:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F37661847;
	Thu, 28 Mar 2024 18:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43B2C433C7;
	Thu, 28 Mar 2024 18:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711652261;
	bh=g8MZoSOBw83lfy1GQGN+fYvIbwsa4mnyeiq8LMMUAbw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ti6Tw9mMMkTBavcMr86LzhVafkUKbgTXs+DJ6l9HnvUJFa5/xg1SngxeY7S0O+Uul
	 uNPxj6Nm9l3lBPwl+KOM8IHUD8F74Ok4LxdD8acbvwlx6y/18dnrr0rgOExUPDQfrB
	 s0T7Hw0h6TJcZUNzHAsZd+fAPfpZczhpHXwFyrFU2hy0dO9Nuyj+m6cIXO/NQmRr49
	 ix6BypTQQpIvqDWp+hWwKWEha/TEU+mQfG/jnEjUTc4PblbILf7d/OfV3tgshCbxQY
	 kwsvK1xr4+AKzxzfvZdZ+KHUpCNz61MxWnF063i3bTp9g9iw0cs5a6ddzmC42e9Ex4
	 E1HRQ1jqvy4zQ==
Date: Thu, 28 Mar 2024 11:57:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, Vasanthakumar
 Thiagarajan <quic_vthiagar@quicinc.com>, netdev@vger.kernel.org
Subject: Re: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware
 channel capabilities to user space
Message-ID: <20240328115739.78ec5650@kernel.org>
In-Reply-To: <485ca445f0f0c47179a338df2538e74d520627ad.camel@sipsolutions.net>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	<20240328072916.1164195-3-quic_periyasa@quicinc.com>
	<6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
	<9d5c2f9f-19b5-af4d-8018-1eb97fac10d6@quicinc.com>
	<9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
	<20240328114903.1d0c8af9@kernel.org>
	<485ca445f0f0c47179a338df2538e74d520627ad.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_185745_163276_289A9BEA 
X-CRM114-Status: UNSURE (   5.85  )
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

On Thu, 28 Mar 2024 19:53:33 +0100 Johannes Berg wrote:
> I suppose we could even define a
> 
> nla_for_each_type(..., type)

That's probably a good idea for the kernel! We already have a bunch of
the loops with the if (type != DESIRED) continue, as you mentioned.

