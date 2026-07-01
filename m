Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5EEC43458
	for <ath12k@archiver.kernel.org>; Wed,  1 Jul 2026 03:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EluPiVYwrut5vB0qvVHBuX/RKP3pGuDFL8Baho7ssgw=; b=SLsvnKhkCycITT0gyCclyls83r
	AqfdoMNVpFfKg0upaJjsQ6Rcg2NjaYJ58l9Y/gc1Ste0i7L/Thb/YxHX2jD3huua92nOuKTWlJNLQ
	JfcHoKjr0sj98GS6NF4BgQwbJhih7Tb4CJB8hWiNZa0HknQECHIx1nirtsTnhlitYzPXwgobDijad
	RY2NGEaSOtDCkYe3g08TAnsVYPCGChl9NNf1M+XaD2vzlXlGxpXOIr9OoPvVRuOkVYk6ZbwvaHOmY
	vod8Y0JvS9n9e0zv7GkFdoi/EUErK/k/rus35gMs6CmNJx4jXJVLZ1q5e9c8lZ0lmkl6DR2A31W7Y
	afKmgS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1welQr-00000000ZSi-0HUY;
	Wed, 01 Jul 2026 03:16:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1welQi-00000000ZS7-1Tel
	for ath12k@lists.infradead.org;
	Wed, 01 Jul 2026 03:16:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6612tRhK3953010
	for <ath12k@lists.infradead.org>; Wed, 1 Jul 2026 03:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EluPiVYwrut5vB0qvVHBuX/RKP3pGuDFL8Baho7ssgw=; b=CFdKlPir1LUv7CT0
	WJVZjwGMWOaq12RwUJ8iW4FwHeMlJtloa3dQFcXEw6mzEZSw3hG28k7HDQJc0TCR
	BymI6cgFBb4wFwxBTpOG9b+FkleIqJgAUlBRoD8cS3u2h87ZvVjN/YbrEM3P9usS
	VDM+7EvC/jIJdv74QRqLEan3atmQdSGcEWCqLaa/kcPJ9EIl6i9qt711wYyLEHHI
	qH47ig16m9siXNR6n4uMUBBnVuMlZ53sq9g8DRwKaneE+NgkbJmFDe3TlgJJh4Bc
	zctYwo004q41ymXJD+JjHo9alCdhe/ytPoWoAsHKGgwL+0RdlyMSft/qGMyCguav
	bKoFVA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jkt9uyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 01 Jul 2026 03:16:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c011c7cb9so765437eec.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 20:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782875762; x=1783480562; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EluPiVYwrut5vB0qvVHBuX/RKP3pGuDFL8Baho7ssgw=;
        b=bLL4z6HCD1or5tNDyQsmPmTQzMVN9bZ4VuolIHnhuhJX2K+ZSvrTaDQLJ9cAaoVNUO
         8ubAN1uFbz28co7pLi/pI5Hdkp7JGdZGR1+vpXgaC713WuUHZtw0fdl8NQg6g7R45qCF
         n0q1s5QfdeSbGBwa52MJUYrA8xwVfKOy/bSdqcOrtg7OHQ+Gt0rvDv1MU241lWcG9vdW
         /dbAIXk3b4Nou9fia6A0bDH/FH8y1i+LE03rTS2NbN1dSUiWqB9yNVZZTkI8ggbkGO0R
         8trWjBdSV5c+mZkmA/f62BOai7Q3ZkivlCEdylx2AJ9R8XgBns4xEixL0N2AYGiri1js
         Rrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782875762; x=1783480562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EluPiVYwrut5vB0qvVHBuX/RKP3pGuDFL8Baho7ssgw=;
        b=cuThAd6JhtdZQ1OLzPLXolnf+8quO31o69jJTlm5nKrqsqvVcXS/9dS47+mSOxV3T8
         +k8GraIzxHdyuaHsAOU+RpD0qpdwZ3kaPJOPSqVXf1ERWbWBCCHZLI6ptAQD0gpos6w0
         x/jgeESc8Q+W2G6EGjfRz1KWdhF6jrjL9gR+gUt19SucVD+IiGAL/30M2C/jAemlAzqY
         U+If6Zhyir9n2dnGaDiClUBlQO+Zi3We5t5jIj16yiG/9GpZYOA6mGpsU7DWd51o0S3z
         dpBBKBx0GadJ6zZ/FLSWLBzVXLEYQpyerlw6adK2o+VaVtaiOq+/2ABH++k/qHRKLO4J
         NxAg==
X-Forwarded-Encrypted: i=1; AHgh+RqEpoIyznB7wzV2r804L1OfG15Mm3EV6vNLCsPsIiw4eKNgt31yqaxW2E5Gj7DaJggUTS/SWzU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIMCK+jmqmXB202tJcHo3tKx6VsrHJBbKvxZqLQOUghrdyfgSH
	CSNE1D0GZ0Z/wi2UYuXV/kVmgO+moeMT8SdAu+Vx7Y86BDA/dLdo+d/vz3xu+pI3WZnSduyQ47U
	cXRYid41MMNDi3r+zwIMCEZyRCMEKH9uR93TWIOPS5VtlXB5fm4aq/6f3u5VXS8Ru
