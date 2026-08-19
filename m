Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904BCC5B572
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 07:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+komlKcq5f1mW0dY2GaEuMSAW6/rcfAJ7ejyYXJCejI=; b=r7MwZRkPzlSUszE+llnNbyFAIp
	W8bvgVrUQL+Bx6TeKe5jNKHWnMubonAgu070Tt4LvccTlFdUn9JYVatefTVKtjnrmv9MpDMOGNd+H
	CAanRaSON8Ss3GifT8wz5UD9k8X3L9XcSiTOcbIM0306TfnVWkMFGNM1wxYxAa5xnR4HX1SkYKHlZ
	vzDgzr/hferWIr0oRSEf/0MBlUuLdDjI+WdSDqJeqMPKz0VLebUKSfhxWTvYDRIjguNc1VGXUMV93
	b+GqF47/ai04Ectx72OQpmRqKJnyAACReZdSnE910Blmn5q4lv31PRLckpBnu/0RRFEuCIz+qG1vy
	452W58KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaxL-00000009E0C-2Nwz;
	Wed, 19 Aug 2026 07:43:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaxJ-00000009Dzm-0LtC
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 07:43:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZQdp3691888
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 07:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+komlKcq5f1mW0dY2GaEuMSAW6/rcfAJ7ejyYXJCejI=; b=GTZHdq185BXXM/oY
	zit1s0iEoX9wBqcCK1FtVjqGvHorxFh1xffufGgIGMEbM9/cf/7LUf/3ODYi6Uwj
	2aAWkTjbEDlJpSUs4szG8PSMDQZpN3wPzbDV9kC4dF2c3I+DJ9v4bO31sR/EsJNM
	YXhrc9bPLaJ2u3Q1V8+QcAwX6rLXcVMup7ER1nzh5CuHRft4erSYTbdkHXS9Y2QQ
	sKx+U9df8jNY99Q5kMYmOgzUAfODptFXmg71t6dXnUMyCvIwA6oMSjf43qsRFzcz
	1n25midJfevS1sU7M/+sECFMmYGUlBhKWOgugqZPpEBqrJTQuGCyfNSka8kS7n1+
	PIRhPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfka0ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 07:43:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51e9d892f0dso1984581cf.2
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 00:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787125403; x=1787730203; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+komlKcq5f1mW0dY2GaEuMSAW6/rcfAJ7ejyYXJCejI=;
        b=WMAwDfKLTn1bUIwZJB1/D7ri+lWJrgRqXaa3v8PcZ5ivRKZGAfs3R1eYR1dyGdoTh9
         7HN6m8E04Oze/2r/TFtCLYkuSpP3iOAYTrlv8vbjHuEINKpBR+O9BMhfywAc/7xFH35+
         c/r+mjdmlwC/lZOZQp8Y8kaUtA8COh0OMjis/39R71zX+3cpj7PLlSIKFK3ZkqZvtJTO
         JQnk8iAloFF1wr+S07A4fXYCq126IlXKWINZAsW96yueYOiAlwvjxY8u9NqzPJbOxeOU
         YTBjktDm8M7Xr0peHr+M+oJvJTnmT0Tifla5AIBwGRFtFt+DrCN4ylRzZfpvjgxhZH1N
         zn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787125403; x=1787730203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+komlKcq5f1mW0dY2GaEuMSAW6/rcfAJ7ejyYXJCejI=;
        b=BvziPwT3WZyY5u8Qaela1FH5hiqk4whKUKwDUaT5VUhEEkaFu+xr8gs1doYy6/MulO
         HLC9Bk+nXgsI5o+Ffx8BdOEdy+yLGkXx6xWQKVFIQN3Anmbs+EYSKlCPZ2MpDoneFLkG
         Y8Pc5vNRwg80oRkrMzUHnXGgSG98zmvOFFqRqiGwuDy3mWRwO6qcV1Pct3AQJzx8H80A
         kHprRyr6XWgSOtPkyD8HdSq4xmszabY2jYFLVAd8QRIaoLQv7n5OonZCpfqwC9ccHLwU
         jWRDuvmoY/ixNALW5vPJ0MWB3oSPt7nz5iqVt38aFFvNICjSH+1LDE9FxP7SNNEbbJvo
         pigg==
X-Forwarded-Encrypted: i=1; AHgh+RrTWaQDtGSf+fAOStHKA77mUoHyGFPjo7GYVVu5Hj8bA8Mv81QqgmrZor3qum+lAeGsgOUefDY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqVCsHjIsARCtkdbAk5AYoy0k8eSsH5J44PIVNDvP5pecSODtn
	2q75u6GcMWBsb4ol+I70aT2AC9bWq4Spx9N/vQ/V83Z5NPkJTMaHoJjKM2KgZgFImyshS9AYwUs
	ZZG3qxui7KW1eOzQqV1pRpdpvda/jIr1Xvk/xGVNnvGS0TO6w7H0bBKy9sQwenW0i
