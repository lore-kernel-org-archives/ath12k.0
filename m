Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E0DC7619A
	for <ath12k@archiver.kernel.org>; Tue, 11 Apr 2023 10:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7T4IDkY9VeR5UjyVjbnXbk7AzXGdwrxiygfIkGMMgo=; b=FTewSf8NkiuUu/
	SRE5dWF3UkvptS4gul95fgtN5dJbcnCdpLwaXdW3lg74Nq7Y4CUABjCYjvM7UFXyCkHbt+5P2ydwA
	qFY7MhqG0kcB10peEP2+sFHd53+gDm9y+xxNS6J0qBbm8LNQkDAs65BmTlg5VHLjGGhY4bTUCcEL3
	n1Tgz9H5XwRZV+VT+P/evty4SVBegF4U+2XXxly3rcZXRvZVMa+EFwnDMCl2pOPDCpfNQYZZvsu4Y
	mwzdKWFj1clpNzgNHbiw1h9nVZXGE2dNkRPa8bd2XzVc1jZ27VMVbseRahjMOcE9mM1Pb714nc9Tc
	afC1KRsQAB59KKGH9lSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmB50-00HEBx-3C
	for ath12k@archiver.kernel.org;
	Tue, 11 Apr 2023 10:18:26 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmB4x-00HEB7-2l;
	Tue, 11 Apr 2023 10:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=g37lg8wxChlnTFd5lG/0A02V1vDlQ8YaEb0RUigmtow=;
	t=1681208303; x=1682417903; b=ojKNw5mpEYwiGT4/qf0SiiWDSMqazzMNSwCSQyMMboR88eM
	U0bzX3vFRXmfP9eC2vRDROb2aMC9wj/aIdrbtEzsyRvtllwmQqRvq2ZNIeqMcVcG70DaMnpbyTZTG
	/JMu0X1+ijNgu8IHRyh1q0alKxQmGeH5F2+YHbRibZ271PD5MCw7u4InxZDeWSUUiSa+aP27LboSL
	JA/LvCHA/oj38zgXTx0A9rCyyyWPQHJHtAJmVJK7WKzNBcq9Nqlr3tY0mk6QJ4cKmqdjJi4eSTdkQ
	kj1vAUyoMpnk8+6/Z5vRgq6oMfFzm2NYM53JEPhIqitfVc/pl084OB5DF9WaBi2A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pmB4t-00CgIS-1p;
	Tue, 11 Apr 2023 12:18:19 +0200
Message-ID: <b352dc03e5b404e4caa7e836a6ee3efde7e17ba6.camel@sipsolutions.net>
Subject: Re: [PATCH 24/27] wifi: mac80211: implement link switching
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org
Date: Tue, 11 Apr 2023 12:18:18 +0200
In-Reply-To: <955cf0b5-8973-86b5-109e-268917d70904@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.d99dfbe65c90.I92385ba882ec984a9a2ad18293173436657e82aa@changeid>
	 <ca5177fe-3b9f-2309-9afd-1d5e827540f7@quicinc.com>
	 <50719d34bc48d816d00b56d3d9efdb59e3e51a16.camel@sipsolutions.net>
	 <955cf0b5-8973-86b5-109e-268917d70904@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_031823_891208_6A7125D9 
X-CRM114-Status: UNSURE (   8.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Mon, 2023-04-03 at 22:21 +0800, Wen Gong wrote:
> 
> Also it does not have BSS_CHANGED_ASSOC(exists in 
> ieee80211_set_associated()) for
> 
> ieee80211_link_info_change_notify()/ieee80211_vif_cfg_change_notify().

Well, that's clearly intentional though, since the assoc state is at the
MLD level, so changing a link doesn't affect the assoc state, right?
This is also done through _vif_cfg_change_notify().

> So I think low-level driver also need to auto add BSS_CHANGED_ASSOC 
> logic for the added link as well as the pairwise key you said, right?
> 

That doesn't make a lot of sense as written, IMHO, but yes if you have
something you need to do on links during assoc, then you'd have to take
care of that as well, just like the keys.

johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
