Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D2FC43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 06:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Esj1g2bG213H6N7p0zMCbkRBnvln/9mEV3dG4w1Ful0=; b=i/NQ8EfpS6u9aUUqVUNY7YJMJc
	GoVSgjGJAP5RTZFmyXSB5sw3PptQ03Oiwbdc466mDoEtO3vhdge3eU9i1yHfgFFlp6XX53rURsMVv
	z5YpcZBQ0F5jfhXTfdI3JLhYmBWf4cbN/XMr2iazw2IxDkSImzivUJlVXISNm/C26EVtRRtcSit8D
	wRYolsTPuiugKH9Rh5MHNfvDXJC/dhvYfoQfYtK7BqFrA5I04FRecOSHMRr7LEDCGGlx81Fee6/fE
	T2yZrwx6yo2I66WGktQJ54RbnrXpChj0D0McQTvWnrLtVH4+m8QIQbeA8ubr3k2/aXXyyFj7eq9I7
	WIfe3IOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9ua-00000008Cmk-18Uw;
	Mon, 13 Jul 2026 06:13:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9uX-00000008ClR-0uqR
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 06:13:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3A2DM038776
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 06:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Esj1g2bG213H6N7p0zMCbkRBnvln/9mEV3dG4w1Ful0=; b=CCnC6lI2bDZnHLFA
	e/M2f9kWK40UgQ7WJkDoLvmafZVMfHcK3T3Ff0RO2ShQubcTN3szuYm+EnDs9YpG
	dpxwMbsbC7OyG70ELnMu9YKqoA+e3Cfh/6W8fyLjLzNTgIZkkEN9A1+MpyilaRQg
	4C7pHJW8KDSfpSnwKvEPN7b8t6UIUSHKntaRBrX09ufDewxh3lw0EBzwjLRUvl1K
	KnTtlOSmfQR88jVghy3QouVEhwkfDFP84pzgsbwqkFdho9Uw3xnxJ3q1RBTWN8D7
	hjB4W2U92IZB2CKiZhKcBh7baqkk7tE+D0lRMHW6FdU7C1QCwD+25EEQNf1hKHah
	jsbDqw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9mmfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 06:13:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8484739a9cbso3731129b3a.0
        for <ath12k@lists.infradead.org>; Sun, 12 Jul 2026 23:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783923179; x=1784527979; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Esj1g2bG213H6N7p0zMCbkRBnvln/9mEV3dG4w1Ful0=;
        b=YxYf1wPUMmwsdxIXOPH3snKlw83/FKJlAZebATst5hSZsr49YrK2m+t917xIueTeS5
         J6QgVxlFh/PU4K4myc1ro9281YGd0iuHN6aPTOe8P+ikLUaHfZwjtexmAMgMURUULmr/
         TT/B+xZbUwxan9zHToxEGBlb39DD9Hvw8UwlYIIJOuUqA0AbJq6GH9oJH4mLQfky43SQ
         QQuN6bRa7tXm9WX7XkgkW7hKrYl/LgA21++ZmwLdrMkjvUEgmiRszUxj5F4lJJnYYDmy
         I12KxxA259N0127EB8I7IluVmXfUHWMFvweMIQLRRGa/cCZqWWE6rxDih/d/SmUcJSMj
         BqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783923179; x=1784527979;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Esj1g2bG213H6N7p0zMCbkRBnvln/9mEV3dG4w1Ful0=;
        b=MfL3af3e4ZX23PBx3jgU6x5Ivx6RkG6jlXiQE0KI72WHr9xR/JWFMwtWv43ckvfFsw
         yQlnPcNFMKHxC4hoLQFQFTYKsSbFdWTPCAUqLVr8ESGLBBbjc5wgPJEWV+LsGgPjuGoV
         pH8mBq1oLGjYuKqCFGnOoP908OdcndRUeMB+/A6M9vQ81pa9yn6YIUSLKCkt6zneQA9A
         fpQcOdj0k/XGGTOXLsWYi42PB70raCBXLY+EDFoeBZ+A3bV+QK+6uGv5t5rV8CHlbyGw
         GzSRaeFDMxAsen8Ff8uVxWhtkg0n1iCD3CBAvRdpD6OZhb5fMHag6HydyzCCAb7Fk7nh
         SEFg==
X-Forwarded-Encrypted: i=1; AHgh+RoQdPJ5ZISQwMc9Of4GKWN6+s8Dramlqyy6NoiY9M5ImYyWFPbreqO0z4a62LpTT4rmu7lvbyA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxba5A44Kwp/gPj0fCVgfV/K3zObU/fwBzKQqWgxTdEaAFJ8Lkt
	mOIUT8occfPv7Lhc4miCA8ocI9v9/UI18/X8KiTxItuTPW9p+jS+Ik1qh3COoLUP1LIzkvEBQt8
	lph5CL29OABI+qqsCldev19Y96ChI/DaUMJ/qoFfjos6zV2p2bA2ImWWRq13+dkrAH4k9jn4L27
	o=