X-Gm-Gg: AfdE7ckdKmK/aXXKTL1aTJTUZgcvG8TimNyyQhS/fjUql9rfO8KGj0nRRCFu2F2Of3V
	rs3FMmR3PgbMJJoeL2CaIAqhpfCTzC9pG1zt+eujELYCE4/wEVtUSUIQbDUS6VYNI3obWugmF40
	KFg5r4IOYkVVraqVog+MTXWqH7rk24zkbDBKqf9WxiWY2PtxfYD/bYJ9e9T84JCsTa9wvC0/x2q
	g1zD2BQ4aKd1gxn9qx17jYJmmLZU8oxs2aLRuU7IZyfdOtnMl+o27wcA1J4czYCyMpLpqB3mYZh
	3WOS57yeWRbNnoFQnZuwMa+jcNaCqngdGtwRT+DCGKTZnQeb2eVB/hrhR86E6McySagrLx7kNvy
	HKmTkMwBlTMnWEDfZJQnx36RLJfdJllplS9G2gzpDGqHJ
X-Received: by 2002:a05:693c:2d8b:b0:30c:a62b:d033 with SMTP id 5a478bee46e88-30ee1347f41mr5819768eec.15.1782875762109;
        Tue, 30 Jun 2026 20:16:02 -0700 (PDT)
X-Received: by 2002:a05:693c:2d8b:b0:30c:a62b:d033 with SMTP id 5a478bee46e88-30ee1347f41mr5819743eec.15.1782875761474;
        Tue, 30 Jun 2026 20:16:01 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee31da9f3sm12011579eec.22.2026.06.30.20.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 20:16:01 -0700 (PDT)
Message-ID: <d828e192-5a5d-4962-98d1-0f86ad402a63@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 08:45:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: add QMI capability negotiation
 for dynamic memory mode
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260626084327.2022076-1-aaradhana.sahu@oss.qualcomm.com>
 <4db87d04-2de6-4521-8da0-d80b036d216a@oss.qualcomm.com>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <4db87d04-2de6-4521-8da0-d80b036d216a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAzMSBTYWx0ZWRfX1+0OZSv1e4K5
 JL0fI+6OWYtxdIOOvFJ9z1ZLgjQ5JbSyenU+Pk/n3pbnJoiu6hdS76ZhJ8fSlKdaHk3T4ZfarKp
 Xv1qR+pZQv2ECYkzYSkBMdRsLPo5Pmo=
X-Proofpoint-GUID: Qv2uvSewvF68Ux4QKedj73D1a16vFPcT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAzMSBTYWx0ZWRfX5N0mhiKOawAU
 /lGROqneu+gwxtZ83JNprshxyLSyzD2fTaITZ3H4HJuulsUkX/guVHbGB8I0sFwLXq4xLen0lBp
 mvQm6+h0Gcv2SsXIH44OWzGijcoTYfro6yv8OqNAIyH7Qdk+bY9TtxkZCQ2wiANbh9GKcTDtH9z
 gxzqHcrZUeP0QTLTmemWLYkdcuIrfHwdghG1wckbWm3t5gT7Ni+TV9vRGoMubSfgGyyeTBNk4fm
 FZNoYX9acBSIvTnclSHVLIsjE/mkip/uyuw9SxK82lRh9qpm1t0wsb89T0N2D511PLRyDNrbRdu
 rF7+FRSxKQOsdrIJpYqwDtogQZrK1KsoyX1YrWsV3qDk05sm5aeZk1aL7cNp74Y32S6sYIJgaTq
 8BdQ+Dg7ajEGarZCRnSli6hiec3+oedca35ASDduPdb+M5WrKkW/pX4GHkxAZx6UB9Gz0Pjk4Ou
 KYpoOtZxYyTBhlIvArw==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a448673 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=GQrcdJE8DHaTUL9bi8kA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Qv2uvSewvF68Ux4QKedj73D1a16vFPcT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_201604_582143_951A4EBB 
X-CRM114-Status: GOOD (  12.82  )
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



On 6/30/2026 9:23 PM, Jeff Johnson wrote:
> On 6/26/2026 1:43 AM, Aaradhana Sahu wrote:
>> @@ -2319,11 +2360,14 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
>>  
>>  	ab->qmi.num_radios = resp.num_phy;
>>  
>> +	if (resp.dynamic_ddr_support_valid)
>> +		ab->qmi.dynamic_ddr_support = resp.dynamic_ddr_support;
>> +
>>  	ath12k_dbg(ab, ATH12K_DBG_QMI,
>> -		   "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d\n",
>> +		   "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d dynamic_ddr_valid %u dynamic_ddr_support %u\n",
>>  		   resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support,
>> -		   resp.num_phy_valid, resp.num_phy,
>> -		   resp.board_id_valid, resp.board_id);
>> +		   resp.num_phy_valid, resp.num_phy, resp.board_id_valid, resp.board_id,
>> +		   resp.dynamic_ddr_support_valid, resp.dynamic_ddr_support);
> 
> Your logging change conflicts with the one in:
> wifi: ath12k: use %u for unsigned variables in QMI debug logs
> 
> That one is already in my pending queue, so I'll have you rebase once that one
> lands in ath-next.
> 
> /jeff
> 

Sure, I will rebase and send next version.

