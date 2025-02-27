Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA40C021BE
	for <ath12k@archiver.kernel.org>; Thu, 27 Feb 2025 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZ667nlR5K4N4gfwiaQsj8aDolpBaxgNKl8SPx17ZhE=; b=EgIqcVnnNsgYu8Ee0DsKDXJ/1j
	8DmBfhrHn0UjJqe0nT6YzE7gtCurclKjqN3YWb9uHq0F1Esj4i8ggFO4EdMtPwNHarwvXt3w/qTNQ
	LmuR2HTE5OxCNV17AU3hUHJgI1zx9lxl72xphSGIC8ql0Ln/qMs2iDAiflbeusT/nwxxnJ+UeGgCn
	2SNV2SCvfiMCUAwpdx9KaStF4NTcb61NFTNu23QnsGO5fQynT8s4ls8+8HSBdS9gnBWvXSG5dkkVw
	gOq4FHlv+dj9hzLlkWjwMRfoRqFFUv7e/WIF+j/Pn9BbbCJ2JN6RiZTSBH3Vfrcw7LXwEFDF7A/kU
	MyIHLIXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaXm-00000006ulE-1ti4
	for ath12k@archiver.kernel.org;
	Thu, 27 Feb 2025 09:51:02 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaFi-00000006s5B-0azz
	for ath12k@lists.infradead.org;
	Thu, 27 Feb 2025 09:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=OZ667nlR5K4N4gfwiaQsj8aDolpBaxgNKl8SPx17ZhE=;
	t=1740648741; x=1741858341; b=KxnHvzneaKLLaPYN/ZIFyKoeIGG0x5nNP44paV0GLBahmr4
	m/YhruJV3JIBFttlGAzkRJKOTkFFzf6wmMlX/4j0rIeWAITeDE73NoccwJRumM+ob+Mk8w+ndaGCD
	6dgXCk7f1KxuokrOf+T+1nNs8yP1rd1eqyoH6gB32REZjuALJrNC8M8DpyWdk1HTJrRq11HJ8z11Q
	DIt6C6lO2aTBgrp1I6Avw4g62CUhRLrqtu+UMiUHyb4axI2JWARSkB0wefJfN26wfwTvlFiAFIwmN
	l6kWdZ3q6cVW4sBknpWZX3OKtj4vxTrUdcmI2+3cI5NlU4ZHmMgfO+71L3Av2j5Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tnaFe-0000000CWqz-4APc;
	Thu, 27 Feb 2025 10:32:19 +0100
Message-ID: <900f042d03d34385fa3507610ae291a36ca4885b.camel@sipsolutions.net>
Subject: Re: [PATCH v3 0/5] wifi: mac80211/ath12k: add support to fill link
 statistics of multi-link station
From: Johannes Berg <johannes@sipsolutions.net>
To: Ping-Ke Shih <pkshih@realtek.com>, Sarika Sharma
 <quic_sarishar@quicinc.com>,  "ath12k@lists.infradead.org"	
 <ath12k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 10:32:18 +0100
In-Reply-To: <df26e3aeb3724d969f444eab65d8c872@realtek.com>
References: <20250227045824.91480-1-quic_sarishar@quicinc.com>
	 <bac3fdc3bd39e45150e5b7d60be01b5d732a04bf.camel@sipsolutions.net>
	 <df26e3aeb3724d969f444eab65d8c872@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_013222_177603_52EA1934 
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

On Thu, 2025-02-27 at 09:30 +0000, Ping-Ke Shih wrote:
>=20
> I have encountered structural (not functional) dependency problem too.=
=20
> Could you share how I can tell NIPA the dependency between two patchset?
>=20

I don't think you can at all, at this point.

johannes

