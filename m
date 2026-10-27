Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF12606A31F
	for <ath12k@archiver.kernel.org>; Tue, 27 Oct 2026 00:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hUhS4YRp;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IPpmdMgW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H/yoQOUKBrL56T5gjNQcc+KduxA/BxAhW7oXXt9IhIc=; b=hUhS4YRpCI97aS
	92+sSQxpC7xlXfqiOmtFXfyk5JDIMU1VnyXElC474XnQl/ZqUpA1AWilicCc1WEY6DoZG31PsZf9x
	kLFUAhlL7bUUzK/vCwB2BWXPwus1O1Cjak1koAc3SkNdSVSC5VvXuF2JHKG6vQ9/Ld2fxP3eXUuln
	Xjf4zt78/oFn547BIecrXtDitXE2/X5z8bjsrC7y5+wEpPaPLQIlLEJCPAX8WXt4YLu9ZXhfBEEu6
	6Wgas+ts2EFpzhWN5BjNpgnni9X80mMmgvawxq1IURre6baKoXWpUtKzLfuiIJPylsuBwVykSrwCz
	G25CT1lkGKKLCob/od6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLUqT-00000003WXH-3zpN;
	Tue, 27 Oct 2026 00:15:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLUqS-00000003WX4-3EKg;
	Tue, 27 Oct 2026 00:15:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31291600CB;
	Tue, 27 Oct 2026 00:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FD51F01825;
	Tue, 27 Oct 2026 00:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793060115;
	bh=H/yoQOUKBrL56T5gjNQcc+KduxA/BxAhW7oXXt9IhIc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IPpmdMgWBt1jeGhOyJrZLKls4yjD6kVph15b6Y6qHdKQ11b9aAxvx+Ar9n9oHuPU7
	 ik6RmqL6C4t2DwUiKDgqqEqkJgnVb8rO3Nq3+KI0tsryhcW+xNAsi+nuLeh+JfcgP5
	 msQ/Qwq9PY09mcCwCJu6qz1yqHlS6k9pUdU5ouCHpMArXpcK8312x3yaWTqAcrItXs
	 Fh/5fH2zakApSy+yx7UtQ7DAfMxO5uQ9rCWnj5d2Scab6XDypcEDgWaadPOOLYnHXo
	 0vxZcJ9sVOBJOU+5sYCx4hLwt3DAbqwljp0Q2XE5gnkSrGeQ0s+HX3UumLBTdkHG7H
	 bpVu/SD4ErvZA==
Date: Mon, 26 Oct 2026 17:15:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Manivannan Sadhasivam via B4 Relay
 <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, Manivannan Sadhasivam
 <mani@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, Bjorn Andersson
 <andersson@kernel.org>, Chris Lew <christopher.lew@oss.qualcomm.com>,
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, Raj Kumar Bhagat
 <raj.bhagat@oss.qualcomm.com>, Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] net: qrtr: Add support for using identical MHI
 endpoint devices
Message-ID: <20261026171514.35136bec@kernel.org>
In-Reply-To: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com>
References: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 19:43:06 +0200 Manivannan Sadhasivam via B4 Relay
wrote:
> Merge Strategy
> ==============
> 
> Since both QRTR and ath drivers are falling under the networking tree, the whole
> series can be merged through netdev tree.

Makes sense, could you repost these after the merge window (~1 week)
and tag as "PATCH net-next" then? Our CI is thrown by the wifi patches
in the same series and did not ingest the series.
-- 
pw-bot: defer

