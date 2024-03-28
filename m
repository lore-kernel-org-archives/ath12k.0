Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002CFCD11DD
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMmVIKQoM/PlNFhCTLxNd05/dFR7NQI6JqPlu8BOkgE=; b=iGb2Q+/sVkf7PCSfmaXOhRRbwc
	axnU8q4Ukk+hUECZGeK1zcxnncvuAeG6pPAXlUsrcfR0hDyk0zK3JGGfNrcVvjlGRdxBS0C+jEnqi
	vM1RIeLigyeowVyjTZ4ibA0jZ/nsNIUkEeMeAOK3bt7Mpu8NlhqBCWtA62cybJGkT5KpuodXHO8PZ
	pNCEZjQUuTUce+E5F8k3mo7bcYSTzqKOIgjB2rBKhfBhoAXd8qvC5pxuNZyeKWvwRhvSrFHkVJuhp
	6Rt6LOTUq659t2F4uuDvxL2k9Jq/CaWDzwrrfsXiSTMGixsPPFKQOMilmKbsTV21U5W/aqUts82HW
	pZF7E/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsJh-0000000Eg3B-2xb0
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 16:09:25 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsJe-0000000Eg1O-3IvT
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 16:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=CMmVIKQoM/PlNFhCTLxNd05/dFR7NQI6JqPlu8BOkgE=;
	t=1711642161; x=1712851761; b=u8DMk1h5iQFoCGm05H5oMCjSEgo1e/FjFyOS86/rCxS3GCd
	1s+OHU0Jm+Q9WU3UNNs4cVJClo3OL3YyNcg7JAtVpLL0p2DCkvyrjr82w1DB8G3gLZ+W0QNSCeSMf
	CaqsrHpAtceieEtlDhQk942bicrAEDO/EHScG9FhMYBJZuFZxoBtSjVL3D0ScG4P6/qHhULtDn9i6
	RqCSW9YpiRnQ3f8Kq1mxQI5xr2OTqwstcj5J4x5mHyggLFzzLYs+9oqodEU5KC8TuRDyfBH19N0NG
	cIHZcI/sB1NkInmJQTlqP8thkE9EnOZl9+6yErDKA/VWHrIIa8GJRB+YBxRZlV4Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rpsJa-000000017LB-363U;
	Thu, 28 Mar 2024 17:09:18 +0100
Message-ID: <3f61f18fbf3372ff88da54cdfbd309e74b2aa4e9.camel@sipsolutions.net>
Subject: Re: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware
 channel capabilities to user space
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vasanthakumar Thiagarajan
	 <quic_vthiagar@quicinc.com>, netdev@vger.kernel.org, Jakub Kicinski
	 <kuba@kernel.org>
Date: Thu, 28 Mar 2024 17:09:17 +0100
In-Reply-To: <14b739c9-18da-0d58-b58d-cccebc505950@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-3-quic_periyasa@quicinc.com>
	 <6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
	 <9d5c2f9f-19b5-af4d-8018-1eb97fac10d6@quicinc.com>
	 <9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
	 <14b739c9-18da-0d58-b58d-cccebc505950@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_090923_050945_9E76132B 
X-CRM114-Status: UNSURE (   5.61  )
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

On Thu, 2024-03-28 at 20:40 +0530, Karthikeyan Periyasamy wrote:
>=20
> Can you point to any attribute constructed in this way from kernelspace=
=20
> for the reference to explore more ?

I don't have anything directly, looking at the code finds e.g.
devlink_dpipe_entry_ctx_append() but honestly that's really quite
trivial, it just adds that new attribute while iterating whatever list
you have.

johannes

