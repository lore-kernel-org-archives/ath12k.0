Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9507EC98314
	for <ath12k@archiver.kernel.org>; Thu, 24 Sep 2026 07:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4nn7rL8dapC4UOGT/5eGQcnexT8dmi9oUpt/Cv5W90=; b=fzPmSM8QreEeB72SwuK3fu/8BA
	1HuEDmRQyxpHwQN2W5pX8VXPFvlW7rRlxOSvmbitJNZ8E1hDEDyfCS+kRoe/J8DElCNR8a+lQRzub
	VltqBlgxzHW6B2RoZnlLEvgxE8XkHru3mm5xcTncNMDfwnD0Ai3yafakC80zeRAp8sFofuYjjbQCI
	tEPyschcThurITM/ckiL128Dj9jNSvwe9DWjuf5l/vBkETv0JVTrlco+ludv9O8qYD5l6VTuV7G6v
	q+5R10kBfMTjz+QlY22XAF5nq4w/yn+PJI8PKzS3NFOKrMTTDiidFvoIEYd/lWvpd2kekM48wYGF3
	ez8D/GXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dWz-0000000AEb9-17lt;
	Thu, 24 Sep 2026 07:06:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dWw-0000000AEaL-0oey
	for ath12k@lists.infradead.org;
	Thu, 24 Sep 2026 07:06:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eUq51278488
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 07:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o4nn7rL8dapC4UOGT/5eGQcnexT8dmi9oUpt/Cv5W90=; b=n2pTe5wG6b5/PwU4
	sFoJkc/YmHGTBSQf6wwRjV0p7bCtknjK0W0sbtUxeMy1XGPxwveVrkO2SmIB11OE
	Ej4HpzXwEoMaTMUqXAWKVUfSkSVJsYNpeLVns+cFLkVpeCka87f6t8Pi9iZ7vDwf
	GBig9qT0FpwzScDG+jt/AV5Fy+MGVODar8qDhEn+4hHLWnaPjSWJ1oJ2iyzIzbDc
	ZO88wYEEpT92UiuYEkHvbkAYQWYwtbKYP1MkRap5dsn6NT7uSrPGU6huUPQJK8TZ
	fO5dmv+XTYVPewCQBpy2TKs61OLWrHAHiB7aS2QArdR6Hra5b+1Cetzv/8meBX1E
	4qcwng==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb3434-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 07:06:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3284bbaa89dso1423841eec.0
        for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 00:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790233563; x=1790838363; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4nn7rL8dapC4UOGT/5eGQcnexT8dmi9oUpt/Cv5W90=;
        b=aAkddno1Yl0lPtfb49sxf3LLNc/Cry7iSdYo8VUZI84oJRwzpQp83vZ3ifeuI2PgoT
         DxGFiiyik3pWPLPzDihCXIdk8jsVm9Ncur7eL10axfGug03fQzVNHcrStOY5ajePT8pj
         nSmZWkkBNt0asqwVhvO3IIMZThOrd8Pea1HGnbLSgHfk4WFqlxf35lpxuJ4t6dK1hiJF
         AeXZP6UPYcH21qZvpCkwLcmhn1a+E51CF7CPCsCiChC2IQnf4C+QgBaNsvmUR+JyMmKS
         l04kB949iIm1l4QVjc0h2WwU1uvPyUkiY0UIWT2FEGPBMPpp7bUbx/XJTCQQl9rFW+Xa
         xpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233563; x=1790838363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4nn7rL8dapC4UOGT/5eGQcnexT8dmi9oUpt/Cv5W90=;
        b=gb5wC9+FS8EFlCRrQ/Q7FTsOqkfu2KcOuCtHppaHkOTrLOiXUurTlG3gPwpLbpyTys
         FqRwVsgmWNXiT3sv1857V1Wkd+w6rH375Le/CsQx+47nZjiPKOHaBQLuvT506eWRG+vH
         JHt2RW7STUGaW3HP49wSL4MjqD2jA0G2Su2/bkphdMT3ZI7n33gvA3WMpwZj1CU/L32E
         //BHx5mLXQ4dYRZ/rSMhPQ0TWMNg2+QKqo/2lCik6KzymrLyfQS/cTHIAfReA3yv4aVR
         oAOSApAnfITs0lxM1iU34f1n10bR8Kk+/3cYj7LsDe3cqkFmjxzOIA6pBtoCuJWB5mIv
         XN/A==
X-Forwarded-Encrypted: i=1; AKwUvBzy68X4XY+Ce/u+bGUBU0h3+fcOFeC5QTRN/iVMhjHzIPwH0TAkxlmVYUA4aygL96LYQtE7zt8=@lists.infradead.org
X-Gm-Message-State: AFuF++kuXckSzzXhbt1sO63fmlyZRXlbZUv7eU/bq/AbxPy2YE7relCn
	MrztsB1pVsUWPbcHR6evR73lP8WV+hwqJRVeWwelk0R/QpN/rGNuNKNAafYXueMH/rGH0ow9QBP
	pQc/gV2dKGMHHE/cYeNr3RLxIQsJoe6NCyZmL9lnattx1IeQEVAt44PKBi846UHKu
