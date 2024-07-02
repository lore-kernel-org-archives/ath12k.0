Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EC5C3064D
	for <ath12k@archiver.kernel.org>; Tue,  2 Jul 2024 10:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOdM6Qb9j8IFZmk3rqp6hNNkOxSPORCx5BOXBpNXpM0=; b=2sXUT3lAkNWtZ6/ba28p8r15Xy
	/bEAlU2y+DaP3W61vSoD5hN2TK0KT22E+VOcCTg4lrtDht1Pd3P8zA58foHLaQ7/iVt05zNquIdH7
	bRl9NiQYHMDBJS+yF66KwZnR+Zq581b8+k/EXbcsq+0bK43Qw99p3scEyp1Q02BVMTECtD9538Cgd
	//qEnJxxUpuYus8UDZjz/yh1Bjqp4Yw4ZzWyR8CTYBp3NuXv2TyrdWECmMLFyp3TgyO+WF8FR/i6n
	INuxqoc5MTAkUCefs2Xy/K78go5pEKZB/8lW55Wg4/wREedj9vhN4SEyvS7eCsm0MiTv1i2VvTico
	IKYWBe4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOab7-00000006KM6-1HSn
	for ath12k@archiver.kernel.org;
	Tue, 02 Jul 2024 10:18:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOab1-00000006KLP-3kjM
	for ath12k@lists.infradead.org;
	Tue, 02 Jul 2024 10:18:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 492E1CE1D5B;
	Tue,  2 Jul 2024 10:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23ABC116B1;
	Tue,  2 Jul 2024 10:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719915525;
	bh=CRjzfm/cbEoxLAEG2O4pIEn5GWYKGji12h6CpdySr1M=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=o3Mu1rdm/jyfR8imds6yJmp1ckZY8qpqs0xLnpN1v9tGkY0kLbHPEOw/h2dFnbW5I
	 DFKLaE9xulAi2BAkwdQHWzLEKhv7/ez4B5ydj4Y+E2ujG9YFGvqisKKBd3VKb+ZRSG
	 m84xM5UVXmeaHf8/KfXqnmibLkjUwDKWork34nTIkxegWj9LO01pmII/C4Ka3YKRG/
	 e+EJ9wH/DvLLLw4y4egojSFk/NOL1FgPadfw5BDSg4ikCj8f2y4bEiXoJpsKvypS7J
	 2bBFUKAJ9JSIOZPLg/TzOnwrQD3vfdzevd9ZhNGZMSUDdkL8WVd+iK+OC8t2lnBWPi
	 8H1M/L1YebmwQ==
From: Kalle Valo <kvalo@kernel.org>
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v5 3/4] wifi: ath12k: add factory test mode support
References: <20240624095305.37189-1-quic_aarasahu@quicinc.com>
	<20240624095305.37189-4-quic_aarasahu@quicinc.com>
Date: Tue, 02 Jul 2024 13:18:42 +0300
In-Reply-To: <20240624095305.37189-4-quic_aarasahu@quicinc.com> (Aaradhana
	Sahu's message of "Mon, 24 Jun 2024 15:23:04 +0530")
Message-ID: <87plrwf665.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_031850_792154_A7AFE353 
X-CRM114-Status: GOOD (  16.41  )
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

[...]

> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -42,6 +42,10 @@ static int ath12k_core_rfkill_config(struct ath12k_base *ab)
>  	return ret;
>  }
>  
> +bool ath12k_ftm_mode;
> +module_param_named(ftm_mode, ath12k_ftm_mode, bool, 0444);
> +MODULE_PARM_DESC(ftm_mode, "Boots up in factory test mode");

In the pending branch I moved these to the beginning of the file,
otherwise they are quite hidden:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=0006b23098b2cb0dded6c650ef9b5a590bfb5a3c

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

