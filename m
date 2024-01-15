Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDABCC3DA79
	for <ath12k@archiver.kernel.org>; Mon, 15 Jan 2024 15:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PqNAxPnRqPsYC5zgzKMOmjq8Nh/JE21VocEdUJc+hg=; b=Rpaz7ibrrtnVC63RImGFy2hd9M
	kGpRdMVhWAngD2b3cKR7ucnoblZaj+/vpP3g9lsUXkKMq/o+33qv7N5LmZCXIuUa9DAxp+6T7AT8O
	3+1+F1IvILnjDATCfA1Zq4bblQWqXN4VmRmeTlNbdGqHM9P/MKL7FZDZYG35HiiGg1sha/uzPvVtk
	+H56jZMfdHJ8uP0wY0kSeXuN6McTVpwEmmE+IGR2Gun1ySBCQN7/tMASTDqo1+a2QFWcaHlS3SAPG
	dNqBLsXxWj57X/6HLDd3LonI1SLz595/1OuQfpyr43jrGMC9HMerE4dk9YWuFRDPZxAlnQMDqz8lC
	pDW+brPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPP0J-009QBv-1m
	for ath12k@archiver.kernel.org;
	Mon, 15 Jan 2024 15:35:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPP0G-009QBR-1w
	for ath12k@lists.infradead.org;
	Mon, 15 Jan 2024 15:35:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 632E4CE0A11;
	Mon, 15 Jan 2024 15:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D0FC433C7;
	Mon, 15 Jan 2024 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705332948;
	bh=yHZKmeXhQWua2LT7+setasCLUF/ot995lzkKJhmsS6Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VCsQuhY71D7udhp0cWBDWk05XvZ6EeWqwybkVSgG4UkH+RC1L593tLwixK2X6VmWD
	 A7YrivuOgQP5k5mBcR1+BMiPEREz2AgJzT/8UqyBvnfHNnlHhhI70tDyzY7CsZ14o2
	 qybgmRxynXZYh8SNexAitvXq3PROKWnJ69xsLbGV0Tf1UyIkfo7Mxbaj4CZzKZTxr6
	 izXJYGp4xtjVdbamQ6O2RmsL8W83JwSU3ak2YPPdqy4seb8HgP1R7vO++cnmVxaH4E
	 g+nPEYMjcFf+8YWJx1f/dVh29v4nz0XhtzFqf+lNpQai+TC1UflcO3Np74QuTdksZS
	 zTmm+5wk2GscQ==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 00/10] wifi: ath12k: Refactor mac80211 callback
 operation functions
References: <20240103063731.3356060-1-quic_periyasa@quicinc.com>
Date: Mon, 15 Jan 2024 17:35:45 +0200
In-Reply-To: <20240103063731.3356060-1-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Wed, 3 Jan 2024 12:07:21 +0530")
Message-ID: <87r0ii7goe.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_073556_993316_A07E6B93 
X-CRM114-Status: GOOD (  10.33  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> Currently, the existing mac80211 callback functions are defined assuming
> each link/radio is represented by a single mac80211 hw. In order to
> support multi link operation (MLO), need to move from the multi wiphy
> model to a single wiphy model. However, the single wiphy model allows
> multiple link/radio to be exposed by the same mac80211 hw. Therefore, we
> need to separate the link/radio specific handling within the mac80211
> callback operations. This way, the callback can be extended to support
> multiple link/radio in the future.
>
> 			Current Multi wiphy Model
>
> +---------------+            +---------------+            +-------------+
> |  Mac80211 hw  |            | Mac80211 hw   |            |Mac80211 hw  |
> |  private data |            | private data  |            |private data |
> |               |            |               |            |             |
> |               |            |               |            |             |
> |               |            |               |            |             |
> |   ar (2GHz)   |            |   ar (5GHz)   |            |  ar (6GHz)  |
> |               |            |               |            |             |
> |               |            |               |            |             |
> |               |            |               |            |             |
> +---------------+            +---------------+            +-------------+
>
>
>
>
> 			  Single wiphy Model
>
>                            +--------------+
>                            | Mac80211 hw  |
>                            | private data |
>                            |              |
>                            |ath12k hw (ah)|
>                            | +----------+ |
>                            | |ar (2GHz) | |
>                            | +----------+ |
>                            | |          | |
>                            | |ar (5GHz) | |
>                            | +----------+ |
>                            | |          | |
>                            | |ar (6GHz) | |
>                            | |          | |
>                            | +----------+ |
>                            +--------------+
>
>
> Karthikeyan Periyasamy (10):
>   wifi: ath12k: Refactor mac callback of config
>   wifi: ath12k: Refactor mac callback of bss info changed
>   wifi: ath12k: Refactor mac callback of conf tx
>   wifi: ath12k: Refactor mac callback of start
>   wifi: ath12k: Refactor mac callback of stop
>   wifi: ath12k: Refactor mac callback of update vif offload
>   wifi: ath12k: Refactor mac callback of configure filter
>   wifi: ath12k: Refactor mac callback of ampdu action
>   wifi: ath12k: Refactor mac callback of flush
>   wifi: ath12k: Refactor start vdev delay function

In the pending branch I renamed the patch titles like this, an example:

wifi: ath12k: refactor ath12k_mac_op_conf_tx()

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=bdb399b467daacabdc0e2127e03874d399f17a38

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

