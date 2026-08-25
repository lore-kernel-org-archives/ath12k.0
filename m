Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E6EC61DBD
	for <ath12k@archiver.kernel.org>; Tue, 25 Aug 2026 17:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRiq4k43x6g0FlQYiIBHzlixzzb5eQIhX6AkPCST7nM=; b=uyjdzVhHvhEK/OUyaUOtrupZp6
	3zsIzyByLjsX8xA5ElsSOaG7ZH4qfIhM3bQx6fTLRF9q+Nhanv7H2006+a5Hih9zcQ27ePX0joBBN
	LubWcSOEoinpV8+RPhEjYdhyOj5DukD/yd3S8Iqw1Df8BMmU8q2D7aFO1UbjrQR9DF+bB5kJ8XMxm
	TqsSFizPQ6qDt1iNAtG9NGipZrLEpn6qZL9OanB2XQQD7IU26nOMnrEhkMODnLSIN1OxJ5ILM1shR
	8Jg0mw1CrlBhkUdQCHGetlY9qIhqEe4lrdK+0ZeSfbscvIa/uBF41dtWjYUk4p6qQmOj6mGQM1tQc
	1m7lB3kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuwv-00000001DT4-1mKw;
	Tue, 25 Aug 2026 17:28:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuws-00000001DSP-277C
	for ath12k@lists.infradead.org;
	Tue, 25 Aug 2026 17:28:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHPlUH1440450
	for <ath12k@lists.infradead.org>; Tue, 25 Aug 2026 17:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uRiq4k43x6g0FlQYiIBHzlixzzb5eQIhX6AkPCST7nM=; b=Ei+qmLFFTNN/dS1W
	0k50RPiwclU53IhYV5TO3S9t/iK4IqWyc0SxYUkCYGOw0PllUcZWPtVycK8FxlB/
	eQmthK33iNxANkQvBNrYVGsMDYIgIbq6yJexUozey6r9syP+FDwHcUVXkUFKQ7li
	0Ef1pEWZI/w2xTc2uD7LfJn2F7/K52YRWx18f+N+Zs60FX+6cLSgDWaLGNfsPP60
	uLG752P4pDmoPt+OjULpV/cLJtwySlKbUhtyJhKSm8aIMXAoD+gV2JRUwrpL92iH
	c+XtxohKo7hrXuGbx5iN/Ev3lVTPR3rdsc3zfleSJvek+l0gJJYIOwZomcteyG4V
	XR5J0w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9f9ur1wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 25 Aug 2026 17:28:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1333795a91.1
        for <ath12k@lists.infradead.org>; Tue, 25 Aug 2026 10:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787678911; x=1788283711; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRiq4k43x6g0FlQYiIBHzlixzzb5eQIhX6AkPCST7nM=;
        b=ReNVQz6ZbCjvmugV9jLGhjAcDmn3M9dLg6ryH1rRulQ8Es6LOafPvCJZvhkrJWkOf7
         oyqMYQDfOLYWUWlcmSFY05b5HCtw1iuhrdqg2b17qZsonP1ijmrEpEA6aeJMX/PGDw+9
         Qdp2iEbESUwMUWuZIfidlPpg0DnGq8CxFf6jKYKoDTNnMaxsr7aKEJruWzRxMnHzU7+U
         0hz9e+J5qG0YvbTdLBbCxPBhF1au57ldprE0Aw2jVtta0fz67iOkshn2k4nkca6OswrM
         EybaEsErAGAG6lmjGR6lTvJvUS6dK32qt6lo4jCE/yaLYRiyJROJzahRXqoS2aZPwmbs
         DnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787678911; x=1788283711;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRiq4k43x6g0FlQYiIBHzlixzzb5eQIhX6AkPCST7nM=;
        b=ABoOfB4ebfjzT6ayupqd+CaWRyhyKVumTpJjxtDifP6RdVSz2impyh8HQNjN8ugy98
         88M2zbEs3nqTxumYChScLVEDjdVEg6+j8Mxj2s+7+0gb51B4Pj/TLXk+W5/ZPvMS9u3C
         5mY1dAU8pYvCilKuyuBSBvvLEINirbf/b/9a85eTRegAYFIVT4uvhijxpETAdgRoMp9x
         ZrjIgF61drCsSkt7BAEafvthpYjITYsxHYbnTS70SE3cbphmBvNfHtEf+PzXO34fK4Xk
         jCVigeU2ya3SSv0Ldz5EBWowvSFtSNONLP8++2jjjWmrCFIT3z9FTAOnhYHw6cnUJObA
         91Zw==