X-Gm-Gg: AYBFou1043lyZhKXWhdKmdcuIPMAmQyLeiHI0YwYPn6iMp2V4wjqdncJfgF8xAD5n/z
	X0E3YRUNJ2rrqH7jOb1acG5C2NPVIzhBzVUQyWTYiBZm10FjThcXxCrsh4lWk6Cr+fPMxYjR6y5
	cTma6i5VstTu/LlbsovtwocpUXHjvt6unvX1OF6ulF5ygqN20Y6+kuR1zzqi+gro2tyZ+agY+vT
	XZm1H+5fX+qoHraRoTeR7oRZXVAbZR0umDWdTl9h686cxr9h4dGmlrNQ9rXHKTcqk6B+5fYDDpq
	dTovNx0jzC1Q/z1T+5adJwgHqzWQ6vRXjZ+zr5j9GAE1ODo6fUw39givEIXuv9MF7Dz9NuNSC+A
	xvKdahGYaiIu1cq9l5963SF9Jwf0k5wjpWQ==
X-Received: by 2002:a05:7301:7189:b0:33b:de13:9574 with SMTP id 5a478bee46e88-340034bb5f2mr1189731eec.19.1790233562820;
        Thu, 24 Sep 2026 00:06:02 -0700 (PDT)
X-Received: by 2002:a05:7301:7189:b0:33b:de13:9574 with SMTP id 5a478bee46e88-340034bb5f2mr1189702eec.19.1790233561971;
        Thu, 24 Sep 2026 00:06:01 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684d643sm23791376eec.18.2026.09.24.00.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 00:06:01 -0700 (PDT)
Message-ID: <66e6b21e-843a-44ca-bf77-30441a80510e@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 12:35:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v2] wifi: mac80211: Report parent AP BSS
 parameters for AP_VLAN
To: Johannes Berg <johannes@sipsolutions.net>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ganesh Kariganuru Mahabalesh <quic_gkarigan@quicinc.com>
References: <20260915052923.3300269-1-aaradhana.sahu@oss.qualcomm.com>
 <48ebf25d157b8c12dff724fb1f6a97a0b45849e0.camel@sipsolutions.net>
 <ddaf2702-b33e-459c-9efd-098feba33243@oss.qualcomm.com>
 <ee25d1c927d4a618384eb05a210b0f9b2147d055.camel@sipsolutions.net>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <ee25d1c927d4a618384eb05a210b0f9b2147d055.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T6XZoUBFisT7XeKSG0CZTNqZcM7crZt8
X-Proofpoint-ORIG-GUID: T6XZoUBFisT7XeKSG0CZTNqZcM7crZt8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMCBTYWx0ZWRfX9wQJuo+hqwR0
 3bmL/aqRuKsV5gCXqSDavcOxpnWay3NiOlNEHDSmy443jpJC2z8IIiD4Om52ner33xIGn3X7+4n
 2skZn+8LU+p4Qk8liNCSHJa/bpQCHNV2tMa6j0oixJ6bRvEKk0PUwQU6FRCNe+svQAZL3cVJ9db
 z9v+hxxkj444vI4u5jxJA9knaPtsAOGwSoV785dFQRpqr/9UcXRcv1s7f6c5DGAZIvWmALvO/cT
 5feMy8KdnEBxMs6sht0c/Ur+ft7Ij6hJWTM+SyyWo373vxsB15OQtufZ5ZpEvBMgYVBzYV66egm
 nrkRK2vinMrTTHUbejtlOKGcd8i1pydqyeedenUUUBi6TNor3POcnQ3OSoCpDn2XQ/qUBZfmBED
 DErYPgtHjotcZqnRnsijeFuSZlwGhAKAHfTqjsemI7wjLETQi9z4Ui2enZa0LOpw2O8SN87EGyZ
 OX4fr3A46UNGWqwMctQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMCBTYWx0ZWRfXyOGQvUO0xxD3
 3pA/Ep44D8MNfwvxr174q2/EtvmQfqp6Y9qYjWOTr8c1aDE5HoA2Izk1UW8jzGsv1kyspHPYdFw
 gyRn4PHnWOWi4dP+Lzsks0OnDAnMGIY=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab4cbdc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=4E4ZdRUUPFxwFNmS2ZwA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_000606_366414_7F5D8DE1 
X-CRM114-Status: GOOD (  15.11  )
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



On 9/22/2026 4:21 PM, Johannes Berg wrote:
> On Tue, 2026-09-22 at 16:12 +0530, Aaradhana Sahu wrote:
>>
>> Since all these parameters (beacon interval, DTIM period, CTS protection,
>> short preamble, and short slot time) are already populated in sta_info and
>> are visible through the iw station dump command, I only made changes for the
>> AP_VLAN case, where these values are currently reported incorrectly.
> 
> Fair, but I suspect that they were really only there for 'iw link'?
> 
>> I am not sure whether any third-party userspace application relies on these values
>> apart from iw. If we remove these parameters from the AP-side station information,
>> the iw station dump output will also change. Would that be acceptable?
> 
> I don't see why not, if nothing relies on it.
> 
> johannes

Thanks. One clarification regarding the proposed removal: sta_set_sinfo() is common to
both AP and STA interfaces, and NL80211_STA_INFO_BSS_PARAM is also reported for the STA-side
station dump, where these parameters describe the BSS the station is associated with.

Would it be reasonable to remove NL80211_STA_INFO_BSS_PARAM only from the AP-side station
information, including AP_VLAN, while retaining it for the STA side?

If so, I can simplify the change accordingly and avoid adding the AP_VLAN-specific
BSS configuration lookup.

