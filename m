Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF98EC54E67
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 13:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Rm8OlYxC/AWjajIdqDA4wJmrZGXskO5TRemOf7OBDs=; b=TBSxbNfEEXsrJsuTHThokaAmQQ
	cwVg/h0WJc51OeNhUvbUKbWTiECxmAC3Ip73ZboYH3RPqLZD0S7VlfAB6WryiSVDvXnR5TwwKQlRZ
	DGxDCnjtBxgR15CooRqduiKU7aGCZGsDDKHNW3zVgKBYwi2OGa5rD4mjqeesSAXPYAk/UMH8KyNsX
	YZ36q939EtZq3UB2ZheonRyyWHKCP66pSCv0Ds79KJc6Q5Kykmb241TP1n5YNd7dbKHqRJ234li4B
	+ApmT/wc2WpMJ1iJDBvn+1vd/1Rrl8lvlUWuyp20AkjOB2CU3UybdJPQKlpl9yHIlTorrZ+VgSHwU
	sR9yrVeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppvu-0000000E7sZ-2s25
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 13:36:42 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppvt-0000000E7s5-0ILF
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 13:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=1Rm8OlYxC/AWjajIdqDA4wJmrZGXskO5TRemOf7OBDs=;
	t=1711632998; x=1712842598; b=D2ArgLM32AzcwsOaSnZE81zaEYSl4sNx5Wz7JXhfRyuO9qc
	fezGaiHgD4jM2oz/Wl0NfwghKOzQld7xfft3/DVs5UrXxOXEIhLsWiwXqrIEU3quppuSOIytjTvXz
	myrlaTDPhLGwS6yJenbsfflM6zwViJJYLXU+41lqvv8HN6c/kSvYh25/JDHB9Xf07qBbRrLstB9fI
	e8rB2nsvNYC4NX9Z5cJFdl7T/8/1yQpUgbXSv4l11Xn8OFE2BPpyuxHbi1zX87lUKbKGoNid3JwVy
	Q+TLS5rEiwCLcumLiYesyoosQipCSQM64RYvVwFjRbeIPsyXa9d59JTCOFnDy8Og==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rppvn-000000010W6-3K0C;
	Thu, 28 Mar 2024 14:36:36 +0100
Message-ID: <8821e4fe9930560d19809390777451d631821f1f.camel@sipsolutions.net>
Subject: Re: [PATCH 07/13] wifi: cfg80211/mac80211: Refactor iface comb
 iterate callback for multi-hardware dev
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vasanthakumar Thiagarajan
	 <quic_vthiagar@quicinc.com>
Date: Thu, 28 Mar 2024 14:36:34 +0100
In-Reply-To: <20240328072916.1164195-8-quic_periyasa@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-8-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_063641_179109_0698A913 
X-CRM114-Status: UNSURE (   3.92  )
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

On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
>=20
> +	int num_interfaces =3D 0, hw_chan_idx =3D -1;

No point in that new variable, just statically pass -1?

And this really is only a cfg80211 patch, with the API updates
propagated where needed, but we don't list all that in the subject.

johannes

