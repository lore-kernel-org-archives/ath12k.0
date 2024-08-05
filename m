Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1DCC3DA7F
	for <ath12k@archiver.kernel.org>; Mon,  5 Aug 2024 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkjJ/PtuclJazVEuiczpTQonI7tcNaKqlQjkzjt3rJA=; b=GAXGmze5IZW2CIXLBn5dBi7ucJ
	JYzoIX9caO2eZO+ZTZhveDw0zAKekfj55x/71qfY0KwSHMzELHd57KCx2TS50YVJA1MPmTo3Nd2cZ
	9JZKiBTPMPksPX33vb+i40VnhZNCqkegQQTLx1C6VpYuGLcw9bYrb3PoqKB9ESllqFbCyGPawS+Ax
	RllzOailMNjAYS1a2mG1Cl6q0uCO9SkDJtz7wk7WTe4XgsDh4tEw/eLMiWcXiNiLGNPUF3ejCOyGX
	xIanu2nWDlsaJ/rN9ZzShxI8bmd4eaY7ww1vf2rvhfNCACnwINfAlCWqwWs79hf5+ECOzU7wQEJuS
	oZvWlxpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sauSW-0000000FPDY-3h7w
	for ath12k@archiver.kernel.org;
	Mon, 05 Aug 2024 09:56:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sauSS-0000000FPCX-2oZV
	for ath12k@lists.infradead.org;
	Mon, 05 Aug 2024 09:56:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9457360BC3;
	Mon,  5 Aug 2024 09:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EF9C32782;
	Mon,  5 Aug 2024 09:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722851811;
	bh=kE/2fNW+HYfr/+/bFE8saaUkp5t2GeyDZLSLZcPFuwk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=aqx0HgaaGhpP+qdOXW40Hkbl4dFu32a+ESKECMNPTnXpJqVw4H2NqMtDXzZpaj20D
	 Z0UMLnl3YZ0OR0r9gPW/uVpHGjarfi8WvK6YK49ENj/ISgfROC6M/vqqSGR6HN9ePa
	 lCyLQjt/GH0vbnqHAz+eQbZgBdEP/PYic+WzbmKPuUu9smKaXTWi9wfuYg4rfK+z5r
	 TrzGK0x/kCslPqa6B3BYZ2HcvduJ0BJJw7ApCfeoFj22zK73pnXSUb11ravllKK0zK
	 POZ3LV2HrhfMNB1VTNtYAS7E6VTA3UodcXP/5qbQyu2oI5afJSrwgHEepArDsIU8/L
	 8ct9X/JDQ7THA==
From: Kalle Valo <kvalo@kernel.org>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Sriram
 R <quic_srirrama@quicinc.com>
Subject: Re: [PATCH v6 1/3] wifi: ath12k: prepare vif data structure for MLO
 handling
References: <20240711165511.3100433-1-quic_ramess@quicinc.com>
	<20240711165511.3100433-2-quic_ramess@quicinc.com>