X-Gm-Gg: AfdE7cmn06CroXvuGUm6vPW5quHUPg8O2EhEEbdmteORA7E/zSoox+pI5zWi9roDRRH
	A5cmKB1EDVqRW9k8p5bVCSPEFZl8GAIUdymBRiXmyT007k1CJKlf3GEDr0FAj9ONb9FduC/EC0E
	n1i3BG0Jk9SzfIUUkOe3rNs+VM0xF+uOiXSGG2LxrBaAVzmWsQkEmakMWQaYI9gHwma/z59DRAR
	y5kpXR5QB2yFRZ8VcUgxH3MJTpaxu9YeOrBZjl++0H42gOB+nyO4n0Cyyj194JVvgQT9UgWF+dA
	XuCvy+NutMcKWtvGSbrI+DSaxcJ7fPEqLyt2Qwv9UWiW6mm/43/zFsrNBh2/xf1TAsaEgQBAqL0
	71ggodWKWYVIoAqvcvWuvzUqfr+3kLM6SYMA9F2O0B1hcdp1TCbY+k27ZXsCnxs3VLtwYvz4ejS
	8CGkceO38=
X-Received: by 2002:a05:6a00:1393:b0:848:536f:4236 with SMTP id d2e1a72fcca58-8488ac9f361mr6774370b3a.22.1783923179114;
        Sun, 12 Jul 2026 23:12:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:1393:b0:848:536f:4236 with SMTP id d2e1a72fcca58-8488ac9f361mr6774353b3a.22.1783923178657;
        Sun, 12 Jul 2026 23:12:58 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6ddc974sm13738668b3a.60.2026.07.12.23.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 23:12:58 -0700 (PDT)
Message-ID: <8672d283-fb01-46ff-8dd6-b1d9bd3d17ca@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:12:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Set
 IEEE80211_OFFLOAD_ENCAP_4ADDR after tx_encap_type vdev param
To: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260701182428.906441-1-tamizh.raja@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260701182428.906441-1-tamizh.raja@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2MSBTYWx0ZWRfX+Uln9dDDY1Od
 U4T8QSUWFp+R896AKa/vhCOrj1poI0gqvT2sZlme8uC0oNPhizHGqXZtynGb+65MoSb+AHs+ocq
 OXKsdbWZmqIYko2oA3EgdJPap6k4+Yc=
X-Proofpoint-GUID: X6jve4KMaIFdSTMcFTO9c4YqrL1KbsXZ
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a5481ec cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sEHCxLyKOP1LC-VHyggA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2MSBTYWx0ZWRfX/+RIfP10HFAL
 liJOsVj2ewuMqtRAX9pHjW40cZJTDRZ34YLc+2LkGegXAK0Y2zyziGExxDhSFZlN6laoSwtDo10
 hezu/cqPue0k+84LQB8qozXvRulOLToQxvJUiWW/i5Otq+fQWgpr1+MNBZCAXWSLtssfM8yPJ9+
 BQHGdapMZ/TcT4Slul04B7RZF6UmKnFl/YyItYWMYX6UTewzO5vUva7P5t4/IxE3TMAi2TdfJP6
 z3unQiL46L21gDAflB0rAlpycNoLfTIx36ux80lu3E8xTSA4qRZvvpcLT6K/bRIJXWpdrLU7dAD
 IvSDGnz5jB6oeyZAd/tOWmz+twlBXM78Ulem/Cu33y8ij8vBtpIEaV7y59Ogp0L2/djT5+0hiaC
 QJXzSMTxZHPox3qFDqj4W4TTDqt2tw3d+fhQCCN86CtyzqFxFxgMtLHDkRUEYXpg6924IcHPnN/
 /N+cu2dE8iR3WozsSIQ==
X-Proofpoint-ORIG-GUID: X6jve4KMaIFdSTMcFTO9c4YqrL1KbsXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_231301_380707_C8A0B68C 
X-CRM114-Status: GOOD (  10.57  )
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



On 7/2/2026 2:24 AM, Tamizh Chelvam Raja wrote:
> Currently, IEEE80211_OFFLOAD_ENCAP_4ADDR is set when
> IEEE80211_OFFLOAD_ENCAP_ENABLED is present in vif->offload_flags
> at the beginning of ath12k_mac_update_vif_offload().
> 
> However, if the WMI vdev set_param for tx_encap_type fails,
> IEEE80211_OFFLOAD_ENCAP_ENABLED is cleared but
> IEEE80211_OFFLOAD_ENCAP_4ADDR remains set, leaving the flags in
> an inconsistent state.
> 
> Fix this by setting IEEE80211_OFFLOAD_ENCAP_4ADDR only after the
> tx_encap_type has been configured via the WMI vdev set parameter.
> 
> Compile tested only.
> 
> Fixes: 729cad3c3c9e ("wifi: ath12k: Add 4-address mode support for eth offload")
> 
> Signed-off-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


