Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AD6C369AB
	for <ath12k@archiver.kernel.org>; Tue, 15 Apr 2025 06:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcIAga6GYfzSYtTDO27V82Rac8anYUyHC4H02k+lpNo=; b=phv+7q9zR8M/Sx6EfzESZCdXMH
	w+d2v1mTpHoyXIY0d0R7aM5Xj2ayS04zyBvcaHVxaxr9r5j+DlXGUp/7fI2tEgQruDlqLwzidlLfA
	pMqKasY/J8jmBc/KOUqZqWfLLxlfQBkmfxCBpWNCcFzRX83MlTIuSPq1VW6qr8/5Z1cR0NBkjzwrx
	LEiggx1sZfWnsq2w01CXVrIc/tOiV6Id0xUU0Y2+5fiKbv7ga13CDCi5k2ENmhDm2RC9J7K30HTq5
	E6oZR+s2e+cUD5LMuoSgr7QGQDfWONknxwoxS6qag1i4k0MaHqZAOKSgt9i1kIE+YrujRTi0Ys/uL
	rzCv59mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Zzj-00000004h6i-191Q;
	Tue, 15 Apr 2025 06:42:07 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Zzf-00000004h5w-2wxG;
	Tue, 15 Apr 2025 06:42:04 +0000
Date: Tue, 15 Apr 2025 08:42:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744699322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zcIAga6GYfzSYtTDO27V82Rac8anYUyHC4H02k+lpNo=;
	b=eJQyJh4PDfD3MFybZK57HSiim6SrToWbG5vis+3yeZ9uaCDEfrs1/zbSr78EZdhDUZqCNk
	Zb6/iGTUh8vhK2//ahfE75aaTSwuo+npGWmBUM3RA3qj6pI7LkNvKFrBqcnQw5+I9NxgbK
	r4//3qKNtN7PlsoJNA45nC2bOEapn03Nie9UL7Wi+ePAMxRzEqI63hCy43JtHOv1WxpK49
	GsRer8kOiweAFl/VXWLzf3qUqrJnIaaXuHTwtBwpf+l51hxVG8iszaDWVsjWsAQR96dMIu
	Capvt/4r0j4sNdPTJSDsubtyM3mzzOeljZtVvRZghnIytaTK8FN07P1AyYPLVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744699322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zcIAga6GYfzSYtTDO27V82Rac8anYUyHC4H02k+lpNo=;
	b=vkHNJiYezAQSOxrKFxNBB4BL/zW1bwvyrhu4JqnD9CdZgyVlWlwHGv6AvwNgS/LfIMGT6K
	FJueRUo6PMOUBVCQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Brian Norris <briannorris@chromium.org>, 
	Francesco Dolcini <francesco@dolcini.it>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ath11k@lists.infradead.org, ath12k@lists.infradead.org, wcn36xx@lists.infradead.org, 
	linux-wireless@vger.kernel.org, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next 0/7] net: Don't use %pK through printk
Message-ID: <20250415084125-a8677bbf-5fee-4670-8d4c-4afda6669e5f@linutronix.de>
References: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
 <9c53011a-0e00-49f8-bf7e-b04ddc8c575b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c53011a-0e00-49f8-bf7e-b04ddc8c575b@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_234203_887027_9AEFF00C 
X-CRM114-Status: UNSURE (   7.06  )
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

On Mon, Apr 14, 2025 at 08:02:39AM -0700, Jeff Johnson wrote:
> On 4/14/2025 1:26 AM, Thomas Weißschuh wrote:
> >       wifi: ath10k: Don't use %pK through printk
> >       wifi: ath11k: Don't use %pK through printk
> >       wifi: ath12k: Don't use %pK through printk
> >       wifi: wcn36xx: Don't use %pK through printk
> 
> the first four should go through ath-next and not net-next
> 
> >       wifi: mwifiex: Don't use %pK through printk
> 
> this should go through wireless-next

Ack, thanks. I'll resend it there when the discussions here are done.