X-Forwarded-Encrypted: i=1; AHgh+RqBM1n3+kxfzQyOTk13tPwsUqwNr42m0TmHCseybLQ5ewRzqTJNtVczS8t08SG+fpdZ6w95KX4=@lists.infradead.org
X-Gm-Message-State: AFuF++kJBM6K3h8PThcpH909e36F2HqJ/joFiUENxxYakaU7jrmUZToF
	88fsJVKw8D9GVCmRx4Vprsc8pzik0Rwfoa/1kc6a3S/Oe05HCRre5MSpuO+UEK55C60xa96yXfN
	YZFhFfEmtyHzi6d8kygtofRyuzKhPioC/Yn6OZtoCqNgSstmirZpzqXE0uEauxR2KsyP0kFQ0
X-Gm-Gg: AR+sD119/HhwUP3eNMensz9k/OcB4DJ53t2BK2433FgC1tf/SxqQliqy9VbsS04DoOQ
	In5h3n4o+uM2jJOMsyLF9NimVm1Ys2V1ThirDgp8k4JAh1xnsI+HYyqUzR34sjaYyNoSZTfHPFc
	wC+KbaBNBqsG5otarFokRki3jdTWLWWzE4bY5fISjPYhT2DLEcSWZt4ZoJ9rhVG+yW2VDaDGTE/
	qUpFA1W/Reuatw0oJDohSW+++HAsH72ZOiBq8M8K0wY8+/hEwte+RfgmZ1d9XkRvnGoV8vyGyju
	jC+Ouky9TtVIGjZef+RQTZurX2IEa+TCa+h30cKmlqkBevs4Cv2w/NsZcpeffEheQQR762pJsk5
	aclUBbF7jbD+sYS8TQqdZZnEpkTwgnvETJm9L0Q==
X-Received: by 2002:a17:90b:4c43:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-396458291d9mr10587095a91.4.1787678911088;
        Tue, 25 Aug 2026 10:28:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4c43:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-396458291d9mr10587022a91.4.1787678910600;
        Tue, 25 Aug 2026 10:28:30 -0700 (PDT)
