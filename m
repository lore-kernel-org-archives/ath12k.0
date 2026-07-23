Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE0FC531F7
	for <ath12k@archiver.kernel.org>; Thu, 23 Jul 2026 15:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGldtjWtoAZeUpRF2fyi1CaIWl9IkMdaVdhUWFMLlss=; b=sVarWvZototIahStC5AQDYzMnc
	xolXlk4zyRkfddwtUhvEutfFPtbph15SzWq+U1kOVHZxjtUoRPC5gAUPxHOTilV+Ck1zGo1ABY8XH
	ZcXVQ6P+hufHY3qI83WVyR9Y40IL1/fANhP+W86jPAhlni4jBmznFUiC5VJyO7n2ZiaVJvfAUmS6H
	EcuXo7DpFlHcL19/OjSEUpmJDDjHZ0daUuwnA/dS2YLbIW3TjsAZF8Ugo/Ik5+Ndet3ViawZamUmp
	XRTalJ7nA/lXW7HMgH2dp6g3uv9vSu4q3rqevLZJHFn80eI50qdN8ADkMmAbGBRCwd03/XPeiWPLK
	xIhek59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvcJ-0000000Ed68-3Fgd;
	Thu, 23 Jul 2026 15:45:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvcG-0000000Ed5Y-3KWU
	for ath12k@lists.infradead.org;
	Thu, 23 Jul 2026 15:45:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvZF83954530
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 15:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGldtjWtoAZeUpRF2fyi1CaIWl9IkMdaVdhUWFMLlss=; b=PYTD+Mf+iZ44FGoK
	sNuX3WUdDjSOWKz7lPNfYBA7LSF9nH4CqRPWhacMOK7NLhkEG4qOhTd23TXRS8BQ
	YgrtiKqxrTR5W4911vetFMvU1pdwu/T8lE3o7T3+qfE5PaJ3xNzw/nPl07JZeInF
	UbPG6kZmpbjtvNRPMhbFTk1PmN67Z2KUSQw/2T9rIi3ErZ5q4Nvo74lzvziKh1Ya
	R9cNGvGeRx+FzuEg25/HvkztppnQeeHu3JMwt3pjp19xMyVF7WFyzo911tN+/85n
	HkGIeewCa5EBcYRoHfLAqs/GOKQjqbW8brtl7aSq6E93vp/ym8Tj2ZSdONaYYcVr
	hQPDqA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0kt8qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 15:45:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e63de75aaso1197389a91.3
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 08:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784821543; x=1785426343; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGldtjWtoAZeUpRF2fyi1CaIWl9IkMdaVdhUWFMLlss=;
        b=dM3XbZqSikw4sZm5ne33TeBxEmJqeUHjPLLHaG76B6xMcp2dtLCS0+IuLVUGDEtW44
         v4j/7GEADwlAYuMiMaD1XnXmoLt3jkLw5Ks+WJ1PBm2Ig6hQrKGM7TXXqVPhzXnolEEG
         ORQ038RDn4VOlpAGlBK+hMSkRi7i78FQtUEgh6V8ialH2pCHcYRpWCPTjdrsxBqSYIJL
         T+bBjTXjpEfLdYsbCaGu7l3GoBFgz/96/Smho0mudzDdYQJrpjmPWy+1YnNcFudyR+wh
         qBgQKEZxTRrVuOahWAWTbvM8b5MuS76acSeVCNV1RUDk1A4GiVpt4lRttZbpEzcD0N0X
         oXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821543; x=1785426343;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGldtjWtoAZeUpRF2fyi1CaIWl9IkMdaVdhUWFMLlss=;
        b=QdjIGxQiZg73iOUyw4g4Lzb9nUMj3N1e3Wgo2pDZngl1TTRQ93vRm3ZsUstM3C7YcP
         FLfvVSKkgadK8LdxGbfNr0+EFOM/56LYfK58oLvHXTGAPM1CsbjJZ4t0An2iHFLfWBCx
         Rao2ZHp+xjr0oTWE/lsZb/hGbj2VA7H8ewxZl4hAz7HR/XADA+CCh+9FsigoemmsgyQh
         Xg6n7BgHGhQm+cv0/Z3eAqjJXKp0pgV2IKhFE7fNv3g8ZrBwOzTybUCRL4EsPfQoR7kB
         l0EmynlR4F/CA5XkK5vzgzhF1jTqUFzkKRJE2D90CgeBThQr9YhePiQXQzp5OPZhQGnW
         qfYQ==
X-Forwarded-Encrypted: i=1; AHgh+RovRAgOE4kTySTX8GQg0ubuGJGq++/+okuu5GjC/dz2t/DuqLe31DwGfivGfzWIWaLn5UnhUzU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPlzHVhs3EQyJce8jdB09bTHe/0HSHajTOnQ28akL/czhvjt8d
	GQ7dGPPMURhQpW6QQYtxL7ErxxZrpWsh5uCoizdaY7442avOsgjtxGHTcEM4dab97sNiRPC3DnS
	0SC+ercnmqk6rBAm2BiHYqerb0xTCSQ4Jb6re9lEFCKixmusp6FukZcYUpadWYU7T766NaMqs
