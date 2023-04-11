Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6987C76196
	for <ath12k@archiver.kernel.org>; Tue, 11 Apr 2023 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTFTRSw8uG6w/T55BsNeuwWVsLEbcTmMMRzXKkPTjwg=; b=cQM7O53Ao8G4Mm
	7K+QahgzJvCem7os8dFLkYOY7xOeyptXVz34mUtoUVKXFzYgSlqC8iy0ey+cr8HJyKgWx5lMuhw/t
	azLle4iCBLrIqkDkWlUBGUTeqmOTowYnSanagyPaNMjn1TdPpzGn/q1max4qxhM+t5p0KjqULuqgm
	QrUSW30htokZ8lHADwl4d0lTEo6kb7ehEVPneE5P7f/hckwwQjwlMbRDPYjk4pktqrlUSTHKNtQqe
	fQq3I+jsD2qrXFVnG4/lJttW4se0RjSQXebJ8bEnSFIjUmEBaB8wybY453jIYlFcyTQ2IckJJUI9c
	ltnOvW2PztDJYD+JR3FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmB3T-00HDrK-1i
	for ath12k@archiver.kernel.org;
	Tue, 11 Apr 2023 10:16:51 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmB3P-00HDjb-2f;
	Tue, 11 Apr 2023 10:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=VBbUCXUzj+FqoSlTXXwTAPkQoNkpCBgeaQh7XK4E1V8=;
	t=1681208195; x=1682417795; b=nqtRpj5yooOsdUIYzRXLUG+z5c4aaN28BCgghbbe0v3Rc27
	Ne01A9yQiqC3Kp0gNnQPUd7SUsa+g/GMyamateZb9zfJrURjKjKwN7fz3sGPkd+O/k1vDm+R6AYBk
	Yf+kd8L9oH9ku/zyIDCfbP1fLzCStqrYqEGAbrtVktKsqXwu6W9XTaI3gKVKfgJz+HcnZix+P8CHr
	965CmU9RGc7bEsrr+LFMkUuzIOUDB1AZpchT+nF0Mmb2x38DOxoNmOw/zalsYH6w+wdYbb3CwnQFj
	yWjHjmFJ9+FFO2GUu6bPRQYVE93Rv8EQSGyAAfYH42IOtbSDe2vwMVpJC7LyVLqw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pmB36-00CgG2-2k;
	Tue, 11 Apr 2023 12:16:28 +0200
Message-ID: <90618520913ba1e6795403b0ab1aabdb1e374f9d.camel@sipsolutions.net>
Subject: Re: [PATCH 24/27] wifi: mac80211: implement link switching
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org
Date: Tue, 11 Apr 2023 12:16:28 +0200
In-Reply-To: <e315d6bf-67d7-31b3-991d-e6cb78701990@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.d99dfbe65c90.I92385ba882ec984a9a2ad18293173436657e82aa@changeid>
	 <ca5177fe-3b9f-2309-9afd-1d5e827540f7@quicinc.com>
	 <50719d34bc48d816d00b56d3d9efdb59e3e51a16.camel@sipsolutions.net>
	 <7872a08d-fe37-a876-713d-c5ec40c1893f@quicinc.com>
	 <106ad2b4934efd2f81d51b2e66336954bee7c185.camel@sipsolutions.net>
	 <e315d6bf-67d7-31b3-991d-e6cb78701990@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_031647_861169_71AC285A 
X-CRM114-Status: GOOD (  13.02  )
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

On Mon, 2023-04-03 at 22:15 +0800, Wen Gong wrote:
> On 3/28/2023 3:39 PM, Johannes Berg wrote:
> > On Tue, 2023-03-28 at 15:37 +0800, Wen Gong wrote:
> > > On 3/27/2023 4:31 PM, Johannes Berg wrote:
> > > ...
> > > > > Also I see commit(8fb7e2ef4bab mac80211_hwsim: always activate all links) and ieee80211_if_parse_active_links()
> > > > > will use ieee80211_set_active_links(), so I think ieee80211_set_active_links() has passed test case with some type lower driver/chip?
> > > > Yes, we have this working on iwlwifi/mvm.
> > > > 
> > > > johannes
> > > May I know how did you test it?
> > Just writing to the debugfs file. We have various tests using that now.
> > 
> Do you mean the various tests using debugfs or using 
> ieee80211_set_active_links() directly?
> 

Yeah the tests write to debugfs.

johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
