Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E384CD4F3C
	for <ath12k@archiver.kernel.org>; Tue, 19 May 2026 15:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjviU8/yki0j3i02YNJGeBy6UlijAfb+iIHsVBrcFtQ=; b=Vf+DnIXD5LhJxtQbYoNV4msMM6
	Y2Wo6tLLRqd+OKC9IVsoPk4j551ETFMBvgoxKg5pDOayXLWejAjhFAg0x0qNiutjexQgLdXfnEiXL
	qeLSuWmsgE+EujKCcHoasIQ0RRrZVAQRtJqWUnoEkn2KyPSI4r6WP1kDDG2vSHELhtGR7h8u/fErN
	Bf4RaFBuhRyRWwTl660HobUdrh+lslF90cY32NwAXwBolXjmzVlhD2K9ruqjrbymCVPDy2K4QFooJ
	LwTjMnzBTu+ZhcUErgpTFWx+eVtZG62aRacGUA485AXnxGq77mNReZEEhZfYGBn3+9hSdTFtzhMJJ
	3uTJT9Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMib-000000027nL-4935;
	Tue, 19 May 2026 15:50:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMiZ-000000027mg-2wdK
	for ath12k@lists.infradead.org;
	Tue, 19 May 2026 15:50:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExGVi341432
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 15:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjviU8/yki0j3i02YNJGeBy6UlijAfb+iIHsVBrcFtQ=; b=nS1c7q4fRt7fKV41
	iehpP18cemYhC0ipT9ePdDPI/rBNx+JTIq7UK5Xu5YFa06AVEZpJi22wBKRrFEKW
	OadPsHhh0ENd+B0SYd+nRYLZ58/zjHH/QJ+LI0ndOQE8euHgGY8eq2Z3eFeD+7A0
	5SYCtLst/+GHr9xGK+bgGbo9XD+9tAHZYC19eXXTnu98wAKE/iMaAazoisjrURvj
	z7fVgRXTWiLAVbRqXTVmpPwmYIKqStECRAOEXX1ER/YS29ppB/zj62HXE02ffQRK
	Hioouw5dNOaofJwsTDt+aXVNPDlbTTIwyW3qoyeAa2/GEFr0q2iiHQPVlWRaUBWB
	9OdVzw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3v8819-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 15:50:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f5943ca81aso14011314eec.0
        for <ath12k@lists.infradead.org>; Tue, 19 May 2026 08:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779205849; x=1779810649; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjviU8/yki0j3i02YNJGeBy6UlijAfb+iIHsVBrcFtQ=;
        b=FX0qHJi8r9kv9OTLVvTjsX8i/4YeEmGiJ4VXDd2XQr4DV3IPUGhR3GqhC7wkWpKXJY
         VUZ5qYzBRQmzjIRpAFjvaLCSiSgKZ5VvrM+gP501kCIx0h5YVrdHh1B7cBrzzTPamql+
         /sMcTALXAd2GsZ8IgbiGfiO1ylSwB69alM8Ksf2AaLuuOjGdLwcwJeOjeo2yPhY2poPK
         Artp0eAp+a9rCibEhEcOxQnvH9+1Q1CpolYmM3VJ5zQksHo4kb+CRCG4aRLeJQvj1hZa
         jSDaHB8xvMqGGicn01AT1z/hsxMO/DkBUodwpRftVofDsBXbbYLTiONGT/lrnpx5a0JX
         ToQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779205849; x=1779810649;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjviU8/yki0j3i02YNJGeBy6UlijAfb+iIHsVBrcFtQ=;
        b=mhAku9cqf+3V8tBABjl8Ia0QqsO+r/UlqDM3O2k5CxcBFRnPLPrZ5LAAi5lO1HCbto
         EC0bUQvkFIDIvHXZ9lW3OajXhR+XC9LYS7D8ZrdZp4pVJAYtQfvXffzkCNtlzsilSWes
         QX/zXTJH4wYIu244lT91X364BAlgcQ83aeuVs+G3+7YxLn85fn/yyHinYLpjVgBMGOti
         EijwGrfiI4ar76R58PbFQMp+4FsIp06LV4+Y9lyKy9VpH32UKtcjILWLkEKSoUufbPio
         r4zc60RRMXFyjGPD4+cxoTVZCKwsGByzc5BiwhuckBdh1O1oFx2/H/lt8YCvQTq9hnm8
         hZWg==
X-Gm-Message-State: AOJu0YyGsnMh5FQX1OK6HwVlPGKXjCeJv7XncBQnsnSEr92SVnftpnFJ
	+6OpSUUAdSVO01ftMJ4Hk0BJaTjpsQkI/WmDq1DOSZ4cKEL0i/ZU08EG3Ntp41rosTwD6GJM5OI
	PgkqLKw1ueoMOv6ykq5KLd9XX/g7N1A7Dyr5Bhsy30J7CaBHhKSZEHTJWrv3pZDOUQoD4cvxG
