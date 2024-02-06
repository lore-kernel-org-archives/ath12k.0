Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71890C4828D
	for <ath12k@archiver.kernel.org>; Tue,  6 Feb 2024 16:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rH1ley6oKMK30Mbbte1rDLGoBRtUmr0uxSxU9LNRWJQ=; b=drXuuVBwEjVBgGCTafTLrbbdKF
	wp1rH6EHf0+MvCOXXBonlz/BKvtKXFDpLiVOQuhV0N5IwBWLwmOLfzzQJropE0fMEYF+pYOLhhLfX
	Sm7FX2/rv1AhRU1eoG9UmcWpGDrj7Q1geHEXwuWYSz8lPBXsFPdOpaRqs/yq5ClIRXxrR4aGk6ZM2
	JwroYyuJZ43rJrjR5ZWpwTMMIbRdTLMUtoBQVD3lTyRIxuEIrVOqLd2Ci8Bfj9p1Dn7sJ4dAPCR8M
	HHtN3AF75ODEp5FlSBr2C2KATA+s+CWT88yjiLiRRAjGnmyrkLI9vqpneXHSOqpWw72XITB3tkIpk
	AfwP6jRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXOFt-00000008FUh-37sU
	for ath12k@archiver.kernel.org;
	Tue, 06 Feb 2024 16:25:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXOFD-00000008FOz-1zsG
	for ath12k@lists.infradead.org;
	Tue, 06 Feb 2024 16:24:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 60FA1615AF;
	Tue,  6 Feb 2024 16:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B7FC433F1;
	Tue,  6 Feb 2024 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707236662;
	bh=mRnyrMkY2nLwbDxUm7UrZ9ceTa8DXc5KnOeL2gxvfrk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fGvelH+6oeq9Ef1QlS5DtzCWQhQax7xFHfNWN1hkOsg0JGN1Re4JiuOGQCoeyVfst
	 KNbsEda3Nua0ZfVSO9YteVNw3f2rcHMWWh3c+MqPZ2RXmjM9UiXjwaFGb4RIdlQ+QS
	 oy6JN6qpbWQu7WvUbcAMwFEGfdwu/UT3IxlzATj7ZUBIIW/01k+sLcwmT/u0W2pLh2
	 0jXT5Gd94DUxibYtyh2KJFZW6pxMxLG2J7wI8zBzVL77MEGswgIp88Fb5HJ++rRTNw
	 0UyFOWSH83S7WnleZUpEN59QD2OerTbTAXA1wRAR1i4kXxv7sKy5anBN1jBhi+JKi0
	 3Z5S7AfS8yseA==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6 08/11] wifi: ath12k: allow specific mgmt frame tx
 while vdev is not up
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
	<20240130040303.370590-9-quic_kangyang@quicinc.com>
Date: Tue, 06 Feb 2024 18:24:19 +0200
In-Reply-To: <20240130040303.370590-9-quic_kangyang@quicinc.com> (Kang Yang's
	message of "Tue, 30 Jan 2024 12:03:00 +0800")
Message-ID: <87il31r26k.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_082425_350441_E20E796D 
X-CRM114-Status: UNSURE (   9.83  )
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

Kang Yang <quic_kangyang@quicinc.com> writes:

> In current code, the management frames must be sent after vdev is started.
> But for P2P device, vdev won't start until P2P negotiation is done. So
> this logic doesn't make sense for P2P device.
>
> Also use ar->conf_mutex to synchronize ar to avoid potential conflicts.

Please do locking changes in a separate followup patch, I removed this
in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=d357dcb3cd0cd3bf57064dc673b5477d884454b3

I assume you are referring to ar->allocated_vdev_map and access to that
indeed doesn't look consistent. Most of the places take conf->mutex but
I see some places which it's accessed without the mutex, for example
ath12k_mac_get_arvif_by_vdev_id() and ath12k_mac_get_ar_by_vdev_id().

I recommend in the followup patch checking all the access to
ar->allocated_vdev_map, fixing that if needed and adding documentation
to struct ath12k::allocated_vdev_map how it's supposed to be protected.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

