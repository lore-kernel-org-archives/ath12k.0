Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934A5C531C9
	for <ath12k@archiver.kernel.org>; Sun, 26 Jul 2026 12:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ladVpaoW9vefHFwesCEbd1yA6LOVd5j8P6Nrhwso7U=; b=wzr3DoDEscx8rE1AfTqBJ6Auv0
	wrzsHJuVT46id65CPdnEqD1r8w19Z7OLGJkJwC5HvbptuIU/bHTNq28uhkVYhpsyykdBtSyWZpUGj
	40RX1uml5vn/XjFXMQMILrx5cTchZo2eZvh51fptvFK+Fu/9dGT59gm39MUsaxb8TPCIa9c8vqyp2
	YHzAEJ5lZRA8/koLgf2KgLRVR/qL9xSHCFL3kZHOP9LMfBj/sAkRaN1y7zsZyIyt03BAfRlRoL8k0
	z5hkIds0PKyRrawYjr65f5r2/43MwcmTS5kIxgZNEbilqvJMWUrgjEvDDX4OuUYa9ZXya/V3Q9cSR
	OuKTb+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wny8V-00000001AGp-3XEb;
	Sun, 26 Jul 2026 12:39:19 +0000
Received: from mailtransmit05.runbox.com ([2a0c:5a00:149::26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wny8S-00000001AG1-1WXo
	for ath12k@lists.infradead.org;
	Sun, 26 Jul 2026 12:39:18 +0000
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <stian@pokerfj.es>)
	id 1wny8I-00Fy8q-Br; Sun, 26 Jul 2026 14:39:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pokerfj.es;
	 s=selector1; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=4ladVpaoW9vefHFwesCEbd1yA6LOVd5j8P6Nrhwso7U=; b=W45kUUBRIZyCMhuWMit2ACqzDu
	Sgqpcfc4G8GuGr3hhpXJ74E02SRuBVDynjLPs7sfERsWmEwc3v/iP3/Z4HUO28vWjIev73ceGcg+6
	RNoFdRFZ0SG0eEfvir/xEFmp3Yf3IprYoF7bXQb3m16s8OM99XzgqtJkRzXOD55RiCoyY/CCZcwe/
	feAZCfk00KeTbiXbCSe32M7Mqfd66lXTyEZ2chPBqDt5lUAUySiyJcOrcBHZ2AAYUtX1Kvt9BWTIn
	ZvBw5MxMT89ey/7zeFTSF56pr9kfSwNeflFfnZ6v+acIdEqDc/fCWSI2J1VhxUxoGwbkNOnQRvhEZ
	4DU1KI1g==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <stian@pokerfj.es>)
	id 1wny8H-0003RT-GK; Sun, 26 Jul 2026 14:39:05 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1471791)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wny8D-00DiuM-07;
	Sun, 26 Jul 2026 14:39:01 +0200
From: Stian Knudsen <stian@pokerfj.es>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath12k: restore country code during resume
Date: Sun, 26 Jul 2026 14:39:00 +0200
Message-ID: <kRCU5oqTQiSs4eiJwPN0zw@pokerfj.es>
In-Reply-To: <36d63752-0d93-412c-96c8-546c972e6b7b@oss.qualcomm.com>
References: <df37460e-f8ba-4e11-b412-4aa8b17cd32e@oss.qualcomm.com>
 <bacea060-bae5-4136-841c-49db5b561b51@oss.qualcomm.com>
 <36d63752-0d93-412c-96c8-546c972e6b7b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_053916_936253_5C107F80 
X-CRM114-Status: GOOD (  38.55  )
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

