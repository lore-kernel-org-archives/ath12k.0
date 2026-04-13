Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B3AF34C62
	for <ath12k@archiver.kernel.org>; Mon, 13 Apr 2026 15:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsBZdzMgUZ1Ovc49Jq1ZuQrmf8Pz1UqW5hXCPZ7ghig=; b=c0TanQi5dUaypP3o1sgmBldbrp
	VaDjIMC5eE9RyQqgJBIjwMuEf3wj/pw0f8qqcykscoSjydAc91bBuajMgNl9jRLnZ4jwldmjV0amz
	IOJFdGZy4FNVH4u6KX2QGX3W4jxmfpkFjzwsB+bzVMk3Msgqyii+8Dni7T4bFLJL6QHW2q17bB+Yf
	ROaKGz2RvzG+igBgCApfrXCws1gEAy4CYgKSpAKHnX7mAiShcN0HE/roGvhh3HdbuQWNAnP2b4jSB
	cNPPkcvFa0W5/WTsho+Lqul/bsZ8qBxfRgQh+fWymZMWP+LcuyNEkMVQXbVZrMSBW1PIcY/EnDS/N
	60U/CCMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJEl-0000000Fxwu-20jm;
	Mon, 13 Apr 2026 15:30:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJEi-0000000FxvP-3ybO
	for ath12k@lists.infradead.org;
	Mon, 13 Apr 2026 15:30:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DEDVF42557435
	for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 15:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XsBZdzMgUZ1Ovc49Jq1ZuQrmf8Pz1UqW5hXCPZ7ghig=; b=L5gc9r61mJFDtKk9
	T8/YFXIeg4zvO7QRN0AnnA1q99N35pFhSu5YWDoKrJhAldtGskpJJ96A2bSJHD1P
	DVH/mpAzSDuJXL49jXmQRqgA8QYtbwqmzgGS125IqaqceJpxsf+UqvHSmjoCeo61
	WDGyDe3iv/btnyY8LwVWu4YB11q+xYxTX0EyC+BrNcWv08q4X/PbjWB3qg7h1x7a
	NAKI/th+gy/Fy6f+DKDs3EYsVdUpOP8A6Iopi2k61dx2N9t871qzNg+ER/he08zl
	mdp5Y1WxpwCyOvIQl1vD2D2C64R5cbhanrCYuOo/iab410D9BF7Br89jNgVUd+mN
	UFjf2Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh22f89w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 15:30:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b258636d16so45253215ad.2
        for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 08:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776094203; x=1776699003; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XsBZdzMgUZ1Ovc49Jq1ZuQrmf8Pz1UqW5hXCPZ7ghig=;
        b=eskpjGSic80nSgbwOGPSqVH4QB/1FgOqaj2LC9yteh96O1FdRdOOBFaJYPjvUxFydk
         I8r55hIJokNZLXqeNYnULfnAbSVUzqkIBEB/UkiwxubLxgvIgPAP8K4U3q20Gflh7Nhk
         gSQtLYWSI2KIUz8gORs0SccgTDP7QV9crKA54uDNGppiIcxLDnnijDEVGJ52wULhMg1p
         D6wEYgC73dafmkEHFC1gtJRSRlEqqabCuJudOVgsjpqOifCW1KIjDAvhCzNP+ogBdWzf
         RymXW0NUle8uhqV0jKiSvbSaW+XxW6fFaJ4+qFmNVeElGaUNZoEaKVj5ak4im5axLOBz
         bgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776094203; x=1776699003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsBZdzMgUZ1Ovc49Jq1ZuQrmf8Pz1UqW5hXCPZ7ghig=;
        b=Uirg+va41+yMweFOyi7/YOPIOqv4rmM0QCDf9w3vTbltHAyfL9L/Rbay++eIIz/n7C
         rrKHhAV3FVfBib2lBj1fGAiY9yuUEGwsq94UrZ4FGHZH2/snqmxx5HouQZCEJToFjPEt
         X5VO01RF94Hdg5UvHo0iaO9iIco1GD9u3wY/Pk9vIHg4GkZTiePK/NqmgG53Hgr9Roni
         1iEVRdpuJMArORe6Ti0BO3giM/MfW/nsQvtCfot5dO0Ne7FPP+XWC4ZthIYEfBIOJJgf
         DsEEBNphyoijHm9BzrRYXhR87u1hlRKtFbyXx+8sIKhoZ7s0AoiO6tu5F1zj5hboSwRM
         9T6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ZWIwPq66MkYwy/2LnARwelDyUqw0syBUt2mzC0JepI4p8mgE+1d8/lURg8FdJCgOvI1TLpTs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzakFwOTDJlVw1mYsPPFTuuKR32ysPn6GRha2HHo5f8Xc79zqPQ
	HnHeb7QL9vEBaE/dBX4WNQRIgdvLuv0yJzZLv7gB3ihOHu2vXzP/22otPAvcoDJ0Tz5NdUFZRN5
	cWRCxPerToDcfU+wDiEHX8fQztrQJDXpr2ZwPqUlFvXqYT8V5ilCG5HUtCbyZtWaCilsS0NMM
