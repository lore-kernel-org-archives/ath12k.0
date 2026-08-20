Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2922BC5DF85
	for <ath12k@archiver.kernel.org>; Thu, 20 Aug 2026 17:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGTHQM6yXTCq7iCsg06gYiI/zbE8XuFZp0lB3XIIEd8=; b=eMJt31l1u36hLpl8UCXwEKUEkL
	EtAr2UoEbFEBC1c3iRYGJzP2KhI8NPxVJwq32M2y359K/bIP1sjdQZFbPoyteKhCHE4GqX3nHAbTv
	10aPlOoI6RRG8Pa33aDEEfyW5UZmq01n/PjwvkrfVniTeKjGSeIfb5OVrDdXtvH/Vz8lXunGdD5SI
	JRLEDG3+CKPqACA9Ugm8m/76VEX8MqRtfxRr0RsybwkQZ6xLwTx9vEA2WTkih4UqbA1ZVvmWoX99X
	X8q4f2xNGaYORV6dCs0169fDQNzR4GmstB2Y+MJkk8lFlpPmCAE7gEJaDdGRYno9P5YFMfF8N9eo+
	vGQ16m3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx701-0000000C09M-3Lwe;
	Thu, 20 Aug 2026 17:56:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6zz-0000000C08Q-2OeL
	for ath12k@lists.infradead.org;
	Thu, 20 Aug 2026 17:56:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KG6mKc3919789
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 17:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGTHQM6yXTCq7iCsg06gYiI/zbE8XuFZp0lB3XIIEd8=; b=VR/Eg9Ty9X+sPHRH
	vlDtUh/9W2Vgu/NdlrP37kJkqWRCh3jbrtERm2JMqAGCaiRsO4LMM1UXja60GjMW
	LmryfAy/XQz9bfqXFZxRLwdu6T8QpuNA5MoIOXniGw9rFU+pG/IA6BB9dKc6ITlQ
	L/vo5Jmev94R3NKBUOcBBckJ16UXNY9FkN2X5VvTYm1YVZZ5G5s3lOs7jOeyy9VO
	2P36Zel3sGU+x8KMxl6Uqp0AtuQ1TVK46hlEG94fY0/nROEMxNyuMdXjnpBvuAyE
	oIFu8dByausdXSafifshJobofGutW2HpsvmQSZUwa3dQK/8tXkhyD11lkI7Y8EGU
	5kSwZw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w49as60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 17:56:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so218881a12.0
        for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 10:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787248578; x=1787853378; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGTHQM6yXTCq7iCsg06gYiI/zbE8XuFZp0lB3XIIEd8=;
        b=VWYXhLoXVI3UNKaCUrRHhmS4rM358pd4VDPHICoJoegtkku9FJe5Zzo22+KGB1W8OE
         yULyF2CKxuWgLhCzafvovbTZNASVFO0T+PnaWBLxVcAgZPdF00EWm7Lmiukgst9ywQJv
         vYEaGAVuKyWEtLd8dF3uUmHBhVCT0Jf7b3z5QosDGWIIskUzD/oOhUQnaeI+0yvzwxxx
         Ah/UX0GI+ZSRvCWlVzMgQ70+GNHhH4e+LZxR054tfkjSoBu4s9A5znd6rXX69MHRDLXQ
         zUzAf5VK3A492E9eH9JHhr1Qn5De2PdwKc93/VXNAoZuyQde5oPox8TiZh7+2wUvQO0w
         WbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787248578; x=1787853378;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGTHQM6yXTCq7iCsg06gYiI/zbE8XuFZp0lB3XIIEd8=;
        b=Jdza2Nkp0FNBLPBT3AHYkAtuvHE+5zlP+A/jP88U+m9cqy0mhaIPbg/8LE0KrvCuYt
         qXQgy7jg1dDpOTnypChDANQDE9KZ3URNEx2pzr+z3MT5ZxKjFgHke6X9qkjzNpvEjLZl
         qF5M2MwFwNszhay3tdZytgk3Iu2viz8d71U4hV7qsHh3+X2mzQ43HhVWF4JQJvJOLtw0
         WIeDoOs31GeTdACxW9+6XM0sCC2QY2TybicPf7M4Il9p3/BsajX1LVjggQFSJ7kEzqT5
         1rY1AbgAqw87RTfxeBxtFUty3IFrXvmnGjscMjdiD1PN9DecyDfPuaqPgz6l+KwybZvX
         Fr+A==
