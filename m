Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD62C25B75
	for <ath12k@archiver.kernel.org>; Wed, 15 May 2024 17:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4m0/CSu31nDc6F1zSURoPD0U9WwJzoHKvzpSlwfnfNI=; b=CQfutBvq2l8OmNtuVhYvB11wpk
	+7vomwLasoEtLeVm519mU1QoXID4TtDVDPZUvcjIBj6DxkqTe+2WeqnMVWyB/CGA2jxWiEbIO7ZI1
	YGQm5doTP1Sjx1AmDIaRyLNviQf09kLnBFmVKlnbvr4ycxKL1Sh32qfiOj2sPHv8ylBM7XgPwiGb5
	/00g+GEAV8YZgJjAbptrQ7gpEM8n/ox9uPR0dtPUaU773YKJsNkKfgiJMzkGEFN2+W3VRH4CDuBTO
	zht1VtzJqFIftjEpAlBFRLbtyb39UTiokOX1SfOy141X7guzPU+f5avtGqocD1X0hYt2/nT+BTqCn
	hvLsmarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Igi-00000002S94-1UYB
	for ath12k@archiver.kernel.org;
	Wed, 15 May 2024 17:45:12 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Ige-00000002S5A-3qCD
	for ath12k@lists.infradead.org;
	Wed, 15 May 2024 17:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=4m0/CSu31nDc6F1zSURoPD0U9WwJzoHKvzpSlwfnfNI=;
	t=1715795106; x=1717004706; b=OGCNdzgNVWWqQjWS0ydBs8vymqLDg0uEDxqOJkQlm8a+TJf
	kbUEgM28qAHYZyTUlCsDkZmFGRqHg6cNj9/WVO/KNs8z9zSvhtuLGIhmjGjDAmPRw8a3945iNDsDE
	oIiQSExdzf2nsW4ZSIjGO/8YlPqXLXMCUrh5zPGPOyegEmd+tgQRFpZfRQPtNlEpklcz/RcFeqL0q
	k7GGteNKfiEmEK1VUWHgoNcZKMSO4daDHTFPPCGFQcZRDd4GUvfZqJemzZljzWwB4JlHg3HmWu6k7
	Yb8JFLIo3laTN8ICLCSzwMxb70eudKb85u1c5m4esz9ZKncZF8stOuYn9PVeDCHw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1s7IgZ-00000006nqX-3wIG;
	Wed, 15 May 2024 19:45:04 +0200
Message-ID: <32e7237f6dcf98254c2468438665a1b9357d2dd9.camel@sipsolutions.net>
Subject: Re: [PATCH V5 01/10] wifi: mac80211: Add EHT UL MU-MIMO flag in
 ieee80211_bss_conf
From: Johannes Berg <johannes@sipsolutions.net>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 15 May 2024 19:45:03 +0200
In-Reply-To: <20240515165231.12114-2-quic_pradeepc@quicinc.com>
References: <20240515165231.12114-1-quic_pradeepc@quicinc.com>
	 <20240515165231.12114-2-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_104509_405842_3D1452D4 
X-CRM114-Status: UNSURE (   4.71  )
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


> + * @eht_80mhz_full_bw_ul_mumimo: does this BSS support the reception (AP=
) or
> + *	transmission (non-AP STA) of an EHT TB PPDU on an RU that spans the
> + *	entire PPDU bandwidth
>=20

I'm really not sure why you insist on neither fixing the documentation
nor the implementation, but I'll say it again (just this once): they
need to match!

johannes

