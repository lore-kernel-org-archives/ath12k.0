Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AE0E9D40D
	for <ath12k@archiver.kernel.org>; Wed,  4 Feb 2026 16:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6SYdVhNGU3D9fq53FA8dnp4FDuDt1w/ap5/WjW9al6I=; b=y/RCDmC9RpSDKA61uxoWa6TKeM
	fR8oZRqGaWPRJwCTJZRMp7np0RFh8AwohyZJTb0lEsre2i0L/GJhg8P/rWcydjd1C2VJeRaQhJrAu
	CTiiwArhLZ0hlDuy2sATyKMCLYibb/tlx3UHWDuXKBnwp1Ab3pVUKzMJATbqyJFu2Y+xQRy2IJh+P
	GRcBrJzKE861i3x8oWonUlS2a69l1RUm9pCjkZgwW9TgwPDdfffleLPNklBwaRQCfR7mGaaC58tU+
	BbgtW1yh9rXZtYhvNFpkYY0ac/a+yBP7gz4Swp0msZevq3Pf3J/CC8JCR+2ajKskKv6sfB3cTNd9F
	PS3G+yiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vng4d-00000008nKq-2O04;
	Wed, 04 Feb 2026 16:49:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vng4d-00000008nKi-05yf
	for ath12k@bombadil.infradead.org;
	Wed, 04 Feb 2026 16:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=6SYdVhNGU3D9fq53FA8dnp4FDuDt1w/ap5/WjW9al6I=; b=FHfgZL+i+AKUhbmn1PI2jeT+lV
	gG+SBYYn76K5VkkZLD4o6CjbdQZ9XHNjcGI4qnh+IkQRjaMxDxQCeIvwxumW9wVl4I2nIhkvmoTJ1
	cjsKBPCbJNfWirPi9YTJQ6eL1RQOro5l8z2yRd8c2m7ley+hMrkUfIaRL9xLCWMYot10QcLOle0FJ
	MXQG0p1/NEW0UFdsQiUV/ZFJK28642lV3wuH+BMKAkIlUeK0pk6YFBy5joX7w50zDSOV6hGVTZR+l
	LbGJwaYtchqugMIFo8m29JW4zaILiH7eEhhntdvpw30sRpe7wyZjgBgsW8oI6dtXyz7U1apLBm+UZ
	SFDBU9tw==;
Received: from e3i714.smtp2go.com ([158.120.86.202])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vng4Z-00000000v2t-2xVv
	for ath12k@lists.infradead.org;
	Wed, 04 Feb 2026 16:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1770223772; h=from : subject
 : to : message-id : date;
 bh=6SYdVhNGU3D9fq53FA8dnp4FDuDt1w/ap5/WjW9al6I=;
 b=jr6bow58h+BAeCOYVmTpEI2bEhinPOJ4Zez4v78i4Enqcdx+lvQwox21d3PWguMD+B9Mx
 ai2wQztJNTp5UdmIc0eyh4h671KNtVWbZaO2f+NuDz55oPnPTwQYM/WHuOi09hue/OzO0Kd
 5XFETjtV2eesFQPNyk4kpzyG+++n6A/5wHRnjgtJwKePH9W5x1GSBO2jyzroAReJivBiJ0U
 oe6SxqOcEt5W3HxcRD40DMY1+w2grwdKFYKDCXDjLI8fD5evSczUEUwwrSdCQ6IGJjSQcLv
 Df16wws29YDru+rkpJAVW7fT+AhmkqhPDVowr3OUPUvpfwgqJKFXF3faH7BQ==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1vng4I-AIkwcC8jEAf-Jb0J;
	Wed, 04 Feb 2026 16:49:30 +0000
Date: Wed, 4 Feb 2026 17:31:28 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: ath12k@lists.infradead.org
Cc: Remi Pommarel <repk@triplefau.lt>
Subject: [BUG] ath12k: CSA with blocktx disrupts TX on other bands
Message-ID: <aYN0YOwzxujAFtUN@pilgrim>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616su3L7CQ_w7
X-smtpcorp-track: Mz3jvd23PbMq.UMfE8foPRQqu.RL1aWQMN9NZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_164947_968214_07652442 
X-CRM114-Status: UNSURE (   8.51  )
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

Hi,

With the single phy changes introduced for MLO support, both 2.4 GHz
and 5 GHz interfaces on the same dual-band chip now share the same
hardware queues, even when operating on separate bands.

As a result, when a Channel Switch Announcement (CSA) with blocktx
is triggered on one interface (e.g., the 5 GHz vif),
ieee80211_vif_block_queues_csa() pauses the shared HW queues. This
unintentionally blocks TX traffic on the other interface (e.g., the
2.4 GHz vif), despite it being on a different band.

I haven't tested it, but the same issue is expected to affect a single
MLO AP setup, where a CSA could inadvertently pause transmission across
all links.

To address this class of problem, the IEEE80211_HW_HANDLES_QUIET_CSA
flag was introduced. When set, it delegates queue pausing to the
firmware, avoiding unnecessary disruptions in multi-vif or MLO
scenarios. This approach is already used in iwlwifi/mvm, as seen in
commit bbd6d0f8bc51 ("wifi: iwlwifi: mvm: advertise
IEEE80211_HW_HANDLES_QUIET_CSA").

Thus, does the current ath12k firmware properly handle TX quiescing
allowing IEEE80211_HW_HANDLES_QUIET_CSA to be set ? Or does it need
to be handle at the driver level (likewise what has been done in
iwlwifi/mvm in the commit above) ?

Thanks.

-- 
Remi