X-Forwarded-Encrypted: i=1; AHgh+Rp1IHHpH4G3Zd3d6VhEVeXI5biCymD9T37/4S3HHsRBNUsogoxNxeNr82sim4UQT1zW4ASyBfs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQW0tnakYEouJJJN7YLWTE6GNeHE+LiEXTHfGp40C6Pc2YD7gz
	FNAdG71eBMyY4YcBnNDr/GbQyR+4RAgf/HTmYquPxsavrn7a+nobNHHlK+aPzPes2xob1266ACz
	XELdmHA/MUpSMu7kAm/z/tPxrvndnEERanNwwUDMSyYtN62yqIdDdcFxDFqCYpow/
X-Gm-Gg: AR+sD130B0UlHhsYWKTgJvvTV67jzbje2Iw3uDyLKChz77vBlqsr0Vh3wJKtOxilIBV
	lVU46/UT6qwFEGwAi8PobvXANLqsHqBF///pKBzDcgY2ZfoYdW69HjMnAHwK8NThKCNZ350gQrT
	LbgEQb7cO8FW7PfFECMHydyiC3cTBs3wd4cUkUC7wt/UnoCTiTCPW+3LDI9xwfGTzgjRYW9DhFH
	BA1TZTKs5C8e2aMJBFgBY/7JzZUc+pE6M7+0CKXhh2eG24Bsk4NAK7o98Cu4pyMMHO4PIjV23jd
	vKNItc88kERsSw2yFE+GaPg08GQu5aQWWBuGflfwH/YRDizOmDZra1ri11M8zJ/MZ9i10nyarD/
	GYTuADZXz5hQhaqKJAJ8Xobrzolo0vkNnZ8xljrvvfu1mhFG9j3Mll4c=
X-Received: by 2002:a05:6a21:600c:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3cd2fd8e339mr427551637.2.1787248578386;
        Thu, 20 Aug 2026 10:56:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:600c:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3cd2fd8e339mr427415637.2.1787248577835;
        Thu, 20 Aug 2026 10:56:17 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15523489fsm2134371a12.5.2026.08.20.10.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:56:17 -0700 (PDT)
Message-ID: <1bdf4b7d-2f05-4ae3-8304-60697d2c849d@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:56:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3 2/8] wifi: mac80211: change public RX API
 to use link stations
To: Benjamin Berg <benjamin@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>, Ping-Ke Shih <pkshih@realtek.com>,
        Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Benjamin Berg <benjamin.berg@intel.com>
References: <20260819135703.4072215-10-benjamin@sipsolutions.net>
 <20260819155703.af6d319e6b61.I4a2d45609e94b52654b10ec572e59a45d09c41f4@changeid>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260819155703.af6d319e6b61.I4a2d45609e94b52654b10ec572e59a45d09c41f4@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEzNCBTYWx0ZWRfX15zsTo8bfiEV
 If22RpuxinEyQFJyGvZcjaBTRzyQDy5Sdy6W++WuMY8V8PyzxWho+6AXSvGoI4NHKBwA2st5kJw
 IxlKQmSgn5lM90vKZhx1JdH+V0fomRA=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a873fc3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=hwlI8agmJUGWGRcycR8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 5jPUyGpADRBvnkNeLGBtf4ABqvaqCKDz
X-Proofpoint-GUID: 5jPUyGpADRBvnkNeLGBtf4ABqvaqCKDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEzNCBTYWx0ZWRfX1HK1NSAZCXNH
 QzhFeh/t3qOCshTbOAedP+jin9OfKvorf6WkfuKH2H2BAUjGlwHlTrwbnF8pzEdNZaVAz9RN3nW
 +9PutvemN6WxQpy9TlNjx6JsqrPFfEv7+kCx1UAZnbouf/V0duahPhs8qqqXdzsBiCFqxEJgM7V
 lDp4arlEoSo9Vw0qBztIKWlSWYG6Ntaujoz73cC6oWgOYRm9PkwRePF6LU3tar7c9wL0Q+gKNOo
 VEN+Tb6ePLKc8AsxepY2TziEv/or5AcKDM1bmb5usZvph/bgrUFR/SD5JFe0c+NeP2up7C7wLB+
 q36Ob/8aOdVIo0lEMWxGobwmL2oDDpRdexdy4AkwOoXRVtC96OxlodvpGP4qJ8xPmulk+mA7EY5
 XVvIi1dyh8D5lap9J/SyQgsJBFY3I4q2Qv5dHs/ZkmmAHo26O9ZpNPc34rMVR2d0kWpUgQhNbMt
 qeHcM/540lVyvZjTI6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_105619_646137_08092DEE 