X-Gm-Gg: AR+sD111lQJ+Zgn5ZiU7SLnXi016XpdOR/tU9BOxlS+7r0+tAkpwvTJZ3vyQzMw2oXu
	3c3/yikIDdGupN+0NwyG/Foo/Ztabzg4bZQpG8ZjNXjZXsIbIahP0L0gDDTEv4n56DSXP2KOjlC
	I7NWYvXwTdpbJi6uA+uX/Op3qfEKengf97inlwygaAi6/2A6zqnb65Ke5/xlHOf7WsT1QIc3pgo
	lmjsdZ+txAPJ0h/skNYBp6b7iNs/b1Zwkh1FEwrTwdJvevl+9Su9zGa0ia5efA6kQP09OD4iXBP
	ovDRYEW18r2Jv9EC3CyxSICom22Yn9W5VOLqxDKdgLmxbINl2DlxDSeoeHUnhvuhAeiW8ItHQBB
	WKXeegb+IEDVzNdITMB+n4gHc
X-Received: by 2002:a05:622a:588:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52dd5771811mr17503401cf.2.1787125403074;
        Wed, 19 Aug 2026 00:43:23 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52dd5771811mr17503211cf.2.1787125402645;
        Wed, 19 Aug 2026 00:43:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c27693dsm38948566b.60.2026.08.19.00.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 00:43:21 -0700 (PDT)
Message-ID: <7334cace-49e2-4a8e-aae2-6541c62f5b5a@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 09:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: wmi: Complete regulatory update
 for dropped events
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260818-topic-wifi_reg_fix-v1-1-18c7c289e528@oss.qualcomm.com>
 <f4f1e338-1206-46a1-bbfd-79fb768dc382@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f4f1e338-1206-46a1-bbfd-79fb768dc382@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dJxzXzicBfY_hT2vJmu7crjx40BM9RxP
X-Proofpoint-ORIG-GUID: dJxzXzicBfY_hT2vJmu7crjx40BM9RxP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA1NyBTYWx0ZWRfX/P0WPADIExaf
 YcOwhhb9z5ABxN31DLn9icxZsHBJzOj9APns35PJwAaIEFs3YZKTTAx97VAhyeNTeTfEdNdEQmL
 B2S8m768mmy4gs9/DEXro0VbYBhL9uq3kxftIruHUT0XQmdq3G/6+qJKMqO3rIUQDto8YS0QPuf
 Wvyw0rfgAeMnsCPDrZ/vxlPE6yx/kBbPpJCd+6xetN4t/MBtVRruBFqzR/IPIJmd54D43yUvUoj
 monxUJMjN6kmYhoF+JbsHrRLFz60GR4JUvvCd2QYMoTXCD4J6MJa38L2YkoyrX2HdpKIbgf2rVV
 hzCaGDf1W6URiDoDznM3hkXjmgqHHp+SwZ2nzqeLAWhWBpEOYMrg64F/LjTq07vkVZKjn46dqNe
 LodetBeDLzY6sBkDn3Kti8gGLUZTRzFm6KJ2EwQqRzvBGSKVJANYd60ft+0wAmYHRDNC8a6qw78
 Wipu1wQq9NzsxA1dVuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA1NyBTYWx0ZWRfX/SJwSnSghKAf
 WB0aE2qVEp3/qAth6R7sVBeWwE/hjPpz/5JEweC6ol98wLMpWb5wPGfjgA0eCKAKmzUE0l6F6oQ
 Z12hBV/mS5Dv4uL8bWn/GJrrJUu85E8=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a855e9b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f9ODZV7ehGsSn-uyBzwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_004325_253954_02DB3271 
X-CRM114-Status: GOOD (  12.27  )
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

On 8/19/26 3:50 AM, Baochen Qiang wrote:
> 
> 
> On 8/18/2026 10:57 PM, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> If ath12k_reg_validate_reg_info() returns STATUS_FALLBACK/DROP (which
>> are not fatal), the code then jumps to mem_free with pdev_idx still set
>> to 255, making the following completion never take place.

[...]

> there is a similar patch [1] as part of a series [2]:
> 
> [1]
> https://lore.kernel.org/all/20260729-ath12k-regd-wait-timeout-v1-1-504aa6e7e93c@oss.qualcomm.com/
> [2]
> https://lore.kernel.org/all/20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com/

Ah, sorry.. I tried searching for whether you guys handled it but
I didn't find that series. Let's go with your patches.

Konrad

