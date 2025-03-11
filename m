Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B03FC28B30
	for <ath12k@archiver.kernel.org>; Tue, 11 Mar 2025 10:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDEcPICgPdcj4BLkvrHUhCEXWz6wWt7eYDl1f2//4jE=; b=fqB3HgFim6nbHfOxsdnskAa2hQ
	vGUlH6SVr76YhHgxZxmFcMuDt/odGWqDjn3Ko2nIirS1Xw8b06EJDWWRAn0C+FRH35AX1uYCRkOUV
	BlV6KbiuxoRCHusAsiXULG40gGORYCw8K7yDLg7/PKhDPWk07338RQNT4PHvUAG6JWa1nHEq1qv7X
	A3YlWzH0M7nN/9N22J4z2FptCaQ8AWBtxg1896VkdsjiupV9qI2vVEtKkK/vcQAIcJpLhYGPtuRep
	ob/bOBqFWj9jPAbPeXzF4zGBMOD1w4f+gU2ES6iBoXTjRB7wYjzGgWhD2bSlB0m4sij3+v1IlC1rU
	I9nBW0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trwqR-00000005KsR-3ZJq
	for ath12k@archiver.kernel.org;
	Tue, 11 Mar 2025 10:28:19 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trwiw-00000005JWz-3jog
	for ath12k@lists.infradead.org;
	Tue, 11 Mar 2025 10:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Date:MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Cc:To:From:Subject:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=aDEcPICgPdcj4BLkvrHUhCEXWz6wWt7eYDl1f2//4jE=;
	t=1741688434; x=1742898034; b=QQTjSTC/UX234U/OJbjWeTqJ2/omdCi28SE15AArOnPKntN
	zkEaKoerdB1gZwYmihBPFdOm3Gww5+UdlCcsxEl5R6uSpXSSt6Gj3RMCqmd5kNEhZGTJRxlhzBZqM
	ELHtBpzw7Lr18J+79hzGq8ceX1PmRUONn4mRfC5Rn6qdxuOzlY9kUxBPrZQaPNjSHWy4lSVggV5LH
	pwQtDZhTJ1G1lUS7Fi/IO7y399aTiTjHhcsPXaxRO6d7PnD2GrVdJITprFdH4WF4FYoBsll+8mC3f
	HxfYrKX7fhrtu3U/1DP4kMlpve1OZIgFPEmcFzc9z2RisrDEM/9gUFAA2QHq30MA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1trwit-00000007nFL-3oTm;
	Tue, 11 Mar 2025 11:20:32 +0100
Message-ID: <9a2d609041f3797c48080ca8a2a63b56be94c358.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 3/4] wifi: mac80211: Add helpers to
 fetch EMLSR delay and timeout values
From: Johannes Berg <johannes@sipsolutions.net>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20250306062157.1185769-4-quic_ramess@quicinc.com>
References: <20250306062157.1185769-1-quic_ramess@quicinc.com>
	 <20250306062157.1185769-4-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Date: Tue, 11 Mar 2025 10:46:30 +0100
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_032034_950070_9777B9D0 
X-CRM114-Status: UNSURE (   5.20  )
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

On Thu, 2025-03-06 at 11:51 +0530, Rameshkumar Sundaram wrote:
> Add helpers to get EMLSR transition delay, padding delay and transition
> timeout values from EML capabilities field of Multi-link Element.
>=20
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> ---
>  include/linux/ieee80211.h | 74 +++++++++++++++++++++++++++++++++++++++
>=20
That's not really mac80211, but not sure what we usually do here.

johannes

