Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036BFCE8E9A
	for <ath12k@archiver.kernel.org>; Thu, 24 Oct 2024 17:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmpxKtjqTpNEoo5WRNY+/4a6XERqRDOe8Bfu0Nu13tI=; b=dlabK2exKa2RKq9HBK3u/J8V4a
	tCk105intjIzEYvca+unAXIgIueKdzYzBbL4WbluBuXgpmFTjjs4VSQGlScJ+Ac8Pu3qflzo0Jt4z
	bq02SoI3DLQOHvtiwiHx0VMft078lMOHkbc4oeDqpweJa7XrSlB6nKa69UT3dlabMEeF7CSgGZMt5
	oZbGLHyJzX7+PBdrlRCDyYZWY7Z3MMGCXz3k3ZJaJDSsTfxH+dlVyZs9Zn02eA6XLNgQur7oLfZsh
	iXNJgr3gOIywGXl5Vmn3nH2ApQutxEyKD3LLeXp5z+pdWT2edBsd5T4DXbpukC2ne4jpPc+M/zZgs
	4vVIz23Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41pl-00000001K1o-2Uq1
	for ath12k@archiver.kernel.org;
	Thu, 24 Oct 2024 17:41:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41WY-00000001G2j-32XA
	for ath12k@lists.infradead.org;
	Thu, 24 Oct 2024 17:21:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FC965C4AB4;
	Thu, 24 Oct 2024 17:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBEFC4CEC7;
	Thu, 24 Oct 2024 17:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729790485;
	bh=IxpR5XjcaYcZ65huyZuO1PDv2ovoaXh745f+hkM7SPM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nrnLInid2ueSNqYCcvwTcLcbpU3aplkalnukL3AoJr6WcKV0tGi31ygFjsbhQt7jI
	 m1RnCVltUs1BXgJV8JejxfFqMEceW5zy+7JT6jsmykxBf19JWgeiydkd+BOukdodaY
	 0zXLhG2zyVYPbACr+pyY3pcUCT1vDsZEOXKY2VmRvEYaFtMWWks4JBCshYsw7regsr
	 95K0hhqX43OxAQQZvhUuntyI/e8LSzrDIxXyQf8WmeLh/plMvnTGADoIVmfsyjae+W
	 ONMdMITnGBnXDJHsFeRtc2Nq64qpZkcrWBl0A5XKP9gT/2HC7XUZmGoJLbtmU/e44M
	 lCn5uzV/SpA0w==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/8] wifi: ath12k: ath12k_mac_vdev_create(): use goto
 for error handling
References: <20241023133004.2253830-1-kvalo@kernel.org>
	<20241023133004.2253830-2-kvalo@kernel.org>
	<ab8f3e88-f55b-4945-b4bb-a784d1466a27@quicinc.com>
Date: Thu, 24 Oct 2024 20:21:22 +0300
In-Reply-To: <ab8f3e88-f55b-4945-b4bb-a784d1466a27@quicinc.com> (Jeff
	Johnson's message of "Wed, 23 Oct 2024 08:01:05 -0700")
Message-ID: <877c9xmn71.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_102126_872939_CF62335B 
X-CRM114-Status: GOOD (  23.18  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 10/23/2024 6:29 AM, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> In commit 477cabfdb776 ("wifi: ath12k: modify link arvif creation and removal
>> for MLO") I had accidentally left one personal TODO comment about using goto
>> instead of ret. Switch to use goto to be consistent with the error handling in
>> the function.
>> 
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> 
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/mac.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index f5f96a8b1d61..f45f32f3b5f6 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -7047,8 +7047,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
>>  		ret = ath12k_wait_for_peer_delete_done(ar, arvif->vdev_id,
>>  						       arvif->bssid);
>>  		if (ret)
>> -			/* KVALO: why not goto err? */
>> -			return ret;
>> +			goto err;
>
> why does this goto err instead of err_vdev_del?

Good point. I did this to follow the same as the next command does:

		ret = ath12k_wait_for_peer_delete_done(ar, arvif->vdev_id,
						       arvif->bssid);
		if (ret)
			goto err;

But yeah, err_vdev_del looks like more approriate.

>
>>  
>>  		ar->num_peers--;
>>  	}
>
> looking at the context for this patch I have a question about a different part
> of this function:
>
> 	param_id = WMI_VDEV_PARAM_RTS_THRESHOLD;
> 	param_value = hw->wiphy->rts_threshold;
> 	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
> 					    param_id, param_value);
> 	if (ret) {
> 		ath12k_warn(ar->ab, "failed to set rts threshold for vdev %d: %d\n",
> 			    arvif->vdev_id, ret);
>
> NOTE: no return or goto
>
> 	}
>
> 	ath12k_dp_vdev_tx_attach(ar, arvif);
> 	if (vif->type != NL80211_IFTYPE_MONITOR && ar->monitor_conf_enabled)
> 		ath12k_mac_monitor_vdev_create(ar);
>
> 	return ret;
>
> NOTE: this can return an error if the RTS threshold set fails, but fails
> without cleaning up (dp vdev still attached and monitor vdev created)
>
> Seems either we need error handling if the set param fails, or we should ret 0
> at this point

Yeah, I do not like this kind of vague error handling at all. I think we
should have either a proper error handling or a comment explaining why
we continue to the execution. An example about the comment:

ret = foo();
if (ret)
        ath12k_warn("foo failed: %d", ret);
        /* continue function because foo is optional */

I think this should all this should be cleaned up in a separate patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