Date: Mon, 05 Aug 2024 12:56:48 +0300
In-Reply-To: <20240711165511.3100433-2-quic_ramess@quicinc.com> (Rameshkumar
	Sundaram's message of "Thu, 11 Jul 2024 22:25:09 +0530")
Message-ID: <87frrj70nz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_025652_864675_92197091 
X-CRM114-Status: GOOD (  27.47  )
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

Rameshkumar Sundaram <quic_ramess@quicinc.com> writes:

> From: Sriram R <quic_srirrama@quicinc.com>
>
> To prepare the driver for MLO support, split the driver vif
> data structure to scale for multiple links. This requires changing
> the use of arvif to per link and not per hw which can now
> comprise of multiple links.
> Also since most configurations from mac80211 are done per link, do refactoring
> of the driver functions to apply these configurations at link level.
>
> Split ath12k_vif which is the driver private of ieee80211_vif to store
> link specific information as ath12k_link_vif. For default use cases
> the ath12k vif will have a preallocated link vif called deflink which will
> be used by non ML and the first link vif of ML vif.
>
> With MLO Support to be added, remaining link vifs will be allocated during
> channel assignment where vdev create/start happens. These link vifs will be
> freed during interface down.
>
>        		Current ath12k_vif(arvif) structure
>
>              +---------------+      +---------------+     +---------------+
>              | ieee80211_vif |      | ieee80211_vif |     | ieee80211_vif |
>              | private data  |      | private data  |     | private data  |
>              |               |      |               |     |               |
>              |  ath12k_vif   |      |  ath12k_vif   |     |  ath12k_vif   |
>              |  (arvif)      |      |  (arvif)      |     |  (arvif)      |
>              |               |      |               |     |               |
>              |  +----------+ |      |  +----------+ |     |  +----------+ |
>              |  |*ar (2GHz)| |      |  |*ar (5GHz)| |     |  |*ar (2GHz)| |
>              |  +----------+ |      |  +----------+ |     |  +----------+ |
>              |               |      |               |     |               |
>              +---------------+      +---------------+     +---------------+
>
>        	Proposed ath12k_vif(ahvif) containing ath12k_link_vif(s) (arvif)
>        	(deflink is preallocated member which is always the first link if
>        	 ieee80211_vif is MLD and is the only link otherwise)
>
>        			+---------------------------------+
>        			|     ieee80211_vif               |
>        			|     private data                |
>        			|                                 |
>        			|   ath12k_vif(ahvif)             |
>        			|                                 |
>        			| +-------------------------------+
>        			| |ath12k_link_vif deflink (arvif)|
>        			| |        +---------------+      |
>        			| |        | *ar(2GHz)     |      |
>        			| +-------------------------------+
>        			| +-------------------------------+
>        			| |  ath12k_link_vif *link (arvif)|
>        			| |        +---------------+      |
>        			| |        | *ar(5GHz)     |      |
>        			| +-------------------------------+
>        			| +-------------------------------+
>        			| |  ath12k_link_vif *link (arvif)|
>        			| |        +---------------+      |
>        			| |        | *ar(6GHz)     |      |
>        			| +-------------------------------+
>        			|                                 |
>        			+---------------------------------+
>
> To refactor existing ath12k_vif to make use of link vifs, following
> changes are made,
>
>  1. ath12k_vif now called by variable name ahvif stores multiple
>  arvifs(ah12k_link_vif) and also has a back pointer to ieee80211_vif.
>
>  2. In this patch set, only deflink is used to be on par with the
>  existing code. When MLO support is added the link id will be used to
>  fetch the arvif.
>
>  3. For mac80211 ops which doesn't use specific link_id, the config or info
>  is common for the vif, hence apply the config to all link vifs.
>  The links_map in the ahvif, will be used to identify all the link vifs that
>  are setup.
>
>  4. Change ath12k_vif_to_arvif() as ath12k_vif_to_ahvif() to fetch the
>  hw level vif. The link vif can be fetched from ahvif->link[], or the
>  deflink can be accessed via ahvif->deflink. API to access link
>  vif(arvif) by passing link_id can be introduced with MLO Support.
>
>  5. The ieee80211_vif can be accessed from ahvif using ath12k_ahvif_to_vif()
>
> Locking:
>  Currently modifications to members of arvif and arsta are protected by ar->conf_mutex
>  and it stays as such.
>  Now with these hw level structure (ahvif) being introduced, any modifications
>  to its members and link objects (i.e., arvifs[] which are dynamically allocated)
>  needs to be protected for writing and ah->conf_mutex is used for the same.
>  Also, atomic contexts(say WMI events and certain mac_ops) that we currently have in driver
>  will not(shouldn't be allowed) do any modifications but can read them and
>  rcu_read_lock() is used for the same.

Please elaborate more about your locking design. Because of past bad
contributions from Qualcomm the bar is really high for adding any new
locks. I'm doing the locking analysis right now but it would help a lot
if you could provide your own analysis.

My first impressions:

It's really confusing to have two locks with the same name (conf_mutex
in struct ath12k_hw and struct ath12k).

struct ath12k_hw already has hw_mutex so I'm even more suspicious about
this locking design. That's not explained at all in commit messages.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