On Friday, 24 July 2026 04:51:43 Central European Summer Time Baochen Qiang 
wrote:
> On 7/24/2026 8:15 AM, Jeff Johnson wrote:
> > On 7/20/2026 5:09 AM, Stian Knudsen wrote:
> >> The country code configured before suspend is lost after resume:
> >> the device is powered down in suspend_late and powered back up in
> >> resume_early, so firmware reboots with its default regulatory
> >> settings and the previously set country code is no longer applied.
> >> 
> >> On WCN7850 the firmware comes back in the world regulatory domain
> >> (country 00) and takes ~7 seconds to rediscover the country code
> >> from AP beacons, part of a ~16 second total delay before wifi
> >> reconnects after resume.
> >> 
> >> Restore it by resending WMI_SET_CURRENT_COUNTRY_CMDID during resume
> >> if a country code was set before suspend, i.e. when ar->alpha2 is
> >> valid. This follows the same approach as ath11k commit 7f0343b7b871
> >> ("wifi: ath11k: restore country code during resume").
> >> 
> >> Note that only single_pdev_only devices support suspend/resume (see
> >> ath12k_core_continue_suspend_resume()), so handling the first and
> >> only pdev is sufficient.
> >> 
> >> Tested-on: WCN7850 hw2.0 PCI
> >> WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> >> 
> >> Fixes: 8d5f4da8d70b ("wifi: ath12k: support suspend/resume")
> >> Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> >> Link: https://lore.kernel.org/r/-_iDJ_M5RrqACWB0qmtleg@pokerfj.es
> >> Signed-off-by: Stian Knudsen <stian@pokerfj.es>
> >> ---
> >> v2:
> >> - Add Fixes tag, per Baochen's review comment.
> >> - Link to v1:
> >> https://lore.kernel.org/r/20260717130254.36732-1-stian@pokerfj.es ---
> >> 
> >>  drivers/net/wireless/ath/ath12k/core.c | 21 +++++++++++++++++++++
> >>  1 file changed, 21 insertions(+)
> >> 
> >> diff --git a/drivers/net/wireless/ath/ath12k/core.c
> >> b/drivers/net/wireless/ath/ath12k/core.c ---
> >> a/drivers/net/wireless/ath/ath12k/core.c
> >> +++ b/drivers/net/wireless/ath/ath12k/core.c
> >> @@ -197,6 +197,7 @@ EXPORT_SYMBOL(ath12k_core_resume_early);
> >> 
> >>  int ath12k_core_resume(struct ath12k_base *ab)
> >>  {
> >> 
> >> +	struct ath12k *ar;
> >> 
> >>  	long time_left;
> >>  	int ret;
> >> 
> >> @@ -211,6 +212,26 @@ int ath12k_core_resume(struct ath12k_base *ab)
> >> 
> >>  		return -ETIMEDOUT;
> >>  	
> >>  	}
> >> 
> >> +	/* So far only single_pdev_only devices can reach here,
> >> +	 * so it is valid to handle the first, and the only, pdev.
> >> +	 */
> >> +	ar = ab->pdevs[0].ar;
> >> +	if (ab->hw_params->current_cc_support &&
> >> +	    ar->alpha2[0] != 0 && ar->alpha2[1] != 0) {
> >> +		struct wmi_set_current_country_arg arg = {};
> >> +
> >> +		memcpy(&arg.alpha2, ar->alpha2, 2);
> >> +
> >> +		reinit_completion(&ar->regd_update_completed);
> >> +
> >> +		ret = ath12k_wmi_send_set_current_country_cmd(ar, &arg);
> >> +		if (ret) {
> >> +			ath12k_warn(ab, "failed to set country code during 
resume: %d\n",
> >> +				    ret);
> >> +			return ret;
> >> +		}
> > 
> > Baochen, can you remind me why we don't need to wait for completion here?
> > (the ath11k change doesn't wait)
> 
> Technically we will wait, but asynchronously instead of synchronously. It
> works in a way:
> 
> 1. reinit completion
> 2. send new cc to firmware, proceed with no sync wait.
> 3. in reg channel list event host process reg rules, queue regd update work
> and signals completion.
> 4. regd update work calls ath12k_regd_update() where we wait for the
> completion.
> 
> But I am feeling this is not a good design. As you can see,
> ath12k_regd_update() is reachable via the regd update work, which is queued
> in reg chan list event. However it is the event itself signals the
> completion. That means ath12k_regd_update() never blocks, the whole
> reinit-wait thing is a no-ops.
> 

To be honest, I didn't walk that code path when I wrote the patch. I added 
reinit_completion() because it's what the existing call sites already do 
(ath13k_update_11d() and the reg_notifier path in reg.c, and the ath11k commit 
this was ported from), not because I'd verified it synchronizes anything.
I went through the code path, and came to the same conclusion as Baochen's 
explanation: ath12k_reg_handle_chan_list() queues regd_update_work before the 
event handler calls complete_all() a few lines later in the same function 
(wmi.c), so by the time the queued work reaches its 
wait_for_completion_timeout() in ath12k_regd_update(), the completion is 
already signaled. I don't think it's blocking anything meaningful.

Since it's not limited to this patch, happy to either add a comment here once 
you settle on how to describe it, or drop the reinit_completion() call from my 
patch entirely if you'd rather not repeat it to a fourth call until it's 
cleaned up.
Whichever you prefer for v3.

> > If that is legit, perhaps we should document it with a comment since
> > reinit_completion() without waiting for it seems strange
> > 
> >> +	}
> >> +
> >> 
> >>  	return 0;
> >>  
> >>  }
> >>  EXPORT_SYMBOL(ath12k_core_resume);
> >> 
> >> --
> >> 2.50.0





