Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E641CC0218D
	for <ath12k@archiver.kernel.org>; Sun, 26 Jan 2025 19:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zppcty4/uQ16HqpS+FI7awSafDceY417DKR0YNvbdh0=; b=zMxRuW4E17Wk811Q/3LCYlbg5k
	KV9gDmDqpOlP6lQkC/So52pn6dpDtfa4rLKF7owB4rKFCF4SM1/jUvNIqmWehNqk/jYOs03hWuXjE
	JLGBKEve6OXxZGSgPs8JEQ6CsN1igoex5DpDzkwfpiXCvYDGxkivEc01FBJ3APZVo0kEI0UZjOyGJ
	EowqTddTK5tkMT1KDlzMS8QeGtKDdfDVA2ARjjgcNt+EfzqxyBx+mDVDIpMvcQ3jZfUpmnSYK975K
	UxKMz0Ncs55mvRC/sV2z21ItFmqmKb34qJtJxds2Dgs0BW8ynDoiTMyqFvgqr0FSp0qlHzvS2oEc5
	mqoclvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc8YO-00000000pzE-2p6S
	for ath12k@archiver.kernel.org;
	Sun, 26 Jan 2025 19:44:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc8YL-00000000pys-0ti4
	for ath12k@lists.infradead.org;
	Sun, 26 Jan 2025 19:44:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50QJQw45009362
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 19:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zppcty4/uQ16HqpS+FI7awSafDceY417DKR0YNvbdh0=; b=jgj052mKUkXPEFNL
	bdMCeepNgfrBRZuseLkWbq/EL0pZ8BpY9xhkQCk587nejC8dZhXpl6xzt0YK9cvT
	NcmMUIy/SlRtJfkyLIBX4ibhl+owNsBshkz8Zsasc0G/CAOEEDEyRg8OTMi1FOeb
	hvBV09sgrvw6H+QZTb+O+5k6BerkgQOW6sihp/zradCoer8z6TXGhO1eOCswj6G/
	3vl73ZEJKMJxkzcrzSGUXpeec/8drkiCWV/JNPzZdz624bozVE8wLtU+mRqs2s48
	iNuWDOdH2oWUFDpZA1ZaqrngHfqEBGjORUG/x6kj6Fi9hBt+sla2PFaFK9Y2K5Ng
	6EcQuw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cs2hj71r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 19:44:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2162f80040aso63735225ad.1
        for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 11:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737920654; x=1738525454;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zppcty4/uQ16HqpS+FI7awSafDceY417DKR0YNvbdh0=;
        b=DoYDt258rIzl2W5y3TSVliYOsCM82GOsyhriUckBMIO2wGJFXWlmiVCbLLvoVwFCN8
         +MquBYXoc7rm4KvhGX7P8D8/r6eIiYThclstmWuCA0slYD3m5ThAI4qKSYPpcldoJl9q
         1SsCNeFOe1fSVxPMnzllfcyU/RgMbEXA5luzOZEC49mSQR1uhBw3utxRKz6nkQ3XQVjt
         ugNycgRcb8cyput6ulM2u+4LfWjsyBZw4qR4tMlUK4lC13o7W/T/xMf6j6bSKSTIok/E
         ixhkVigJ1INGmz3nXlY6B7q/hq33CiqUwpUOOjYzR8wrelx19FRB5gnctDDednkS1quI
         sXQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJynixNsNYFCwG3/aSZwKR7L0x1ve2dIEmdBm7HRw2Wvsajedr9fnCKYWyEl9qPpGSu5OZQBU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWCezzjSInRVdlxGDZPmS9BYHJ26Cwq2AAUVen3fIrCOcrRkXK
	KZ29vLvf8f5TDhL6xGQp71kxR5BKg1ipT/sHwm5A9joVLO53kB1hD0vqNxqZM7KnuP5t1eScssW
	HqGOJQcyDZBTtxltjh0uyl5e7XhOrrEV+a3wPVRw12cdCZ8iyOguR8ROxJnXN
X-Gm-Gg: ASbGncvks3kznloHZxo5PzumxMkhwTzAgua3vbaY2brWt8N9O8TjbCl5bfKrkNxMKMs
	544zc/GRcShXpLLapIATU6jB7eLMVsZGdH7rqExxt8Y98FxKh6cBwAS/uMp/Ud62j/BxLLa+1il
	GQxLB61hrcnnfcGoBBZLKOzHFqjirBnNWdVg2bFiqZ5jdCcPpETMoO9L3CaHtdtuGPjLvDZdzax
	2OqkKFewGBLCNkzW1Ow6fzk2BldBbdaYYPvkl2X58Ig6Lkxjj9dt8ahwqnF0xrSIKGHuldca9uK
	9VlPs4nMLaXky7FD6Ogz130OPMSb3SlLT2PbFHj/1g8Rj7nMC01kp5+H/cMNhgp5inCjJ0djtA=
	=
X-Received: by 2002:a17:902:da87:b0:216:501e:e314 with SMTP id d9443c01a7336-21c3540d181mr559954675ad.20.1737920654304;
        Sun, 26 Jan 2025 11:44:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwcgvc9tmkTjZVF+OIDMkxCxBDysIhtQ/xvXpuxEuYyELDBP38Vxfm4g8tZfJuRsKlEr7oFg==
X-Received: by 2002:a17:902:da87:b0:216:501e:e314 with SMTP id d9443c01a7336-21c3540d181mr559954435ad.20.1737920653939;
        Sun, 26 Jan 2025 11:44:13 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da424eb96sm49386475ad.222.2025.01.26.11.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 11:44:13 -0800 (PST)
Message-ID: <b9a81c89-70f0-453c-9619-5d1142bd91d4@oss.qualcomm.com>
Date: Sun, 26 Jan 2025 11:44:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/9] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <quic_msinada@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
 <20250114003813.2783550-7-quic_pradeepc@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250114003813.2783550-7-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zDwIA8WnKrv8qG5i-FoxQdOyUu2qXJZY
X-Proofpoint-GUID: zDwIA8WnKrv8qG5i-FoxQdOyUu2qXJZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-26_08,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501260160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_114417_389324_499A9144 
X-CRM114-Status: UNSURE (   8.78  )
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

On 1/13/2025 4:38 PM, Pradeep Kumar Chitrapu wrote:

...

> +static int
> +ath12k_mac_set_peer_he_fixed_rate(struct ath12k_link_vif *arvif,
> +				  struct ath12k_link_sta *arsta,
> +				  const struct cfg80211_bitrate_mask *mask,
> +				  enum nl80211_band band)
> +{
> +	struct ath12k *ar = arvif->ar;
> +	u8 he_rate, nss;
> +	u32 rate_code;
> +	int ret, i;
> +	struct ath12k_sta *ahsta = arsta->ahsta;
> +	struct ieee80211_sta *sta;
> +
> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
> +
> +	sta = container_of((void *)ahsta, struct ieee80211_sta, drv_priv);

we have a helper for this so please use it:

	sta = ath12k_ahsta_to_sta(ahsta);


