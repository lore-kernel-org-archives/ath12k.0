Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69543CE7AF7
	for <ath12k@archiver.kernel.org>; Fri, 29 Sep 2023 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXMfp+E/84/5c85wCGvV8cnbO2ZvPVfg99KdZefJ8ws=; b=wX7PKmimPrmEVe
	30+y/bKs/69mqS7SQF9uRYiGQudnU4DRpixq0SIag8L5WX2UZzfu2mraUSntGNIvkniGc4mGny8MW
	S5cHoBVd0uu33c9AdZ6lyeSNOz2WsVnEQewsDXo/ES2ec7ydlxUFxRzFeg/qssezDTNjIYN7PlMEO
	4B96rGmlzL2T4mgZnGlUAY4cbxgHqx6Jzfx9hWrFBfZpQPHGB+BPFaHGhKvrX1mehCM03tALzZSme
	jGeYqMPwM2htOgvjnB772dhL++iVG4Th+nPKE2zPTmzRM464zvplCBfrIWv1FDqXvq6+JShotY7HL
	uLeult6no9+BCQEBq1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm9Kn-007QUh-0V
	for ath12k@archiver.kernel.org;
	Fri, 29 Sep 2023 08:58:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm9Kk-007QTX-0Y
	for ath12k@lists.infradead.org;
	Fri, 29 Sep 2023 08:58:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BF9461E72;
	Fri, 29 Sep 2023 08:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5CBC433C8;
	Fri, 29 Sep 2023 08:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695977928;
	bh=SBYFF3GE71EQ79OqXOD4/RePPQVKeKn0txws+PTnhFg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=cqU5wCv6WlqzbUEHh5RTOZws4NjKenUDAQypXEV2dkd7Xu9J0WmUggUI/fPyPiBtk
	 IlMk2cFga67Y+nbExp+G3f6GQI+Dn2tTEZ/GpbLn3ZU2gHoqmza1yswVPEtBbHOusd
	 bHKVx9V3JR2rI2u47+EAvSjtT5DrqQaUcdAX2LS1xjk60la7EE7HsU96KLFX9XXcoI
	 5xklSVTMWdFdOK/F/KGwNZLTjhymUBjBFnDxlgg5Z9Uydo1UYtSIotPh2ijEMYErkt
	 ip0Xl/BwcSrRLeeHMVsQhgNsGxF/yMn5BToRuhzylBuyUtZdpTjYPBLv5OcUXIMmo7
	 IrbSNuHUY/Mpw==
From: Kalle Valo <kvalo@kernel.org>
To: Hari Chandrakanthan <quic_haric@quicinc.com>
Cc: <quic_kvalo@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: wifi: ath12k: do not drop data frames from unassociated stations
References: <1689749074-14676-1-git-send-email-quic_haric@quicinc.com>
Date: Fri, 29 Sep 2023 11:58:45 +0300
In-Reply-To: <1689749074-14676-1-git-send-email-quic_haric@quicinc.com> (Hari
	Chandrakanthan's message of "Wed, 19 Jul 2023 12:14:34 +0530")
Message-ID: <87y1gp73ui.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_015850_291455_2D8D8198 
X-CRM114-Status: GOOD (  17.23  )
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

(moving from ath11k to ath12k list)

Hari Chandrakanthan <quic_haric@quicinc.com> writes:

>>From 'IEEE Std 802.11-2020 section 11.3.4.1':
> If STA A in an infrastructure BSS receives a Class 2 or Class 3 frame
> from STA B that is not authenticated with STA A
> (i.e., the state for STA B is State 1), STA A shall discard the frame.
> If the frame has an individual address in the Address 1 field,
> the MLME of STA A shall send a Deauthentication frame to STA B.
>
> When data frames from unassociated stations are received by an AP,
> the AP is supposed to send a deauthentication/disassociation frame with
> reason code "Class 2 frame received from nonauthenticated STA" or
> "Class 3 frame received from nonassociated STA".
>
> But ath12k AP doesn't send deauthentication/disassociation frames,
> when it receives data frames from unassociated stations.
>
> The ath12k driver drops the data frames from unassociated
> station and the upper layer(mac80211/hostapd) is not aware of such event.
> Hence deauthentication/disassociation frame is not sent to that
> particular station by the AP.
>
> To address this issue, allow the data frames from the
> unassociated stations to reach mac80211 so that mac80211 can send
> NL80211_CMD_UNEXPECTED_FRAME event to userspace(hostapd) and hostapd
> upon receiving the event will send the deauthentication/disassociation
> frame with proper reason code.
>
> The data frame from unassociated stations gets dropped in mac80211.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>

Heh, I think I found a bug in patchwork. I had a weird problem that
whenever I took this patch from patchwork and applied it using git-am
the commit was empty. The issue seems to be that in mbox format
patchwork doesn't replace "\nFrom " with "\n>From " like all other
software do.

When downloading from patchwork[1]:

[...]
X-Mailing-List: linux-wireless@vger.kernel.org

From 'IEEE Std 802.11-2020 section 11.3.4.1':
If STA A in an infrastructure BSS receives a Class 2 or Class 3 frame
[...]

But from lore[2] it's correct:

[...]
X-Mailing-List: linux-wireless@vger.kernel.org

>From 'IEEE Std 802.11-2020 section 11.3.4.1':
If STA A in an infrastructure BSS receives a Class 2 or Class 3 frame
[...]

No need to resend because of this, the patch will be soon in the pending
branch.

[1] https://patchwork.kernel.org/project/linux-wireless/patch/1689749074-14676-1-git-send-email-quic_haric@quicinc.com/mbox/

[2] https://lore.kernel.org/linux-wireless/1689749074-14676-1-git-send-email-quic_haric@quicinc.com/raw

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
