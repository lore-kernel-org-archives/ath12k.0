Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AD0C76195
	for <ath12k@archiver.kernel.org>; Tue, 28 Mar 2023 07:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYC2v72neWwiJwgG7RQ1+FEcBdoiXZuhMhQQsVE5xbQ=; b=ePXClz+nUiyQ4Y
	t/R8Q/y1nVJio3Uc/WLoBRtEXjUxnDIJxMNnk8LVbRTuqHucutSodzoEmCeq2hi36Te1QxnLBwNjW
	Xjfk5EPvfFlMaso4NYcXp9SKZzTt1ALgJlU1gwCPG4zj4R7ERyMGhx212TcXtGxWFJECysQAbk0pq
	JoXl94DP3qyWVAk2CFa/9Bis6p5cFfKNJPSdL0rRPg3crj1mvWyb8FLrzfGoO6L2AWHdxLM3gisMv
	nPegt9jSK54XEzLWreEpnZTZKHuNu9aqV+619p6myKi6EdVm98JxwVbXBCkODncbKwlpu9neHnsAW
	psdqGvokPHwLRhsq5mvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3vR-00DUgh-2F
	for ath12k@archiver.kernel.org;
	Tue, 28 Mar 2023 07:39:25 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3vO-00DUfW-1C;
	Tue, 28 Mar 2023 07:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=1aCiWsotuTKKkpfjYxMqVJAlIn/qwNM5nDZjA2y6tgI=;
	t=1679989159; x=1681198759; b=DB6bkEEu5OgrS86uufboTpmQ6v72GOL6eXp/i/V0GjmpIW+
	zSzalKGonBph2Hm+vOL8l/7p/hNvUyi1onTPiB6SWLTrnHN0buLN6bAB/LMbhL+X/VU9cfPHLZhVY
	P4GLTgEIUZxVlExUI+/paYyOekPIyaEMuvqV1oHaSO50j2Eou746wKUwcEziGUQolVU/fQbGjwENY
	lM25CzxyzbNzBt9TElUkM11m6AQjvteaMRLv5vOABal5AytH1j06I9/fwuhC6NZPIHiVtV1aJdizs
	1wF+kHbDwoSfUtAeinOP7rmvM9Z/6ZaCzJR9wfSyKwlLQMyitxtKVOnPTvLcu2Dg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ph3vF-00Ga82-34;
	Tue, 28 Mar 2023 09:39:14 +0200
Message-ID: <106ad2b4934efd2f81d51b2e66336954bee7c185.camel@sipsolutions.net>
Subject: Re: [PATCH 24/27] wifi: mac80211: implement link switching
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org
Date: Tue, 28 Mar 2023 09:39:12 +0200
In-Reply-To: <7872a08d-fe37-a876-713d-c5ec40c1893f@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.d99dfbe65c90.I92385ba882ec984a9a2ad18293173436657e82aa@changeid>
	 <ca5177fe-3b9f-2309-9afd-1d5e827540f7@quicinc.com>
	 <50719d34bc48d816d00b56d3d9efdb59e3e51a16.camel@sipsolutions.net>
	 <7872a08d-fe37-a876-713d-c5ec40c1893f@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_003922_407421_50D1605F 
X-CRM114-Status: UNSURE (   9.18  )
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

On Tue, 2023-03-28 at 15:37 +0800, Wen Gong wrote:
> On 3/27/2023 4:31 PM, Johannes Berg wrote:
> ...
> > > Also I see commit(8fb7e2ef4bab mac80211_hwsim: always activate all links) and ieee80211_if_parse_active_links()
> > > will use ieee80211_set_active_links(), so I think ieee80211_set_active_links() has passed test case with some type lower driver/chip?
> > Yes, we have this working on iwlwifi/mvm.
> > 
> > johannes
> May I know how did you test it?

Just writing to the debugfs file. We have various tests using that now.


johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