X-Gm-Gg: AR+sD10jD6Uv5HFB3WFnPovXTHI11+VjrRqjSXcgIlmXBzzZFAixi7wmlLYqOPAy2sn
	v1MTN8u2Owu8r2DSLHaUoa2xX9ZZym3oCErgSAto7eM3hQDDMbjWRhCezrkNNI10bVZlVlGqX/e
	Msvu/HWJuAiFGGVjxJlpsXjKC9bjsRyDHOT8UodIKJ5y/gBx/bW6rSfFp7mrrzzqzxwL3bVbpGy
	60BQ5nAesws1Sgm6nGEYk1ruB2gNzjDN5/hu/J092V1Ky7hXG0SlQ4UUYDj/XlWx0howgCjdWXV
	/OwZquFYHmL4X8dH+JsgXOATbQxDPomW/G7Vw4/87G+hml8Nrnde+uuYOKxmCgoZeyLKdibMlNB
	FAoEuHrZe5xVHer8ctF63nW6tlcWkzAFw/b9U41qATB1oSzPVw3I68wKWhA==
X-Received: by 2002:a17:90b:33c1:b0:38e:92e5:48f5 with SMTP id 98e67ed59e1d1-38ec6565e61mr3564616a91.24.1784821542680;
        Thu, 23 Jul 2026 08:45:42 -0700 (PDT)
X-Received: by 2002:a17:90b:33c1:b0:38e:92e5:48f5 with SMTP id 98e67ed59e1d1-38ec6565e61mr3564581a91.24.1784821542180;
        Thu, 23 Jul 2026 08:45:42 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm15329291c88.7.2026.07.23.08.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 08:45:41 -0700 (PDT)
Message-ID: <21084de4-cdf5-4a99-9e0c-da4db067e4f9@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 08:45:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2 1/8] wifi: ath12k: fix out-of-bounds
 clear_bit in ath12k_mac_dp_peer_cleanup()
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
 <20260720-ath12k-fw-allocated-ml-peer-id-v2-1-630632758a80@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260720-ath12k-fw-allocated-ml-peer-id-v2-1-630632758a80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OdEh0aQ6GSLOHbTwMMfVdbMmcZnGaWJv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX2Ov4Xn1qU1u2
 Kg2Xq6JscErF2BB/N/VudP+ypzRfIc3Pfz73W5gyoCycAIwsagCu4GnZjKksSeLpwlNzfQPVPmw
 jORqn4IWEK/aAJR64Fi/WHbM8vPMogM=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a623727 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Qi-GXyMJ-ei9_mG92UcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: OdEh0aQ6GSLOHbTwMMfVdbMmcZnGaWJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX5PZpuu0mSwp2
 2zUHZ36Vej+g93LEXrQz3c7a/xhBcL6/zCKVBApw8TOO+ydLdGpGLBnLHa5XbpExSiZ6GkQiFrv
 ZM/ZwaZxG7LYpkPUVteAPNj55c+h4EwnJ9eCeLViaxjxkayIIkiA+J82UT9A720tWPiupQcCYK1
 9JY9AfNf1A1CB9XFgHiBDpHZJJh6in2K0BvRQeFfov1x1Z7rfBsC9AFslzcJNr3l1g02xldcnhS
 O5M0SKQ3MnAzmm0NaFWSvlVZmXJnD1OZIPJ8ytcg37tCuvFf9JBuULnxUv+x/cusNKnlMjVT/bL
 3jFwG95XOkNczapNMxgxcqvaYJQ1otZUqDA/j4HhkbycPSikXw62oyOBV0NdLlP9oNOPMBAH0fC
 fq7P+Z3fUWgS4966VFlN+yKJFr7eJrVCtatFtFtsuiSMQKcmMkV7m09mwkzNdICnFbf2Wv5irXY
 OyAlvP04i+OedgVRBDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_084544_987904_79DE6AD9 
X-CRM114-Status: GOOD (  20.83  )
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

On 7/19/2026 11:43 PM, Baochen Qiang wrote:
> ath12k_mac_dp_peer_cleanup() clears the ML peer ID slot on the
> free_ml_peer_id_map bitmap by indexing it with dp_peer->peer_id. That is
> wrong: dp_peer->peer_id for an MLO peer always carries the
> ATH12K_PEER_ML_ID_VALID bit (BIT(13)), so clear_bit() is invoked with
> index >= 0x2000, which is far outside the bitmap of ATH12K_MAX_MLO_PEERS
> (256) bits and corrupts memory adjacent to ah->free_ml_peer_id_map. The
> intended bitmap entry also never gets cleared, so subsequent
> ath12k_peer_ml_alloc() calls eventually run out of IDs.
> 
> The ID without the VALID bit is what ath12k_peer_ml_alloc() returned and
> is stored in ahsta->ml_peer_id. Use that instead.
> 
> While there, also reset ahsta->ml_peer_id to ATH12K_MLO_PEER_ID_INVALID so
> the bitmap and ahsta->ml_peer_id stay in sync;

nit s/;/./

> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: ee16dcf573d5 ("wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 490c134c1f29..b7eba8ea981b 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1283,8 +1283,11 @@ void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
>  	spin_lock_bh(&dp_hw->peer_lock);
>  	list_for_each_entry_safe(dp_peer, tmp, &dp_hw->dp_peers_list, list) {
>  		if (dp_peer->is_mlo) {
> +			struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(dp_peer->sta);
> +
>  			rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
> -			clear_bit(dp_peer->peer_id, ah->free_ml_peer_id_map);
> +			clear_bit(ahsta->ml_peer_id, ah->free_ml_peer_id_map);
> +			ahsta->ml_peer_id = ATH12K_MLO_PEER_ID_INVALID;

so this now matches the code at the end of ath12k_mac_ml_station_remove() and
in the cleanup section of ath12k_mac_op_sta_state(), so perhaps that should be
refactored into a helper function in the future

>  		}
>  
>  		list_move(&dp_peer->list, &peers);
> 