X-Gm-Gg: Acq92OF/uWSaztqFJTSM/vi5MCDOxv0qBEzVJD+hOrdkY7lfOUQVFmiOmobylvkfvpE
	kD3p7HLcqEEqMcsjP/ww8CcIFdVRwsvLskf5gNTZEiOOyyug4jo4Xrdo3qgaM80M7G4/GaqDZFk
	dFlUv7IpN4Kmd4I42Z7PkE2JMH0kRBvkXSOCwMCETg9H5gCs9oaCMrxaAms1QZt/5swpA9+x1cm
	SCLeiFQ35n668pNqylKuMbeo5CidL3YpsCuSORHziyjQpg8qnLLN3zneQuWbQWwMeP+0tUgl0O1
	UKcRDMcaLs0BpIPkreFtXbD0XS1aHAQLpumziJrq5QHdG0wjTHdg++V7x6XywiMh1lizFK0aqKX
	9jwMOYqhZ5O+9QPkWby1e0WsgaPVEZs9zaOK7jDL1DDkZfddxipWv0o+dbtO2rPfXhuQhszDo6w
	9NpnQgdhkyx9FK6w==
X-Received: by 2002:a05:7300:5b88:b0:2d9:b466:5e19 with SMTP id 5a478bee46e88-303986011c1mr10148793eec.21.1779205849474;
        Tue, 19 May 2026 08:50:49 -0700 (PDT)
X-Received: by 2002:a05:7300:5b88:b0:2d9:b466:5e19 with SMTP id 5a478bee46e88-303986011c1mr10148758eec.21.1779205848882;
        Tue, 19 May 2026 08:50:48 -0700 (PDT)
Received: from [192.168.1.38] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294adddaasm16403484eec.13.2026.05.19.08.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:50:48 -0700 (PDT)
Message-ID: <f2ad69a2-35da-4611-9466-eda63c264c1f@oss.qualcomm.com>
Date: Tue, 19 May 2026 08:50:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_ath12k=3A_QCN9274_hw2=2E0_single-band_cards_on_IPQ9?=
 =?UTF-8?Q?574_=E2=80=94_firmware_RDDM_after_WMI=5FINIT=5FCMD_=28WLAN=2EWBE?=
 =?UTF-8?B?LjEuNi0wMTI0Myk=?=
To: insalata.fresca@gmail.com, jjohnson@kernel.org, quic_rajkbhag@quicinc.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        quic_bqiang@quicinc.com
References: <6a0b9e39.87c5160c.1d1e38.353c@mx.google.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6a0b9e39.87c5160c.1d1e38.353c@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E0qtqqEHsKjJ2gj0QF8x8ZY5HinwDXYO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE1NyBTYWx0ZWRfX4aMe+dMG4qWp
 DTL9xSX/8WvQ+2RuI4jejBvUirblzX59hhdcUtrpWPruZ22ndCVq0p1xB2bFvixoT+5fk3kKIgq
 p9atDrGtUeZEzy2IgCIgxJRlFfLCbzI3yknW8qG2vxRY+mAgMTwUPt2oGz1t3TaCMTBWedU+eSL
 LkC4Jv2hu1pjl0VfMw7jivJ3dzSGQR5AwoXtnrukotcj34FcvG8RrIkmV896YJDfY6Evsc8dDJ9
 rHFNCwgHnY23GEJJHKkRZGgqHmglGChnyAM7uSM9kncKfV1VXFhB267x+gHAuqbvaHxOnk2rKG9
 PQM8NALn0iCRKXKxCu9noTFGCbSWWMjiFUaz/g2WxYLu5JEyqsQroe8J+l5GpaV6/sLron8bYM1
 G+VMA314UFGJz/gkvvNWVRkglM6KgLULI180z7t+PBlcxGU61gC8Pl1P1HYyI53omMuSHkZf9ap
 AMOwz/HzCAcaIXMkvtA==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0c86da cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=TD6mGIVpAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=5r-N1VMzM78MpTgf-BoA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=V7iCuLqznmuTtf2Pv1nF:22
X-Proofpoint-ORIG-GUID: E0qtqqEHsKjJ2gj0QF8x8ZY5HinwDXYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_085051_873803_55247727 
X-CRM114-Status: UNSURE (   8.23  )
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

On 5/18/2026 4:18 PM, insalata.fresca@gmail.com wrote:
> Fix B -- DMA ring capability parser must tolerate unknown module IDs:
> 
>   Without: "Invalid module id 3" -> "failed to parse tlv -22" -> WMI ready timeout
>   Cause  : WBE.1.6 sends capability entries for module_id 3 (and possibly
>            others) the host enum does not know. ath12k_dp_get_ring_num()
>            returns -EINVAL for unknown IDs, breaking TLV parsing entirely.
>   Fix    : warn-and-skip on unknown module_id instead of returning -EINVAL.

There is already a public patch for this issue:
https://patch.msgid.link/20260505172415.566328-3-nazar@mokrynskyi.com

I've pinged the development team to look at the other issues.

What would be best is if you could create a Bugzilla ticket for tracking.
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugreport.html

/jeff

