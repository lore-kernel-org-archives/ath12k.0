Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9857E77180
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03/6JBw35Kj5mZr8oUvdF/uBrkeeok4qkzHJYqiyg70=; b=olOlCghTT/fdPSH0pbBuBNKigp
	7Uhb6J48w0DEX6ZLA9a+k9A78gOaxyAvteLMpuxr5fo8Wi9l8ccMB1jVRhkSzKw7NUQZysaL5vj+N
	PHgfTDxtah2Mu8ccRUwV8aMehZFKi21yf1e/QC2sOx/O85aJ1EC851MAu3mWJeNmLF2hiUNmyUxjD
	pHkW/nZGKrRa5PsjAAhWyBilDIn2CBqtxiFVn0jPG9nFNm+wA57DIXGgjZKegKNhSs5rnd8Gr18oG
	IEuW4sdCQA+amkQDZGI0ePneadEGcmnIogCYxLtE6jMcZ8mJCAUJ/UTfH8vHQAuMjE9uHdo6+WPts
	AUmH4E1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQOJ-0000000FZx8-1nm8
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 17:20:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQOG-0000000FZve-3qSL
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 17:20:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CBA2AA416C6;
	Wed, 11 Dec 2024 17:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40664C4CEDD;
	Wed, 11 Dec 2024 17:20:47 +0000 (UTC)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Sriram R <quic_srirrama@quicinc.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Rameshkumar Sundaram <quic_ramess@quicinc.com>, 
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <755becb1-819b-484d-8fac-9a2db53ced1b@stanley.mountain>
References: <755becb1-819b-484d-8fac-9a2db53ced1b@stanley.mountain>
Subject: Re: [PATCH next] wifi: ath12k: Off by one in
 ath12k_wmi_process_csa_switch_count_event()
Message-Id: <173393764722.2156603.16648228152971339085.b4-ty@oss.qualcomm.com>
Date: Wed, 11 Dec 2024 09:20:47 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_092049_018727_941B5266 
X-CRM114-Status: UNSURE (   4.76  )
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


On Fri, 06 Dec 2024 15:52:29 +0300, Dan Carpenter wrote:
> The ahvif->vif->link_conf[] array has IEEE80211_MLD_MAX_NUM_LINKS elements
> so this should be >= instead of > to avoid an out of bounds access.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: Off by one in ath12k_wmi_process_csa_switch_count_event()
      commit: 58fa8109fa8dae2947567e8f56dbd55ad81bc35c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


