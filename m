Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F3BCD5BDF
	for <ath12k@archiver.kernel.org>; Thu,  5 Sep 2024 16:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Pa3NHeXIfrJWG+cCMsnE6llXnOkpKZLKeaFocHX4/g=; b=oxjvLYndgPw2PLi0FSNfLyk7Rr
	Ka8++sH2aLpjoqdwGUeRaghsmOVG64eXE7VMTHtRUL3zx9ukZdOUCe91625mxlkhBIa/eJ5kdx2/Q
	DpLBF+MPysPNYd4qPnfr3EkVmN52fp98Gec/Z77rJTYe7g/faF16gtxkJi/HjrFAWJv4dtaam+430
	xwfESsLnoQT5ggW00Tr+hlL42vcqpgtdmKLiP2ZZurPyyFV2+Hwg7RdLYv9b3XAz+kHzgvTYud85E
	WCfHYomjKFDdMzs+5zv7RhsZjIi2g3lyuKtRRAlgt8FyHkyLjazaCcK0/wlXAznIH08GhQKY4Dtks
	MC/wW5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFoa-00000009DPL-2LZV
	for ath12k@archiver.kernel.org;
	Thu, 05 Sep 2024 16:58:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFoX-00000009DOo-2pUe
	for ath12k@lists.infradead.org;
	Thu, 05 Sep 2024 16:58:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7606B5C5421;
	Thu,  5 Sep 2024 16:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D798BC4CEC3;
	Thu,  5 Sep 2024 16:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725555512;
	bh=h1QSlJ3PIWCP6HZnmIIWnR/RuJh0VXMkl/Tv3e4WziY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=dYc98lcn7hZ2jXro3bcyVG+m2LnKLA44Hm1RtpJVw3SRXTjlPs2PrJ1wbJ94NKZ8c
	 LrH1r0BBV4oEer7m7Re/HGRImgzSp1TOzqOTxd8P+/5fdnSC/la7geo2u+x79+MjW+
	 ilqQX+yiHcskOVtiF95KOFPSdwgPomEKRKaOkTZ6Xzw+RFrlqlDpqC5G5rGOobYyBm
	 n8YEbZHIrVAi5/saD+A9UocjzzZYmZLiYWsRNdrfVYmMRaBgbcJAdWNme0h7xG4Xg2
	 s3mlc6yT7/JZonSlDVhhio9gJwrdAawQErRsrE6F8AUsMb80ZpOS4CQ9f0/sXgunW0
	 N0xxwG/Tf33gw==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH RFC 4/4] wifi: ath12k: convert struct
 ath12k_sta::update_wk to use struct wiphy_work
References: <20240821153728.2121600-1-kvalo@kernel.org>
	<20240821153728.2121600-5-kvalo@kernel.org>
	<7717fa70-38f0-44e9-bf3b-26ce71389707@quicinc.com>
Date: Thu, 05 Sep 2024 19:58:29 +0300
In-Reply-To: <7717fa70-38f0-44e9-bf3b-26ce71389707@quicinc.com> (Baochen
	Qiang's message of "Thu, 22 Aug 2024 14:19:20 +0800")
Message-ID: <87h6auhway.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_095833_786402_2880D0C5 
X-CRM114-Status: GOOD (  12.37  )
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

> On 8/21/2024 11:37 PM, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> As ath12k is now converted to use wiphy lock we can convert
>> ath12k_sta_rc_update_wk() to use wiphy_work_queue(). This is just for
>> consistency.
>> 
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> 
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/core.h |  2 +-
>>  drivers/net/wireless/ath/ath12k/mac.c  | 17 +++++++++--------
>>  2 files changed, 10 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
>> index 7fad2150d9bd..cc28185be650 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.h
>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>> @@ -445,7 +445,7 @@ struct ath12k_sta {
>>  	u32 smps;
>>  	enum hal_pn_type pn_type;
>>  
>> -	struct work_struct update_wk;
>> +	struct wiphy_work update_wk;
>>  	struct rate_info txrate;
>>  	struct rate_info last_txrate;
>>  	u64 rx_duration;
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index 80db9004cdd7..8bf7b026f8e4 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -4258,9 +4258,9 @@ static int ath12k_station_disassoc(struct ath12k *ar,
>>  	return 0;
>>  }
>>  
>> -static void ath12k_sta_rc_update_wk(struct work_struct *wk)
>> +static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *work)
>>  {
>> -	struct ath12k *ar;
>> +	struct ath12k *ar = wiphy_priv(wiphy);
>
> wiphy_priv() returns pointer to ieee80211_local, not ath12k.

Yikes! Great find, thanks for the thorough review. Will fix in v2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

