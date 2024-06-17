Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00162C27C79
	for <ath12k@archiver.kernel.org>; Mon, 17 Jun 2024 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wGiY7RMkieahgsfbVwfCmI3S5d2ARJvPdQl3cZhiCY=; b=LOkc/H6OjRdUuELdGUzAPr7lKn
	AdJRKPmPvzfruGp4foX7FqBIlDsf3/LPQE8nXa8cwmEl4+hQIKJMBCEBVyjLuq+cl5nqThTj8Ng6V
	bct++YfhQB/PMz4N6EUCDNZ5LbHgJqbBYHAo+PvuQbb1TO/X/pAqszgeV3dX/H0dnErVLHIilnoFQ
	sSZxAgHWkmokX1Uu3B+507n4rm3meXIFxWwVy/OjuGuyhv7FXFrIPm5lu4RaOM7nIE6g4jnNODRWB
	gG7k4OXc/Lo9oLGE+xxSB6US2gFSaq8m5+4UBqWDA7Y6yha23yGxJxzGbivBixKxWBH28AG5H6CDx
	WacMHotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCdu-0000000Auv4-2nCa
	for ath12k@archiver.kernel.org;
	Mon, 17 Jun 2024 13:43:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCdr-0000000Autu-1Rvt
	for ath12k@lists.infradead.org;
	Mon, 17 Jun 2024 13:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C31E61077;
	Mon, 17 Jun 2024 13:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26219C4AF53;
	Mon, 17 Jun 2024 13:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718631805;
	bh=/QgzJzbG+aEkoSnSmwQZl/Am2miS1ZCWALieAysez/g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Kmnw4KwY7FBylUp4MsGLdUEr9lRqvdYkuBCbBOa5U4uaGNMZjRP4hJoh986t4PED6
	 t8EmrHb6l3sauOBfkFFy46Gf12YB/oAvfCJ3F0wWSH/jDgi/RNbWHay82WRYCRvaR0
	 foB4Z8FXhYDcI5AhFp+/KVu5lZbnCeFsryCAprTE3tZsfJJ69FJM5B2xo7JnseLJ/0
	 lIQMacznu+R8ia+UasXvlbUpsatwVYdSyZ3pGhYnIa1fPqolUBrXiF3oA4NmHv78CN
	 Pgx0jP7vpYtoxuaxnF0095PjfbqbUpBQAosxhkg6/BXUTIJemtk0Y4fvKKgc6c73NK
	 dXQhPwL08EZCg==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 2/8] wifi: ath12k: implement WoW enable and wakeup
 commands
References: <20240604055407.12506-1-quic_bqiang@quicinc.com>
	<20240604055407.12506-3-quic_bqiang@quicinc.com>
Date: Mon, 17 Jun 2024 16:43:23 +0300
In-Reply-To: <20240604055407.12506-3-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Tue, 4 Jun 2024 13:54:01 +0800")
Message-ID: <87msnjn0qs.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_064327_448109_C6D0D9FC 
X-CRM114-Status: GOOD (  14.18  )
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

> Implement WoW enable and WoW wakeup commands which are needed
> for suspend/resume.
>
> Tested-on: WCN7850 hw2.0 PCI
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

[...]

> +int ath12k_wow_enable(struct ath12k *ar)
> +{
> +	struct ath12k_base *ab = ar->ab;
> +	int i, ret;
> +
> +	clear_bit(ATH12K_FLAG_HTC_SUSPEND_COMPLETE, &ab->dev_flags);
> +
> +	for (i = 0; i < ATH12K_WOW_RETRY_NUM; i++) {
> +		reinit_completion(&ab->htc_suspend);
> +
> +		ret = ath12k_wmi_wow_enable(ar);
> +		if (ret) {
> +			ath12k_warn(ab, "failed to issue wow enable: %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret = wait_for_completion_timeout(&ab->htc_suspend, 3 * HZ);
> +		if (ret == 0) {
> +			ath12k_warn(ab,
> +				    "timed out while waiting for htc suspend completion\n");
> +			return -ETIMEDOUT;
> +		}
> +
> +		if (test_bit(ATH12K_FLAG_HTC_SUSPEND_COMPLETE, &ab->dev_flags))
> +			/* success, suspend complete received */
> +			return 0;
> +
> +		ath12k_warn(ab, "htc suspend not complete, retrying (try %d)\n",
> +			    i);
> +		msleep(ATH12K_WOW_RETRY_WAIT_MS);
> +	}
> +
> +	ath12k_warn(ab, "htc suspend not complete, failing after %d tries\n", i);
> +
> +	return -ETIMEDOUT;
> +}

Why the loop here? Looks really odd to me and no explanation why it's
needed. ATH12K_WOW_RETRY_NUM seems to be 10 so this can loop a lot.

ath11k seems to have a similar loop and no comments there either. I
clearly missed that in review.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

