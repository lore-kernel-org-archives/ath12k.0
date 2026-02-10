Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CF7EA813E
	for <ath12k@archiver.kernel.org>; Tue, 10 Feb 2026 15:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ack/R3gOu6ylG0aLM8s2A97tY4Z9UXlkYyFIfsgcpuE=; b=jI+yAUuV6C0sLRoQm0l+iWuXo+
	esaxFDd/AIGIMj0vnxp7iwzQH1k2vE+zSyVLfPv87rKYU5x87aNTOrHQ9AMC9IKkpYu85ViQHBAmY
	aefK5ahWkVKFffy6dzyER4q8xN3pD/LkzFZ3Oi1qw7vtyLLzMfeAV+z0Eq6e49wV61LG70sEkrjcL
	rX9GkWtHXcwYzcbnef5AsoY9Y+F8ovx24+guOn9TCgp2srVoabN6vR/TKTSxxtD30XayAICO9Jsos
	F+WGH/JKKRIvQFIjcTqS9OoRUEy4Dm0UFqlhr/ToABQ8yNlYF5OzB1SYjMP4PSWQu6K8d8OKEMXEn
	s3cmUIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpq79-0000000HAAQ-3zf0;
	Tue, 10 Feb 2026 15:57:23 +0000
Received: from e3i677.smtp2go.com ([158.120.86.165])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpq77-0000000HA78-2V3O
	for ath12k@lists.infradead.org;
	Tue, 10 Feb 2026 15:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1770739029; h=from : subject
 : to : message-id : date;
 bh=ack/R3gOu6ylG0aLM8s2A97tY4Z9UXlkYyFIfsgcpuE=;
 b=NxCshrX2EcHuzkCY6ggwzti70IgImjwRcAU3FzwLQ6BDYWWHAxW1IjnUSzCahMrtGdGFJ
 U3zuBclNJ9BDy9sQhCUNJzsGDA6Ls/8peuJkbVclhb6VTlmC4XnQ6KqfIbqWuBNzVodhsUZ
 wa8q4Q0y5ue0BL7Uq1GEz7Q6y1VT2+J6T7kUvYpcDKDZN6E30O93T6JvLAdaHsv3uRVOaPo
 Iqg/M2jz47qIT8RstQjyPi/8q5Vbg9qDfJDiOhSkSGAh3/pRjhvBMsMtTo6jW1E7rmSo7kI
 3Mx+VQYieQqZVZpN+WtJNBMn/aelj122XhEtYeg7Es5ser8kZkDn3Lngs7pA==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.99.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1vpq6q-FnQW0hPvYoT-lYQA;
	Tue, 10 Feb 2026 15:57:04 +0000
Date: Tue, 10 Feb 2026 16:38:46 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Yingying Tang <yingying.tang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
	yintang@qti.qualcomm.com
Subject: Re: [PATCH ath-current] wifi: ath12k: fix incorrect channel survey
 index
Message-ID: <aYtRBg498h_aLPBK@pilgrim>
References: <20260210024440.3422264-1-yingying.tang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210024440.3422264-1-yingying.tang@oss.qualcomm.com>
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616s297POVH8C
X-smtpcorp-track: aIqyQsBUgjV-.I2R3Jb-phLru.vFPpmgaN8pq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_075721_803998_F58C5FA3 
X-CRM114-Status: GOOD (  19.82  )
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

On Tue, Feb 10, 2026 at 10:44:40AM +0800, Yingying Tang wrote:
> A wrong channel survey index was introduced in
> ath12k_mac_op_get_survey by [1], which can cause ACS to fail.
> 
> The index is decremented before being used, resulting in an
> incorrect value when accessing the channel survey data.
> 
> Fix the index handling to ensure the correct survey entry is
> used and avoid ACS failures.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: 4f242b1d6996 ("wifi: ath12k: support get_survey mac op for single wiphy") # [1]
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> 
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index e0e49f782bf8..86ce7d87b5a5 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -13086,6 +13086,7 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
>  	struct ath12k *ar;
>  	struct ieee80211_supported_band *sband;
>  	struct survey_info *ar_survey;
> +	int orig_idx = idx;
>  
>  	lockdep_assert_wiphy(hw->wiphy);
>  
> @@ -13120,7 +13121,7 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
>  		return -ENOENT;
>  	}
>  
> -	ar_survey = &ar->survey[idx];
> +	ar_survey = &ar->survey[orig_idx];
>  
>  	ath12k_mac_update_bss_chan_survey(ar, &sband->channels[idx]);
>  

This change appears to break channel survey data on the QCN9274 (a
dual-band device), because each radio has its own ar (ath12k_radio)
instance.

A proper fix, for both single and dual band, could need to fetch the
survey index info from the frequency. Maybe reusing the freq_to_idx()
from wmi.c that already does the conversion as below ?

  ar_survey = &ar->survey[freq_to_idx(ar, sband->channels[idx].center_freq)];

Another solution could be to keep your patch and just remove the
following bits from freq_to_idx() as below.

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 3ce5fcb0e460..d05b837f7d47 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6568,9 +6568,6 @@ static int freq_to_idx(struct ath12k *ar, int freq)
 	int band, ch, idx = 0;
 
 	for (band = NL80211_BAND_2GHZ; band < NUM_NL80211_BANDS; band++) {
-		if (!ar->mac.sbands[band].channels)
-			continue;
-
 		sband = hw->wiphy->bands[band];
 		if (!sband)
 			continue;


With that being said, there might be cleaner ways to do that though
(e.g. keeping survey result in ath12k_hw instead of per radio, ...).

Thanks,

-- 
Remi

