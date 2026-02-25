Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2A4FD45F1
	for <ath12k@archiver.kernel.org>; Wed, 25 Feb 2026 22:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svccUThHe/dQLGWL4PYVHbZ8LS96Vy6iNyhhAR9sFEM=; b=qINONqOq7XrvaN6spgcy/h9vYJ
	1uWpauWpdbem7RB31DbtgcmZEmKe5OKMqk7rP1daNAKLPTYai1g3q0F2oJ9is6UWOE68sPS/zCa6p
	aCF81jUpWTreEi2fkNVZvMD/RHqgZIdJUAgbC+pdNpwZsiUVzVkCWAfiHhe0deRPLvdSCxKncXIQB
	VP8A/RHrdO84+Zvsbe16i6LGxitIAIrF1RKTDVncR6rxSZsyfb2PB8D4+R/cCL6cKU/OQz7vOjLSq
	s3M5qOHsk8AZXIwFtD1f5+sXSoThAAseZHGhcNiu8BddV6tFQb9Rm5imi8MXVW9vuQ8zRBoB8I6T2
	UHLAAH2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNIi-00000004zab-1PUW;
	Wed, 25 Feb 2026 22:24:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNIf-00000004zaG-42j7
	for ath12k@lists.infradead.org;
	Wed, 25 Feb 2026 22:24:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PHIPxe3056472
	for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 22:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	svccUThHe/dQLGWL4PYVHbZ8LS96Vy6iNyhhAR9sFEM=; b=o3xf4W2IYukQzGJl
	3df3jhgP884OdcdX1k5XXFAtEMraxac66VwBsunfsiQKOv8aGP1STPiZAeiRwkZG
	ImjJZ+bRX+WdZ+10ewE26vB7jKw+NxKtNdQkhsVThJ0ibdlFwXpXg84mrOddhJle
	LVjmjjw8rRHKcofL4yWz+EknVDYeeyzddkfRJuemfxLvvEeibDRul8uSXCOtF06N
	PubpnaLbQfOVFIiGaGa6V8JLgPtl2b+VrUCy5517kHl9SOoPwKkaLPSfCkDXDlnZ
	k0nWlQBjTbWdytzCdDanUNa7jXA00/wQ6mn6y0fxvzncrjwN9+F51pXV6Smfsuu9
	ojASyQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39jced-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 22:24:09 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-45ca5b0a968so3291336b6e.2
        for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 14:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772058248; x=1772663048; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svccUThHe/dQLGWL4PYVHbZ8LS96Vy6iNyhhAR9sFEM=;
        b=HKpMzGUpAPabqLMpHe30Z9dSCKhvx+pYfqNzP//+3wHjQBLTA06AXWFM4vHHjd3AHj
         CptBn0DNlw9PT3YwnLphwhnv5UvghXJayZO8oGXfphJpwswOPv6ZNbUA+HpEOsWoKbVD
         KSWWwjWLNLlPdF19O5hcKIYvS11gS22pD+R99MsAQ2vVYRGfauAVMpbjtrVtmiqbzuPh
         2v6f3RlJOyw8PECLjGi8/lq6agO2WYUWpanzsHIIYMz0iDc2o9b7G2yZlOzUlr2miiUe
         dPtkP3vxfdRQlSImoTQZ+r/Zz6faxWnxJeuWcYlkfPYywQylGnUqajd5dYzkm8Mw0bzV
         fyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058248; x=1772663048;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svccUThHe/dQLGWL4PYVHbZ8LS96Vy6iNyhhAR9sFEM=;
        b=T2HjhVhQ6UiFt69W5xp2SBehNE0x1yrp4f2BKDJUlvi/GoFgOOQBrOkG12QqQC8O/H
         rceDZ8uydund19cWsJKiL0JY82PXAGcbUNWQJ2QBqSjrdTI7UQn0ekTKwyJG96AREyOJ
         ZXlzLFfCRYv/X9cpeGZL3Pk4QIHdNNbkhsqSQ7jb0D9fHB+M9NlsXBwwRx7JS4FL+wnt
         9txcmiFFwzdDP+CC4bz4yD5I38ZrZbVIeFhcCXHoKezF4/UbOYCzNsQ0BryZQemEPHGV
         H1KYzJuyIkxSXYf6DNyOOi13mJpXVrUblR4PZigJ/1d35ydg3UCNJyhW8Fxy1pETaL2Y
         pKXA==
X-Forwarded-Encrypted: i=1; AJvYcCVxnL5gAGij4F0/RdGGnBMkK8PQ+hOQHe4hjx+e8G9Ut0CoOgKDDCvrHYkmMqcRBgDiuTNDWCY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXpAZGoAl73WI/74YFShQADNa6n21C8DmlXTatF0URB3Y9rwII
	GbpYArlTP10p7xQuvwfZFDdMuczMoEezMA/31JynX3vpNDvmGLzhHgmEDgTDhZe/pxw1QiTXkHd
	3bHHi14G59wQWTPVvoIBNBzL8OP4crpnQ+bkIwSTNMT/KRSkIEWDvnQgEmLP4v3hp
X-Gm-Gg: ATEYQzx/nX8oOYcChJo0Xjn9bHhF/BqwLZpR4nLkeUn3hhz3AegbXE9wbtwTvt1EkN2
	kHmbgnp9fAgwOEOySdjlrHui00bi1+V6a6NkKFGpYcAgwMOF0jZO178ojSezu1tGDdWK9KxFC1B
	3Sy8F03mpYiT6+XZsglpk6pn2Tt2tPOOJr8typilhD0zr1c0xqDw8r/fOHlc3oY3ktJNJFXWQIg
	vnv2d+wJ1EmRmXfHZDlkmEJESItJL0hKtJiI74Wv2cGVKDfkUA3fdj7+Et4wkiPH2jye8el6zXy
	y7xVYqxbr69sfZY+RTkhoZgc+18fl058EVcQCyESA8dHLaPxxOtr/X3SzfgHO0baO2CX/jUYCvw
	SJV4lTRFgo0RZf4QZm2rLB1D0W/whuOFWgN4JNJ8vgN1cIBkJC5smOVKFyIbJ0RuboV8boiOH3/
	/X/8eih7oIAgJxTA==
