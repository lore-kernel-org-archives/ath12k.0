Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CA4D711BC
	for <ath12k@archiver.kernel.org>; Wed, 20 Nov 2024 15:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UllidBk5IhAm0zhmDbJu7iOGphxgLKeUwJuHposV9vw=; b=uCVZBPVCp2WTw7UjDQliWUI4lB
	I3A4noUJEBHB6M6SWKKK4h+oUaqJOJjd7f+6JBpnC0kv5nxCJGE27RrCov6WH1jdWFq704Paldoug
	I9nst5T2pzG8S96CSHL0idZ3ZNxo5vH1llFJwFEhtt3LvixYgNcaZ8H4wH1qg+tDGhWA2vZTw6uO3
	/gzpMw+YXgUgXRozyWvvori8ibO/XAJt5+Pxh25/7Rp7KckX+ZgKF/ops6zUDrDbe6b6wcQ5Sh7ok
	D0ZIilb9GLGFzN32czuyi39kL6z5RcNCkPz7siDWpsW2+Y1hz9TR0rpWqukB2phJHaopVAw22M8vD
	ex+cDQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDn4r-0000000FkC2-0b41
	for ath12k@archiver.kernel.org;
	Wed, 20 Nov 2024 15:57:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDn4p-0000000FkBQ-0tJu
	for ath12k@lists.infradead.org;
	Wed, 20 Nov 2024 15:57:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 07204A41FF1;
	Wed, 20 Nov 2024 15:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D7EC4CECD;
	Wed, 20 Nov 2024 15:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732118230;
	bh=9HtNhpAoeaZqWtQn9YJ4/BbDLRqxCH3IH1krL7hPBRA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NSDbNf/3pQW24+VIO4wp+UMoU4Aw4Nf+Bmh9n1QBI1rNaO5GbekDGBdwqeGoTqS3e
	 +e52IW1JeAo9hI1akj06jFaO2idHlkPf4MpcPHM+qkYl26k4clCP+oiwc2VQRqyB+G
	 XxlkbF9MXWPTTA1+7CIqZ9qwiv7qIyy2EN3Bfkb7wbDJLjDDYLeszWc9Q6kTpM/nrl
	 8RS+mfOat4iE0/ftPuwmuSSDKIG72WYo1tYrGMBdnqguMl8/CmKEHp3zGtB4triBuN
	 NLh041UZDgGxcP5+qxAsX3GawdRo6ZNCP444uKceGS/dX3eWMniO4oabwrQdMEBNMF
	 +XrE21St/ZpPw==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/8] wifi: ath12k: Add MLO station state change handling
References: <20241106142617.660901-1-kvalo@kernel.org>
	<20241106142617.660901-2-kvalo@kernel.org>
	<f75d7222-514b-4c6f-985d-e6ffd67e317a@quicinc.com>
	<877c984eym.fsf@kernel.org>
	<ffa411d1-89d3-4278-9f62-828c27c0afe0@quicinc.com>
Date: Wed, 20 Nov 2024 17:57:07 +0200
In-Reply-To: <ffa411d1-89d3-4278-9f62-828c27c0afe0@quicinc.com> (Baochen
	Qiang's message of "Wed, 13 Nov 2024 10:33:38 +0800")
Message-ID: <87frnlzyng.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_075711_311748_1232C3C3 
X-CRM114-Status: GOOD (  10.23  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

>>>> +	arsta->arvif = arvif;
>>>> +	arsta->ahsta = ahsta;
>>>> +	arsta->state = IEEE80211_STA_NONE;
>>>> +	wiphy_work_init(&arsta->update_wk, ath12k_sta_rc_update_wk);
>>>> +
>>>> +	rcu_assign_pointer(ahsta->link[link_id], arsta);
>>>> +
>>>> +	synchronize_rcu();
>>>
>>> what are we waiting for here?
>> 
>> That's a good question. I didn't analyse that thoroughly but I'm just
>> making sure here that all readers have access to the new arsta before we
>> return to mac80211.
>
> why would readers have to access arsta BEFORE returning to mac80211?
> any potential race conditions?
>
> and even if it is necessary, how could synchronize_rcu() guarantee
> that? synchronize_rcu() is used to make sure all readers have exited
> from RCU read critical section, I don;t see how it could make sure a
> newly assigned entry get accessed.

Yeah, I'm not making any sense. I'll remove synchronize_rcu() in v2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

