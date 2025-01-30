Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3058BC0218D
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 00:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=po3bYhuUznoa/KRaYsWLaR5r54iic7yoSXMCO3Mfr1g=; b=MzS0eyfU5eqiNUrp4UOUXhsLtx
	evRXogeBK+Fa8fWyzbN4qAvMwQzgAhUx0f5weRFVBKaRgfIPOY60D0ES/nNFuwcJQzpZ8anykq5yQ
	gYSuQ7Nj9IwPT3J/Oi/xpsyng0rVnZSSQmOpyXnQ5FNeeFviUZZNoKaXMA+B6E45CW6BkVzYmmIzD
	V6Ps+jNYKtBjdWlkujedLC68eyB+zg7eu7ogt9CqVvFHuWUhyCBBRoY+nnEOC2ZDkG206/kFWetDX
	/pZ2KFRxMYcTR50tcBMEDb6J/H3ld1SfYOi/YghjXB6NyhnBQHaTTE8hcYeg+hoDff/95IjePCJXI
	hZAWSfpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdIc2-000000080SO-3Mz7
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 00:40:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdIbz-000000080Rv-2rGj
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 00:40:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TIWhpS020915
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 00:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	po3bYhuUznoa/KRaYsWLaR5r54iic7yoSXMCO3Mfr1g=; b=j1UGNN0XuGl9N1Ck
	KbOq/cLUx4paaN2RAr+lhHBdch6V6LTVcJhpbnxr0IoKf01zJUeTMCC6bhiqKd2Z
	8H3ojBmBvJiIaLf5YoI6dbHwGFJ0UD3BqsISpI6Jf/Rx5/c/OLJBvZj4PtUc9lQU
	q5qqKoiPgi/wbqS8sBZoWSxlJ0SAomPoH+Iu1qamlqhRPrlSZIYgO5etpU4sCHGP
	9rrujHmRNFFu1N/hfCUoZbyotwTZ8b7ZjylITRI+FN/Fo0S6k9m/7tv+N0/ATFr/
	8rB1s8YXpzxzEISCglTGoE6uPDPx0+EOrdkzhO3ygjrd+u+x1gmqmiLLviR4IHtn
	rlUlTQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fsq28rvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 00:40:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef35de8901so391071a91.3
        for <ath12k@lists.infradead.org>; Wed, 29 Jan 2025 16:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738197649; x=1738802449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=po3bYhuUznoa/KRaYsWLaR5r54iic7yoSXMCO3Mfr1g=;
        b=NLtHHd3UdvTTR+1vltZCKybkF1fs+ufedTZsSrBNu8vNJQ5OzzX/S3XkkPHCPW16no
         B41xP2hTlr1R/QlICrMwmW0IXlrGwPVSVErYlBTTzfavHXjMLN18IlbG0PwJjHM6aUX0
         ZKjuNbr2wrUxaWLNhaIuTXGpavYmniQ+jAE6Z7ERKZcWkNFJnWbPR/fhFuZRPhTDEqMt
         aAarRCPjX2HnvUL1hLW7lroSYJDKmPCgPIni97kjQCrTMrjH8/e6Ass1XLh/eAgiRiuI
         UD7xWa7c4yFYUyOapAaYYA3vlRnODbqcQShILNfydELnRoFbQ/DBVhne99o96o1q1toq
         5xLA==
X-Forwarded-Encrypted: i=1; AJvYcCVutx8stKXPOHs9w2ih41yer1mna/v2L+LBKjwEm5SqIiainVxInnObNTiCf+bzOmJkoMDYnpM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw19TCaicoznrNsQVsnhUkaPCZ+3Q56t7gq/3CTgw7HEU7JwAvU
	eqRPrvyROXHaIq21MxOtJQqIEcAUBbThCA9+ZI45wTPpbth60qw2wASwDVT5Suk+hlKEH0NMUzv
	LsJlzqMOJvHv5J32qeTAk8VsRA6jEqNAwWwWS6Z31r9RPvVcp5eLLuq2J2qu7
X-Gm-Gg: ASbGncu5BRO8qFx9mkNJPqL4Sv7z8RfkpaUvkbdUs0Z25OUybKBpvVFdySdUSwxS60r
	WCyupR7P67fyRqS54abnsOqalpJmG0nt7mZOQ4b825vqP5TMr+0W0RgEHfmjPIwuYpgP9vKuDsi
	6N8cAqr+RJLR+twtdy6s++nt2SYYs6CaTZyAHyXgVcmdnSD8+hmN1E9JLOFWjdUZRfO2EmrCBJe
	mnbb4zx3CoI15/8GxvosW7jNr3e/U1G42tWOlpP+iNHkUF4cRd5X1hUuesc+fDe9yp0GNDXk894
	GiJz/TqbtuZ3NkHEIf73ozPyx6Qm+Y8BKEVAuZa6Rv6QMev2T6OhI6elAv+AG9Uk5aMWpajTUw=
	=
X-Received: by 2002:a17:90b:5150:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-2f83ac72363mr7092107a91.25.1738197648963;
        Wed, 29 Jan 2025 16:40:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjeeBGHQYK4pwJpYbbQtyFpKkkhvlOwnQJRHFqL1T5XxfaPsnkvAFYLuNJG4+wJrLuZvVCYA==
X-Received: by 2002:a17:90b:5150:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-2f83ac72363mr7092076a91.25.1738197648578;
        Wed, 29 Jan 2025 16:40:48 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848ace1ebsm187855a91.44.2025.01.29.16.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 16:40:48 -0800 (PST)
Message-ID: <6f52dcd2-3b0b-4c19-b8bd-cd17dc4543b5@oss.qualcomm.com>
Date: Wed, 29 Jan 2025 16:40:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath12k: fix handling of CSA offsets in
 beacon template command
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250124-ath12k_mlo_csa-v2-0-420c42fcfecf@quicinc.com>
 <20250124-ath12k_mlo_csa-v2-2-420c42fcfecf@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20250124-ath12k_mlo_csa-v2-2-420c42fcfecf@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: In19AqGXYRDI4eIMgxxRuMgTW-psTZJN
X-Proofpoint-GUID: In19AqGXYRDI4eIMgxxRuMgTW-psTZJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_05,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=957
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_164051_843080_ACD6263E 
X-CRM114-Status: UNSURE (   8.25  )
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

On 1/23/2025 10:16 PM, Aditya Kumar Singh wrote:
> @@ -108,5 +108,6 @@ int ath12k_mac_vdev_stop(struct ath12k_link_vif *arvif);
>  void ath12k_mac_get_any_chanctx_conf_iter(struct ieee80211_hw *hw,
>  					  struct ieee80211_chanctx_conf *conf,
>  					  void *data);
> +struct ieee80211_bss_conf *ath12k_mac_get_link_bss_conf(struct ath12k_link_vif *arvif);

This patch now conflicts with:
wifi: ath12k: report station mode transmit rate

but i'll clean that up in 'pending'

>  
>  #endif



