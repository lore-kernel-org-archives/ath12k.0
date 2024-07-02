Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F32C30658
	for <ath12k@archiver.kernel.org>; Tue,  2 Jul 2024 13:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGcmfJQgbtGePDLXMcQH3PSKhXQTWHNp0zyUE9SGXn8=; b=1aR3krvbxJDuY8ChY3rq13CpIl
	FIDBt4aNMn46yRFo7hda9VNItx52qv2HWAiT6xA984uNqwqZ44rQPJYBZ6gv8vzWp5+UEQAlx+dB1
	sJ1z1SpHlysF58mOV5U0gMaVM6yhTCHAsuD7Z0sD3J6iXGbx3R8HnxO62mz46fl/US6+jUPoqoNad
	vi8xuMUdqckr1b1w6+jHP9nggN3P4YZE2SriNB6yQjSU/RNWgqe5+QuTBxZnDKmmHpXPexgbNjpeC
	Gh1RTceEbG1e6DFefvgTlQkP9ILnMa+fNgKa8AVhuUhAc4GiBMro/Zpwyz2Ok0X4k7/YwcoKMQrTS
	ZxWTgirg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOdt5-00000006vCX-3jbI
	for ath12k@archiver.kernel.org;
	Tue, 02 Jul 2024 13:49:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOdt2-00000006v9o-1Air
	for ath12k@lists.infradead.org;
	Tue, 02 Jul 2024 13:49:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3A6861B43;
	Tue,  2 Jul 2024 13:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B419CC116B1;
	Tue,  2 Jul 2024 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719928175;
	bh=gKNKa0nlgIHI/MTbG7isQib7yZ9uA/afNheMP2daZjs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kEbYUpgt2TSZCzMjuxmAVcMzCmyaGHaCEAV+8xXcmfdcjB8vjW+R5InAghRQWE/vc
	 QKlzn4TYdysu1YMh4pc3xh04u7Hf4AXAZ2wynV5RPe1ZoKMVqgkZOhp3f9Awz/FY01
	 y0ta6P5dD4UN81bnpAL0DRM4Z66QTT/+KXzhSC6EVD6A0dR/+Qc2uUNDpqsWwQgN/K
	 eXGo9ZJdRn2OxWWws2SrW1o3YvGdTDIz3S1wn63MtoEqW2jG0PqoocBxJB0fQvDsr1
	 mPXcS2VPwzR5OMxZtb+uVDUGlD8gQeLNp2+aN6hZr2BUzOPgBFQp0DqUF/wtf25Jcd
	 Gn8Fl2TUPlLRA==
From: Kalle Valo <kvalo@kernel.org>
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v5 3/4] wifi: ath12k: add factory test mode support
References: <20240624095305.37189-1-quic_aarasahu@quicinc.com>
	<20240624095305.37189-4-quic_aarasahu@quicinc.com>
Date: Tue, 02 Jul 2024 16:49:32 +0300
In-Reply-To: <20240624095305.37189-4-quic_aarasahu@quicinc.com> (Aaradhana
	Sahu's message of "Mon, 24 Jun 2024 15:23:04 +0530")
Message-ID: <87le2jgaz7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_064936_381091_8D02473A 
X-CRM114-Status: GOOD (  17.28  )
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

Aaradhana Sahu <quic_aarasahu@quicinc.com> writes:

> Add support to process factory test mode commands(FTM) for calibration.
> By default firmware start with MISSION mode and to process the FTM commands
> firmware needs to be restarted in FTM mode using module parameter ftm_mode.
> The pre-request is all the radios should be down before starting the test.
>
> All ath12k test mode interface related commands specified in enum
> ath_tm_cmd.
>
> When start command ATH_TM_CMD_TESTMODE_START is received, ar state
> is set to test Mode and FTM daemon sends test mode command to wifi
> driver via cfg80211. Wifi driver sends these command to firmware as
> wmi events. If it is segmented commands it will be broken down into
> multiple segments and encoded with TLV header else it is sent to
> firmware as it is.
>
> Firmware response via UTF events, wifi driver creates skb and send
> to cfg80211, cfg80211 sends firmware response to FTM daemon via
> netlink message.
>
> Command to boot in ftm mode
> insmod ath12k ftm_mode=1
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>

I have not reviewed this in detail yet but few first impressions:

> @@ -626,6 +634,8 @@ struct ath12k {
>  
>  	u32 freq_low;
>  	u32 freq_high;
> +	struct completion fw_mode_reset;
> +	u8 ftm_msgref;
>  };

fw_mode_reset is unused so I removed it in the pending branch.

> @@ -856,6 +867,8 @@ struct ath12k_base {
>  		/* protected by data_lock */
>  		u32 fw_crash_counter;
>  	} stats;
> +	bool ftm_segment_handler;
> +	struct ath12k_ftm_event_obj ftm_event_obj;
>  	u32 pktlog_defs_checksum;

ftm_segment_handler is also unused so removed that as well.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

