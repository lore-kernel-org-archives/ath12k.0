Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426A1606A31C
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n6rLV8BX;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UWEht0kS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YLr4CIDJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bGy6b93BMabiFW4YE7hFTHDKndizv2Qb5AduPJ5ZRN4=; b=n6rLV8BXg4x/M0
	XhEWfJJWKsotVWEwEupoaPvTbe0TC/ruLJDN34biUbE5/FUC8uGRiWj+WEB8jDO1QtYWV3PIuht6z
	UZSkWbbKSGfn2FsGtEjBzdSeFldlqOnd4e4KHhhVihk5Cgj3n9kaYDNAwJ87eUQnxpNr13bLnsYoZ
	YwNPHtKWBBKXAKXChqcfwwBIDFzkAiR5VxYOFOenObt9P4ijRprs0KUO48Ma+QA03zTygGWNZmtBN
	nuMlNqmkr+QqNoO20kTW0OONVeoTGAFErhacVcmefahem1340ToFYZztAIcj7yx0JEx6KxuysUG7k
	9E57cb0m9BuDrzczhxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSt6X-00000001n1T-1W81;
	Mon, 16 Nov 2026 09:34:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSt6U-00000001n15-0lBJ
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 09:34:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7fNPH3490159
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 09:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bGy6b93BMabiFW4YE7hFTHDKndizv2Qb5AduPJ5ZRN4=; b=UWEht0kSmwCIAN1i
	vf89wzG5WssBH3FqIx0wVC17aqTqMf5CR+0Gm0ieo4n1tboCvqOImpEdr580vM+k
	ShnrOj1cGeymCmHM9PXDJawkXUrI6/piZoL1qMHuXwqn2wh2+882xVNssA+fXiri
	vjZ31xJcij+8arPeIpNSVB5t9NrHax4k5HRspNud9mdo1gBEcE8/uH7dbl9vaSdG
	xEE67Q2Qn+IHTV2UOXoaspf0sZY+Dpaxujmy5aHOP2AAJbgtL9wO91pmfFsFLEIu
	TNjRWAS/kVBudFprplsOXU+AyMkqaNWkzLeBM/KhXUGy78clZdWcZ8LpFyrikltl
	H/XcOw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcdr9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 09:34:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4130863eec.0
        for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 01:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794821661; x=1795426461; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGy6b93BMabiFW4YE7hFTHDKndizv2Qb5AduPJ5ZRN4=;
        b=YLr4CIDJ/yLcHPf2qhvmSRvPaECZ30uM3DEBd5N1WgDWvpSMElezwNzxsuDvYYyVFM
         ncwc8g/lxLaACbe6SC9YQY0rd7hH71x6kmBwKA4UJ+VCXMV8u1aa9WM/KBGiKHHUJHmG
         cQR2JM+mULexkyi87KyT3W0y0ONQPZvhSyP53/Tvvx+s/N+Rkh/XSmomk3i0DZSrQpXm
         14RuOkpewmzRKBTc7tF+sirUD9ME55LEsl/P25xxrZmAPhS8D1NgoBuAIIz4MPrZSkQI
         s5ji6U85sm2EWgcpVtEY5p4d3AsguBHFopXp8QBmC46O8cjcUbnWzb3AvtSuF2J6+6yY
         tKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821661; x=1795426461;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGy6b93BMabiFW4YE7hFTHDKndizv2Qb5AduPJ5ZRN4=;
        b=MPZbzqo+C3gLpemuqdcUOtAw3lO4c1pjV0x1uyosU9Qr7w7ckzFR/fGlL1NA7niHEA
         ZUW7MFnr9Ee/sF+v6Q3LBS7veFQTrZMk7aiCzHqAJJ/whjqrgZ73ug15EVY1WAo78p9V
         Sg8Udy9mPGZetyi5yf4IlnLcmiOntwfMz4qm6alVOo+CdpsZ+xsvBtjKtSurXalJ4PU7
         rsPsbw6tabsP3L0fMKw8e80vlve3Lty8WpvI4tuFh+HGTA0mFejW0EK93Yw7PqfNo+QC
         7eGSfAfIjdrGeJkIBC2UU+wUAkyK0dQ9Xn2jCj4O0sSqfxQp5OlijfqB3Am1aG+LbxmG
         t7Qg==
