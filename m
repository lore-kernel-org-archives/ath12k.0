Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46976C4345F
	for <ath12k@archiver.kernel.org>; Fri,  3 May 2024 07:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKo0Z91tgLvGRSS1P/vRqhhsNrROxVkRsdMCAt/7o3A=; b=S902px1qKFTxt34zq7wDo0bEKE
	CBxRvBuQ/uO/FCyp6bhQkX0zkwk5FsxtViUKxBcRX8gQSMmuXtSHPX2CqjVqLhyzsgjzXTpqsWcAD
	/ejJGU9zUkis/UzDtvpSZ8v9wkmsRrgpRexUby16ekc6VxpGOsadKR/kegZazoXtF1+d/Im5XTpnr
	lnON8f8FpnsV+Hm1Jk1SqtLs8ZHVt3gTxmAUPvsY5veEyg9VLKKGRBmUeBf1jSa3UgyE8oN0u/egy
	hogjKireIZ4D8V6hpp/XeIfT35qRxisokmbifm6vAP7VQ9o16lsq2cN2UyzsLyEOfKouAyyIw14/E
	RmdzVGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2nN7-0000000FTMC-4BqE
	for ath12k@archiver.kernel.org;
	Fri, 03 May 2024 07:30:22 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2nN5-0000000FTKu-20Tt
	for ath12k@lists.infradead.org;
	Fri, 03 May 2024 07:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=dKo0Z91tgLvGRSS1P/vRqhhsNrROxVkRsdMCAt/7o3A=;
	t=1714721416; x=1715931016; b=d4CKzg/4m7tFYUoXImoAQSsGeyBcpa2tyqeZ+6VzNNLY3Fi
	6kj6u52DMyO/4nGQWAADBfURLZZq4gM3XUlDyka6AXMHp7/TV/3cT6ZMhQzs/z1MyQ3pwSzD+UZwI
	JJvfOz+M0Ay4cXqm09BmIr63JT5TIDMjvirQXRIOKB4pm4/5Tfl6d1vwglmQC/22zeR9BFq6hQR3J
	V/5F4UP3/YYc0jue28xy/Izt3b/s0W90eDPzrSw+0anBMTift+o/er4vWrFQ8pEL1b0ZRUSCc7v9X
	EqE1cUtbP3YVbOQmix6mR1BaxVMG1Z7D/oUeEuO0CxAchhp8EiB4e5WUkH2gSYoA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1s2nMy-00000001cIQ-3UtR;
	Fri, 03 May 2024 09:30:13 +0200
Message-ID: <8d6b5aab2ccfcb90547536fd334a6d69ca7b6943.camel@sipsolutions.net>
Subject: Re: [PATCH 01/10] wifi: mac80211: Add EHT UL MU-MIMO flag in
 ieee80211_bss_conf
From: Johannes Berg <johannes@sipsolutions.net>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 03 May 2024 09:30:10 +0200
In-Reply-To: <c6891df6-0b34-43d6-b931-16a3da577407@quicinc.com>
References: <20240325201031.10837-1-quic_pradeepc@quicinc.com>
	 <20240325201031.10837-2-quic_pradeepc@quicinc.com>
	 <8efc258b698acd504c1fc699d026b906bf383894.camel@sipsolutions.net>
	 <b4fb2e9f-b7af-42da-be97-9ae1560ebad2@quicinc.com>
	 <a313c313ab41325843092dc8445386dd802ed115.camel@sipsolutions.net>
	 <c6891df6-0b34-43d6-b931-16a3da577407@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_003019_768709_3B91C9FC 
X-CRM114-Status: UNSURE (   6.19  )
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

On Tue, 2024-03-26 at 11:36 -0700, Pradeep Kumar Chitrapu wrote:
> >=20
> > Yes but ... you document AP and non-AP STA, but only implemented it for
> > AP?
> >=20
> > johannes
> Sure. Thanks. will fix this in next revision.
>=20

We got to v3 and you didn't?

johannes

