Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EA2C02183
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 18:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeYnpGY3XiBsgcSH24HhTPbLvlkmT2XS0hhU1Ze3J8I=; b=Qbq2VTWgalfx2ECuTQ/IttSNrM
	8loS2yESHeIyZE8fTy7JvzTEfTLfO5HJsTYIgQ+Yxn74fHjsbHtH0yvuRBnsRM130vU41N+Jn2EtZ
	8fK1TNJCl1kiSLoW4/v+vHqIFy5J6EWBR7i9wEHkz1QPHww/ujX+P/b8kuBCGYdbzuYYiJv0nRqfi
	7D1FjnwnlQctOSa5wNsWnrFjLCPn2qKx6NBAuP+ung1126z3XSK72tAnQqAsiq2CYN73yzrTRhtdm
	oM00ye7I3wy+xEmMGUMr1qVNB8kh7hUhmE3cbA3tS1B6FXp4AvdJCBK9VA4uUWv85J0VLe1Bvud4j
	JhVo027g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlpE-00000009RtL-2toL
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 18:39:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlpD-00000009RtC-2LGt
	for ath12k@bombadil.infradead.org;
	Tue, 14 Jan 2025 18:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FeYnpGY3XiBsgcSH24HhTPbLvlkmT2XS0hhU1Ze3J8I=; b=U615VrqpnIRmx/wTqMLQchGmPV
	YYtcXcjtAMpJkf1OE5xOflyZ4yDCTXZmfNdGAixYUBMgAuk3FWoHqP5C6FGPrmQHlnDAeWKfd6qQK
	lY0w5ABICwPpgjZkiR+D9KV1l6W86PQz0ckjYois7882G4GbV3mlDUWfePx2N652QK0IEe5eXahOs
	Y4ipOBFnWlXqt3NIFTTH0f0dV/lY6/sEwdO3Qx9yavdrq11Qpg0PXx0t/uV7N/jL+AhYy98jLpScu
	u3XvoyT0hhh/G54iY/TyQcXFXXQ2wR7O6TbR6q5IMWj14QYz8/6dleTD7vVUEsm9/TBLYtzFeoXrD
	cjHmJ9cA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlpA-0000000AYPs-1zRD
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 18:39:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35DACA41B2C;
	Tue, 14 Jan 2025 18:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD54FC4CEDD;
	Tue, 14 Jan 2025 18:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736879975;
	bh=lFW8xhnm4FmFpEtoCShRybDMlrjwPRMLXP3eIbz4nHU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=iPCValXzCGVwJm2eLC4ZSqlRQZxyMFcM8avnXhNquiJYIPKbLPOEEsGbFNbOBdUxs
	 UhvpmFjHBlIaGtO5LWN+zrWSIxz0qy69Yb7ZQo3IdIPBC9lXto7AIkwMfmQ4//go9p
	 J4vjrLadgvfZZcLiJCK0+6dKoelN9wVNFeTkCQ0BopLJQ+5bd+EI+Yid9ohWBx4hZH
	 99OH+BagD5GOywq8WQttstwYYxUIC5/XrSb8fXpQP3UqKY0hU5HFjFYjFkOHBwuTUI
	 twVfuEnmW/sqLIZi2xPuxih2LBYkuvMV0F0AvrQpvDJUhqEe4sgWblkLwxH8RfGbLn
	 QgJ6sJbEIUVLA==
From: Kalle Valo <kvalo@kernel.org>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,  <linux-wireless@vger.kernel.org>,
  <ath12k@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] wifi: ath12k: handle
 ath12k_mac_ieee80211_sta_bw_to_wmi() for link sta
References: <20250110-fix_link_sta_bandwidth_update-v1-0-61b6f3ef2ea3@quicinc.com>
	<20250110-fix_link_sta_bandwidth_update-v1-2-61b6f3ef2ea3@quicinc.com>
Date: Tue, 14 Jan 2025 20:39:32 +0200
In-Reply-To: <20250110-fix_link_sta_bandwidth_update-v1-2-61b6f3ef2ea3@quicinc.com>
	(Aditya Kumar Singh's message of "Fri, 10 Jan 2025 00:13:13 +0530")
Message-ID: <87v7uhnst7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_183936_749303_FB7D8C2C 
X-CRM114-Status: UNSURE (   8.36  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> writes:

> Currently ath12k_mac_ieee80211_sta_bw_to_wmi() handles the bandwidth from
> sta's deflink member. This works only for non-ML station. Now that MLO
> support is there, extend this function to use link sta instead of deflink.
>
> Additionally, in ath12k_mac_handle_link_sta_state(), the link sta structure
> is not accessible, making it difficult to fetch the bandwidth there.
> However, ath12k_mac_station_assoc() does reference the link sta structure.
> Therefore, move the initial assignment of the arsta bandwidth member to
> ath12k_mac_station_assoc().
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

So how does this help in practice? Ie. what are the user visible
symptoms this patch is fixing?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