X-CRM114-Status: GOOD (  15.49  )
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

On 8/19/2026 6:57 AM, Benjamin Berg wrote:
> diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
> index abbe65cbcd89..3da06a55913e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mac80211.c
> +++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
> @@ -1255,7 +1255,7 @@ EXPORT_SYMBOL(mt76_rx_signal);
>  static void
>  mt76_rx_convert(struct mt76_dev *dev, struct sk_buff *skb,
>  		struct ieee80211_hw **hw,
> -		struct ieee80211_sta **sta)
> +		struct ieee80211_link_sta **link_sta)
>  {
>  	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
>  	struct ieee80211_hdr *hdr = mt76_skb_get_hdr(skb);
> @@ -1302,11 +1302,15 @@ mt76_rx_convert(struct mt76_dev *dev, struct sk_buff *skb,
>  	       sizeof(mstat.chain_signal));
>  
>  	if (mstat.wcid) {
> -		status->link_valid = mstat.wcid->link_valid;
> -		status->link_id = mstat.wcid->link_id;
> +		struct ieee80211_sta *sta = wcid_to_sta(mstat.wcid);
> +
> +		if (mstat.wcid->link_valid)
> +			*link_sta =
> +				rcu_dereference(sta->link[mstat.wcid->link_id]);
> +		else
> +			*link_sta = &sta->deflink;
>  	}
>  
> -	*sta = wcid_to_sta(mstat.wcid);
>  	*hw = mt76_phy_hw(dev, mstat.phy_idx);
>  }
>  
> @@ -1530,7 +1534,7 @@ mt76_check_sta(struct mt76_dev *dev, struct sk_buff *skb)
>  void mt76_rx_complete(struct mt76_dev *dev, struct sk_buff_head *frames,
>  		      struct napi_struct *napi)
>  {
> -	struct ieee80211_sta *sta;
> +	struct ieee80211_link_sta *link_sta;

My review agent says:
**Issue 1 — mt76: uninitialized `link_sta` pointer on the no-wcid path.**

In `mt76_rx_complete()`, `link_sta` is declared but not initialized to NULL.

Then `mt76_rx_convert()` is called, which only sets `*link_sta` when
`mstat.wcid != NULL`. If `mstat.wcid` is NULL, `link_sta` remains
uninitialized and is then passed to `ieee80211_rx_list()`. This is a use of
an uninitialized pointer. The fix is trivially `= NULL`.

>  	struct ieee80211_hw *hw;
>  	struct sk_buff *skb, *tmp;
>  	LIST_HEAD(list);
> @@ -1541,8 +1545,8 @@ void mt76_rx_complete(struct mt76_dev *dev, struct sk_buff_head *frames,
>  
>  		mt76_check_ccmp_pn(skb);
>  		skb_shinfo(skb)->frag_list = NULL;
> -		mt76_rx_convert(dev, skb, &hw, &sta);
> -		ieee80211_rx_list(hw, sta, skb, &list);
> +		mt76_rx_convert(dev, skb, &hw, &link_sta);
> +		ieee80211_rx_list(hw, link_sta, skb, &list);
>  
>  		/* subsequent amsdu frames */
>  		while (nskb) {
> @@ -1550,8 +1554,8 @@ void mt76_rx_complete(struct mt76_dev *dev, struct sk_buff_head *frames,
>  			nskb = nskb->next;
>  			skb->next = NULL;
>  
> -			mt76_rx_convert(dev, skb, &hw, &sta);
> -			ieee80211_rx_list(hw, sta, skb, &list);
> +			mt76_rx_convert(dev, skb, &hw, &link_sta);
> +			ieee80211_rx_list(hw, link_sta, skb, &list);
>  		}
>  	}
>  	spin_unlock(&dev->rx_lock);