X-Gm-Gg: AeBDievXuT0BcO7XepP39SBrElaNz/XUHHakjfzxSx3pEdMwom/QE1weWNMcEqom4yq
	n6fUI9EVHGaTTTptCLjs++PRbYlK00p/E1AGOpbiKLcyBmUFgORugUqv0loOm6JO2evA0uDY2Q5
	23uut7wMa+qkDmiVzx/ikafPqe8uiPOCPzHSIk1o+fnTDHS0thCjH44dOQSoFLC4lJq+Lc5xKoe
	8gUsXxG+EeOQ5P7BFlrYNxw8q/uvOklV1WnvqtqTjHDSWR/TK3A1MX+nqISjaybGtuAxHLabxU3
	Mke1gYvWITWbqgf405iLtJk4a5xOc6hgEN/F9pK80kq2xWNTrvlVR6fnHBRRuOVpyUj/LcLxKcH
	ZQBfeayHIFJy5DJZcGjxdQoxNGzUh94J5s7DIr9PZnRZTlkR+wWBbAW96ucxKV8s=
X-Received: by 2002:a17:903:292:b0:2b4:5cea:f619 with SMTP id d9443c01a7336-2b45ceaf903mr43676085ad.22.1776094202659;
        Mon, 13 Apr 2026 08:30:02 -0700 (PDT)
X-Received: by 2002:a17:903:292:b0:2b4:5cea:f619 with SMTP id d9443c01a7336-2b45ceaf903mr43675795ad.22.1776094202095;
        Mon, 13 Apr 2026 08:30:02 -0700 (PDT)
Received: from [192.168.0.2] ([183.82.204.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45e949464sm49024015ad.24.2026.04.13.08.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 08:30:01 -0700 (PDT)
Message-ID: <2e8dab9d-dbab-47ff-9b2a-d245b9ba064a@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 20:59:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/5] wifi: ath12k: handle thermal throttle stats
 WMI event
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
 <20260331142446.2951809-2-maharaja.kennadyrajan@oss.qualcomm.com>
 <bb391f8d-e385-42b6-adec-171c21c67246@oss.qualcomm.com>
Content-Language: en-US
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
In-Reply-To: <bb391f8d-e385-42b6-adec-171c21c67246@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FvQMBm3luVtSy8U_2DErSSz3RrfBu15t
X-Proofpoint-ORIG-GUID: FvQMBm3luVtSy8U_2DErSSz3RrfBu15t
X-Authority-Analysis: v=2.4 cv=HKXz0Itv c=1 sm=1 tr=0 ts=69dd0bfb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=YJTfi758wS+jUHW9EIh7Fg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=WdzAzTw8HI4wpw2Cg8EA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE1MiBTYWx0ZWRfXwjEHmGbHSuQ1
 ipErEe7Swz8nu0emV2/uiohLuyy6SIWzODAm5gcWMjLV7Q4/AWBZmfkGIFj5H6fhAe6ma6ZGg2/
 t713z8x/4+eqMJDjrR3pi+CXtTWLIsWZC98BbGS4Xoy4oNPL4vJFUrivqGKjwoybz5+6BJ+/jIQ
 shr5YsCrgLoObVZmxJQdlR5kSUA0q4mp37hfRjNaaGlS6hoAd3KB8/y15FUMZR/+2vqV+y2bgjb
 uXpDRo0lK13I8Gmiw8D2T/DG5VSfdqIoMQ1mKiM8YVPdyRRWL4teKMk1Gi7/WeNpX0qRyc7z4+s
 +6J0PFsLbC5Ut/b0XNg8r0vQoCF3fyqHM2k7kHXSgTdDWzRmGCi2uB+VigggOEHMp5ER6nED55R
 THzRPihMM7xfXJ11G9dP4RexOMYdkYSkcdkKv7L220mrHz2b+TZwFdVFzjn9+NeM/ergF2bREyO
 CMCzjvMuF0rRkgvXP2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_083005_048104_BAF511A4 
X-CRM114-Status: UNSURE (   8.41  )
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


On 10-04-2026 10:54 pm, Jeff Johnson wrote:
> On 3/31/2026 7:24 AM, Maharaja Kennadyrajan wrote:
>> +static void ath12k_wmi_thermal_throt_stats_event(struct ath12k_base *ab,
>> +						 struct sk_buff *skb)
>> +{
>> +	const struct wmi_therm_throt_stats_event *ev;
>> +	struct ath12k *ar;
>> +
>> +	const void **tb __free(kfree) = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
> please rebase on current ath-main, this interface changed with:
> https://msgid.link/20260407095426.3285574-1-nico.escande@gmail.com

sure, I will rebase on latest TOT with new interface and send the next 
version.

> /jeff