X-Forwarded-Encrypted: i=1; AL+hErFWUsWb8hNV7zkIqp+spAU78fRkhx2rGHOzQuOKQgdT4K5/R0ufSQtsV3Xkbra26tdpvBZXbv4=@lists.infradead.org
X-Gm-Message-State: APuU4Z9ZK5Q2x19CRU3NUjeMXEqyRaXqkOQ61tABgMT8iNevpJpF3vZC
	VnHVN0eXbPaiWedB7csdqzMx9hFd+tnVeH3cM9h7pt+0UdfblDU/p6BwN8Plj/GmtvX/ra4nKf3
	+i4UzLlgdAsG0suhSrnbP4qoCahSBdSuDbYAvaBVvd2T00RXS6N26plBoVockzY1/
X-Gm-Gg: AZFdTZeoj3thxCOtoIjTNyHHWoYgqrfKj0mlRRCkuRzJUehNifPfoW4xTg5vkC6mcRg
	9mFO5RmV7MiiEx5/lTx/BAFHpFa8Gx7ydCbgucYsozM0sSy8jEvoUvZKpjrJfNCD/D49tuEa3Ax
	NpGWnx1XOOjsngMMHqzC1+IB5vibroRk45tcIFL9pTa8rvIm3ZIVcXjeSXkzbmzYDxHtutAULNb
	S4HnJAthjGtSQVk0rL54bgNbewYxoz0RW6jyaZx3LRcc00ygFCGJ/ZwxxLMtNO9eIp85ODft5mF
	SlIrmWfAQ1q1d+EyKyKeWmC3IcFukD7zXItYrgyYnURxM4PIR+61oiPuJja+afldpBWXiks25Ez
	I0D2pKdxCPr82WNjUhjeNcoZR5S4xENmRGxJvkB0q7ExmFAdgq7N9nCXUa41p2Z0JdO9DxDYCQk
	oWSA5EqYG12QvDAN5r
X-Received: by 2002:a05:7301:b14:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-37b4a3a4b7emr5923279eec.4.1794821660858;
        Mon, 16 Nov 2026 01:34:20 -0800 (PST)
X-Received: by 2002:a05:7301:b14:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-37b4a3a4b7emr5923263eec.4.1794821660346;
        Mon, 16 Nov 2026 01:34:20 -0800 (PST)
Received: from [192.168.11.102] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm32461561eec.0.2026.11.16.01.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:34:19 -0800 (PST)
Message-ID: <f2347531-afa4-41fd-b0fc-4a150c728a0f@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:04:15 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: hold txmgmt_idr_lock while freeing
 pending mgmt frames
To: Changyul Lee <lcy8047@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Praneesh P <praneesh.p@oss.qualcomm.com>,
        Jiale Yao <yaojiale02@163.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261116021037.538128-1-lcy8047@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261116021037.538128-1-lcy8047@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNyBTYWx0ZWRfX+9AiiGAt3Sxz
 8f6YEPe9cRpx8K0DPVyq2XrOz3BF0FNm+uW2pLafdndnLTKlkgVaDOsf54NiOIJCpRlddA8vUnv
 EgYBBiXctFVuRO/J9p+RfcXYzaH0znM=