X-Received: by 2002:a05:6808:c2ab:b0:45c:90d6:9911 with SMTP id 5614622812f47-4649efebc95mr1146803b6e.36.1772058248070;
        Wed, 25 Feb 2026 14:24:08 -0800 (PST)
X-Received: by 2002:a05:6808:c2ab:b0:45c:90d6:9911 with SMTP id 5614622812f47-4649efebc95mr1146791b6e.36.1772058247726;
        Wed, 25 Feb 2026 14:24:07 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46460661eeesm7255226b6e.13.2026.02.25.14.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 14:24:07 -0800 (PST)
Message-ID: <704dc2ae-cc22-463b-b858-060fe7d35f9b@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 14:24:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/4] wifi: ath12k: harden stats/rate handling
 for WCN785x stability
To: m.limarencko@yandex.ru, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260212121746.329619-1-m.limarencko@yandex.ru>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260212121746.329619-1-m.limarencko@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDIxNCBTYWx0ZWRfX3z432muWFao3
 AtGTk5CvSKzs5hPVPu2kcfv1ETTyGu5UEO3mVo/o9dMoCGEDhnx9HS4C+QMXxre8j1AjIy1MCWw
 ozyWkBeAYO86UW9K5RzXTdOzQPHlgnGeMlvW/7ZKGIgd81q9cpJZZjk7a2ycO/pTGCPHrwAXI/w
 Wst0mwR+qqdOdT1MuvlVcrdskRn8qfruSUEFpJIBgqjmrxkBnkmUJWl+xUecF/eNeNpoH+ozsrs
 T3933NGaG2F5eYtHE0BvAZN4pGAI6izDo/MsYC4VzdrUL8C83US3aHZIsy5th085Mh/cWLc0P/z
 kvPxkm+vtsFWHL6Miq4xmcYIO40Kj5iGCstImG9WjBQ0DWj2WwHB0HPS/jhreq1a/Jr6NV1wB8h
 gsAmlC9qpok9w56CJEDWSY+TE5Y+RT/jnBsEu2r+GIQOBvaN5XC7EfakME/PL/VTQL9GX3egtdC
 eJzG5EgImmZHdQxySQQ==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699f7689 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=vaJtXVxTAAAA:8 a=fa93lz8o_VCnTWEDYAwA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: JOfUSlL45qA1SfU2gHFRByYkSZUS7hsC
X-Proofpoint-ORIG-GUID: JOfUSlL45qA1SfU2gHFRByYkSZUS7hsC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_142410_043678_35DCDB28 
X-CRM114-Status: GOOD (  16.60  )
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

On 2/12/2026 4:17 AM, m.limarencko@yandex.ru wrote:
> From: Mikhail Limarenko <m.limarencko@yandex.ru>
> 
> Hi Jeff, all,
> 
> On QCNFA765/WCN785x (PCI, kernel 6.18.5) we observed three recurring
> issues:
> 
> - chan info events with frequency not present in local survey range,
>   producing invalid idx warnings;
> - frequent VDEV_STAT polling can block for 3 seconds on fw_stats_done
>   timeouts and cause visible hitches;
> - occasional invalid MCS metadata (for example HE MCS=12) propagates
>   into mac80211 status handling and correlates with ieee80211_rx_list
>   warnings.
> 
> This series addresses those cases by:
> 1. returning an explicit error from freq_to_idx() when no channel
>    matches, and rejecting negative indexes in callers;
> 2. reducing the wait on VDEV_STAT fw_stats completion and skipping
>    unnecessary waits for stats types that do not require it;
> 3. sanitizing invalid MCS metadata in both dp_rx and dp_mon paths by
>    falling back to legacy metadata with ratelimited diagnostics.
> 
> Tested on:
> - hardware: QCNFA765 (WCN785x)
> - kernel: 6.18.5+deb13-amd64
> - AP mode: 5 GHz (802.11ac)
> 
> Observed after applying this series:
> - station dump polling no longer shows multi-second stalls in test runs;
> - no fresh ieee80211_rx_list WARN was observed in the same windows.
> 
> v2:
> - patch 1/4 commit message no longer claims OOB in chan-info paths
> - patch 1/4 keeps matched-frequency index progression unchanged
> - patch 1/4 returns -ENOENT on no-match and callers reject negative idx
> 
> Thanks,
> Mikhail Limarenko
> 
> Mikhail Limarenko (4):
>   wifi: ath12k: return error when survey frequency is not found
>   wifi: ath12k: avoid long fw_stats waits on vdev stats hot path
>   wifi: ath12k: sanitize invalid MCS metadata in rx path
>   wifi: ath12k: sanitize invalid MCS metadata in monitor rx path
> 
>  drivers/net/wireless/ath/ath12k/dp_mon.c | 38 ++++++++++++++---------
>  drivers/net/wireless/ath/ath12k/dp_rx.c  | 39 ++++++++++++++----------
>  drivers/net/wireless/ath/ath12k/mac.c    | 22 +++++++++++--
>  drivers/net/wireless/ath/ath12k/wmi.c    |  9 +++------
>  4 files changed, 70 insertions(+), 38 deletions(-)
> 

This series does not apply cleanly to ath/main (or ath/ath-next).

Please make sure the issues you saw have not already been fixed since there
were substantial changes from 6.18 => 6.19.