Received: from [192.168.1.7] ([122.167.99.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm984220c88.12.2026.08.25.10.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 10:28:30 -0700 (PDT)
Message-ID: <ab922bb8-6eba-4cfe-b756-45c0b653416c@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 22:58:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3 0/8] Adding NO_STA flag and reworking RX
 link resolution
To: Benjamin Berg <benjamin@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>, Ping-Ke Shih <pkshih@realtek.com>,
        Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Benjamin Berg <benjamin.berg@intel.com>
References: <20260819135703.4072215-10-benjamin@sipsolutions.net>
Content-Language: en-US
From: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
In-Reply-To: <20260819135703.4072215-10-benjamin@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V475-38FjawKUCTRP9jYiGBIWwUIbKXc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE0OCBTYWx0ZWRfX30N23BnjE14a
 OUxOzQfvamssS4PvFfnY7ea+27QzbJpYdQPa8/gUyh+y/kdSlIe5oH9GXC/ng5PdTEG9RTNm+dj
 rSdpGEeMgw3JMonjvYsLm3CifTvgdmuZBcBiyvzoj/0B47uYBk+kBpzHEzk1d2guTr+6PJUId91
 LUYamihygl2fNCXXlMGF1I2IHNiNspme9QYnllYr896eoZvRPFcpW0C56RM5KYLWUbE5WakJ4LJ
 XtHzAwAQHHxP1FhcgwgDPoFWs149F5aoJb6cu42TdMwI2bT79LDV+RYKxgzN53XY5vDVeMVhBN4
 5r8Nxj53PTInmNOtjKiqwdi1Dj8fkq9ftM8OZwz64EaC1hIbaybCR1gXrm4Fw+Lw3GdRQw/x7IW
 4qv130TSJfYlyWl5RFojsyMcf0CV5esuUPeKyf4Li+BU4Bb6ZmOs8NP7viLmArKRwPW/oAcWcPi
 /UwJ9H6wQRScJLZd21w==
X-Authority-Analysis: v=2.4 cv=acNRWxot c=1 sm=1 tr=0 ts=6a8dd0c0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=oX6zrBFkKDnm7aSYfwAOkA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=-TwTuGK1WEEtMzw1PQMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE0OCBTYWx0ZWRfX107qqloidlpV
 sfWEmvxzvcNGbQmS+W/pjTdqlamRaZQY1UL2Bewiq4dp4S7s++UFvTBJfa8wTBpFwPgQ4CYrkxz
 69+LVKWGJJufyuo2ao+yuvoO75foKdc=
X-Proofpoint-ORIG-GUID: V475-38FjawKUCTRP9jYiGBIWwUIbKXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1011 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_102834_670616_CA773BE6 
X-CRM114-Status: GOOD (  22.49  )
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



On 8/19/2026 7:27 PM, Benjamin Berg wrote:
> From: Benjamin Berg <benjamin.berg@intel.com>
> 
> Hi,
> 
> This patchset refactors the RX link resolution a bit to fix some issues
> where mac80211 might accept frames on the wrong link and incorrectly
> translate the address. It also adds a new NL80211_ATTR_FRAME_CMD_NO_STA
> flag so that userspace can know whether address translation was done by
> the kernel on RX and can also prevent address translation for management
> frames during TX.
> 
> This together should be enough to fix the existing issues in hostapd
> where stations that are still associated try to authenticate again but
> hostapd for example ends up sending the frame to an old link address.
> 
> Benjamin
> 
> PS: Sorry, the last mail had various issues, so resending properly now.
> 
> v3:
>   * Fix issues found during review
> 
> v2:
>   * Remove unused variable in rtw89
> 
> Changes in v1:
>   * Add NAN_DATA interface handling
>   * Handle NO_STA flag correctly for NAN
>   * Fixed forwarding of station parameter
>   * Rebase and other small fixes
> 
> Changes in RFCv2:
>   * Port other drivers to new API (untested)
>   * Fix a checkpatch warning
> 
> Benjamin Berg (8):
>    wifi: iwlwifi: use link_sta internally to the driver
>    wifi: mac80211: change public RX API to use link stations
>    wifi: mac80211: refactor RX link_id and station handling
>    wifi: mac80211: rework RX packet handling
>    wifi: cfg80211: add attribute for TX/RX denoting there is no station
>    wifi: mac80211: report to cfg80211 when no STA is known for a frame
>    wifi: mac80211: pass station to ieee80211_tx_skb_tid
>    uwifi: mac80211: pass error station if non-STA transmit was requested
> 
>   drivers/net/wireless/ath/ath11k/dp_rx.c       |   2 +-
>   drivers/net/wireless/ath/ath12k/dp_mon.c      |   2 -
>   drivers/net/wireless/ath/ath12k/dp_rx.c       |  20 +-
>   drivers/net/wireless/ath/ath12k/hw.h          |  20 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  20 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |  12 +-
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c    |   6 +-
>   drivers/net/wireless/ath/ath12k/wmi.c         |   6 -
>   drivers/net/wireless/intel/iwlwifi/mld/agg.c  |  17 +-
>   drivers/net/wireless/intel/iwlwifi/mld/agg.h  |   4 +-
>   drivers/net/wireless/intel/iwlwifi/mld/rx.c   |  50 +-
>   drivers/net/wireless/intel/iwlwifi/mld/rx.h   |   2 +-
>   .../wireless/intel/iwlwifi/mld/tests/agg.c    |   7 +-
>   drivers/net/wireless/intel/iwlwifi/mvm/rx.c   |   2 +-
>   drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c |   6 +-
>   drivers/net/wireless/mediatek/mt76/mac80211.c |  22 +-
>   drivers/net/wireless/realtek/rtw89/core.c     |   7 -
>   .../wireless/virtual/mac80211_hwsim_main.c    |   3 -
>   include/net/cfg80211.h                        |   4 +
>   include/net/mac80211.h                        |  25 +-
>   include/uapi/linux/nl80211.h                  |   7 +
>   net/mac80211/agg-tx.c                         |   4 +-
>   net/mac80211/ap.c                             |   3 -
>   net/mac80211/ht.c                             |   2 +-
>   net/mac80211/ieee80211_i.h                    |  11 +-
>   net/mac80211/iface.c                          |   7 +-
>   net/mac80211/mlme.c                           |  10 +-
>   net/mac80211/offchannel.c                     |  13 +-
>   net/mac80211/rx.c                             | 447 ++++++++++--------
>   net/mac80211/scan.c                           |  10 +-
>   net/mac80211/tdls.c                           |   2 +-
>   net/mac80211/tx.c                             |  10 +-
>   net/wireless/nl80211.c                        |   8 +-
>   33 files changed, 413 insertions(+), 358 deletions(-)
> 

The changes look good to me, no hwsim test cases failure.

Note: The hostapd changes posted in: [PATCH 0/6] hostapd: handle nl80211 
no_sta flag in management frames


Reviewed-by: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>