X-Proofpoint-ORIG-GUID: JFYDfLwLf69Ox98KTTgRiMXxu9nt74P1
X-Proofpoint-GUID: JFYDfLwLf69Ox98KTTgRiMXxu9nt74P1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNyBTYWx0ZWRfX6fnQXVPHuAvg
 uPowDf3cRLd8VxL/iz5HfgPI/WPi4scznopvTj0DWr2kUxYqgt2aKh+VAUznmBJ741pN+9iTkA7
 snxxY3nMQXJDmf7gjjW+1c5rQDxZURJCAnvuaqFjD/DCZ4Ytr+dBQNwCnMLkElFI7dJk55LGcdh
 QYKjpzVUlGA4paksCBBGWXlJTwGbyXsLzynIcRTT8+QTqo+AV9AI85F5tWdy8c22ubRYhz19qYg
 pesIJ3vuGzXq+lL8wR8NLSZlHKJFGebzBBFPrT4uAZ3BVWQp++lgj6W07/yMtYdafZ0ICDV72SD
 kJWdZ8QattCoDjFsD08C6VyQo0wz6mZqnJIfMetND+NRSrTGiEmfsbn+Be1MGTwNhVV1z4sY4AF
 euUvo3060OvBJe70P5MwnvBaZIxJsgcQHqC2zlOS0WDfC1TwbsO+VvGzRx+G0lJk9ajSYFWaOoj
 SHfuexVO/hig6vJqZGQ==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6aface1d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=U9V32cEEDgW5s8OV8dIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_013422_227436_38C9EA5D 
X-CRM114-Status: GOOD (  17.39  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/2026 7:40 AM, Changyul Lee wrote:
> ath12k_mac_vif_txmgmt_cleanup() and ath12k_mac_tx_mgmt_pending_free()
> walk ar->txmgmt_idr without txmgmt_idr_lock. A WMI management TX
> completion can meanwhile remove an entry and pass its skb to mac80211,
> which frees it. ath12k_mac_vif_txmgmt_cleanup() then reads skb_cb->vif
> from the freed skb, and both walks can read an IDR node that was freed
> after an RCU grace period.
> 
> Hold txmgmt_idr_lock over both walks and make ath12k_mac_tx_mgmt_free()
> expect it to be held.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> Found with a static analysis tool we are developing.
> Compile-tested only, with x86_64_defconfig plus ATH12K and W=1.
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index eee3f38375ae..bffb2edd0531 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -9220,10 +9220,9 @@ static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
>   	struct sk_buff *msdu;
>   	struct ieee80211_tx_info *info;
>   
> -	spin_lock_bh(&ar->txmgmt_idr_lock);
> -	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
> -	spin_unlock_bh(&ar->txmgmt_idr_lock);
> +	lockdep_assert_held(&ar->txmgmt_idr_lock);
>   
> +	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
>   	if (!msdu)
>   		return;
>   
> @@ -9241,8 +9240,10 @@ void ath12k_mac_tx_mgmt_pending_free(struct ath12k *ar)
>   	struct sk_buff *msdu;
>   	int buf_id;
>   
> +	spin_lock_bh(&ar->txmgmt_idr_lock);
>   	idr_for_each_entry(&ar->txmgmt_idr, msdu, buf_id)
>   		ath12k_mac_tx_mgmt_free(ar, buf_id);
> +	spin_unlock_bh(&ar->txmgmt_idr_lock);
>   }
>   
>   static void ath12k_mac_vif_txmgmt_cleanup(struct ath12k *ar,
> @@ -9252,11 +9253,13 @@ static void ath12k_mac_vif_txmgmt_cleanup(struct ath12k *ar,
>   	struct sk_buff *skb;
>   	int buf_id;
>   
> +	spin_lock_bh(&ar->txmgmt_idr_lock);
>   	idr_for_each_entry(&ar->txmgmt_idr, skb, buf_id) {
>   		skb_cb = ATH12K_SKB_CB(skb);
>   		if (skb_cb->vif == vif)
>   			ath12k_mac_tx_mgmt_free(ar, buf_id);
>   	}
> +	spin_unlock_bh(&ar->txmgmt_idr_lock);
>   }
>   
>   static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arvif,
> 
> base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

